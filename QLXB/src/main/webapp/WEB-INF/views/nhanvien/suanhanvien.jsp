
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN</title>
<link href='assets/css/trangchu.css' rel='stylesheet'>
<link href='assets/css/all.css' rel='stylesheet'>
<head>
<title>Admin quản lý du lịch</title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
	integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
	crossorigin="anonymous"></script>
<style>
.dropdown-menu.show {
	left: -400px;
	background-color: aliceblue;
}
</style>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
}
</style>


</head>
<body>
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<c:if test="${sessionScope.TaiKhoan.nhanVien.chucVu.id==2}">
   <%@ include file="../includes/Navbarc1.jsp" %>	
   </c:if>
   <c:if test="${sessionScope.TaiKhoan.nhanVien.chucVu.id==8}">
   <%@ include file="../includes/Navbarc12.jsp" %>	
   </c:if>
			<div class="col py-3">
					<c:if test="${message==1}">
					<div class="alert alert-success fade show" role="alert"style='position: fixed; width:50%; margin-left:300px; z-index: 100 '>
						<h4 class="alert-heading">SUCCESS!</h4>
						<p>Thêm nhân viên viên thành công</p>
						<hr>
					</div>
				</c:if>
				<c:if test="${message==2}">
					<div class="alert alert-danger fade show" role="alert"style='position: fixed; width:50%; margin-left:230px;'>
						<h4 class="alert-heading">ERROR!</h4>
						<p>Thêm nhân viên thất bại</p>
						<hr>
					</div>
					</c:if>
					<c:set var="message" value="0" />
					<button onclick="location.href = '../danhsachnhanvien.htm'"  class="btn btn-outline-secondary my-2 my-sm-0" type="submit"> << Trở lại</button>
				<div class="container form-dang-nhap">
					<div class="modal-body">
					<form:form action="update.htm" modelAttribute="nhanvien">
						
							<div class="form-group">
								<div>
									<h1>Sửa nhân viên</h1>  
								</div>
								<div class="row">
									<div class="col">
										<label for="recipient-name" class="col-form-label">Mã
											nhân viên :</label> <form:input type="text" class="form-control"
											path="maNV" placeholder="Mã nhân viên" readonly="true"/>
											<form:errors path="maNV" />
										
									</div>
									<div class="col">
										<label for="recipient-name" class="col-form-label">Họ
											 </label>  <form:input type="text" class="form-control" path="ho"
											placeholder="Nguyen Van"/>
											<form:errors path="ho" />
									</div>
									<div class="col">
										<label for="recipient-name" class="col-form-label">Tên
											 </label>  <form:input type="text" class="form-control" path="ten"
											placeholder="A"/>
											<form:errors path="ten" />
									</div>
								</div>
								<div class="row">
									<div class="col">
										<label for="recipient-name" class="col-form-label">Căn
											cước công dân :</label>  <form:input type="text" class="form-control"
											path="cCCD"/> 
											<form:errors path="cCCD" />
									</div>
									
									 <div class="col">
										<label for="recipient-name" class="col-form-label">Giới
											tính :</label><br>
										<div class="form-check form-check-inline">
											<form:radiobutton path="gioiTinh" value="nam" label="Nam" checked="true"></form:radiobutton> 
										</div>
										<div class="form-check form-check-inline">
											<form:radiobutton path="gioiTinh" value="nữ" label="Nữ"></form:radiobutton>
										</div>
									</div> 
								</div>
								<div class="row">
									<div class="col">
										<label for="recipient-name" class="col-form-label">Ngày
											sinh :</label> <form:input type="date" class="form-control"
											
											path="ngaySinh" />
									</div>
									<div class="col">
										<label for="recipient-name" class="col-form-label">Số
											điện thoại :</label>  <form:input type="tel" class="form-control"
											id="phone" path="sDT" />
									</div>
								</div>
<div class="row"><div class="col">
								<label for="recipient-name" class="col-form-label">Địa
									chỉ:</label>  <form:input type="text" class="form-control" path="diaChi"
									/></div>
									<div class="col">
								<label for="recipient-name" class="col-form-label">Email
									:</label> <form:input type="email" class="form-control" path="email"
									id="inputEmail4" placeholder="nguyenvana@gmail.com"/> 
									</div>
									</div>
									<div class="row">
									<div class="col">
										<label for="recipient-name" class="col-form-label" >Chọn chức vụ :</label> 
											 <form:select path="chucVu.id" class="form-select" aria-label="Default select example">
											<c:forEach var="chucvu" items="${chucvus}">
 
     <form:option  value="${chucvu.id}">${chucvu.ten}</form:option>
  
  </c:forEach>
  
 </form:select>
 </div>
 <div class="col">
										<label for="recipient-name" class="col-form-label">Trạng thái :</label><br>
										<div class="form-check form-check-inline">
											<form:radiobutton path="trangThai" value="1" label="Hoạt động" ></form:radiobutton> 
										</div>
										<div class="form-check form-check-inline">
											<form:radiobutton path="trangThai" value="0" label="ngừng hoạt động"></form:radiobutton>
										</div>
									</div> 
									</div>
							</div>
							
							
							<button class="btn btn-primary">cập nhật</button>
						</form:form>
					</div>
				</div>
				
			</div>
		</div>
	</div>
<script>
  setTimeout(function() {
    document.querySelector('.alert').classList.add('d-none');
  }, 2000);
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>