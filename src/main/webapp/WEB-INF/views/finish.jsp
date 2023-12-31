<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-color: #F9F9F9;
	font-family: Arial, sans-serif;
	font-size: 16px;
	line-height: 1.5;
	margin: 0;
	padding: 0;
	background: url('resources/images/main1.png');
	background-size: cover;
}

div {
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	margin: 50px auto;
	max-width: 600px;
	padding: 30px;
	text-align: center;
}

h1 {
	font-size: 2.5em;
	margin: 0 0 20px;
	color: #359381;
}

h2 {
	font-size: 1.8em;
	margin: 0 0 10px;
}

h3 {
	font-size: 1.4em;
	margin: 0 0 10px;
}

button {
	display: block;
	padding: 10px 20px;
	border: none;
	background-color: #359381;
	color: #fff;
	font-size: 1.2em;
	cursor: pointer;
	border-radius: 5px;
	transition: background-color 0.3s ease;
	margin: 20px auto;
}

img {
	max-width: 30%;
	height: auto;
	margin: 20px 0;
	display: block;
	margin-left: auto;
	margin-right: auto;
}

button:hover {
	background-color: #005F6B;
}
</style>

</head>
<body>

	<div>
		<h1>주문 완료</h1>
		<h2>Nuts를 이용해주셔서 감사합니다!</h2>
		<h2 style="font-size: 15px">고객님의 제품을 최대한 빠르게 배송해드리겠습니다.</h2>
		  <h3>로그인 정보: ${member.memberId}</h3> 
		<img alt="" src="resources/images/truck.png">
		<button onclick="location.href='${session.member ? session.member.memberId : '/main'}'">메인 화면으로 이동</button>
		<button>마이 페이지로 이동</button>
	</div>

</body>
</html>