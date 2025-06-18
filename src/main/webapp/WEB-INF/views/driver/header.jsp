<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 아이콘용 CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
	body {
	        margin: 0;
	        padding: 0;
	        background-color: #f9f9f9;
	        font-family: 'Segoe UI', sans-serif;
	    }
    
    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px 40px;
        background-color: white;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    .left-section {
        display: flex;
        align-items: center;
        gap: 20px;
        font-size: 20px;
        font-weight: bold;
        color: #000;
    }

    .logo {
        display: flex;
        align-items: center;
    }

    .logo img {
        width: 30px;
        height: 30px;
        margin-right: 10px;
        border-radius: 50%;
    }

    .main-link {
        font-size: 15px;
        font-weight: 500;
        text-decoration: none;
        color: #333;
        transition: 0.2s;
    }

    .main-link:hover {
        color: #0077cc;
    }

    .logout {
        text-decoration: none;
        color: #333;
        font-weight: 500;
        display: flex;
        align-items: center;
        gap: 6px;
        font-size: 15px;
    }

    .logout i {
        color: #1ec9d8;
    }
</style>

</head>
<body>
	 <header>
		<div class="left-section">
			<div class="logo">
                <img src="https://upload.wikimedia.org/wikipedia/commons/9/98/Microsoft_Edge_logo_%282019%29.svg" alt="로고" />
                방과후 교육
            </div>
            <a href="/driver/main" class="main-link">메인페이지</a>
        </div>

        <a href="/driver/logout" class="logout">
            <i class="fas fa-right-from-bracket"></i> 로그아웃
        </a>
    </header>
</body>
</html>