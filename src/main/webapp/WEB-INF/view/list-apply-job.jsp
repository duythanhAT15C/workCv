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
	<c:if test="${not empty successDelete}">
		<div class="toast" data-delay="2000"
			style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">
			<script>
			console.log("success: ", '${successDelete}');
			setTimeout(function() {
				Swal.fire({
					title : 'Delete Successfully!',
					text : '${successDelete}',
					icon : 'success',
					timer : 6000,
					buttons : true,
					type : 'success'
				});
			}, 1000); // Delay to match data-delay attribute
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
								class="ion-ios-arrow-forward"></i></a></span>Công việc <span></span>
					</p>
					<h1 class="mb-3 bread">Danh sách công việc đã ứng tuyển</h1>
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
							<c:if test="${applyJobList.totalPages > 0 }">
								<div class="row">
									<c:forEach var="applyJob" items="${applyJobList.content}">
										<div class="col-md-12 ">
											<div
												class="job-post-item p-4 d-block d-lg-flex align-items-center">
												<div class="one-third mb-4 mb-md-0">
													<div class="job-post-item-header align-items-center">
														<span class="subadge">${applyJob.recruitment.type}</span>
														<h2 class="mr-3 text-black">
															<a
																href="${pageContext.request.contextPath}/recruitment/detail/${applyJob.recruitment.id}">${applyJob.recruitment.title}</a>
														</h2>
													</div>
													<div class="job-post-item-body d-block d-md-flex">
														<div class="mr-3">
															<span class="icon-layers"></span> <a
																href="${pageContext.request.contextPath}/company/detail-company/${applyJob.recruitment.company.id}">${applyJob.recruitment.company.nameCompany}</a>
														</div>
														<div>
															<span class="icon-my_location"></span> <span>${applyJob.recruitment.address}</span>
														</div>
													</div>
												</div>
												<input type="hidden" id="idRe${applyJob.recruitment.id}"
													value="${applyJob.recruitment.id}">
												<div
													class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0 status-list-apply-job">
													<div>
														<a data-toggle="modal"
															data-target="#exampleModalDeleteApplyJob${applyJob.id}"
															class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
															<span class="icon-delete"></span>
														</a>
													</div>
													<c:if test="${applyJob.status == 1}">
														<p
															style="color: #1e7e34; font-weight: bold; margin-top: 10px">Đã
															duyệt</p>
													</c:if>
													<c:if test="${applyJob.status == 0}">
														<p style="color: red; font-weight: bold; margin-top: 10px">Đợi
															duyệt</p>
													</c:if>
												</div>
											</div>
										</div>
										<!-- end -->
										<!-- Modal -->
										<div class="modal fade"
											id="exampleModal${applyJob.recruitment.id}" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">
															Ứng tuyển: <span>${applyJob.recruitment.title}</span>
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
																	<label for="fileUpload" class="col-form-label">Chọn
																		cv:</label> <input type="file" class="form-control"
																		id="fileUpload${applyJob.recruitment.id}" name="file"
																		required> <label for="fileUpload"
																		class="col-form-label">Giới thiệu:</label>
																	<textarea rows="10" cols="3" class="form-control"
																		id="text${applyJob.recruitment.id}">

                                                    </textarea>
																</div>

															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-dismiss="modal">Đóng</button>
																<button type="button"
																	onclick="'apply('${applyJob.recruitment.id}')'"
																	class="btn btn-primary">Nộp</button>
															</div>
														</div>
													</form>


												</div>
											</div>
										</div>
										<!-- Modal delete -->
										<div class="modal fade"
											id="exampleModalDeleteApplyJob${applyJob.id}" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel"
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
														Bài tuyển dụng :
														<c:out value="${applyJob.recruitment.title}" />
														<form:form
															action="${pageContext.request.contextPath}/user/delete-apply?page=${param.page }"
															method="post">
															<input type="hidden" class="form-control" id="id"
																name="id" value="${applyJob.id}">
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
							<c:if test="${applyJobList.totalPages == 0}">
								<div style="text-align: center">
									<p style="color: red;">Danh sách trống</p>
								</div>
							</c:if>

							<c:if test="${applyJobList.totalPages > 1}">
								<div class="row mt-5">
									<div class="col text-center">
										<div class="block-27">
											<ul>
												<!-- Liên kết quay lại trang trước -->
												<c:if test="${numberPage > 0}">
													<li><a
														href="${pageContext.request.contextPath}/user/get-list-apply?page=${numberPage - 1}">&lt;</a></li>
												</c:if>

												<!-- Liệt kê tất cả các trang -->
												<c:forEach begin="0" end="${applyJobList.totalPages - 1}"
													var="pageIndex">
													<li class="${numberPage == pageIndex ? 'active' : ''}">
														<a
														href="${pageContext.request.contextPath}/user/get-list-apply?page=${pageIndex}">${pageIndex + 1}</a>
													</li>
												</c:forEach>

												<!-- Liên kết đến trang tiếp theo -->
												<c:if test="${numberPage < applyJobList.totalPages - 1}">
													<li><a
														href="${pageContext.request.contextPath}/user/get-list-apply?page=${numberPage + 1}">&gt;</a></li>
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
		function apply(id) {
			var name = "#idRe" + id;
			var nameModal = "#exampleModal" + id;
			var nameFile = "#fileUpload" + id;
			var nameText = "#text" + id;
			var idRe = $(name).val();
			var textvalue = $(nameText).val();
			var fileUpload = $(nameFile).get(0);
			var files = fileUpload.files;
			var formData = new FormData();
			formData.append('file', files[0]);
			formData.append('idRe', idRe);
			formData.append('text', textvalue);
			if (files[0] == null) {
				swal({
					title : 'Bạn cần phải chọn cv!',
					/* text: 'Redirecting...', */
					icon : 'error',
					timer : 3000,
					buttons : true,
					type : 'error'
				})
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
						url : '/user/apply-job/',
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
									title : 'Ứng tuyển thành công!',
									/* text: 'Redirecting...', */
									icon : 'success',
									timer : 3000,
									buttons : true,
									type : 'success'
								})
								$(nameModal).modal('hide');
								$('#fileUpload').val("");
							} else {
								swal({
									title : 'Bạn đã ứng tuyển công việc này!',
									/* text: 'Redirecting...', */
									icon : 'error',
									timer : 3000,
									buttons : true,
									type : 'error'
								})
								$(nameModal).modal('hide');
								$('#fileUpload').val("");
							}
						},
						error : function(err) {
							alert(err);
						}
					})
				}
			}
			

		}
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