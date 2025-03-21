<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Work CV</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap"
	rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/aos.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/jquery.timepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/css/bootstrap-reboot.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/css/mixins/_text-hide.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/bootstrap-grid.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/bootstrap-reboot.css">

<!-- JS -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery-migrate-3.0.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.easing.1.3.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.stellar.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/aos.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.animateNumber.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/scrollax.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/google-map.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

</head>
<body>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid px-md-4">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">Work CV</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			<!-- 			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li
						class="nav-item <c:if test="${pageContext.request.requestURI == '/'}">active</c:if>"><a
						href="/" class="nav-link">Trang chủ</a></li>
					<li
						class="nav-item <c:if test="${pageContext.request.requestURI == '/listjob'}">active</c:if>"><a
						href="${pageContext.request.contextPath}/listjob" class="nav-link">Công
							việc</a></li>
					<li class="nav-item"><a href="/" class="nav-link">Ứng cử
							viên</a></li>
					<li class="nav-item cta mr-md-1"><a href="/recruitment/post"
						class="nav-link">Đăng tuyển</a></li>
						
					<c:if test="${currentUserFullName != null}">
						<body class="logged-in">
					</c:if>
					<c:if test="${currentUserFullName == null}">
						<body>
					</c:if>

					<c:if test="${currentUserFullName != null}">
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle" id="userDropdown" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
								${currentUserFullName} </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/profile">Hồ Sơ</a></li>
								<li><a class="dropdown-item" href="/save-job/get-list">Công
										việc đã lưu</a></li>
								<li><a class="dropdown-item" href="/user/list-post">Danh
										sách bài đăng</a></li>
								<li><a class="dropdown-item" href="/user/get-list-apply">Công
										việc đã ứng tuyển</a></li>
								<li><a class="dropdown-item" href="/user/get-list-company">Công
										ty đã theo dõi</a></li>
								<li>
									<form action="${pageContext.request.contextPath}/logout"
										method="post">

										<button type="submit" class="dropdown-item">Đăng xuất</button>
									</form>
								</li>
							</ul></li>
					</c:if>

					<c:if test="${currentUserFullName == null}">
						<li class="nav-item cta cta-colored"><a
							href="${pageContext.request.contextPath}/showMyLoginPage"
							class="nav-link">Đăng nhập</a></li>
					</c:if>

				</ul>
			</div>
	-->
		</div>
	</nav>
	<div class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-start">
				<div class="col-md-12 text-center mb-5">
					<p class="breadcrumbs mb-0">
						<span class="mr-3"><a href="index.jsp">Trang chủ <i
								class="ion-ios-arrow-forward"></i></a></span> đăng nhập<span></span>
					</p>
					<h1 class="mb-3 bread">Đăng nhập / Đăng kí</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- <div th:if="${msg_register_success}" class="toast" data-delay="2500"
		style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">
		<script>
			swal({
				title : 'Đăng ký thành công!',
				/* text: 'Redirecting...', */
				icon : 'success',
				timer : 3000,
				buttons : true,
				type : 'success'
			})
		</script>
	</div>
-->

	<c:if test="${not empty addUserSuccess}">
		<div class="toast" data-delay="1000"
			style="position: fixed; top: 100px; left: 40px; z-index: 2000; width: 300px">
			<script>
				console.log("addUserSuccess: ${addUserSuccess}");
				setTimeout(function() {
					Swal.fire({
						title : 'Add Successfully!',
						text : '${addUserSuccess}',
						icon : 'success',
						timer : 6000,
						buttons : true,
						type : 'success'
					});
				}, 1000); // Delay to match data-delay attribute
			</script>
		</div>
	</c:if>

	<c:if test="${not empty addUserFalse}">
		<div class="toast" data-delay="1000"
			style="position: fixed; top: 100px; left: 40px; z-index: 2000; width: 300px">
			<script>
				console.log("addUserFalse: ${addUserFalse}");
				setTimeout(function() {
					Swal.fire({
						title : 'Add False!',
						text : '${addUserFalse}',
						icon : 'error',
						timer : 6000,
						buttons : true,
						type : 'success'
					});
				}, 1000); // Delay to match data-delay attribute
			</script>
		</div>
	</c:if>

	<c:if test="${param.error != null}">
		<div class="toast" data-delay="1000"
			style="position: fixed; top: 100px; left: 40px; z-index: 2000; width: 300px">
			<script>
				console.log("loginFalse: ${loginFalse}");
				setTimeout(function() {
					Swal.fire({
						title : 'Login False!',
						text : '${"Sai tên đăng nhập hoặc mật khẩu"}',
						icon : 'error',
						timer : 6000,
						buttons : true,
						type : 'success'
					});
				}, 1000); // Delay to match data-delay attribute
			</script>
		</div>
	</c:if>

	<!-- <div th:if="${msg_register_error}" class="toast" data-delay="2500"
		style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">
		<script>
			swal({
				title : 'Đăng ký thất bại!',
				/* text: 'Redirecting...', */
				icon : 'error',
				timer : 3000,
				buttons : true,
				type : 'error'
			})
		</script>
	</div>
-->
	<!-- HOME -->
	<section class="section-hero overlay inner-page bg-image"
		style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/hero_1.jpg');"
		id="home-section">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h1 class="text-white font-weight-bold">Đăng kí / đăng nhập</h1>
					<div class="custom-breadcrumbs">
						<a href="home.jsp">Trang chủ</a> <span class="mx-2 slash">/</span>
						<span class="text-white"><strong>Đăng nhập</strong></span>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="site-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5">
					<h2 class="mb-4">Đăng kí</h2>
					<form:form
						action="${pageContext.request.contextPath}/auth/register"
						method="post" class="p-4 border rounded" modelAttribute="addUser">

						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="email">Email</label> <input
									type="email" id="email" name="email" class="form-control"
									placeholder="Email" required>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fullName">Họ và tên</label> <input
									type="text" id="fullName" name="fullName" class="form-control"
									placeholder="Họ và tên" required>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="password">Mật khẩu</label> <input
									type="password" id="password" name="password"
									class="form-control" placeholder="Mật khẩu" required>
							</div>
						</div>

						<div class="row form-group mb-4">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="rePassword">Nhập lại mật
									khẩu</label> <input type="password" id="rePassword" name="rePassword"
									class="form-control" placeholder="Nhập lại mật khẩu" required>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="roleId">Vai trò</label> <select
									class="form-control" name="roleId"
									aria-label="Default select example" required>
									<option selected>Chọn vai trò</option>
									<option value="1">Ứng cử viên</option>
									<option value="2">Công ty</option>
								</select>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
								<input type="submit" value="Đăng kí"
									class="btn px-4 btn-primary text-white">
							</div>
						</div>
					</form:form>

				</div>
				<div class="col-lg-6">
					<h2 class="mb-4">Đăng nhập</h2>
					<form:form action="${pageContext.request.contextPath}/auth/login"
						method="post" class="p-4 border rounded">

						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">Email</label> <input
									type="text" id="fname" name="username" class="form-control"
									placeholder="Email" required>
							</div>
						</div>
						<div class="row form-group mb-4">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">Mật khẩu</label> <input
									type="password" id="fname" name="password" class="form-control"
									placeholder="Mật khẩu" required>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
								<input type="submit" value="Đăng nhập"
									class="btn px-4 btn-primary text-white">
							</div>
						</div>

					</form:form>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<jsp:include page="/WEB-INF/view/public/fragments.jsp" />
	</footer>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const dropdown = document.querySelector('.nav-item.dropdown');
			const dropdownMenu = dropdown.querySelector('.dropdown-menu');
			const dropdownLink = dropdown
					.querySelector('.nav-link.dropdown-toggle'); // Lấy thẻ <a> của dropdown
			const isMobile = window.matchMedia("(min-width: 1200px)").matches; // Nếu màn hình nhỏ hơn 992px (mobile)

			// Khi click vào thẻ dropdown
			dropdown.addEventListener('click', function(event) {
				// Ngừng sự kiện mặc định của browser (tránh nếu có các sự kiện khác ảnh hưởng)
				//event.preventDefault();

				// Kiểm tra trạng thái hiện tại của dropdown menu
				console.log(isMobile)
				if (dropdownMenu.style.display === 'block') {
					dropdownMenu.style.display = 'none'; // Ẩn dropdown

				} else {
					dropdownMenu.style.display = 'block'; // Hiển thị dropdown
				}
			});
			if (isMobile) {
				dropdownLink.addEventListener('mouseenter', function() {
					// Hiển thị dropdown khi hover trên desktop
					dropdownMenu.style.display = 'block'; // Hiển thị dropdown khi hover
				});

				dropdown.addEventListener('mouseleave', function() {
					// Ẩn dropdown khi không hover
					dropdownMenu.style.display = 'none';
				});
			}
		});
	</script>
</body>
</html>