<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<style>
/* Thay đổi font chữ cho toàn bộ trang */
body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
	font-size: 16px; /* Tăng kích thước chữ toàn trang */
}

/* Bỏ dấu chấm của các thẻ <ul> có class no-bullets */
.no-bullets {
	list-style-type: none; /* Loại bỏ dấu chấm */
	padding-left: 0; /* Xóa khoảng cách bên trái */
}

/* Tùy chỉnh thêm nếu cần */
footer {
	padding: 20px 0; /* Khoảng cách trên dưới */
}

footer h5 {
	font-size: 22px; /* Kích thước chữ */
	font-weight: 600;
}

footer p, footer ul {
	font-size: 17px; /* Kích thước chữ cho nội dung */
}

footer ul {
	padding-left: 0;
}

footer ul li {
	margin-bottom: 5px; /* Khoảng cách giữa các mục trong list */
}

footer ul li a {
	text-decoration: none; /* Loại bỏ gạch chân mặc định */
	color: inherit; /* Kế thừa màu sắc từ phần tử cha */
}

footer ul li a:hover {
	color: #ddd; /* Màu chữ khi hover vào liên kết */
	text-decoration: none; /* Bỏ gạch chân khi hover */
}
/* Tùy chỉnh icon */
footer ul li a i {
	margin-right: 12px; /* Thêm khoảng cách giữa icon và text */
}
</style>
</head>
<body>
	<!-- fragments.jsp -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<h5>About Us</h5>
					<p>Some information about your company</p>
				</div>
				<div class="col-md-4">
					<h5>Contact</h5>
					<ul class="no-bullets">
						<li>Email: contact@example.com</li>
						<li>Phone: +123 456 789</li>
					</ul>
				</div>
				<div class="col-md-4">
					<h5>Follow Us</h5>
					<ul class="no-bullets">
						<li><a href="#"><i class="fab fa-facebook"></i>Facebook</a></li>
						<li><a href="#"><i class="fab fa-twitter"></i>Twitter</a></li>
						<li><a href="#"><i class="fab fa-instagram"></i>Instagram</a></li>
						<li><a href="#"><i class="fab fa-github"></i>GitHub</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
</body>

</html>
