<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page buffer="16kb"%>
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
	<!-- <div th:if="${msg_register_success}" class="toast" data-delay="2000"
		style="position: fixed; top: 100PX; right: 10PX; z-index: 2000; width: 300px">
		<script>
			swal({
				title : 'Đăng nhập thành công!',
				/* text: 'Redirecting...', */
				icon : 'success',
				timer : 3000,
				buttons : true,
				type : 'success'
			})
		</script>
	</div>
	-->
	<div class="hero-wrap img"
		style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row d-md-flex no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-10 d-flex align-items-center ">
					<div class="text text-center pt-5 mt-md-5">
						<p class="mb-4">Tìm việc làm, Cơ hội việc làm và Nghề nghiệp</p>
						<h1 class="mb-5">Cách dễ dàng nhất để có được công việc mới
							của bạn</h1>
						<div class="ftco-counter ftco-no-pt ftco-no-pb">
							<div class="row">
								<div
									class="col-md-4 d-flex justify-content-center counter-wrap ">
									<div class="block-18">
										<div class="text d-flex">
											<div class="icon mr-2">
												<span class="flaticon-visitor"></span>
											</div>
											<div class="desc text-left">
												<strong class="number" data-number="46">${numberCandidate}</strong>
												<span>Ứng cử viên</span>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-md-4 d-flex justify-content-center counter-wrap ">
									<div class="block-18 text-center">
										<div class="text d-flex">
											<div class="icon mr-2">
												<span class="flaticon-visitor"></span>
											</div>
											<div class="desc text-left">
												<strong class="number" data-number="450">${numberCompany}</strong>
												<span>Công ty</span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 d-flex justify-content-center counter-wrap">
									<div class="block-18 text-center">
										<div class="text d-flex">
											<div class="icon mr-2">
												<span class="flaticon-resume"></span>
											</div>
											<div class="desc text-left">
												<strong class="number" data-number="400">${numberRecruitment}</strong>
												<span>Tuyển dụng</span>
											</div>
										</div>
									</div>
								</div>
								<script>
								<!--
    								document.addEventListener("DOMContentLoaded", function() {
        							// Lấy tất cả các phần tử có class 'number'
	        							const counters = document.querySelectorAll('.number');
	
								        counters.forEach(counter => {
								            // Lấy giá trị từ data-number
								            const target = parseInt(counter.getAttribute('data-number'));
								            let count = 0;
								
								            // Thiết lập interval để đếm số
								            const interval = setInterval(() => {
								                // Cập nhật số hiển thị
								                counter.textContent = count;
								                count++;
								
								                // Dừng lại khi đạt target
								                if (count > target) {
								                    clearInterval(interval);
								                }
								            }, 10); // Đếm mỗi 10ms
								        });
							    	});
							    	//-->
								</script>
							</div>
						</div>
						<div class="ftco-search my-md-5">
							<div class="row">
								<div class="col-md-12 nav-link-wrap">
									<div class="nav nav-pills text-center" id="v-pills-tab"
										role="tablist" aria-orientation="vertical">
										<a class="nav-link active mr-md-1" id="v-pills-1-tab"
											data-toggle="pill" href="#v-pills-1" role="tab"
											aria-controls="v-pills-1" aria-selected="true">Tìm công
											việc</a> <a class="nav-link" id="v-pills-2-tab"
											data-toggle="pill" href="#v-pills-2" role="tab"
											aria-controls="v-pills-2" aria-selected="false">Tìm công
											ty</a> <a class="nav-link" id="v-pills-3-tab" data-toggle="pill"
											href="#v-pills-3" role="tab" aria-controls="v-pills-3"
											aria-selected="false">Tìm theo địa điểm</a>

									</div>
								</div>
								<div class="col-md-12 tab-wrap">

									<div class="tab-content p-4" id="v-pills-tabContent">

										<div class="tab-pane fade show active" id="v-pills-1"
											role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
											<form
												action="${pageContext.request.contextPath}/recruitment/search"
												method="post" class="search-job">
												<div class="row no-gutters">

													<div class="col-md-10 mr-md-2">
														<div class="form-group">
															<div class="form-field">
																<div class="icon">
																	<span class="icon-map-marker"></span>
																</div>
																<input type="text" name="keySearch" class="form-control"
																	placeholder="Tìm kiếm công việc">
															</div>
														</div>
													</div>
													<div class="col-md">
														<div class="form-group">
															<div class="form-field">
																<button type="submit"
																	class="form-control btn btn-primary">Tìm kiếm</button>
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>

										<div class="tab-pane fade" id="v-pills-2" role="tabpanel"
											aria-labelledby="v-pills-performance-tab">
											<form
												action="${pageContext.request.contextPath}/company/search"
												method="post" class="search-job">
												<div class="row no-gutters">

													<div class="col-md-10 mr-md-2">
														<div class="form-group">
															<div class="form-field">
																<div class="icon">
																	<span class="icon-map-marker"></span>
																</div>
																<input type="text" name="keySearch" class="form-control"
																	placeholder="Tìm kiếm công ty">
															</div>
														</div>
													</div>
													<div class="col-md">
														<div class="form-group">
															<div class="form-field">
																<button type="submit"
																	class="form-control btn btn-primary">Tìm kiếm</button>
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>
										<div class="tab-pane fade" id="v-pills-3" role="tabpanel"
											aria-labelledby="v-pills-performance-tab">
											<form
												action="${pageContext.request.contextPath}/recruitment/searchaddress"
												method="post" class="search-job">
												<div class="row no-gutters">

													<div class="col-md-10 mr-md-2">
														<div class="form-group">
															<div class="form-field">
																<div class="icon">
																	<span class="icon-map-marker"></span>
																</div>
																<input type="text" name="keySearch" class="form-control"
																	placeholder="Tìm kiếm theo địa điểm">
															</div>
														</div>
													</div>
													<div class="col-md">
														<div class="form-group">
															<div class="form-field">
																<button type="submit"
																	class="form-control btn btn-primary">Tìm kiếm</button>
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section bg-light">
		<div class="container">
			<h4 style="margin-top: -20px">
				Kết quả tìm kiếm cho : <span>${keySearch}</span>
			</h4>
			<div class="row">
				<div class="col-lg-12 pr-lg-5">
					<div class="row">
						<c:if test="${not empty list.content }">
							<c:forEach var="recruitment" items="${list.content }">
								<div
									class="job-post-item p-4 d-block d-lg-flex align-items-center">
									<div class="one-third mb-4 mb-md-0">
										<div class="job-post-item-header align-items-center">
											<span class="subadge">${recruitment.type}</span>
											<h2 class="mr-3 text-black">
												<a
													href="${pageContext.request.contextPath}/recruitment/detail/${recruitment.id}">${recruitment.title}</a>
											</h2>
										</div>
										<div class="job-post-item-body d-block d-md-flex">
											<div class="mr-3">
												<span class="icon-layers"></span> <a
													href="${pageContext.request.contextPath}/company/detail-company/${recruitment.company.id}">${recruitment.company.nameCompany}</a>
											</div>
											<div>
												<span class="icon-my_location"></span> <span>${recruitment.address}</span>
											</div>
										</div>
									</div>
									<input type="hidden" id="idRe${recruitment.id}"
										value="${recruitment.id}">
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
								<!-- end -->
								<!-- Modal -->
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
					</div>

					<c:if test="${list.totalPages > 0}">
						<div class="row mt-5">
							<div class="col text-center">
								<div class="block-27">
									<ul>
										<!-- Trang trước -->
										<c:if test="${numberPage > 0}">
											<li><a
												href="${pageContext.request.contextPath}/recruitment/search?page=${numberPage - 1}&keySearch=${keySearch}">&lt;</a>
											</li>
										</c:if>

										<!-- Các trang -->
										<c:forEach begin="0" end="${list.totalPages - 1}"
											var="pageIndex">
											<c:if test="${pageIndex < list.totalPages}">
												<li class="${numberPage == pageIndex ? 'active' : ''}">
													<a
													href="${pageContext.request.contextPath}/recruitment/search?page=${pageIndex}&keySearch=${keySearch}">
														${pageIndex + 1} </a>
												</li>
											</c:if>
										</c:forEach>

										<!-- Trang sau -->
										<c:if test="${numberPage < list.totalPages - 1}">
											<li><a
												href="${pageContext.request.contextPath}/recruitment/search?page=${numberPage + 1}&keySearch=${keySearch}">&gt;</a>
											</li>
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