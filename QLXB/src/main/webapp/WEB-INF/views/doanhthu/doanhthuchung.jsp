<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
     integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"> 
     <script src="https://kit.fontawesome.com/ee36f81461.js" crossorigin="anonymous"></script>
<title>Admin quản lý du lịch</title>
</head>
<body>
<div class="container-fluid">
		<div class="row flex-nowrap">
		
 <c:if test="${sessionScope.TaiKhoan.nhanVien.chucVu.id==1}">
   <%@ include file="../includes/Navbarc1.jsp" %>	
   </c:if>
   <c:if test="${sessionScope.TaiKhoan.nhanVien.chucVu.id==8}">
   <%@ include file="../includes/Navbarc11.jsp" %>	
   </c:if>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

<div class="col py-3">

				<h2>Xem doanh thu</h2>
				<div class="d-flex justify-content-center align-items-center">
					<form action="doanhthuchung.htm"
						class="d-flex justify-content-center align-items-center">

						<p class="text-nowrap mt-2">Từ ngày:</p>
						<input class="form-control mx-2" name="tungay"
							data-provide="datepicker" type="date">
						<p class="text-nowrap mt-2">Đến ngày:</p>
						<input class="form-control mx-2" name="denngay"
							data-provide="datepicker" type="date">
						<div class="form-group row  ">
							<div class="col-sm-10">
								<button type="submit" class="btn btn-primary">Lọc</button>
							</div>
						</div>
					</form>
				</div>
				<span style="
    color: red;
">${thoigian }</span>
				<table class="table table-bordered table-striped mt-5" id = "tbldemo">
					<thead>
						<tr>
							<th scope="col">Loại vé</th>
							<th scope="col" colspan="3">Vé học sinh sinh viên</th>
							<th scope="col" colspan="3">Vé bình thường</th>
							<th scope="col" colspan="3">Vé tập</th>
							<th scope="col" colspan="1">Tổng</th>
							
						</tr>
						<tr>
							<th scope="col">Loại hình</th>
							<th scope="col">Trợ giá</th>
							<th scope="col">Không trợ giá</th>
							<th scope="col">Tổng</th>
							<th scope="col">Trợ giá</th>
							<th scope="col">Không trợ giá</th>
							<th scope="col">Tổng</th>
							<th scope="col">Trợ giá</th>
							<th scope="col">Không trợ giá</th>
							<th scope="col">Tổng</th>
							<th scope="col"></th>

						</tr>
					</thead>
					 <tbody>
						<tr>
							<th scope="row">Số lượng</th>
							<td>${c_veHSSV_tg }</td>
							<td>${c_veHSSV_ktg}</td>
							<td>${c_veHSSV_tong }</td>
							<td>${c_veBT_tg }</td>
							<td>${c_veBT_ktg}</td>
							<td>${c_veBT_tong}</td>
							<td>${c_veTap_tg }</td>
							<td>${c_veTap_ktg}</td>
							<td>${c_veTap_tong}</td>
						</tr>
						<tr>
							<th scope="row">Thành tiền (đ)</th>
							<td>${s_veHSSV_tg }</td>
							<td>${s_veHSSV_ktg}</td>
							<td>${s_veHSSV_tong }</td>
							
							<td>${s_veBT_tg}</td>
							<td>${s_veBT_ktg}</td>
							<td>${s_veBT_tong}</td>
							<td>${s_vetap_tg}</td>
							<td>${s_vetap_ktg}</td>
							<td>${s_vetap_tong}</td>
<td>${s_vetap_tong +s_veHSSV_tong+s_veBT_tong}</td>
							<%-- <td>${s_ga_ngay}</td>
							<td>${s_so_dem}</td>
							<td>${s_ga_dem}</td>
							<td>${s_so_thang}</td>
							<td>${s_ga_thang}</td>
							<td>${s_so_ngay + s_so_dem + s_so_thang}</td>
							<td>${s_ga_ngay + s_ga_dem + s_ga_thang}</td>
							<td>${s_so_ngay + s_so_dem + s_so_thang + s_ga_ngay + s_ga_dem + s_ga_thang}</td> --%>
						</tr>
					</tbody> 
				</table>
				<button id="btnexport" class = "btn btn-info">Export to excel</button>
				<script>
        $(function () {
            $("#btnexport").click(function () {
                $("#tbldemo").table2excel();
            });
        });
    </script>
			</div>
			</div>
			</div>




</body>
</html>