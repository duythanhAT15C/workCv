<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Skillhunt - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

	<c:if test="${not empty reviewSuccess }">
		<div class="toast" data-delay="1000"
			style="position: fixed; top: 100px; left: 40px; z-index: 2000; width: 300px">
			<script>
				console.log("reviewSuccess: ${reviewSuccess}");
				setTimeout(function() {
					Swal.fire({
						title : 'Review success!',
						text : '${reviewSuccess}',
						icon : 'success',
						timer : 6000,
						buttons : true,
						type : 'success'
					});
				}, 1000); // Delay to match data-delay attribute
			</script>
		</div>
	</c:if>
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
						<span class="mr-3"><a href="index.html">Trang chủ <i
								class="ion-ios-arrow-forward"></i></a></span>Chi tiết <span></span>
					</p>
					<h1 class="mb-3 bread">Chi tiết công việc</h1>
				</div>
			</div>
		</div>
	</div>

	<section style="margin-top: 10px" class="site-section">
		<div class="container">
			<div class="row align-items-center mb-5">
				<div class="col-lg-8 mb-4 mb-lg-0">
					<div class="d-flex align-items-center">
						<div class="border p-2 d-inline-block mr-3 rounded">
							<c:if
								test="${fn:contains(recruitment.company.logo, 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg')}">
								<!-- Nếu đường dẫn đã chứa phần URL cụ thể, không cần thêm /Assignment02 -->
								<img width="100" height="100" src="${recruitment.company.logo}"
									alt="Image">
							</c:if>
							<c:if
								test="${not fn:contains(recruitment.company.logo, 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg')}">
								<!-- Nếu đường dẫn đã chứa phần URL cụ thể, không cần thêm /Assignment02 -->
								<img width="100" height="100"
									src="${pageContext.request.contextPath}${recruitment.company.logo}"
									alt="Image">
							</c:if>
						</div>
						<div>
							<h2>${recruitment.title}</h2>
							<div>
								<span class="icon-briefcase mr-2"></span><a
									href="${pageContext.request.contextPath}/company/detail-company/${recruitment.company.id}"
									class="ml-0 mr-2 mb-2"> ${recruitment.company.nameCompany}</a>
								<span class="icon-room mr-2">
									${recruitment.company.address}</span><span class="m-2"></span> <span
									class="icon-clock-o mr-2"> ${recruitment.type}</span><span
									class="m-2"></span>
							</div>
							<input type="hidden" id="idRe${recruitment.id}"
								value="${recruitment.id}">
						</div>
					</div>
				</div>
				<!--  <div class="col-lg-4">
					<div class="row">
						<div class="col-6">
							<a class="btn btn-block btn-light btn-md"><span
								class="icon-heart-o mr-2 text-danger"></span>Lưu</a>
						</div>
						<div class="col-6">
							<a data-toggle="modal" class="btn btn-block btn-primary btn-md">Ứng
								tuyển</a>
						</div>
					</div>
				</div>
				-->
				<div class="col-lg-4">
					<div class="row">
						<c:forEach var="role" items="${user.roles}">
							<c:if test="${role.id == 1}">
								<c:choose>
									<c:when test="${checkExistSaveJob}">
										<!-- Nếu đã lưu công việc -->
										<div class="col-6">
											<a id="save-button-${recruitment.id}"
												data-job-id="${recruitment.id}" data-checked="true"
												class="btn btn-block btn-light btn-md"> <span
												id="icon-heart-${recruitment.id}"
												class="icon-heart mr-2 text-danger"></span>Đã lưu
											</a>
										</div>
									</c:when>
									<c:otherwise>
										<!-- Nếu chưa lưu công việc -->
										<div class="col-6">
											<a id="save-button-${recruitment.id}"
												data-job-id="${recruitment.id}" data-checked="false"
												class="btn btn-block btn-light btn-md"> <span
												id="icon-heart-${recruitment.id}"
												class="icon-heart-o mr-2 text-danger"></span>Lưu
											</a>
										</div>
									</c:otherwise>
								</c:choose>

								<div class="col-6">
									<a data-toggle="modal"
										class="btn btn-block btn-primary btn-md "
										data-target="#exampleModal${recruitment.id }">Ứng tuyển</a>
								</div>
							</c:if>
							<!-- Modal Button Ứng tuyển-->
							<div class="modal fade" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLabel" aria-hidden="true"
								id="exampleModal${recruitment.id }">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">
												Ứng tuyển: <span>${recruitment.title }</span>
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
										<script>
				document.addEventListener("DOMContentLoaded", function () {
				    const cvTypeSelect = document.getElementById("cvTypeSelect${recruitment.id }");
				    const cvUploadSection = document.getElementById("cvUploadSection${recruitment.id }");
				    const fileUploadInput = document.getElementById("fileUpload${recruitment.id}");

				    // Lắng nghe sự kiện thay đổi trên dropdown
				    cvTypeSelect.addEventListener("change", function () {
				        if (cvTypeSelect.value === "new") {
				            // Hiển thị phần chọn CV
				            cvUploadSection.style.display = "block";
				            fileUploadInput.removeAttribute("disabled"); // Bật input file
				        } else {
				            // Ẩn phần chọn CV và tắt input file
				            cvUploadSection.style.display = "none";
				            fileUploadInput.setAttribute("disabled", "true"); // Tắt input file
				            fileUploadInput.value = ""; // Xóa file đã chọn
				        }
				    });
				});



				</script>


									</div>
								</div>
							</div>
						</c:forEach>
						<c:if test="${empty user }">
							<div class="col-6">
								<a id="follow-button" class="btn btn-block btn-light btn-md"><span
									class="icon-heart-o mr-2 text-danger"></span>Lưu</a>
							</div>
						</c:if>
					</div>
				</div>

			</div>
			<div class="row">
				<div class="col-lg-8">
					<div class="mb-5">

						<h3 class="h5 d-flex align-items-center mb-4 text-primary">
							<span class="icon-align-left mr-3"></span>Mô tả công việc
						</h3>
						<p>${recruitment.description}</p>
					</div>

				</div>
				<div class="col-lg-4">
					<div class="bg-light p-3 border rounded mb-4">
						<h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Tóm tắt công
							việc</h3>
						<ul class="list-unstyled pl-3 mb-0">
							<li class="mb-2"><strong class="text-black">Ngày
									tạo: </strong> <span>${recruitment.formatCreateAt }</span></li>
							<li class="mb-2"><strong class="text-black">Kiểu
									công việc: </strong> <span>${recruitment.type }</span></li>
							<li class="mb-2"><strong class="text-black">Loại
									công việc: </strong> <span>${recruitment.category.name }</span></li>
							<li class="mb-2"><strong class="text-black">Kinh
									nghiệm: </strong> <span>${recruitment.experience } </span></li>
							<li class="mb-2"><strong class="text-black">Địa
									chỉ: </strong> <span> ${recruitment.address }</span></li>
							<li class="mb-2"><strong class="text-black">Lương:
							</strong> <span> ${recruitment.salary } </span></li>
							<li class="mb-2"><strong class="text-black">Số
									lượng: </strong><span>${recruitment.quantity }</span> người</li>
							<li class="mb-2"><strong class="text-black">Hạn nộp
									CV: </strong><span>${recruitment.formatDeadLine }</span></li>
						</ul>
					</div>

					<div class="bg-light p-3 border rounded">
						<h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Share</h3>
						<div class="px-3">
							<a href="#" class="pt-3 pb-3 pr-3 pl-0"><span
								class="icon-facebook"></span></a> <a href="#"
								class="pt-3 pb-3 pr-3 pl-0"><span class="icon-twitter"></span></a>
							<a href="#" class="pt-3 pb-3 pr-3 pl-0"><span
								class="icon-linkedin"></span></a> <a href="#"
								class="pt-3 pb-3 pr-3 pl-0"><span class="icon-pinterest"></span></a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>


	<section class="site-section" id="next">
		<div class="container">
			<div class="row mb-5 justify-content-center">
				<div class="col-md-7 text-center">
					<c:if
						test="${not empty applyPosts and sessionScope.paginationType == 'listPost'}">
						<h2 class="section-title mb-2">Danh sách ứng viên ứng tuyển</h2>
					</c:if>
					<c:if test="${sessionScope.paginationType == 'category'}">
						<h2 class="section-title mb-2">Những công việc liên quan</h2>

					</c:if>
				</div>
			</div>
			<c:if
				test="${not empty list.content and sessionScope.paginationType == 'category'}">

				<div class="row">
					<div class="col-lg-12 pr-lg-4">
						<div class="row">

							<c:forEach var="recruitment" items="${list.content}">
								<div class="col-md-12">
									<div
										class="job-post-item p-4 d-block d-lg-flex align-items-center">
										<div class="one-third mb-4 mb-md-0">
											<div class="job-post-item-header align-items-center">
												<span class="subadge"><c:out
														value="${recruitment.type}" /></span>
												<h2 class="mr-3 text-black">
													<a
														href="${pageContext.request.contextPath}/recruitment/detail/${recruitment.id}">
														<c:out value="${recruitment.title}" />
													</a>
												</h2>
											</div>
											<div class="job-post-item-body d-block d-md-flex">
												<div class="mr-3">
													<span class="icon-layers"></span> <a
														href="${pageContext.request.contextPath}/company/detail-company/${recruitment.company.id}">
														<c:out value="${recruitment.company.nameCompany}" />
													</a>
												</div>
												<div>
													<span class="icon-my_location"></span> <span><c:out
															value="${recruitment.address}" /></span>
												</div>
											</div>
										</div>

										<div
											class="one-forth ml-auto button-custom d-flex align-items-center mt-4 md-md-0"
											style="width: 236px">
											<a
												href="${pageContext.request.contextPath}/recruitment/detail/${recruitment.id}"
												class="btn btn-primary py-2 ml-2">Xem chi tiết</a>
											<c:forEach var="role" items="${user.roles }">
												<c:if test="${role.id == 1}">
													<a data-toggle="modal"
														data-target="#exampleModalApplyJob${recruitment.id}"
														class="btn btn-primary py-2 ml-2">Apply Job</a>
												</c:if>
												<c:if
													test="${role.id == 2 and sessionScope.paginationType == 'listPost'}">
													<a
														href="${pageContext.request.contextPath}/recruitment/editpost/${recruitment.id}"
														class="btn btn-warning py-2 ml-2">Cập nhật</a>
													<a class="btn btn-danger py-2 ml-2" href="#"
														data-toggle="modal"
														data-target="#exampleModalDelete${recruitment.id}">Xóa</a>
												</c:if>
												<input type="hidden" id="idRe${recruitment.id}"
													value="${recruitment.id}">
											</c:forEach>
										</div>
									</div>
								</div>

								<!-- Modal -->
								<div class="modal fade" id="exampleModalDelete${recruitment.id}"
									tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Bạn có
													chắc chắn muốn xóa ?</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												Bài đăng :
												<c:out value="${recruitment.title}" />
												<form:form
													action="${pageContext.request.contextPath}/recruitment/delete"
													method="post">
													<input type="hidden" class="form-control" id="id" name="id"
														value="${recruitment.id}">
													<div class="modal-footer mt-1">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Đóng</button>
														<button type="submit" class="btn btn-danger">Xóa</button>
													</div>
												</form:form>
											</div>
										</div>
									</div>
								</div>



								<!-- Modal Button Apply Job -->
								<div class="modal fade" tabindex="-1" role="dialog"
									aria-labelledby="exampleModalLabel" aria-hidden="true"
									id="exampleModalApplyJob${recruitment.id}">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">
													Ứng tuyển: <span>${recruitment.title }</span>
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
											<script>
				document.addEventListener("DOMContentLoaded", function () {
				    const cvTypeSelect = document.getElementById("cvTypeSelect${recruitment.id }");
				    const cvUploadSection = document.getElementById("cvUploadSection${recruitment.id }");
				    const fileUploadInput = document.getElementById("fileUpload${recruitment.id}");

				    // Lắng nghe sự kiện thay đổi trên dropdown
				    cvTypeSelect.addEventListener("change", function () {
				        if (cvTypeSelect.value === "new") {
				            // Hiển thị phần chọn CV
				            cvUploadSection.style.display = "block";
				            fileUploadInput.removeAttribute("disabled"); // Bật input file
				        } else {
				            // Ẩn phần chọn CV và tắt input file
				            cvUploadSection.style.display = "none";
				            fileUploadInput.setAttribute("disabled", "true"); // Tắt input file
				            fileUploadInput.value = ""; // Xóa file đã chọn
				        }
				    });
				});



				</script>


										</div>
									</div>
								</div>


							</c:forEach>



						</div>
						<c:if test="${list.totalPages > 1}">
							<div class="row mt-5">
								<div class="col text-center">
									<div class="block-27">
										<ul>
											<!-- Trang trước -->
											<c:if test="${numberPage > 0}">
												<li><a
													href="${pageContext.request.contextPath}/recruitment/detail/${recruitment.id }?page=${numberPage - 1}">&lt;</a></li>
											</c:if>
											<!-- Các trang -->
											<c:forEach begin="0" end="${list.totalPages - 1}"
												var="pageIndex">
												<!-- Chỉ hiển thị trang có nội dung -->
												<c:if test="${pageIndex < list.totalPages}">
													<li class="${numberPage == pageIndex ? 'active' : ''}">
														<a
														href="${pageContext.request.contextPath}/recruitment/detail/${recruitment.id }?page=${pageIndex}">${pageIndex + 1}</a>
													</li>
												</c:if>
											</c:forEach>
											<!-- Trang sau -->
											<c:if test="${numberPage < list.totalPages - 1}">
												<li><a
													href="${pageContext.request.contextPath}/recruitment/detail/${recruitment.id }?page=${numberPage + 1}">&gt;</a></li>
											</c:if>
										</ul>
									</div>
								</div>
							</div>
						</c:if>

					</div>
				</div>
			</c:if>
			<c:forEach var="role" items="${user.roles }">
				<c:if
					test="${role.id == 2 and sessionScope.paginationType == 'listPost'  }">
					<c:if test="${not empty applyPosts}">
						<div class="row">
							<div class="col-lg-12 pr-lg-4">
								<div class="row">
									<!-- Nếu danh sách applyPosts không rỗng -->
									<c:if test="${not empty applyPosts.content}">
										<c:forEach var="applyPost" items="${applyPosts.content}">
											<div class="col-md-12"
												style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; margin: 20px auto;">
												<div class="team d-md-flex p-4 bg-white">
													<!-- Ảnh người dùng -->


													<c:choose>
														<c:when test="${not empty applyPost.user.image}">
															<c:if
																test="${fn:contains(applyPost.user.image, 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg')}">
																<!-- Nếu đường dẫn đã chứa phần URL cụ thể, không cần thêm /Assignment02 -->
																<img class="img" src="${applyPost.user.image}" />
																<input type="hidden" id="userImage" class="img"
																	value="${applyPost.user.image}" />
															</c:if>
															<c:if
																test="${not fn:contains(applyPost.user.image, 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg')}">
																<!-- Nếu đường dẫn không chứa URL đó, thêm /Assignment02 -->
																<img class="img"
																	src="${pageContext.request.contextPath}${applyPost.user.image}" />
																<input type="hidden" id="userImage" class="img"
																	value="${pageContext.request.contextPath}${applyPost.user.image}" />
															</c:if>
														</c:when>
														<c:otherwise>
															<img class="img"
																src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg" />
															<input type="hidden" id="userImage" class="img"
																value="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg" />
														</c:otherwise>
													</c:choose>
													<div class="text pl-md-4">
														<!-- Thông tin người dùng -->
														<h5 class="location mb-0">Họ tên: ${not empty applyPost.user.fullName ? applyPost.user.fullName : 'Chưa cập nhật'}</h5>
														<p style="display: block; color: black">Địa chỉ: ${not empty applyPost.user.address ? applyPost.user.address : 'Chưa cập nhật'}</p>
														<span class="position"
															style="display: block; color: black"> Email:
															${applyPost.user.email} </span>
														<p class="mb-4" style="width: 700px">Mô tả bản thân:
															${not empty applyPost.user.description ? applyPost.user.description : 'Chưa cập nhật'}</p>
														<div class="row">
															<!-- Xem CV -->
															<p>
																<c:if test="${not empty applyPost.nameCv}">
																	<a target="_blank" class="btn btn-primary"
																		href="${pageContext.request.contextPath}${applyPost.nameCv}">
																		Xem cv </a>
																</c:if>
															</p>
															<!-- Nếu status là 0, hiển thị nút Duyệt -->
															<c:if test="${applyPost.status == 0}">
																<p style="margin-left: 10px">
																	<a class="btn btn-outline-primary" data-toggle="modal"
																		data-target="#exampleModalReview${applyPost.id}"
																		onclick="setFileName('${applyPost.nameCv}', '${applyPost.id}')">
																		Duyệt </a>
																</p>
															</c:if>
															<!-- Nếu status là 1, hiển thị Đã duyệt -->
															<c:if test="${applyPost.status == 1}">
																<p style="margin-left: 10px; margin-top: 15px">
																	<span style="color: #1e7e34; font-weight: bold">Đã
																		duyệt</span>
																</p>
															</c:if>
														</div>
													</div>
												</div>
											</div>
											<!-- Modal duyệt -->
											<div class="modal fade"
												id="exampleModalReview${applyPost.id}" tabindex="-1"
												role="dialog" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">Bạn
																có chắc chắn muốn duyệt CV này ?</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															CV : <span id="fileName${applyPost.id}"></span><br>
															Người nộp:
															<c:out
																value="${not empty applyPost.user.fullName ? applyPost.user.fullName : 'Chưa cập nhật'}"></c:out>
															<form:form
																action="${pageContext.request.contextPath}/user/review"
																method="post">
																<input type="hidden" class="form-control" id="id"
																	name="idApplyPost" value="${applyPost.id}">
																<div class="modal-footer mt-1">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal">Đóng</button>
																	<button type="submit" class="btn btn-danger">Duyệt</button>
																</div>
															</form:form>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<script>
									function setFileName(filePath, postId) {
									    // Lấy tên file từ đường dẫn
									    let fileName = filePath.split("/").pop();  // Lấy tên file từ đường dẫn đầy đủ
									    
									    // Cập nhật tên file vào trong modal
									    document.getElementById("fileName" + postId).innerText = fileName;
									}
									</script>
									<!-- Nếu danh sách applyPosts rỗng -->
									<c:if test="${empty applyPosts.content}">
										<p>Chưa có ứng cử viên nào ứng tuyển</p>
									</c:if>

								</div>

								<c:if test="${applyPosts.totalPages > 0}">
									<div class="row mt-5">
										<div class="col text-center">
											<div class="block-27">
												<ul>
													<!-- Trang trước -->
													<c:if test="${numberPage > 0}">
														<li><a
															href="${pageContext.request.contextPath}/recruitment/detail/${recruitment.id }?page=${numberPage - 1}">&lt;</a></li>
													</c:if>
													<!-- Các trang -->
													<c:forEach begin="0" end="${applyPosts.totalPages - 1}"
														var="pageIndex">
														<!-- Chỉ hiển thị trang có nội dung -->
														<c:if test="${pageIndex < applyPosts.totalPages}">
															<li class="${numberPage == pageIndex ? 'active' : ''}">
																<a
																href="${pageContext.request.contextPath}/recruitment/detail/${recruitment.id }?page=${pageIndex}">${pageIndex + 1}</a>
															</li>
														</c:if>
													</c:forEach>
													<!-- Trang sau -->
													<c:if test="${numberPage < applyPosts.totalPages - 1}">
														<li><a
															href="${pageContext.request.contextPath}/recruitment/detail/${recruitment.id }?page=${numberPage + 1}">&gt;</a></li>
													</c:if>
												</ul>
											</div>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</c:if>
				</c:if>
			</c:forEach>


			<div class="col-lg-4 sidebar">
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

	</section>
	<c:out value="${listRelated }"></c:out>
	<c:forEach var="recruitment" items="${listRelated}">

		<div class="col-md-12">

			<div class="job-post-item p-4 d-block d-lg-flex align-items-center">
				<div class="one-third mb-4 mb-md-0">
					<div class="job-post-item-header align-items-center">
						<span class="subadge">${recruitment.type}</span>
						<h2 class="mr-3 text-black">
							<a
								href="${pageContext.request.contextPath}/recruitment/detail/${recruitment.id}">
								${recruitment.title} </a>
						</h2>
					</div>
					<div class="job-post-item-body d-block d-md-flex">
						<div class="mr-3">
							<span class="icon-layers"></span> <a href="#">${recruitment.company.nameCompany}</a>
						</div>
						<div>
							<span class="icon-my_location"></span> <span>${recruitment.address}</span>
						</div>
					</div>
				</div>

				<!-- Nếu session có user -->
				<c:if test="${not empty user}">
					<div
						class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
						<!-- Nếu user có role id = 1 -->
						<c:forEach var="role" items="${user.roles }">
							<c:if test="${role.id == 1}">
								<a onclick="save(${recruitment.id})"
									class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
									<span class="icon-heart"></span>
								</a>
								<a data-toggle="modal"
									data-target="#exampleModal${recruitment.id}"
									class="btn btn-primary py-2">Apply Job</a>
							</c:if>
						</c:forEach>
					</div>
				</c:if>

				<!-- Nếu session không có user -->
				<c:if test="${empty user}">
					<div
						class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
						<div>
							<a onclick="save(${recruitment.id})"
								class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
								<span class="icon-heart"></span>
							</a>
						</div>
						<a data-toggle="modal"
							data-target="#exampleModal${recruitment.id}"
							class="btn btn-primary py-2">Apply Job</a>
					</div>
				</c:if>
			</div>
		</div>
	</c:forEach>


	<script>
	function apply1(id) {
		var name = "#idRe" + id;
		var name1 = 'loai1' + id;
		var name2 = 'loai2' + id;
		var nameModal = "#exampleModal" + id;
		var nameModalApplyJob = "#exampleModalApplyJob" + id;
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
					$(nameModalApplyJob).modal('hide');
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
					$(nameModalApplyJob).modal('hide');
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
			var nameModal = "#exampleModal" + id;
			var nameModalApplyJob = "#exampleModalApplyJob" + id;
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
								$(nameModalApplyJob).modal('hide');
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
								$(nameModalApplyJob).modal('hide');
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



	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<jsp:include page="/WEB-INF/view/public/fragments.jsp" />
	</footer>
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
</script>
	<!-- Ấn nút lưu -->
	<script>
	$(function () {
	    $(document).on('click', '[id^="save-button-"]', function () {
	        var recruitmentId = $(this).data('job-id');  // Lấy ID công việc từ data-job-id
	        var iconHeart = $('#icon-heart-' + recruitmentId);  // Biểu tượng trái tim
	        var button = $('#save-button-' + recruitmentId);  // Nút lưu

	        // Lấy trạng thái lưu từ data-checked và đảo ngược trạng thái
	        var isChecked = $(this).data('checked') === true;
	        $(this).data('checked', !isChecked);  // Đảo ngược trạng thái lưu

	        // Chọn URL và trạng thái mới dựa trên isChecked
	        var url = isChecked ? '/Assignment02/user/deleteJob' : '/Assignment02/user/saveJob';
	        
	        // Gửi yêu cầu AJAX
	        $.ajax({
	            type: 'POST',
	            url: url,
	            data: { jobId: recruitmentId, isChecked: !isChecked },  // Đảo ngược trạng thái khi gửi
	            success: function (response) {
	                var responseData = JSON.parse(response);
	                if (responseData.success) {
	                    // Cập nhật giao diện
	                    if (!isChecked) {  // Nếu trước đó chưa lưu, bây giờ lưu
	                        iconHeart.removeClass('icon-heart-o').addClass('icon-heart');
	                        button.html('<span id="icon-heart-' + recruitmentId + '" class="icon-heart mr-2 text-danger"></span>Đã lưu');
	                    } else {  // Nếu trước đó đã lưu, bây giờ bỏ lưu
	                        iconHeart.removeClass('icon-heart').addClass('icon-heart-o');
	                        button.html('<span id="icon-heart-' + recruitmentId + '" class="icon-heart-o mr-2 text-danger"></span>Lưu');
	                    }

	                    // Hiển thị thông báo thành công
	                    Swal.fire({
	                        title: !isChecked ? 'Đã lưu công việc!' : 'Đã bỏ lưu công việc!',
	                        text: !isChecked ? 'Công việc đã được lưu vào danh sách yêu thích của bạn.' : 'Công việc đã bị xóa khỏi danh sách yêu thích.',
	                        icon: 'success',
	                        timer: 3000,
	                        showConfirmButton: true
	                    });
	                } else {
	                    // Nếu có lỗi
	                    Swal.fire({
	                        title: 'Lỗi!',
	                        text: 'Có lỗi xảy ra trong quá trình thao tác.',
	                        icon: 'error',
	                        timer: 3000,
	                        showConfirmButton: true
	                    });
	                }
	            },
	            error: function (err) {
	                console.error("Lỗi khi thao tác:", err.responseText);
	                Swal.fire({
	                    title: 'Lỗi!',
	                    text: 'Có lỗi xảy ra trong quá trình thao tác.',
	                    icon: 'error',
	                    timer: 3000,
	                    showConfirmButton: true
	                });
	            }
	        });
	    });
	});
	
	$(function() {
	    // Lắng nghe sự kiện click vào nút "Theo dõi"
	    $(document).on('click', '#follow-button', function() {
	        // Kiểm tra nếu người dùng chưa đăng nhập
	        var userLoggedIn = ${empty user ? 'false' : 'true'}; // Kiểm tra biến user

	        if (!userLoggedIn) {
	            // Nếu chưa đăng nhập, thông báo yêu cầu đăng nhập
	            Swal.fire({
	                title: 'Chưa đăng nhập!',
	                text: 'Bạn cần phải đăng nhập để lưu bài tuyển dụng.',
	                icon: 'warning',
	                timer: 3000,
	                showConfirmButton: true
	            });
	        }
	    });
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
</body>
</html>