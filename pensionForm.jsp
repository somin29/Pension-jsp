<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="material-design-iconic-font.min.css">

		<!-- STYLE CSS -->
		<link rel="stylesheet" href="style2.css">
<title>펜션 예약</title>
</head>
<body>
<center>
<div class="wrapper" style="background-image: url('img/bg-registration-form-1.jpg');">
			<div class="inner">
				<div class="image-holder">
					<img src="img/registration-form-1.png" alt="">
				</div>
				<form action="pensionProc.jsp" method="post">
					<h3>Registration Form</h3>
					<div class="form-wrapper">
					<label for="employee-name">Name</label>
					<input type="text" placeholder="Username"  name="name" class="form-control">
					<i class="zmdi zmdi-account"></i>
					</div>
					<div class="form-wrapper">
						<label for="employee-tel">Tel</label>
						<input type="text" placeholder="Tel"  name="tel" class="form-control">
						<i class="zmdi zmdi-account"></i>
					</div>
					<div class="form-wrapper">
						<label for="employee-email">Email</label>
						<input type="text" placeholder="Email"  name="email" class="form-control">
						<i class="zmdi zmdi-email"></i>
					</div>
					<div class="form-wrapper">
						<label for="employee-gender">Gender</label>
						<select name="gender" id="" class="form-control">
							<option value="남자">남자</option>
							<option value="여자">여자</option>
						</select>
						<i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
					</div>
					<div class="form-wrapper">
						<label for="employee-room">Room</label>
						<input type="text" placeholder="Room"  name="room" class="form-control">
						<i class="zmdi zmdi-email"></i>
					</div>
					<div class="form-wrapper">
						<label for="employee-job">Job</label>
						<input type="text" placeholder="Job"  name="job" class="form-control">
						<i class="zmdi zmdi-email"></i>
					</div>
					<button>    
						<input type="submit">확인
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
					<button>    
						<input type="reset">취소
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
				</form>
			</div>
		</div>
</center>
</body>
</html>