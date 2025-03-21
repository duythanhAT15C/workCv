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
	<c:if test="${not empty success}">
		<div class="toast" data-delay="2000"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">
			<script>
			swal({
				title : 'Xóa thành công!',
				/* text: 'Redirecting...', */
				icon : 'success',
				timer : 3000,
				buttons : true,
				type : 'success'
			})
		</script>
		</div>
	</c:if>
	<!-- END nav -->
	<div class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5"
		th:if="${session.user.role.id == 1 }">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-start">
				<div class="col-md-12 text-center mb-5">
					<p class="breadcrumbs mb-0">
						<span class="mr-3"><a href="/">Trang chủ <i
								class="ion-ios-arrow-forward"></i></a></span>Công ty <span></span>
					</p>
					<h1 class="mb-3 bread">Danh sách công ty đã theo dõi</h1>
				</div>
			</div>
		</div>
	</div>
	<c:forEach var="role" items="${user.roles }">
		<c:if test="${role.id == 2 }">
			<div class="hero-wrap hero-wrap-2"
				style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');"
				data-stellar-background-ratio="0.5">
				<div class="overlay"></div>
				<div class="container">
					<div
						class="row no-gutters slider-text align-items-end justify-content-start">
						<div class="col-md-12 text-center mb-5">

							<h1 class="mb-3 bread">Không tìm thấy trang yêu cầu</h1>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach>

	<c:forEach var="role" items="${user.roles }">
		<c:if test="${role.id == 1 }">
			<section class="ftco-section bg-light">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 pr-lg-5">
							<c:if test="${listFollowCompany.totalPages > 0}">
								<div class="row">
									<c:forEach var="followCompany"
										items="${listFollowCompany.content}">
										<div class="col-md-12 ">
											<div
												class="job-post-item p-4 d-block d-lg-flex align-items-center">
												<div class="one-third mb-4 mb-md-0">
													<div class="job-post-item-header align-items-center">
														<!--                                        <span class="subadge" th:text="${saveJob.com.type}"></span>-->
														<h2 class="mr-3 text-black">
															<a
																href="${pageContext.request.contextPath}/company/detail-company/${followCompany.company.id}">${followCompany.company.nameCompany}</a>
														</h2>
													</div>
													<div class="job-post-item-body d-block d-md-flex">
														<div class="mr-3">
															<span class="icon-layers"></span> <a>${followCompany.company.email}</a>
														</div>
														<div class="mr-3">
															<span class="icon-my_location"></span> <span>${followCompany.company.address}</span>
														</div>
														<div style="margin-left: 10">
															<span class="icon-my_location"></span> <span>${followCompany.company.phoneNumber}</span>
														</div>
													</div>
												</div>
												<input type="hidden"
													id="${'idRe'}+${followCompany.company.id}"
													value="${followCompany.company.id}">
												<div
													class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0 button-follow-company"
													style="width: 370px !important;">
													<div>

														<a href="#" data-toggle="modal"
															data-target="#exampleModal${followCompany.id}"
															class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
															<span class="icon-delete"></span>
														</a>

													</div>
													<a
														href="${pageContext.request.contextPath}/company/detail-company/${followCompany.company.id}"
														class="btn btn-primary py-2">Chi tiết</a> <a
														href="${pageContext.request.contextPath}/user/company-post/${followCompany.company.id}"
														class="btn btn-warning py-2 ml-1">Danh sách bài đăng</a>
												</div>
											</div>
										</div>
										<!-- end -->
										<!-- Modal -->
										<div class="modal fade" id="exampleModal${followCompany.id}"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
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
														Công ty :
														<c:out value="${followCompany.company.nameCompany}" />
														<form:form
															action="${pageContext.request.contextPath}/user/delete-follow?page=${param.page }"
															method="post">
															<input type="hidden" class="form-control" id="id"
																name="id" value="${followCompany.company.id}">
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
									</c:forEach>

								</div>
							</c:if>
							<c:if test="${listFollowCompany.totalPages < 1}">
								<div style="text-align: center">
									<p style="color: red;">Danh sách trống</p>
								</div>
							</c:if>
							<c:if test="${listFollowCompany.totalPages > 1}">
								<div class="row mt-5">
									<div class="col text-center">
										<div class="block-27">
											<ul>
												<!-- Liên kết quay lại trang trước -->
												<c:if test="${numberPage > 0}">
													<li><a
														href="${pageContext.request.contextPath}/user/get-list-company?page=${numberPage - 1}">&lt;</a></li>
												</c:if>

												<!-- Liệt kê tất cả các trang -->
												<c:forEach begin="0"
													end="${listFollowCompany.totalPages - 1}" var="pageIndex">
													<li class="${numberPage == pageIndex ? 'active' : ''}">
														<a
														href="${pageContext.request.contextPath}/user/get-list-company?page=${pageIndex}">${pageIndex + 1}</a>
													</li>
												</c:forEach>

												<!-- Liên kết đến trang tiếp theo -->
												<c:if
													test="${numberPage < listFollowCompany.totalPages - 1}">
													<li><a
														href="${pageContext.request.contextPath}/user/get-list-company?page=${numberPage + 1}">&gt;</a></li>
												</c:if>
											</ul>
										</div>
									</div>
								</div>
							</c:if>
						</div>

					</div>
				</div>
			</section>
		</c:if>
	</c:forEach>
	<script>
		function save(id) {
			var name = "#idRe" + id;
			var idRe = $(name).val();
			var formData = new FormData();
			formData.append('idRe', idRe);
			$.ajax({
				type : 'POST',
				url : '/save-job/save/',
				contentType : false,
				processData : false,
				data : formData,
				success : function(data) {
					if (data == "false") {
						swal({
							title : 'Bạn cần phải đăng nhập!',
							/* text: 'Redirecting...', */
							icon : 'error',
							timer : 3000,
							buttons : true,
							type : 'error'
						})
					} else if (data == "true") {
						swal({
							title : 'Lưu thành công!',
							/* text: 'Redirecting...', */
							icon : 'success',
							timer : 3000,
							buttons : true,
							type : 'success'
						})
					} else {
						swal({
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
	</script>




	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<jsp:include page="/WEB-INF/view/public/fragments.jsp" />
	</footer>


	<!-- loader -->
	<!--<div th:replace="public/fragments :: loading" id="ftco-loader" class="show fullscreen"></div>-->
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