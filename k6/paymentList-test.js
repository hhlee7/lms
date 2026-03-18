import http from 'k6/http';
import {check, sleep} from 'k6';

// k6 부하 테스트 설정
export const options = {
    scenarios: {
        payment_list_baseline: {
            executor: 'constant-vus',
            vus: 100,
            duration: '30s',
        },
    },
};

// 테스트 시작 전에 1번만 실행
export function setup() {
    const jar = http.cookieJar();

    // 1. 로그인 페이지 먼저 호출해서 초기 세션 확보
    const loginPageRes = http.get('http://localhost/login');

    check(loginPageRes, {
        'login page status is 200': (r) => r.status === 200,
    });

    // 2. 관리자 계정으로 로그인 요청
    const payload = {
        userId: 'admin001',
        password: '1234',
    };

    const params = {
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        redirects: 0, // 로그인 직후 302 응답을 직접 받기 위해 자동 리다이렉트 방지
    };

    const loginRes = http.post('http://localhost/login', payload, params);

    check(loginRes, {
        'login redirect status is 302': (r) => r.status === 302,
        'redirect location is /': (r) => r.headers.Location === 'http://localhost/' || r.headers.Location === '/',
    });

    // 3. cookie jar에서 JSESSIONID 추출
    const cookies = jar.cookiesForURL('http://localhost');
    const jsessionId = cookies.JSESSIONID && cookies.JSESSIONID.length > 0
        ? cookies.JSESSIONID[0]
        : null;

    check(jsessionId, {
        'JSESSIONID exists': (v) => !!v,
    });

    // 4. 테스트 시작 전에 메트릭 초기화
    const resetRes = http.post('http://localhost/perfMetrics/paymentList/reset', null, {
        headers: {
            Cookie: `JSESSIONID=${jsessionId}`,
        },
    });

    check(resetRes, {
        'reset status is 200': (r) => r.status === 200,
    });

    return {jsessionId};
}

// 부하 테스트 실행
export default function (data) {
    const res = http.get('http://localhost/admin/paymentList', {
        headers: {
            Cookie: `JSESSIONID=${data.jsessionId}`,
        },
    });

    check(res, {
        'status is 200': (r) => r.status === 200,
        'not redirected to login': (r) => !r.url.includes('/login'),
        'paymentList page loaded': (r) => r.body.includes('환불 관리'),
    });

    sleep(1);
}