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

	<c:if test="${not empty updateJobSuccess}">
		<div class="toast" data-delay="1000"
			style="position: fixed; top: 100px; left: 40px; z-index: 2000; width: 300px">
			<script>
				console.log("loginFalse: ${loginFalse}");
				setTimeout(function() {
					Swal.fire({
						title : 'Update Success!',
						text : '${updateJobSuccess}',
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
							<p class="breadcrumbs mb-0">
								<span class="mr-3"><a href="index.html">Trang chủ <i
										class="ion-ios-arrow-forward"></i></a></span> Cập nhập<span></span>
							</p>
							<h1 class="mb-3 bread">Cập nhật bài tuyển dụng</h1>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach>

	<div th:if="${success}" class="toast" data-delay="2500"
		style="position: fixed; top: 100PX; left: 10PX; z-index: 2000; width: 300px">
		<div class="toast-header" style="background-color: #1c7430">
			<strong class="mr-auto" style="color: white">Thông báo</strong> <small
				style="color: white">Vừa xong</small>
			<button type="button" class="ml-2 mb-1 close" data-dismiss="toast"
				aria-label="Close">
				<span aria-hidden="true" style="color: white">&times;</span>
			</button>
		</div>
		<div class="toast-body">
			<p th:text="'✅ ' +${success}"></p>
		</div>
		<!-- 		<script>
    $(document).ready(function(){
      $('.toast').toast('show');
    });
  </script>
 -->
	</div>

	<!--<div th:if="${msg_register_error}" class="toast" data-delay="2500" style="position:fixed; top: 100PX; right: 10PX;z-index: 2000;width: 300px">-->
	<!--    <div class="toast-header" style="background-color: red">-->

	<!--        <strong class="mr-auto" style="color: white">Thông báo</strong>-->
	<!--        <small style="color: white">Vừa xong</small>-->
	<!--        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">-->
	<!--            <span aria-hidden="true" style="color: white">&times;</span>-->
	<!--        </button>-->
	<!--    </div>-->
	<!--    <div class="toast-body" >-->
	<!--        <p th:text="'❌ ' +${msg_register_error}"></p>-->
	<!--    </div>-->
	<!--    <script>-->
	<!--        $(document).ready(function(){-->
	<!--            $('.toast').toast('show');-->
	<!--        });-->
	<!--    </script>-->
	<!--</div>-->
	<!-- HOME -->

	<c:forEach var="role" items="${user.roles }">
		<c:if test="${role.id == 2 }">
			<section class="section-hero overlay inner-page bg-image"
				style="background-image: url('${pageContext.request.contextPath}/resources/assetsimages/hero_1.jpg');"
				id="home-section">
				<div class="container">
					<div class="row">
						<div class="col-md-7">
							<h1 class="text-white font-weight-bold">Cập nhật</h1>
							<div class="custom-breadcrumbs">
								<a href="/user/list-post">Danh sách</a> <span class="mx-2 slash">/</span>
								<span class="text-white"><strong>Cập nhật bài
										tuyển dụng</strong></span>
							</div>
						</div>
					</div>
				</div>
			</section>
		</c:if>

	</c:forEach>
	<c:forEach var="role" items="${user.roles }">
		<c:if test="${role.id == 1 }">
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
		<c:if test="${role.id == 2 }">
			<section class="site-section">
				<div class="container">
					<form:form
						action="${pageContext.request.contextPath}/recruitment/editpost/${recruitment.id}"
						modelAttribute="updateJob" method="post" id="editJobForm">
						<input type="hidden" class="form-control" id="job-location"
							name="id" value="${recruitment.id}">
						<input type="hidden" class="form-control" id="job-location"
							name="createdAt" value="${recruitment.createdAt}">
						<div class="row align-items-center mb-5">
							<div class="col-lg-8 mb-4 mb-lg-0">
								<div class="d-flex align-items-center">
									<div>
										<h2>Cập nhật bài đăng</h2>
									</div>
								</div>
							</div>
							<!--        <div class="col-lg-4">-->
							<!--          <div class="row">-->
							<!--            <div class="col-6">-->
							<!--              <a href="#" class="btn btn-block btn-light btn-md"><span class="icon-open_in_new mr-2"></span>Preview</a>-->
							<!--            </div>-->
							<!--            <div class="col-6">-->
							<!--              <a href="#" class="btn btn-block btn-primary btn-md">Đăng</a>-->
							<!--            </div>-->
							<!--          </div>-->
							<!--        </div>-->
						</div>
						<div class="row mb-5">
							<div class="col-lg-12">
								<div class="p-4 p-md-5 border rounded">
									<h3 class="text-black mb-5 border-bottom pb-2">Chi tiết
										bài tuyển dụng</h3>

									<div class="form-group">
										<label for="email">Tiêu đề</label> <input type="text"
											class="form-control" id="email" name="title" required
											value="${recruitment.title}">
									</div>
									<div class="form-group">
										<label for="job-location">Mô tả công việc</label>
										<textarea name="description" class="form-control" id="editorN"
											required>${recruitment.description}</textarea>
									</div>
									<div class="form-group">
										<label for="job-title">Kinh nghiệm</label> <input type="text"
											class="form-control" id="job-title" name="experience"
											value="${recruitment.experience}" required>
									</div>
									<div class="form-group">
										<label for="job-title">Số người cần tuyển</label> <input
											type="number" class="form-control" id="job-title"
											name="quantity" value="${recruitment.quantity}" required>
									</div>
									<div class="form-group">
										<label for="job-location">Địa chỉ</label> <input type="text"
											class="form-control" id="job-location" name="address"
											value="${recruitment.address}" required>
									</div>
									<div class="form-group">
										<label for="job-location">Hạn ứng tuyển</label> <input
											type="date" class="form-control" id="job-location"
											name="deadline" value="${recruitment.deadline}" required>
									</div>
									<div class="form-group">
										<label for="job-location">Lương</label> <input type="text"
											class="form-control" id="job-location" name="salary"
											value="${recruitment.salary}" required>
									</div>

									<div class="form-group">
										<label for="job-region">Loại công việc</label> <select
											class="form-control" name="type"
											aria-label="Default select example" required>
											<option value="" disabled>Chọn loại công việc</option>
											<option value="Part time"
												${recruitment.type == 'Part time' ? 'selected' : ''}>Part
												time</option>
											<option value="Full time"
												${recruitment.type == 'Full time' ? 'selected' : ''}>Full
												time</option>
											<option value="Freelancer"
												${recruitment.type == 'Freelancer' ? 'selected' : ''}>Freelancer</option>
										</select>
									</div>
									<div class="form-group">
										<label for="job-region">Vị trí công việc</label> <select
											class="form-control" name="rankValue"
											aria-label="Default select example" required>
											<option value="" disabled selected>Chọn vị trí công
												việc</option>
											<option value="Intern"
												${recruitment.rankValue == 'Intern' ? 'selected' : ''}>Intern</option>
											<option value="Fresher"
												${recruitment.rankValue == 'Fresher' ? 'selected' : ''}>Fresher</option>
											<option value="Junior"
												${recruitment.rankValue == 'Junior' ? 'selected' : ''}>Junior</option>
											<option value="Mid-level"
												${recruitment.rankValue == 'Mid-level' ? 'selected' : ''}>Mid-level</option>
											<option value="Senior"
												${recruitment.rankValue == 'Senior' ? 'selected' : ''}>Senior</option>
											<option value="Lead"
												${recruitment.rankValue == 'Lead' ? 'selected' : ''}>Lead</option>
											<option value="Manager"
												${recruitment.rankValue == 'Manager' ? 'selected' : ''}>Manager</option>
										</select>

									</div>

									<div class="form-group">
										<label for="job-region">Danh mục công việc</label> <select
											class="form-control" name="categoryId"
											aria-label="Default select example" required>
											<option value="" disabled>Chọn danh mục công việc</option>
											<c:forEach var="cat" items="${categories}">
												<option value="${cat.id}"
													${cat.id == recruitment.category.id ? 'selected' : ''}>${cat.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>

						</div>
						<div class="row align-items-center mb-5">

							<div class="col-lg-4 ml-auto">
								<div class="row">
									<div class="col-6">
										<a href="#" class="btn btn-block btn-light btn-md"></a>
									</div>
									<div class="col-6">
										<button type="submit" class="btn btn-block btn-primary btn-md">Cập
											nhật</button>
									</div>
								</div>
							</div>
						</div>
					</form:form>
				</div>
			</section>
		</c:if>
	</c:forEach>



	<script>
  ClassicEditor.create(document.querySelector('#editorN')).then(eidt => {
    console.log("da" + eidt);
  })
          .catch(error => {
            console.error(error);
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