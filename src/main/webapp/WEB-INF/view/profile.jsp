<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Work CV</title>
<!--  <meta charset="utf-8"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>


</head>
<body>
<body>

	<c:if test="${not empty updateProfileSuccess}">
		<div class="toast" data-delay="1000"
			style="position: fixed; top: 100px; left: 40px; z-index: 2000; width: 300px">
			<script>
				setTimeout(function() {
					Swal.fire({
						title : 'Update Success!',
						text : '${updateProfileSuccess}',
						icon : 'success',
						timer : 6000,
						buttons : true,
						type : 'success'
					});
				}, 1000); // Delay to match data-delay attribute
			</script>
		</div>
	</c:if>

	<c:if test="${not empty deleteSuccess}">
		<div class="toast" data-delay="1000"
			style="position: fixed; top: 100px; left: 40px; z-index: 2000; width: 300px">
			<script>
				setTimeout(function() {
					Swal.fire({
						title : 'Delete Success!',
						text : '${deleteSuccess}',
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



	<div class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-start">
				<div class="col-md-12 text-center mb-5">
					<h1 class="mb-3 bread">Hồ sơ</h1>
					<div class="form-group">
						<label class="btn btn-primary btn-md btn-file"> Chọn ảnh<input
							type="file" name="file" id="fileUpload" hidden>
						</label>
					</div>
					<div style="margin-left: 0px" id="divImage">

						<c:choose>
							<c:when test="${not empty userInformation.image}">
								<c:if
									test="${fn:contains(userInformation.image, 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg')}">
									<!-- Nếu đường dẫn đã chứa phần URL cụ thể, không cần thêm /Assignment02 -->
									<img id="avatar" height="100" width="100"
										style="border-radius: 50px" src="${userInformation.image}" />
									<input type="hidden" id="userImage"
										value="${userInformation.image}" />
								</c:if>
								<c:if
									test="${not fn:contains(userInformation.image, 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg')}">
									<!-- Nếu đường dẫn không chứa URL đó, thêm /Assignment02 -->
									<img id="avatar" height="100" width="100"
										style="border-radius: 50px"
										src="${pageContext.request.contextPath}${userInformation.image}" />
									<input type="hidden" id="userImage"
										value="${pageContext.request.contextPath}${userInformation.image}" />
								</c:if>
							</c:when>
							<c:otherwise>
								<img id="avatar" height="100" width="100"
									style="border-radius: 50px"
									src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg" />
								<input type="hidden" id="userImage"
									value="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg" />
							</c:otherwise>
						</c:choose>

						<!--<img id="avatar" height="100" width="100"
							style="border-radius: 50px"
							src="${userInformation.image != null ? userInformation.image : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}">
						-->
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${userInformation.status == 0}">
		<div class="container-fluid" style="text-align: center">
			<p
				style="font-size: 20px; font-weight: bold; color: #aaa; margin-top: 10px">Xác
				thực email đăng nhập</p>
			<c:if test="${empty comfirm_await}">
				<div id="part1"
					style="width: 600px; height: 400px; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; margin: 20px auto; padding: 15px">
					<p style="line-height: 35px; font-size: 16px">
						Xin chào, <span>${userInformation.fullName}</span>. Vui lòng xác
						thực và làm theo hướng dẫn trong email. Trường hợp không nhận được
						email, bạn vui lòng bấm nút Nhận email xác thực dưới đây.
					</p>
					<div class="row form-group">
						<form:form
							action="${pageContext.request.contextPath}/user/confirm-account"
							method="post" class="col-md-12">
							<input type="hidden" value="${userInformation.email}"
								name="email" class="btn px-4 btn-primary text-white">
							<input type="submit" value="Nhận email xác thực"
								class="btn px-4 btn-primary text-white">
						</form:form>
					</div>
					<p>
						Mọi thắc mắc vui lòng liên hệ bộ phận CSKH của WorkCV:<br>
					</p>
					- Điện thoại:<span style="color: #5f80ec">(024) 6680 5588</span><br>
					- Email: <a href="#" style="color: #5f80ec"> hotro@workcv.vn</a>
				</div>
			</c:if>
			<c:if test="${comfirm_await}">
				<div id="part2"
					style="width: 600px; height: 400px; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; margin: 20px auto; padding: 15px">
					<p style="line-height: 35px; font-size: 16px">
						Xin chào, <span>${userInformation.fullName}</span>. Bạn đã gửi yêu
						cầu xác thực thành công, vui lòng kiểm tra mail để xác thực.Cảm ơn
						bạn!!!
					</p>
					<p>
						Mọi thắc mắc vui lòng liên hệ bộ phận CSKH của WorkCV:<br>
					</p>
					- Điện thoại:<span style="color: #5f80ec">(024) 6680 5588</span><br>
					- Email: <a href="#" style="color: #5f80ec"> hotro@workcv.vn</a>
				</div>
			</c:if>
		</div>
	</c:if>
	<!-- Phân quyền cho role candidate -->
	<security:authorize access="hasRole('ROLE_CANDIDATE')">
		<!-- HOME -->
		<section class="site-section" style="margin-top: 10px">
			<div class="container">
				<form enctype="multipart/form-data">
					<div class="row align-items-center mb-5">
						<div class="col-lg-8 ">
							<div class="d-flex align-items-center">
								<div class="form-group" style="margin-top: 15px">
									<label class="btn btn-primary btn-md btn-file"> Chọn cv
										(pdf)<input type="file" name="file" id="fileUpload1" required
										hidden>
									</label>
								</div>
							</div>
							<c:if test="${Cv != null}">
								<p id="cvName">${Cv != null ? Cv.fileName :'Chưa cập nhập'}</p>
							</c:if>
							<c:if test="${Cv == null}">
								<p id="cvName"></p>
							</c:if>
							<c:if test="${Cv !=null}">
								<a id="nameCv" target="_blank"
									href="${pageContext.request.contextPath}${urlCv}">Xem CV</a>

							</c:if>
							<a id="nameCv"
								href="${'http://localhost:8080/resources/uploads/'}"></a>
							<c:if test="${Cv !=null}">
								<a style="color: red; margin-left: 20px" data-toggle="modal"
									data-target="#exampleModal" href="#exampleModal">Xóa CV</a>
							</c:if>
							<c:if test="${Cv ==null}">
								<a href="#" style="color: red; margin-left: 20px" id="xoa"
									data-toggle="modal" data-target="#exampleModal"></a>
							</c:if>
							<input type="hidden" value="${Cv.id }" id="cvId" />

						</div>

						<div class="col-lg-4">
							<div class="row">
								<!--                        <div class="col-6">-->
								<!--                            <button type="submit" id="myBtn" class="btn btn-block btn-light btn-md"><span class="icon-open_in_new mr-2"></span>Cập nhật cv</button>-->
								<!--                        </div>-->
							</div>
						</div>
					</div>
				</form>

				<form:form
					action="${pageContext.request.contextPath}/user/update-profile"
					method="post" modelAttribute="updateProfile" id="updateProfileForm"
					enctype="multipart/form-data" data-role="candidate">
					<div class="row align-items-center mb-5">
						<div class="col-lg-8 mb-4 mb-lg-0">
							<div class="d-flex align-items-center">
								<div>
									<h2>Cập nhật thông tin</h2>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="row">

								<div class="col-6">
									<button type="button" id="saveButton"
										class="btn btn-block btn-primary btn-md">Lưu thông
										tin</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row mb-5">
						<div class="col-lg-12">
							<div class="p-4 p-md-5 border rounded" method="post">
								<h3 class="text-black mb-5 border-bottom pb-2">Thông tin
									chi tiết</h3>
								<c:forEach var="role" items="${userInformation.roles}">
									<input type="hidden" value="${role.id }" id="roleId" />
								</c:forEach>
								<div class="form-group">
									<label for="email">Email</label> <input type="email"
										class="form-control" id="email" name="email"
										value="${userInformation.email != null ? userInformation.email : null}"
										required placeholder="you@yourdomain.com">
								</div>
								<div class="form-group">
									<label for="job-title">Full name</label> <input type="text"
										class="form-control" name="fullName"
										value="${userInformation.fullName != null ? userInformation.fullName : null}"
										required id="job-title" placeholder="Full name">
								</div>
								<div class="form-group">
									<label for="job-location">Địa chỉ</label> <input type="text"
										name="address"
										value="${userInformation.address != null ? userInformation.address : null}"
										class="form-control" id="job-location" required
										placeholder="e.g. New York">
								</div>
								<div class="form-group">
									<label for="job-location">Số điện thoại</label> <input
										type="text" name="phoneNumber"
										value="${userInformation.phoneNumber != null ? userInformation.phoneNumber : null}"
										class="form-control" id="job-location" required
										placeholder="+ 84">
								</div>
								<div class="form-group">
									<label for="job-location">Mô tả bản thân</label>
									<textarea name="description" class="form-control" id="editor"
										placeholder="Mô tả">
										${userInformation.description != null ? userInformation.description : null}
										
									</textarea>
								</div>

							</div>

						</div>

					</div>
				</form:form>
			</div>
		</section>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Bạn có chắc
							chắn muốn xóa ?</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<c:if test="${Cv != null}">
							Cv : <span id="cvXoa"></span>
							<span>${Cv.fileName}</span>
						</c:if>
						<form:form
							action="${pageContext.request.contextPath}/user/deleteCv"
							method="post">
							<div class="modal-footer mt-1">
								<input type="hidden" name="idCv" value="${Cv.id}">
								<button type="submit" class="btn btn-secondary"
									data-dismiss="modal">Đóng</button>
								<button type="submit" class="btn btn-danger">Xóa</button>
							</div>
						</form:form>
					</div>

				</div>
			</div>
		</div>
	</security:authorize>

	<!-- Phân quyền cho role company -->
	<security:authorize access="hasRole('ROLE_COMPANY')">
		<!-- Modal -->

		<section class="site-section" style="margin-top: 10px">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 mb-5">
						<h2 class="mb-4">Thông tin cá nhân</h2>
						<form:form
							action="${pageContext.request.contextPath}/user/update-profile"
							method="post" enctype="multipart/form-data"
							modelAttribute="updateProfile" id="updateProfileForm"
							data-role="company">

							<div class="row mb-5">
								<div class="col-lg-12">
									<div class="p-4 p-md-5 border rounded" method="post">
										<c:forEach var="role" items="${userInformation.roles}">
											<input type="hidden" value="${role.id }" id="roleId" />
										</c:forEach>
										<div class="form-group">
											<label for="email">Email</label> <input type="email"
												class="form-control" id="email" name="email"
												value="${userInformation.email}" required
												placeholder="you@yourdomain.com">
										</div>
										<div class="form-group">
											<label for="job-title">Họ và tên</label> <input type="text"
												class="form-control" name="fullName"
												value="${userInformation.fullName}" id="job-title" required
												placeholder="Full name">
										</div>
										<div class="form-group">
											<label for="job-location">Địa chỉ</label> <input type="text"
												name="address"
												value="${userInformation.address != null ? userInformation.address : null}"
												required class="form-control" id="job-location"
												placeholder="e.g. New York">
										</div>
										<div class="form-group">
											<label for="job-location">Số điện thoại</label> <input
												type="text" name="phoneNumber"
												value="${userInformation.phoneNumber != null ? userInformation.phoneNumber : null}"
												required class="form-control" id="job-location"
												placeholder="+ 84">
										</div>

										<div class="form-group">
											<label for="job-location">Mô tả bản thân</label>
											<textarea name="description" class="form-control"
												id="editCompany" placeholder="Mô tả">
										${userInformation.description != null ? userInformation.description : null}
									</textarea>
										</div>
										<div class="row form-group">
											<div class="col-md-12">
												<!--	<input type="button" id="saveButton" value="Lưu thông tin"
													class="btn px-4 btn-primary text-white">
											-->
												<button type="button" id="saveButton"
													class="btn px-4 btn-primary text-white">Lưu thông
													tin</button>
											</div>
										</div>
									</div>

								</div>

							</div>
						</form:form>
					</div>
					<div class="col-lg-6">
						<h2 class="mb-4">Thông tin công ty</h2>
						<div class="form-group">
							<label for="company-website-tw d-block1">Cập nhật Logo</label> <br>
							<label class="btn btn-primary btn-md btn-file"> Chọn logo<input
								type="file" name="file" id="fileUpload2" required hidden>
							</label>
							<div id="divLogo">

								<c:choose>
									<c:when test="${not empty companyInformation.logo}">

										<c:if
											test="${fn:contains(companyInformation.logo, 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg')}">
											<!-- Nếu đường dẫn đã chứa phần URL cụ thể, không cần thêm /Assignment02 -->
											<img id="avatar1" height="100" width="100"
												style="border-radius: 50px" src="${companyInformation.logo}" />
										</c:if>
										<c:if
											test="${not fn:contains(companyInformation.logo, 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg')}">
											<!-- Nếu đường dẫn đã chứa phần URL cụ thể, không cần thêm /Assignment02 -->
											<img id="avatar1" height="100" width="100"
												style="border-radius: 50px"
												src="${pageContext.request.contextPath}${companyInformation.logo}" />
										</c:if>

									</c:when>
									<c:otherwise>
										<img id="avatar1" height="100" width="100"
											style="border-radius: 50px"
											src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg" />
									</c:otherwise>
								</c:choose>

								<!--<img id="avatar1" height="100" width="100"
									style="border-radius: 50px"
									src="${companyInformation.logo != null ? companyInformation.logo : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}">
								-->
							</div>
						</div>
						<form:form
							action="${pageContext.request.contextPath}/user/update-company"
							method="post" modelAttribute="updateCompany"
							id="updateCompanyForm">
							<input type="hidden" name="userId"
								value="${companyInformation.user.id}" />
							<input type="hidden" value="${userInformation.email}" id="email">
							<div class="row mb-5">
								<div class="col-lg-12">
									<div class="p-4 p-md-5 border rounded" method="post">
										<div class="form-group">
											<label for="email">Email</label> <input type="text"
												class="form-control" required id="email1" name="email"
												value="${companyInformation.email != null ? companyInformation.email : null }"
												placeholder="you@yourdomain.com">
										</div>
										<div class="form-group">
											<label for="job-title">Tên công ty</label> <input type="text"
												class="form-control" name="nameCompany"
												value="${companyInformation.nameCompany != null ? companyInformation.nameCompany : null }"
												id="job-title" placeholder="Full name" required> <input
												type="hidden" class="form-control" name="user_id"
												value="${companyInformation.user.id != null ? companyInformation.user.id : null}"
												id="job-title" placeholder="Full name"> <input
												type="hidden" class="form-control" name="id"
												value="${companyInformation.id !=null ? companyInformation.id : null}"
												id="job-title" placeholder="Full name">

										</div>
										<div class="form-group">
											<label for="job-location">Địa chỉ</label> <input type="text"
												name="address"
												value="${companyInformation.address != null ? companyInformation.address : null}"
												required class="form-control" id="job-location"
												placeholder="e.g. New York">
										</div>
										<div class="form-group">
											<label for="job-location">Số điện thoại công ty</label> <input
												type="text" name="phoneNumber"
												value="${companyInformation.phoneNumber != null ? companyInformation.phoneNumber : null}"
												required class="form-control" id="job-location"
												placeholder="+ 84">
										</div>
										<div class="form-group">
											<label for="job-location">Mô tả công ty</label>
											<textarea name="description" class="form-control"
												id="editorN" placeholder="Mô tả">
												${companyInformation.description != null ? companyInformation.description : null}
											</textarea>
										</div>


										<div style="margin-left: 0px" id="divImag1">
											<c:choose>
												<c:when test="${not empty companyInformation.logo}">
													<c:if
														test="${fn:contains(companyInformation.logo, 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg')}">
														<!-- Nếu đường dẫn đã chứa phần URL cụ thể, không cần thêm /Assignment02 -->
														<img id="avatar1" height="100" width="100"
															style="border-radius: 50px"
															src="${companyInformation.logo}" />
													</c:if>
													<c:if
														test="${not fn:contains(companyInformation.logo, 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg')}">
														<!-- Nếu đường dẫn đã chứa phần URL cụ thể, không cần thêm /Assignment02 -->
														<img id="avatar1" height="100" width="100"
															style="border-radius: 50px"
															src="${pageContext.request.contextPath}${companyInformation.logo}" />
													</c:if>
												</c:when>
												<c:otherwise>
													<img id="avatar" height="100" width="100"
														style="border-radius: 50px"
														src="https://st.quantrimang.com/photos/image/072015/22/avatar.jpg" />
												</c:otherwise>
											</c:choose>
											<!-- <img id="avatarBottom" height="100" width="100"
													style="border-radius: 50px; margin-bottom: 15px"
													src="${companyInformation.logo != null ? companyInformation.logo : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}">
												-->
										</div>
										<div class="row form-group">
											<div class="col-md-12">
												<!--  <input type="button" id="saveButtonCompany"
													value="Lưu thông tin"
													class="btn px-4 btn-primary text-white">
												-->
												<button type="button" id="saveButtonCompany"
													class="btn px-4 btn-primary text-white">Lưu thông
													tin</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</section>
	</security:authorize>




	<script>
    /*ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
        console.log("da1" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
    ClassicEditor.create(document.querySelector('#editCompany')).then(eidt => {
        console.log("da2" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
    
    ClassicEditor.create(document.querySelector('#editorN')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
    */
</script>
	<script>
	let editorInstance;
	ClassicEditor.create(document.querySelector('#editor'))
				 .then(editor =>{
					 editorInstance = editor;
				 })
				 .catch(error =>{
					 console.error('Lỗi khởi tạo CKEditor: ', error);
				 })
	let editorInstanceCompany;
	ClassicEditor.create(document.querySelector('#editCompany'))
				 .then(editorCompany =>{
					 editorInstanceCompany = editorCompany;
				 })
				 .catch(error =>{
					 console.error('Lỗi khởi tạo CKEditor: ', error);
				 })
    // Lấy input file và ảnh
    const fileInput = document.getElementById('fileUpload');
    const avatarImg = document.getElementById('avatar');

    // Xử lý sự kiện khi chọn file
    fileInput.addEventListener('change', (event) => {
        const file = event.target.files[0]; // Lấy file đầu tiên
        if (file) {
            const reader = new FileReader(); // Sử dụng FileReader để đọc file
            reader.onload = function(e) {
                avatarImg.src = e.target.result; // Gán src của ảnh bằng dữ liệu file
            };
            reader.readAsDataURL(file); // Đọc file dưới dạng Data URL
        }
    });
    $(document).ready(function () {
        const saveButton = $('#saveButton');
        const fileInput = $('#fileUpload');
     // Truy cập form update-profile
        const updateCandidate = document.querySelector('form[data-role="candidate"]');

        // Truy cập form create-profile
        const updateCompany = document.querySelector('form[data-role="company"]');

        saveButton.click(function (e) {
        	e.preventDefault(); // Ngăn form chuyển trang
            if (window.FormData !== undefined) {
                const form = $('#updateProfileForm')[0]; // Lấy form
                const formData = new FormData(form); // Tạo FormData từ form
                const userImageField = $('#userImage'); // Lấy hidden field chứa đường dẫn ảnh của người dùng
                const cvIdElement = document.getElementById('cvId');
                let cvId = null;
                if (cvIdElement) {
                    // Nếu phần tử tồn tại, lấy giá trị của nó
                    cvId = cvIdElement.value;
                } else {
                    // Nếu không có phần tử, gán cvId là null hoặc giá trị mặc định
                    cvId = 0; // Hoặc cvId = 0 nếu bạn muốn gán giá trị mặc định là 0
                }
                const roleId = document.getElementById('roleId').value;
                
                let description = '';
                if(updateCandidate){
                	description = editorInstance.getData();
                    
                }
                else if(updateCompany){
                	description = editorInstanceCompany.getData();
                   
                }
                console.log("Nội dung editor: " +description);
                formData.set('description', description);
                let file = fileInput.get(0).files[0]; // Lấy file từ input
                console.log(file); // Kết quả không được là `undefined`
                let filePath = '';
                if (file) {
                	// Nếu người dùng chọn ảnh mới, thay đổi giá trị file trong form
                	console.log('User selected a file:', file);
                	formData.append('file', file); // Đảm bảo thêm file vào formData nếu cần
                } else {
                	// Nếu không chọn ảnh, lấy ảnh từ hidden field
                	console.log('No file selected, using default or DB image');
                	// Gán lại ảnh từ DB hoặc mặc định cho avatar
                	const userImage = document.getElementById('userImage').value;
                	console.log(userImage);
                	const fileName = userImage.split('/').pop();
                	console.log(fileName);
                	let avatarImage = '';
                	let fakeFile = null;
                	if(userImage){
                		fakeFile = new File([new Blob()], fileName, { type: 'image/jpeg' });
                		const updatedImagePath = userImage.replace('/Assignment02', '');
                		filePath = updatedImagePath;
                	}
                	else{
                		avatarImage = userImageField.val(); // Lấy đường dẫn ảnh từ hidden field
                		fakeFile = new File([new Blob()], avatarImage, { type: 'image/jpeg' });
                		filePath = avatarImage
                	}


                	// Thêm file giả vào formData
                	formData.append('file', fakeFile);
                }
                formData.append('filePath', filePath); // Đảm bảo thêm file vào formData nếu cần
                if(roleId == 1){
                	formData.append('cvId', cvId ? cvId : 0);
                }
                else{
                	formData.append('cvId', cvId);
                }
                const email = $('#email').val();
                console.log('Email:', email);
                formData.set('email', email);
                console.log("Dữ liệu FormData:", Array.from(formData.entries())); // Debug

                $.ajax({
                    type: 'POST',
                    url: '/Assignment02/user/update-profile',
                    contentType: false, // Để mặc định multipart/form-data
                    processData: false, // Không xử lý dữ liệu
                    data: formData,
                    success: function (response) {
                        if (response === "Error") {
                            Swal.fire({
                                title: 'Cập nhật ảnh đại diện thất bại!',
                                icon: 'error',
                                timer: 3000
                            });
                        } else {
                            console.log("Response từ server:", response);
                            console.log(window.location.origin);
                            const imageUrl = '/' + window.location.pathname.split('/')[1] + response;
                            $('#avatar').attr('src', imageUrl + '?' + new Date().getTime()); // Thêm query string để tránh cache
                            Swal.fire({
                                title: 'Thành công!',
                                text: 'Thông tin đã được cập nhật.',
                                icon: 'success',
                                timer: 3000
                            }).then(() => {
                            	setTimeout(() => {
                                    location.reload(); // Tải lại trang
                                }, 4000);
                            });
                        }
                    },
                    error: function (err) {
                        console.error("Lỗi khi upload ảnh:", err.responseText);
                    }
                });
            } else {
                alert("Trình duyệt của bạn không hỗ trợ FormData.");
            }
        });
    });

</script>



	<!--  <script>
	let editorInstanceCompany;
	ClassicEditor.create(document.querySelector('#editCompany'))
				 .then(editorCompany =>{
					 editorInstanceCompany = editorCompany;
				 })
				 .catch(error =>{
					 console.error('Lỗi khởi tạo CKEditor: ', error);
				 })
    $(function () {
        $('#fileUpload2').change(function () {
            // Kiểm tra xem trình duyệt có hỗ trợ FormData không
            if (window.FormData !== undefined) {
                var fileUpload = $('#fileUpload2').get(0);
                var files = fileUpload.files;

                // Kiểm tra nếu có file được chọn
                if (files[0] != null) {
                    // Tạo đối tượng FileReader để đọc file và hiển thị preview
                    var reader = new FileReader();

                    // Khi file được đọc xong, set ảnh preview
                    reader.onload = function (e) {
                        // Set ảnh preview lên thẻ img có id là avatar1 (trong divLogo)
                        $('#avatar1').attr('src', e.target.result);

                        // Cập nhật ảnh hiển thị tại divImag1 (ở phần form)
                        $('#divImag1').show();  // Hiển thị div chứa logo đã chọn
                        $('#avatarBottom').attr('src', e.target.result);  // Cập nhật ảnh cho divImag1
                    }

                    // Đọc file hình ảnh
                    reader.readAsDataURL(files[0]);

                    // Hiển thị thông báo chọn ảnh
                    $(".toast").toast("show");
                }
            }
        });
        
        
        // Lưu thông tin khi nhấn nút "Lưu thông tin"
   /*     $('#saveLogoBtn').click(function () {
            var fileUpload = $('#fileUpload2').get(0);
            var files = fileUpload.files;
            var email = $("#email1").val();
            const description = $('#editor').val(); 
            formData.set('description', description); 
            // Kiểm tra nếu có file được chọn
            if (files[0] != null) {
                var formData = new FormData();
                formData.append('file', files[0]);
                formData.append('email', email);

                // Gửi file lên server
                $.ajax({
                    type: 'POST',
                    url: '/user/upload-company/',
                    contentType: false,
                    processData: false,
                    data: formData,
                    success: function (urlImage) {
                        console.log(urlImage);
                        if (urlImage == "Error") {
                            swal({
                                title: 'Cập nhật logo thất bại!',
                                icon: 'error',
                                timer: 3000,
                                buttons: true,
                                type: 'error'
                            });
                            $("#divLogo").css("display", "block");
                        } else {
                            $('#avatar1').attr('src', urlImage);
                            swal({
                                title: 'Cập nhật logo thành công!',
                                icon: 'success',
                                timer: 3000,
                                buttons: true,
                                type: 'success'
                            });
                        }
                    },
                    error: function (err) {
                        alert(err);
                    }
                });
            }
        });
        */
    });
	$(document).ready(function () {
        const saveButton = $('#saveUserCompany');
        const fileInput = $('#fileUpload');

        saveButton.click(function (e) {
        	e.preventDefault(); // Ngăn form chuyển trang
            if (window.FormData !== undefined) {
                const form = $('#updateProfileUserCompanyForm')[0]; // Lấy form
                const formData = new FormData(form); // Tạo FormData từ form
                const description = editorInstanceCompany.getData();
                console.log("Nội dung editor: " +description);
                formData.set('description', description);
                const file = fileInput.get(0).files[0]; // Lấy file từ input
                console.log(file); // Kết quả không được là `undefined`
                /*if (!file) {
                    alert("Vui lòng chọn file trước khi lưu!");
                    return;
                }*/

                formData.append('file', file); // Đảm bảo thêm file vào formData nếu cần
                
                console.log("Dữ liệu FormData:", Array.from(formData.entries())); // Debug

                $.ajax({
                    type: 'POST',
                    url: '/Assignment02/user/update-profile',
                    contentType: false, // Để mặc định multipart/form-data
                    processData: false, // Không xử lý dữ liệu
                    data: formData,
                    success: function (response) {
                        if (response === "Error") {
                            Swal.fire({
                                title: 'Cập nhật ảnh đại diện thất bại!',
                                icon: 'error',
                                timer: 3000
                            });
                        } else {
                            console.log("Response từ server:", response);
                            $('#avatar').attr('src', response); // Cập nhật ảnh đại diện
                            Swal.fire({
                                title: 'Thành công!',
                                text: 'Ảnh đại diện đã được cập nhật.',
                                icon: 'success',
                                timer: 3000
                            });
                        }
                    },
                    error: function (err) {
                        console.error("Lỗi khi upload ảnh:", err.responseText);
                    }
                });
            } else {
                alert("Trình duyệt của bạn không hỗ trợ FormData.");
            }
        });
    });
</script>
-->



	<!-- Đây là đoạn script cập nhật công ty -->
	<script>
	let editorInstanceInfoCompany;
	ClassicEditor.create(document.querySelector('#editorN'))
				 .then(editor =>{
					 editorInstanceInfoCompany = editor;
				 })
				 .catch(error =>{
					 console.error('Lỗi khởi tạo CKEditor: ', error);
				 })
	const fileInput2 = document.getElementById('fileUpload2');
    const avatarImg1 = document.getElementById('avatar1');

    // Xử lý sự kiện khi chọn file
    fileInput2.addEventListener('change', (event) => {
        const file2 = event.target.files[0]; // Lấy file đầu tiên
        if (file2) {
            const reader = new FileReader(); // Sử dụng FileReader để đọc file
            reader.onload = function(e) {
                avatarImg1.src = e.target.result; // Gán src của ảnh bằng dữ liệu file
            };
            reader.readAsDataURL(file2); // Đọc file dưới dạng Data URL
        }
    });
    $(function () {
    	// Lấy input file và ảnh
        
        
        // Lưu thông tin khi nhấn nút "Lưu thông tin"
   /*     $('#saveLogoBtn').click(function () {
            var fileUpload = $('#fileUpload2').get(0);
            var files = fileUpload.files;
            var email = $("#email1").val();
            const description = $('#editor').val(); 
            formData.set('description', description); 
            // Kiểm tra nếu có file được chọn
            if (files[0] != null) {
                var formData = new FormData();
                formData.append('file', files[0]);
                formData.append('email', email);

                // Gửi file lên server
                $.ajax({
                    type: 'POST',
                    url: '/user/upload-company/',
                    contentType: false,
                    processData: false,
                    data: formData,
                    success: function (urlImage) {
                        console.log(urlImage);
                        if (urlImage == "Error") {
                            swal({
                                title: 'Cập nhật logo thất bại!',
                                icon: 'error',
                                timer: 3000,
                                buttons: true,
                                type: 'error'
                            });
                            $("#divLogo").css("display", "block");
                        } else {
                            $('#avatar1').attr('src', urlImage);
                            swal({
                                title: 'Cập nhật logo thành công!',
                                icon: 'success',
                                timer: 3000,
                                buttons: true,
                                type: 'success'
                            });
                        }
                    },
                    error: function (err) {
                        alert(err);
                    }
                });
            }
        });
        */
    });
	$(document).ready(function () {
        const saveUserCompany = $('#saveButtonCompany');
        const fileInput2 = $('#fileUpload2');
		
        saveUserCompany.click(function (e) {
        	e.preventDefault(); // Ngăn form chuyển trang
            if (window.FormData !== undefined) {
                const form = $('#updateCompanyForm')[0]; // Lấy form
                const formData = new FormData(form); // Tạo FormData từ form
                const userImageField = $('#userImage'); // Lấy hidden field chứa đường dẫn ảnh của người dùng
                const description = editorInstanceInfoCompany.getData();
                console.log("Nội dung editor: " +description);
                formData.set('description', description);
                const file = fileInput2.get(0).files[0]; // Lấy file từ input
                console.log(file); // Kết quả không được là `undefined`
                let filePath = '';
                if (file) {
                	// Nếu người dùng chọn ảnh mới, thay đổi giá trị file trong form
                	console.log('User selected a file:', file);
                	formData.append('file', file); // Đảm bảo thêm file vào formData nếu cần
                } else {
                	// Nếu không chọn ảnh, lấy ảnh từ hidden field
                	console.log('No file selected, using default or DB image');
                	// Gán lại ảnh từ DB hoặc mặc định cho avatar
                	const userImage = document.getElementById('userImage').value;
                	console.log(userImage);
                	const fileName = userImage.split('/').pop();
                	console.log(fileName);
                	let avatarImage = '';
                	let fakeFile = null;
                	if(userImage){
                		fakeFile = new File([new Blob()], fileName, { type: 'image/jpeg' });
                		const updatedImagePath = userImage.replace('/Assignment02', '');
                		filePath = updatedImagePath;
                	}
                	else{
                		avatarImage = userImageField.val(); // Lấy đường dẫn ảnh từ hidden field
                		fakeFile = new File([new Blob()], avatarImage, { type: 'image/jpeg' });
                		filePath = avatarImage
                	}


                	// Thêm file giả vào formData
                	formData.append('file', fakeFile);
                }
                formData.append('filePath', filePath); // Đảm bảo thêm file vào formData nếu cần
                const email = document.getElementById('email').value;
                console.log('Email:', email);
                formData.set('email', email);
                console.log("Dữ liệu FormData:", Array.from(formData.entries())); // Debug

                $.ajax({
                    type: 'POST',
                    url: '/Assignment02/user/update-company',
                    contentType: false, // Để mặc định multipart/form-data
                    processData: false, // Không xử lý dữ liệu
                    data: formData,
                    success: function (response) {
                        if (response === "Error") {
                            Swal.fire({
                                title: 'Cập nhật ảnh đại diện thất bại!',
                                icon: 'error',
                                timer: 3000
                            });
                        } else {
                            console.log("Response từ server:", response);
                            $('#avatar').attr('src', response); // Cập nhật ảnh đại diện
                            Swal.fire({
                                title: 'Thành công!',
                                text: 'Thông tin đã được cập nhật.',
                                icon: 'success',
                                timer: 3000
                            }).then(() => {
                            	setTimeout(() => {
                                    location.reload(); // Tải lại trang
                                }, 4000);
                            });
                        }
                    },
                    error: function (err) {
                        console.error("Lỗi khi upload ảnh:", err.responseText);
                    }
                });
            } else {
                alert("Trình duyệt của bạn không hỗ trợ FormData.");
            }
        });
    });
</script>

	<script>
	$(function () {
	    $('#fileUpload1').change(function () {
	        if (window.FormData !== undefined) {
	            var fileUpload = $('#fileUpload1').get(0);
	            var files = fileUpload.files;
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
	            var formData = new FormData();
	            formData.append('file', files[0]);
				
	            if (files[0] == null) {
	                $(".toast").toast("show");
	            } else {
	                $.ajax({
	                    type: 'POST',
	                    url: '/Assignment02/user/uploadCv',
	                    contentType: false,
	                    processData: false,
	                    data: formData,
	                    success: function (urlCv) {
	                        if (urlCv == "false") {
	                            swal({
	                                title: 'Cần chọn đúng loại file (PDF)!',
	                                icon: 'error',
	                                timer: 3000
	                            });
	                        } else {
	                            // Cập nhật giao diện sau khi upload thành công
	                            $('#nameCv').text('Xem CV');
	                            $('#nameCv').attr('href', 'http://localhost:8080/resources/uploads/' + urlCv);
	                            $('#cvName').text(urlCv);
	                            $('#xoa').text('Xóa CV');
	                            Swal.fire({
	                                title: 'Cập nhật CV thành công!',
	                                text: 'Đã thêm CV.',
	                                icon: 'success',
	                                timer: 3000,
	                                showConfirmButton: true // Hiển thị nút tích
	                            }).then(() => {
	                            	setTimeout(() => {
	                                    location.reload(); // Tải lại trang
	                                }, 100);
	                            });

	                        }
	                    },
	                    error: function (err) {
	                        console.error("Lỗi khi upload:", err.responseText);
	                    }
	                });
	            }
	        } else {
	            alert("Trình duyệt của bạn không hỗ trợ FormData.");
	        }
	    });
	});

    document.getElementById('confirmForm').onsubmit = function(event) {
        event.preventDefault(); // Ngừng gửi form để xử lý JavaScript

        // Ẩn phần 1 và hiển thị phần 2
        document.getElementById('part1').style.display = 'none';
        document.getElementById('part2').style.display = 'block';

        // Sau khi gửi form (có thể thực hiện gửi form thực tế ở đây)
        this.submit(); // Tiến hành gửi form nếu cần
    };
 // Lắng nghe sự kiện submit của form
    document.getElementById("updateProfileForm").addEventListener("submit", function(e) {
        // Lấy giá trị từ textarea
        var description = document.getElementById("editor").value;

        // Loại bỏ tất cả các thẻ HTML bằng Regular Expression
        var cleanDescription = description.replace(/<[^>]*>/g, '');

        // Cập nhật lại giá trị cho textarea (loại bỏ thẻ HTML)
        document.getElementById("editor").value = cleanDescription;

        // Nếu cần, có thể thêm một số thao tác kiểm tra dữ liệu ở đây trước khi gửi đi
    });
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