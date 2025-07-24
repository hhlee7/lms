
# 🏫 AfterSchoolLMS - 방과 후 학교 통합 관리 시스템

**AfterSchoolLMS**는 방과 후 수업의 신청, 수강, 교보재 요청, 출석, 차량 배차 등 학교 외부 교육 활동을 통합 관리할 수 있는 웹 기반의 LMS(Learning Management System)입니다.  
관리자, 강사, 학생, 학부모, 차량 기사의 사용자 유형별로 맞춤 기능을 제공합니다.

---

## 🧩 프로젝트 개요

- **개발 목적**: 다양한 사용자의 입장에서 방과후 수업의 전 과정을 웹으로 통합 관리
- **주요 특징**:
  - 수업 등록/수강신청/납부/출석/평가/환불까지 전 단계 관리
  - 역할 기반 기능 분리 (관리자 / 강사 / 학생 / 학부모 / 차량 기사)
  - 교보재 요청, 사진첩, 만족도 평가 등 부가 서비스 포함

---

## 📷 미리보기

| 관리자 메뉴 | 회원 관리 | 수강 신청 |
|---|---|---|
| ![Image](https://github.com/user-attachments/assets/bb3577a9-e0b9-49ad-bac2-fbae7b5fe9ca) | ![Image](https://github.com/user-attachments/assets/ef2d8d63-16f2-4aca-8d36-af6595793298) | ![Image](https://github.com/user-attachments/assets/39cb5d61-4039-4251-930c-16ef91265084) |

---


## 👥 사용자 역할 및 기능

### 📌 관리자
- 회원 관리 (강사, 학생, 학부모, 차량 기사)
- 수업 관리, 과목/강의실/교보재 등록 및 수정
- 수강 신청 및 납부 내역 확인, 환불 처리
- 만족도 평가 및 통계
- 공지사항/Q&A 답변, 앨범 관리, 차량 배차

### 🧑‍🏫 강사
- 본인 수업 및 학생 목록 조회
- 출석 체크 및 출결 조회
- 교보재 요청 및 현황 조회
- 사진첩/공지사항 열람
- 개인정보 수정

### 👨‍🎓 학생
- 수업 조회 및 출결 확인
- 수업/강사에 대한 만족도 평가 및 리뷰 작성
- 교보재, 차량 탑승 정보 확인
- 공지사항, 앨범 열람
- 개인정보 수정

### 👪 학부모
- 자녀 수강 정보 및 출결, 배차 내역 확인
- 수강 신청, 납부, 환불 처리
- 공지사항 및 Q&A 작성
- 과목/강사 소개 열람

### 🚐 차량 기사
- 본인 배정 차량 정보 조회
- 탑승 학생 목록 확인
- 공지사항 확인, 개인정보 수정

---

## 🏗️ 기술 스택

| 항목 | 사용 기술 |
|------|-----------|
| Language | Java 17 |
| Backend | Spring Boot |
| Frontend (View) | JSP, JSTL, EL, jQuery |
| DBMS | MySQL |
| ORM | Mybatis |
| Build Tool | Maven |
| Server | Embedded Tomcat |
| 기타 | Lombok 등 |

---

## 📂 프로젝트 구조 (상위 일부)

```
afterSchoolLms/
├── src/
│   ├── main/java/com/example/...
│   └── resources/
│       ├── application.properties
│       └── templates/ (JSP)
├── pom.xml
└── mvnw / .gitignore / ...
```

---

## 🗃️ ERD 및 데이터베이스 설계

- 사용자(`user`), 역할(`role`), 강의(`lecture`), 교보재(`material`), 차량(`vehicle`), 출결(`attendance`), 앨범(`album`) 등 총 25개 이상 테이블 설계
- 수강 신청, 납부, 환불, 배차 등의 흐름이 정교하게 반영됨

👉 ERD: [`04_ERD_A팀.png`](./04_ERD_A팀.png)(첨부 이미지 참조)

---

## 🧾 주요 화면

- 총 90페이지 이상의 화면설계 포함
- 역할별로 메뉴/기능이 다르게 제공되며, 사용성 흐름도에 따라 설계됨
- 화면설계서 PDF 참고: [`05_화면설계서_A팀.pdf`](./05_화면설계서_A팀.pdf)(첨부 문서 참조)

---

## 🗺️ 기능 흐름도

> 관리자/강사/학생/학부모/차량 기사 역할별 기능 및 CRUD 흐름을 도식화한 흐름도 참고

📌 [`방과후수업관리_기능흐름도.png`](./방과후수업관리_기능흐름도.png)(첨부 이미지 참조)

---

## ⚙️ 실행 방법

```bash
# 1. 프로젝트 클론 또는 압축 해제
$ cd afterSchoolLms

# 2. Maven 빌드
$ ./mvnw clean package

# 3. DB(MySQL) 연결 설정 (application.properties)
#    spring.datasource.url=...
#    spring.datasource.username=...
#    spring.datasource.password=...

# 4. 서버 실행
$ java -jar target/afterSchoolLms-0.0.1-SNAPSHOT.jar
```

---

## 🧑‍💻 기여자 정보

- 조서진 / 강사 구성 / https://github.com/SeoJin-s
- 이현호 / 관리자 구성 / https://github.com/hhlee7
- 장정수 / 학부모 구성 / https://github.com/coffee-jeong
- 윤성권 / 관리자 구성 / https://github.com/ysk1007
- 황귀환 / 학생, 차량 기사 구성 / https://github.com/HwangGwihwan

---

## 📌 라이선스

본 프로젝트는 수업용 / 포트폴리오 목적의 샘플 프로젝트입니다.  
상업적 사용은 제한됩니다.
