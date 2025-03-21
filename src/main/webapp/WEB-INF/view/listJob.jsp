<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
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
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">Work
				CV</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul
					class="navbar-nav ml-auto <security:authorize access="hasRole('ROLE_COMPANY')">company</security:authorize> <security:authorize access="hasRole('ROLE_CANDIDATE')">candidate</security:authorize> <security:authorize access="isAnonymous()">anonymous</security:authorize>">
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/" class="nav-link">Trang
							chủ</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/listjob" class="nav-link">Công
							việc</a></li>

					<security:authorize access="hasRole('ROLE_COMPANY')">
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/listUser"
							class="nav-link">Ứng cử viên</a></li>
						<li class="nav-item cta mr-md-1"><a
							href="${pageContext.request.contextPath}/recruitment/postJob"
							class="nav-link">Đăng tuyển</a></li>
					</security:authorize>

					<!-- Nếu người dùng đã đăng nhập -->
					<!-- Nếu người dùng đã đăng nhập -->
					<c:if test="${currentUser.fullName != null}">
						<body class="logged-in">
					</c:if>
					<c:if test="${currentUser.fullName == null}">
						<body>
					</c:if>
					<c:if test="${currentUser.fullName != null}">
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle" id="userDropdown" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
								${currentUser.fullName} </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/profile">Hồ Sơ</a></li>
								<security:authorize access="hasRole('ROLE_CANDIDATE')">
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/save-job/get-list">Công
											việc đã lưu</a></li>
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/user/get-list-apply">Công
											việc đã ứng tuyển</a></li>
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/user/get-list-company">Công
											ty đã theo dõi</a></li>
								</security:authorize>
								<security:authorize access="hasRole('ROLE_COMPANY')">
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/user/list-post">Danh
											sách bài đăng</a></li>
								</security:authorize>

								<li>
									<form action="${pageContext.request.contextPath}/logout"
										method="post">

										<button type="submit" class="dropdown-item">Đăng xuất</button>
									</form>
								</li>
							</ul></li>
					</c:if>

					<!-- Nếu người dùng chưa đăng nhập -->
					<c:if test="${currentUser.fullName == null}">
						<li class="nav-item cta cta-colored"><a
							href="${pageContext.request.contextPath}/showMyLoginPage"
							class="nav-link">Đăng nhập</a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-start">
				<div class="col-md-12 text-center mb-5">
					<p class="breadcrumbs mb-0">
						<span class="mr-3"><a
							href="${pageContext.request.contextPath}/">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span>Job Post</span>
					</p>
					<h1 class="mb-3 bread">Công việc</h1>
				</div>
			</div>
		</div>
	</div>
	<section style="display: block" class="ftco-section">
		<div class="">
			<div class="row justify-content-center mb-5">
				<div class="col-md-7 heading-section text-center ">
					<span class="subheading">Thể loại công việc</span>
					<h2 class="mb-0">Các danh mục hàng đầu</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 ">
					<ul class="category text-center">
						<li><a href="#">Web Development <br> <span
								class="number">354</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Graphic Designer <br> <span
								class="number">143</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Multimedia <br> <span class="number">100</span>
								<span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Advertising <br> <span
								class="number">90</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
					</ul>
				</div>
				<div class="col-md-3 ">
					<ul class="category text-center">
						<li><a href="#">Education &amp; Training <br> <span
								class="number">100</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">English <br> <span class="number">200</span>
								<span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Social Media <br> <span
								class="number">300</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Writing <br> <span class="number">150</span>
								<span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li>
					</ul>
				</div>
				<div class="col-md-3 ">
					<ul class="category text-center">
						<li><a href="#">PHP Programming <br> <span
								class="number">400</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Project Management <br> <span
								class="number">100</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Finance Management <br> <span
								class="number">222</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Office &amp; Admin <br> <span
								class="number">123</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
					</ul>
				</div>
				<div class="col-md-3 ">
					<ul class="category text-center">
						<li><a href="#">Web Designer <br> <span
								class="number">324</span> <span>Open position</span></span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Customer Service <br> <span
								class="number">564</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Marketing &amp; Sales <br> <span
								class="number">234</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
						<li><a href="#">Software Development <br> <span
								class="number">425</span> <span>Open position</span><i
								class="ion-ios-arrow-forward"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-no-pb bg-light">
		<div class="container">
			<div class="row justify-content-center mb-4">
				<div class="col-md-7 text-center heading-section ">
					<span class="subheading">Duyệt qua việc làm</span>
					<h2 class="mb-4">Tìm kiếm nâng cao</h2>
				</div>
			</div>
			<div class="row">
				<div class="ftco-search">
					<div class="row">
						<div class="col-md-12 nav-link-wrap">
							<div class="nav nav-pills text-center" id="v-pills-tab"
								role="tablist" aria-orientation="vertical">
								<a class="nav-link active mr-md-1" id="v-pills-1-tab"
									data-toggle="pill" href="#v-pills-1" role="tab"
									aria-controls="v-pills-1" aria-selected="true">Tìm việc làm</a>
								<!-- 
									<a class="nav-link" id="v-pills-2-tab" data-toggle="pill"
									href="#v-pills-2" role="tab" aria-controls="v-pills-2"
									aria-selected="false">Tìm công ty</a>
									
								 -->
							</div>
						</div>
						<div class="col-md-12 tab-wrap">

							<div class="tab-content p-4" id="v-pills-tabContent">

								<div class="tab-pane fade show active" id="v-pills-1"
									role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
									<form
										action="${pageContext.request.contextPath}/listjob/recruitment"
										method="post" class="search-job">
										<div class="row no-gutters">
											<div class="col-md mr-md-2">
												<div class="form-group">
													<div class="form-field">
														<div class="icon">
															<span class="icon-briefcase"></span>
														</div>
														<input type="text" name="title" class="form-control"
															placeholder="eg. Garphic. Web Developer">
													</div>
												</div>
											</div>
											<div class="col-md mr-md-2">
												<div class="form-group">
													<div class="form-field">
														<div class="select-wrap">
															<div class="icon">
																<span class="ion-ios-arrow-down"></span>
															</div>
															<select name="type" id="" class="form-control">
																<option value="">Loại</option>
																<option value="Full Time">Full Time</option>
																<option value="Part Time">Part Time</option>
																<option value="Freelance">Freelance</option>
																<option value="Internship">Internship</option>
																<option value="Temporary">Temporary</option>
															</select>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md mr-md-2">
												<div class="form-group">
													<div class="form-field">
														<div class="icon">
															<span class="icon-map-marker"></span>
														</div>
														<input type="text" name="address" class="form-control"
															placeholder="Vị trí">
													</div>
												</div>
											</div>
											<div class="col-md">
												<div class="form-group">
													<div class="form-field">
														<button type="submit" class="form-control btn btn-primary">Tìm
															kiếm</button>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>

								<!-- 
									<div class="tab-pane fade" id="v-pills-2" role="tabpanel"
									aria-labelledby="v-pills-performance-tab">
									<form action="${pageContext.request.contextPath}/listjob"
										method="post" class="search-job">
										<div class="row">
											<div class="col-md">
												<div class="form-group">
													<div class="form-field">
														<div class="icon">
															<span class="icon-user"></span>
														</div>
														<input type="text" name="nameCompany" class="form-control"
															placeholder="eg. Hà Nội">
													</div>
												</div>
											</div>
											<div class="col-md">
												<div class="form-group">
													<div class="form-field">
														<div class="select-wrap">
															<div class="icon">
																<span class="ion-ios-arrow-down"></span>
															</div>
															<select name="type" id="" class="form-control">
																<option value="">Loại</option>
																<option value="Full Time">Full Time</option>
																<option value="Part Time">Part Time</option>
																<option value="Freelance">Freelance</option>
																<option value="Internship">Internship</option>
																<option value="Temporary">Temporary</option>
															</select>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md">
												<div class="form-group">
													<div class="form-field">
														<div class="icon">
															<span class="icon-map-marker"></span>
														</div>
														<input type="text" name="address" class="form-control"
															placeholder="Vị trí">
													</div>
												</div>
											</div>
											<div class="col-md">
												<div class="form-group">
													<div class="form-field border">
														<button type="submit" class="form-control btn btn-primary">Tìm
															kiếm</button>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
								 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 pr-lg-4">
					<c:if test="${not empty list.content }">
						<c:forEach var="recruitment" items="${list.content }">
							<div class="row">
								<div class="col-md-12">
									<div
										class="job-post-item p-4 d-block d-lg-flex align-items-center">
										<div class="one-third mb-4 mb-md-0">
											<div class="job-post-item-header align-items-center">
												<span class="subadge">${recruitment.type }</span>
												<h2 class="mr-3 text-black">
													<a
														href="${pageContext.request.contextPath}/recruitment/detail/${recruitment.id}">${recruitment.title }</a>
												</h2>
											</div>
											<div class="job-post-item-body d-block d-md-flex">
												<div class="mr-3">
													<span class="icon-layers"></span> <a
														href="${pageContext.request.contextPath}/company/detail-company/${recruitment.company.id}">${recruitment.company.nameCompany }</a>
												</div>
												<div>
													<span class="icon-my_location"></span> <span>${recruitment.address }</span>
												</div>
											</div>
										</div>
										<input type="hidden" id="idRe${recruitment.id}"
											value="${recruitment.id}">
										<c:if test="${empty user }">
											<div
												class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
												<div>
													<a onclick="save(${recruitment.id})"
														class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
														<span class="icon-heart"></span>
													</a>
												</div>
												<a data-toggle="modal"
													data-target="#exampleModalApplyJob${recruitment.id}"
													class="btn btn-primary py-2">Apply Job</a>
											</div>
										</c:if>
										<c:forEach var="role" items="${user.roles }">
											<c:if test="${role.id == 1 }">
												<div
													class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
													<div>
														<a onclick="save(${recruitment.id})"
															class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
															<span class="icon-heart"></span>
														</a>
													</div>
													<a data-toggle="modal"
														data-target="#exampleModalApplyJob${recruitment.id}"
														class="btn btn-primary py-2">Apply Job</a>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
								<!-- end -->
							</div>
							<div class="modal fade"
								id="exampleModalApplyJob${recruitment.id}" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">
												Ứng tuyển: <span>${recruitment.title}</span>
											</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form method="post" action="/user/apply-job">
											<div class="modal-body">
												<div class="row">
													<div class="col-12">
														<select id="choose${recruitment.id}"
															onchange="choosed(${recruitment.id})"
															class="form-control" aria-label="Default select example">
															<option value="0" selected>Chọn phương thức nộp</option>
															<option value="1">Dùng cv đã cập nhật</option>
															<option value="2">Nộp cv mới</option>
														</select>
													</div>
													<div id="loai1${recruitment.id}" style="display: none"
														class="col-12">
														<label for="fileUpload" class="col-form-label">Giới
															thiệu:</label>
														<textarea rows="10" cols="3" class="form-control"
															id="text${recruitment.id}">

                                                    </textarea>
													</div>
													<div id="loai2${recruitment.id}" style="display: none"
														class="col-12">

														<label for="fileUpload" class="col-form-label">Chọn
															cv:</label> <input type="file" class="form-control"
															id="fileUpload${recruitment.id}" name="file" required>
														<label for="fileUpload" class="col-form-label">Giới
															thiệu:</label>
														<textarea rows="10" cols="3" class="form-control"
															id="text${recruitment.id}">

                                                    </textarea>
													</div>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Đóng</button>
													<button type="button" id="button1${recruitment.id}"
														style="display: none" onclick="apply1(${recruitment.id})"
														class="btn btn-primary">Nộp</button>
													<button type="button" id="button2${recruitment.id}"
														style="display: none" onclick="apply(${recruitment.id})"
														class="btn btn-primary">Nộp</button>
												</div>
											</div>
										</form>


									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty list.content}">
						<div style="text-align: center">
							<p style="color: red">Không có kết quả nào</p>
						</div>
					</c:if>
					<c:if test="${list.totalPages > 0}">
						<div class="row mt-5">
							<div class="col text-center">
								<div class="block-27">
									<ul>
										<!-- Trang trước -->
										<c:if test="${numberPage > 0}">
											<li><a
												href="${pageContext.request.contextPath}/listjob/recruitment?page=${numberPage - 1}&title=${title}&type=${type}&address=${address}">&lt;</a>
											</li>
										</c:if>

										<!-- Các trang -->
										<c:forEach begin="0" end="${list.totalPages - 1}"
											var="pageIndex">
											<c:if test="${pageIndex < list.totalPages}">
												<li class="${numberPage == pageIndex ? 'active' : ''}">
													<a
													href="${pageContext.request.contextPath}/listjob/recruitment?page=${pageIndex}&title=${title}&type=${type}&address=${address}">
														${pageIndex + 1} </a>
												</li>
											</c:if>
										</c:forEach>

										<!-- Trang sau -->
										<c:if test="${numberPage < list.totalPages - 1}">
											<li><a
												href="${pageContext.request.contextPath}/listjob/recruitment?page=${numberPage + 1}&title=${title}&type=${type}&address=${address}">&gt;</a>
											</li>
										</c:if>

									</ul>
								</div>
							</div>
						</div>
					</c:if>
				</div>
				<div class="col-lg-3 sidebar">
					<div class="sidebar-box bg-white p-4 ftco-animate">
						<h3 class="heading-sidebar">Browse Category</h3>
						<form action="#" class="search-form mb-3">
							<div class="form-group">
								<span class="icon icon-search"></span> <input type="text"
									class="form-control" placeholder="Search...">
							</div>
						</form>
						<form action="#" class="browse-form">
							<label for="option-job-1"><input type="checkbox"
								id="option-job-1" name="vehicle" value="" checked>
								Website &amp; Software</label><br> <label for="option-job-2"><input
								type="checkbox" id="option-job-2" name="vehicle" value="">
								Education &amp; Training</label><br> <label for="option-job-3"><input
								type="checkbox" id="option-job-3" name="vehicle" value="">
								Graphics Design</label><br> <label for="option-job-4"><input
								type="checkbox" id="option-job-4" name="vehicle" value="">
								Accounting &amp; Finance</label><br> <label for="option-job-5"><input
								type="checkbox" id="option-job-5" name="vehicle" value="">
								Restaurant &amp; Food</label><br> <label for="option-job-6"><input
								type="checkbox" id="option-job-6" name="vehicle" value="">
								Health &amp; Hospital</label><br>
						</form>
					</div>

					<div class="sidebar-box bg-white p-4 ftco-animate">
						<h3 class="heading-sidebar">Select Location</h3>
						<form action="#" class="search-form mb-3">
							<div class="form-group">
								<span class="icon icon-search"></span> <input type="text"
									class="form-control" placeholder="Search...">
							</div>
						</form>
						<form action="#" class="browse-form">
							<label for="option-location-1"><input type="checkbox"
								id="option-location-1" name="vehicle" value="" checked>
								Sydney, Australia</label><br> <label for="option-location-2"><input
								type="checkbox" id="option-location-2" name="vehicle" value="">
								New York, United States</label><br> <label for="option-location-3"><input
								type="checkbox" id="option-location-3" name="vehicle" value="">
								Tokyo, Japan</label><br> <label for="option-location-4"><input
								type="checkbox" id="option-location-4" name="vehicle" value="">
								Manila, Philippines</label><br> <label for="option-location-5"><input
								type="checkbox" id="option-location-5" name="vehicle" value="">
								Seoul, South Korea</label><br> <label for="option-location-6"><input
								type="checkbox" id="option-location-6" name="vehicle" value="">
								Western City, UK</label><br>
						</form>
					</div>

					<div class="sidebar-box bg-white p-4 ftco-animate">
						<h3 class="heading-sidebar">Job Type</h3>
						<form action="#" class="browse-form">
							<label for="option-job-type-1"><input type="checkbox"
								id="option-job-type-1" name="vehicle" value="" checked>
								Partime</label><br> <label for="option-job-type-2"><input
								type="checkbox" id="option-job-type-2" name="vehicle" value="">
								Fulltime</label><br> <label for="option-job-type-3"><input
								type="checkbox" id="option-job-type-3" name="vehicle" value="">
								Intership</label><br> <label for="option-job-type-4"><input
								type="checkbox" id="option-job-type-4" name="vehicle" value="">
								Temporary</label><br> <label for="option-job-type-5"><input
								type="checkbox" id="option-job-type-5" name="vehicle" value="">
								Freelance</label><br> <label for="option-job-type-6"><input
								type="checkbox" id="option-job-type-6" name="vehicle" value="">
								Fixed</label><br>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section-parallax">
		<div class="parallax-img d-flex align-items-center">
			<div class="container">
				<div class="row d-flex justify-content-center">
					<div
						class="col-md-7 text-center heading-section heading-section-white">
						<h2>Subcribe to our Newsletter</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.
							Separated they live in</p>
						<div class="row d-flex justify-content-center mt-4 mb-4">
							<div class="col-md-12">
								<form action="#" class="subscribe-form">
									<div class="form-group d-flex">
										<input type="text" class="form-control"
											placeholder="Enter email address"> <input
											type="submit" value="Subscribe" class="submit px-3">
									</div>
								</form>
							</div>
						</div>
					</div>
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

			// Hiển thị dropdown khi hover vào dropdown
			dropdown.addEventListener('mouseenter', function() {
				dropdownMenu.style.display = 'block'; // Hiển thị dropdown
			});

			// Ẩn dropdown khi rời khỏi dropdown
			dropdown.addEventListener('mouseleave', function() {
				dropdownMenu.style.display = 'none'; // Ẩn dropdown
			});

			// Đảm bảo menu vẫn hiển thị khi hover vào dropdown-menu
			dropdownMenu.addEventListener('mouseenter', function() {
				dropdownMenu.style.display = 'block'; // Giữ menu hiển thị
			});

			// Ẩn dropdown khi rời khỏi menu
			dropdownMenu.addEventListener('mouseleave', function() {
				dropdownMenu.style.display = 'none'; // Ẩn dropdown
			});
		});
	</script>
	<script>
  // Lấy đường dẫn hiện tại
  const currentPath = window.location.pathname;
  
  // Chọn tất cả các li
  const navItems = document.querySelectorAll('.nav-item');
  
  navItems.forEach(item => {
    // Nếu href trong <a> trùng với URL hiện tại
    if (item.querySelector('a').getAttribute('href') === currentPath) {
    	
      item.classList.add('active');
    }
  });
  document.addEventListener('DOMContentLoaded', function() {
	    const dropdown = document.querySelector('.nav-item.dropdown');
	    const dropdownMenu = dropdown.querySelector('.dropdown-menu');
	    const dropdownLink = dropdown.querySelector('.nav-link.dropdown-toggle'); // Lấy thẻ <a> của dropdown
	    const isMobile = window.matchMedia("(min-width: 1200px)").matches; // Nếu màn hình nhỏ hơn 992px (mobile)
	    
	    // Khi click vào thẻ dropdown
	    dropdown.addEventListener('click', function(event) {
	        // Ngừng sự kiện mặc định của browser (tránh nếu có các sự kiện khác ảnh hưởng)
	        //event.preventDefault();
	        
	        // Kiểm tra trạng thái hiện tại của dropdown menu
	        console.log(isMobile)
	        if (dropdownMenu.style.display === 'block') {
	            dropdownMenu.style.display = 'none';  // Ẩn dropdown
	            
	        } else {
	            dropdownMenu.style.display = 'block'; // Hiển thị dropdown
	        }
	    });
	    if(isMobile){
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
	<script>
function apply1(id) {
	var name = "#idRe" + id;
	var name1 = 'loai1' + id;
	var name2 = 'loai2' + id;
	var nameModal = "#exampleModalApplyJob" + id;
	var nameFile = "#fileUpload" + id;
	var nameText = "#text1" + id;
	var idRe = $(name).val();
	var textvalue = $(nameText).val();
	var formData = new FormData();
	formData.append('idRe', idRe);
	formData.append('text', textvalue);
	var userLoggedIn = ${empty user ? 'false' : 'true'}; // Kiểm tra biến user
	$.ajax({
		type : 'POST',
		url : '/Assignment02/user/apply-job1/',
		contentType : false,
		processData : false,
		data : formData,
		success : function(data) {
			console.log("data: ", data)
			if (!userLoggedIn) {
				Swal.fire({
					title : 'Bạn cần phải đăng nhập!',
					/* text: 'Redirecting...', */
					icon : 'error',
					timer : 3000,
					buttons : true,
					type : 'error'
                });
			} else if (data == "true") {
				Swal.fire({
					title : 'Ứng tuyển thành công!',
					/* text: 'Redirecting...', */
					icon : 'success',
					timer : 3000,
					buttons : true,
					type : 'success'
                });
				$(nameModal).modal('hide');
				$('#fileUpload').val("");
				$(name1).modal('hide');
                $(name2).modal('hide');
                
                // Ẩn phần loai1 và loai2 khi đã ứng tuyển
                $("#" + name1).hide();
                $("#" + name2).hide();
             	// Thiết lập lại giá trị select về "0"
                $("#choose" + id).val("0");
             // Reset textvalue và textarea
                textvalue = '';  // Reset biến textvalue
                $(nameText).val(''); // Reset lại textarea

			}
			else if (data == "notExitsCv") {
				Swal.fire({
					title : 'Cv không có sẵn trong hồ sơ',
					/* text: 'Redirecting...', */
					icon : 'error',
					timer : 3000,
					buttons : true,
					type : 'error'
                });
			}
			else if(data == "exitsUserApplyJob"){
				Swal.fire({
					title : 'Bạn đã ứng tuyển công việc này!',
					/* text: 'Redirecting...', */
					icon : 'error',
					timer : 3000,
					buttons : true,
					type : 'error'
                });
				$(nameModal).modal('hide');
				$('#fileUpload').val("");
				$(name1).modal('hide');
                $(name2).modal('hide');
                
                // Ẩn phần loai1 và loai2 khi đã ứng tuyển
                $("#" + name1).hide();
                $("#" + name2).hide();
             	// Thiết lập lại giá trị select về "0"
                $("#choose" + id).val("0");
             // Reset textvalue và textarea
                textvalue = '';  // Reset biến textvalue
                console.log(nameText);
                $(nameText).val(''); // Reset lại textarea
				console.log(nameText + " 1")
			}
		},
		error : function(err) {
			alert(err);
		}
	})

}
function choosed(id) {
	var name = '#choose' + id;
	var name1 = 'loai1' + id;
	var name2 = 'loai2' + id;
	var button1 = 'button1' + id;
	var button2 = 'button2' + id;
	var giaitri = $(name).val();
	if (giaitri == 1) {
		document.getElementById(name1).style.display = 'block'
		document.getElementById(name2).style.display = 'none'
		document.getElementById(button1).style.display = 'block'
		document.getElementById(button2).style.display = 'none'
	} else if(giaitri == 2) {
		document.getElementById(name2).style.display = 'block'
		document.getElementById(name1).style.display = 'none'
		document.getElementById(button2).style.display = 'block'
		document.getElementById(button1).style.display = 'none'
	}
	else{
		document.getElementById(name2).style.display = 'none'
			document.getElementById(name1).style.display = 'none'
			document.getElementById(button2).style.display = 'none'
			document.getElementById(button1).style.display = 'none'
	}
}

	function save(id) {
		var name = "#idRe" + id;
		var idRe = $(name).val();
		var formData = new FormData();
		formData.append('idRe', idRe);
		var userLoggedIn = ${empty user ? 'false' : 'true'}; // Kiểm tra biến user
		$.ajax({
			type : 'POST',
			url : '/Assignment02/user/save/',
			contentType : false,
			processData : false,
			data : formData,
			success : function(data) {
				console.log(data);
				if (!userLoggedIn) {
					Swal.fire({
						title : 'Bạn cần phải đăng nhập!',
						/* text: 'Redirecting...', */
						icon : 'error',
						timer : 3000,
						buttons : true,
						type : 'error'
					})
				} else if (data == "true") {
					Swal.fire({
						title : 'Lưu thành công!',
						/* text: 'Redirecting...', */
						icon : 'success',
						timer : 3000,
						buttons : true,
						type : 'success'
					})
				} else if(data == "existSaveJob") {
					Swal.fire({
						title : 'Bạn đã lưu bài này rồi!',
						/* text: 'Redirecting...', */
						icon : 'error',
						timer : 3000,
						buttons : true,
						type : 'error'
					})
				}
			},
			error : function(err) {
				alert(err);
			}
		})
	}

	function apply(id) {
		var name = "#idRe" + id;
		var name1 = 'loai1' + id;
		var name2 = 'loai2' + id;
		var nameModal = "#exampleModalApplyJob" + id;
		var nameFile = "#fileUpload" + id;
		var nameText = "#text2" + id;
		var idRe = $(name).val();
		var textvalue = $(nameText).val();
		var fileUpload = $(nameFile).get(0);
		var files = fileUpload.files;
		var formData = new FormData();
		formData.append('file', files[0]);
		formData.append('idRe', idRe);
		formData.append('text', textvalue);
		var userLoggedIn = ${empty user ? 'false' : 'true'}; // Kiểm tra biến user
		if (files[0] == null) {
			Swal.fire({
				title : 'Bạn cần phải chọn cv!',
				/* text: 'Redirecting...', */
				icon : 'error',
				timer : 3000,
				buttons : true,
				type : 'error'
            });
		} 
		else{
			var file = files[0];
			var fileName = file.name;
	        var fileExtension = fileName.split('.').pop().toLowerCase();
	        var fileType = file.type;
	        if (fileExtension !== 'pdf' || fileType !== 'application/pdf') {
	            Swal.fire({
	            	title : 'Bạn phải chọn một file PDF!',
					/* text: 'Redirecting...', */
					icon : 'error',
					timer : 3000,
					buttons : true,
					type : 'error'
	            });
	            $(nameFile).val(''); // Xóa file đã chọn
	            return;
	        }
	        else {
				$.ajax({
					type : 'POST',
					url : '/Assignment02/user/apply-job',
					contentType : false,
					processData : false,
					data : formData,
					dataType: 'text',  // Chắc chắn nhận dạng dữ liệu là chuỗi (text)
					success : function(data) {
						console.log("data: ", data)
						if (!userLoggedIn) {
							Swal.fire({
								title : 'Bạn cần phải đăng nhập!',
								/* text: 'Redirecting...', */
								icon : 'error',
								timer : 3000,
								buttons : true,
								type : 'error'
	                        });
						} else if (data == "true") {
							Swal.fire({
								title : 'Ứng tuyển thành công!',
								/* text: 'Redirecting...', */
								icon : 'success',
								timer : 3000,
								buttons : true,
								type : 'success'
	                        });
							$(nameModal).modal('hide');
							$('#fileUpload').val("");
							
							$(name1).modal('hide');
		                    $(name2).modal('hide');
		                    
		                    // Ẩn phần loai1 và loai2 khi đã ứng tuyển
		                    $("#" + name1).hide();
		                    $("#" + name2).hide();
		                 	// Thiết lập lại giá trị select về "0"
		                    $("#choose" + id).val("0");
		                    $(nameFile).val(''); // Xóa file đã chọn
		                    fileUpload.value = ''; // Dùng để xóa lại file input
		                 // Reset textvalue và textarea
		                    textvalue = '';  // Reset biến textvalue
		                    $(nameText).val(''); // Reset lại textarea

						}
						else if (data == "notExitsCv") {
							Swal.fire({
								title : 'Cv không có sẵn trong hồ sơ',
								/* text: 'Redirecting...', */
								icon : 'error',
								timer : 3000,
								buttons : true,
								type : 'error'
	                        });
						}
						else if(data == "exitsUserApplyJob"){
							Swal.fire({
								title : 'Bạn đã ứng tuyển công việc này!',
								/* text: 'Redirecting...', */
								icon : 'error',
								timer : 3000,
								buttons : true,
								type : 'error'
	                        });
							$(nameModal).modal('hide');
							$('#fileUpload').val("");
							$(name1).modal('hide');
		                    $(name2).modal('hide');
		                    
		                    // Ẩn phần loai1 và loai2 khi đã ứng tuyển
		                    $("#" + name1).hide();
		                    $("#" + name2).hide();
		                 	// Thiết lập lại giá trị select về "0"
		                    $("#choose" + id).val("0");
		                    $(nameFile).val(''); // Xóa file đã chọn
		                    fileUpload.value = ''; // Dùng để xóa lại file input
		                 // Reset textvalue và textarea
		                    textvalue = '';  // Reset biến textvalue
	                    	$(nameText).val(''); // Reset lại textarea
						}
					},
					error : function(err) {
						alert(err);
					}
				})
			}
		}
		

	}
</script>

</body>
</html>