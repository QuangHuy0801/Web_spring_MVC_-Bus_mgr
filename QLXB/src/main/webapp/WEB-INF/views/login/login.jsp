<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<link rel="icon" type="image/x-icon" href="https://andrewlock.net/content/images/2016/10/icon.png">
<style>
.bg-image-vertical {
position: relative;
overflow: hidden;
background-repeat: no-repeat;
background-position: right center;
background-size: auto 100%;
}



.card { {
    margin-bottom: 2rem;
}

@media (min-width: 1025px) {
.h-custom-2 {
height: 100%;
}
}</style>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
	display: block;
}
</style>
<script src=https://www.google.com/recaptcha/api.js></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
     integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"> 
     <script src="https://kit.fontawesome.com/ee36f81461.js" crossorigin="anonymous"></script>
</head>
<body>
<section class="vh-100" style="background-color: #9A616D; height: 100%!important;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="https://i.pinimg.com/564x/fc/e0/68/fce0681b408f1b21b1cd51759ac446dd.jpg"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

               <form:form  action="login.htm" method="post" modelAttribute="taiKhoan">
                  <div class="d-flex align-items-center mb-3 pb-1">
                    <span class="h1 fw-bold mb-0">QUẢN LÝ XE BUS</span>
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Đăng nhập vào tài khoản của bạn</h5>
                 

                  <div class="form-outline mb-4">
                     <form:input type="text" id="form2Example17" class="form-control form-control-lg" path="maNV" />
                     
                    <label class="form-label" for="form2Example17">Tên đăng nhập</label>
                    <form:errors path="maNV" />
                  </div>

                  <div class="form-outline mb-4">
                     <form:input type="password" id="form2Example27" class="form-control form-control-lg" path="PASSWORD"/>
                  
                    <label class="form-label" for="form2Example27">Mật khẩu</label>
                      
                      <form:errors path="PASSWORD" />
                  </div>
					
                  <div class="pt-1 mb-4">
                    <button class="btn btn-dark btn-lg btn-block" >ĐĂNG NHẬP </button>
                  </div>
                  <div class="g-recapcha" data-sidekey="6Ld5VYQmAAAAAK4BBE8MKiguwWfmNYEJGc2m2BjZ"></div>
                  <a class="small text-muted" href="quenmatkhau.htm">Quên mật khẩu?</a>
                </form:form>
				<div style="color: red;
	font-style: italic;">${error }</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>