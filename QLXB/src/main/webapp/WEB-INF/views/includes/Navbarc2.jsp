<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0t bg-primary">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100 ">
                <a href="#" class="d-flex align-items-center pb-5 pt-5 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">QUẢN LÝ XE BUS</span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start " id="menu">
                    <li class="nav-item">
                        <a href="../homeshow.htm" class="nav-link text-white align-middle px-0">
                           <i class="fa-solid fa-house"></i>
                            <span class="ms-1 d-none d-sm-inline">Home</span>
                        </a>
                    </li>
                  <li><a href="../danhsachnhanvien.htm" 
							class="nav-link text-white px-0 align-middle">
							<i class="fa-regular fa-calendar-days"></i> <span
								class="ms-1 d-none d-sm-inline">Danh sách nhân viên</span>
						</a></li>
						     </li>
                 <!--  <li><button onclick="goHome()">Go to Intro Page</button></li> -->
                    <li>
                        <a href="#submenu2" data-bs-toggle="collapse" class="nav-link text-white px-0 align-middle ">
                            <i class="fa-solid fa-map-location-dot"></i>
                            <span class="ms-1 d-none d-sm-inline">Quản lí xe buýt</span></a>
                        <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="../dstuyenduong.htm" class="nav-link text-white px-0"> <span class="d-none d-sm-inline">Tuyến đường</span></a>
                            </li>
                            <li>
                                <a href="../dsxe.htm" class="nav-link text-white px-0"> <span class="d-none d-sm-inline">Xe</span></a>
                            </li>
                               <li>
                                <a href="../dstramxe.htm" class="nav-link text-white px-0"> <span class="d-none d-sm-inline">Trạm xe</span></a>
                            </li>
                            <li>
                                <a href="../dstramve.htm" class="nav-link text-white px-0"> <span class="d-none d-sm-inline">Trạm vé</span></a>
                            </li>
                        </ul>
                    </li>
                     <li>
                        <a href="#submenu3" data-bs-toggle="collapse" class="nav-link text-white px-0 align-middle ">
                           <i class="fa-solid fa-sack-dollar"></i>
                            <span class="ms-1 d-none d-sm-inline">Quản lý chung</span></a>
                        <ul class="collapse nav flex-column ms-1" id="submenu3" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="../doanhthuchung.htm" class="nav-link text-white px-0"> <span class="d-none d-sm-inline">Doanh thu</span></a>
                            </li>
                            
                            <li>
                                <a href="../dsgiave.htm" class="nav-link text-white px-0"> <span class="d-none d-sm-inline">Giá vé</span></a>
                            </li>
                            <li>
                                <a href="../lichsunhap.htm" class="nav-link text-white px-0"> <span class="d-none d-sm-inline">Lịch sử nhập doanh thu</span></a>
                            </li>
                        </ul>
                    </li>
                    
                <hr>
                </ul>
                
              
                <div class="dropdown pb-4">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://github.com/mdo.png" alt="hugenerd" width="30" height="30" class="rounded-circle">
                        <span class="d-none d-sm-inline mx-1">Tài khoản</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
   
                        <li><a class="dropdown-item" href="../suattcanhan.htm">Chỉnh sửa thông tin cá nhân</a></li>
                        <li><a class="dropdown-item" href="../doimatkhau.htm">Đổi mật khẩu</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="../logout.htm">Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
        </div>
        
     <script>
    /* function goHome() {
        window.location.href = "danhsachnhanvien.htm";
    } */
</script>

