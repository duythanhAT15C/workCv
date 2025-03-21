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
						<span class="mr-3"><a href="index.html">Trang chủ <i
								class="ion-ios-arrow-forward"></i></a></span>Chi tiết <span></span>
					</p>
					<h1 class="mb-3 bread">Chi tiết công ty</h1>
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
								test="${fn:contains(company.logo, 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg')}">
								<!-- Nếu đường dẫn đã chứa phần URL cụ thể, không cần thêm /Assignment02 -->
								<img width="100" height="100" src="${company.logo}" alt="Image">
							</c:if>
							<c:if
								test="${not fn:contains(company.logo, 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg')}">
								<!-- Nếu đường dẫn đã chứa phần URL cụ thể, không cần thêm /Assignment02 -->
								<img width="100" height="100"
									src="${pageContext.request.contextPath}${company.logo}"
									alt="Image">
							</c:if>
						</div>
						<div>
							<h2>${company.nameCompany}</h2>
							<div>
								<span class="icon-briefcase mr-2"></span><span
									class="ml-0 mr-2 mb-2">${company.email}</span> <span
									class="icon-room mr-2"></span><span class="m-2">${company.address}</span>

							</div>
							<input type="hidden" id="idCompany">
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="row">
						<c:if test="${not empty user}">
							<div class="col-6">
								<c:forEach var="role" items="${user.roles }">
									<c:if test="${role.id == 1}">
										<!-- 
											<a onclick="follow()" class="btn btn-block btn-light btn-md"
											data-job-id="${recruitment.id}" data-checked="true"> <span
											class="icon-heart-o mr-2 text-danger"></span>Theo dõi
										</a>
										 -->
										<c:choose>
											<c:when test="${checkExistFollowCompany}">
												<!-- Nếu đã lưu công việc -->
												<a id="save-button-${company.id}"
													class="btn btn-block btn-light btn-md"
													data-follow-id="${company.id}" data-checked="true"> <span
													id="icon-heart-${company.id}"
													class="icon-heart mr-2 text-danger"></span>Đã theo dõi
												</a>
											</c:when>
											<c:otherwise>
												<!-- Nếu chưa lưu công việc -->
												<a id="save-button-${company.id}"
													class="btn btn-block btn-light btn-md"
													data-follow-id="${company.id}" data-checked="false"> <span
													id="icon-heart-${company.id}"
													class="icon-heart-o mr-2 text-danger"></span>Theo dõi
												</a>
											</c:otherwise>
										</c:choose>

									</c:if>
								</c:forEach>

							</div>
						</c:if>
						<c:if test="${empty user}">
							<div class="col-6">
								<a id="follow-button" class="btn btn-block btn-light btn-md">
									<span class="icon-heart-o mr-2 text-danger"></span>Theo dõi
								</a>
							</div>
						</c:if>
						<div class="col-6"></div>
					</div>

				</div>
			</div>
			<div class="row">
				<div class="col-lg-8">
					<div class="mb-5">

						<h3 class="h5 d-flex align-items-center mb-4 text-primary">
							<span class="icon-align-left mr-3"></span>Mô tả công ty
						</h3>
						<p>${company.description}</p>
					</div>

				</div>
				<div class="col-lg-4">
					<div class="bg-light p-3 border rounded mb-4">
						<h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Tóm tắt công ty</h3>
						<ul class="list-unstyled pl-3 mb-0">

							<li class="mb-2"><strong class="text-black">Email
									công ty: </strong> <span>${company.email}</span></li>
							<li class="mb-2"><strong class="text-black">Số điện
									thoại: </strong> <span>${company.phoneNumber}</span></li>
							<li class="mb-2"><strong class="text-black">Địa
									chỉ: </strong> <span>${company.address}</span></li>
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
		<script>
		function isJson(str) {
		    try {
		        JSON.parse(str);
		        return true;  // Nếu không có lỗi thì là JSON hợp lệ
		    } catch (e) {
		        return false;  // Nếu có lỗi thì không phải JSON hợp lệ
		    }
		}
		$(function () {
		    $(document).on('click', '[id^="save-button-"]', function () {
		        var companyId = $(this).data('follow-id');  // Lấy ID công việc từ data-job-id
		        var iconHeart = $('#icon-heart-' + companyId);  // Biểu tượng trái tim
		        var button = $('#save-button-' + companyId);  // Nút lưu

		        // Lấy trạng thái lưu từ data-checked và đảo ngược trạng thái
		        var isChecked = $(this).data('checked') === true;
		        $(this).data('checked', !isChecked);  // Đảo ngược trạng thái lưu

		        // Chọn URL và trạng thái mới dựa trên isChecked
		        var url = isChecked ? '/Assignment02/user/deleteFollowCompany' : '/Assignment02/user/follow-company';
		        console.log(isChecked);
		        // Gửi yêu cầu AJAX
		        $.ajax({
		            type: 'POST',
		            url: url,
		            data: { companyId: companyId, isChecked: !isChecked },  // Đảo ngược trạng thái khi gửi
		            success: function (response) {
		            	var responseData = null;
		                if(isJson(response)){
		                	responseData = JSON.parse(response);
		                }
		                else{
		                	responseData = response;
		                }
		                
		                if (responseData.success) {
		                    // Cập nhật giao diện
		                    if (!isChecked) {  // Nếu trước đó chưa lưu, bây giờ lưu
		                        iconHeart.removeClass('icon-heart-o').addClass('icon-heart');
		                        button.html('<span id="icon-heart-' + companyId + '" class="icon-heart mr-2 text-danger"></span>Đã theo dõi');
		                    } else {  // Nếu trước đó đã lưu, bây giờ bỏ lưu
		                        iconHeart.removeClass('icon-heart').addClass('icon-heart-o');
		                        button.html('<span id="icon-heart-' + companyId + '" class="icon-heart-o mr-2 text-danger"></span>Theo dõi');
		                    }

		                    // Hiển thị thông báo thành công
		                    Swal.fire({
		                        title: !isChecked ? 'Đã theo dõi công ty!' : 'Đã bỏ lưu công ty!',
		                        text: !isChecked ? 'Công ty đã được lưu vào danh sách yêu thích của bạn.' : 'Công ty đã bị xóa khỏi danh sách yêu thích.',
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
		                text: 'Bạn cần phải đăng nhập để theo dõi công ty.',
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
	</section>

	<footer class="footer" class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">

			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						<i class="icon-heart text-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">ThanhVD</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
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