<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
function selectDomain(obj){
	document.newMember.mail2.value=obj.value;
	if(obj.value=="") document.newMember.mail2.focus();
}
</script> 
<script>
      var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
      var regExpPassword =/^[0-9]*$/;
      
      var form = document.newMember;
      
      var id = form.id.value;
      var passwd = form.password.value;
      
      if(!regExpId.test(id)){
  		alert("아이디는 문자로 시작해주세요");
  		form.id.focus();
  		form.id.value="";
  		return false;
  	}
      
      if(!regExpPassword.test(passwd)){
  		alert("비밀번호는 숫자만 입력해주세요");
  		form.password.focus();
  		form.password.value='';
  		form.password_confirm.value='';
  		return false;
  	}
</script>

<title>MEMBER INFO</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3" align="center" style="margin: -10px 0 0 -50px;">MEMBER INFO</h1>
		</div>
	</div>

    <div class="container">*표시는 필수 입력 표시입니다</div>
    <hr class="container">
	<div class="container">
		<form name="newMember" class="form-horizontal"
			action="processAddMember.jsp" method="post"
			onsubmit="return checkForm()">
			<div class="form-group row">
				<label class="col-sm-2">*ID</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="id"
						required>
				</div>
			</div>
			<hr class="container">
			<div class="form-group row">
				<label class="col-sm-2">*이름</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control"
						placeholder="name" required>
				</div>
			</div>
            <hr class="container">
			<div class="form-group row">
				<label class="col-sm-2">*비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="password" class="form-control"
						placeholder="password" required>
				</div>
			</div>
            <hr class="container">
			<div class="form-group row">
				<label class="col-sm-2">*비밀번호확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="password" class="form-control"
						placeholder="password" required>
				</div>
			</div>
            <hr class="container">
			<div class="form-group row">
				<label class="col-sm-2">*생일</label>
				<div class="col-sm-4">
					<input type="text" name="birthyy" maxlength="4" placeholder="년도"
						size="6" required> <select name="birthmm" required>
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> <input type="text" name="birthdd" maxlength="2" placeholder="일"
						size="4" required>
				</div>
			</div>
            <hr class="container">
			<div class="form-group row">
				<label class="col-sm-2">*이메일</label>
				<div class="col-sm-10">
					<input type="text" name="mail1" maxlength="50" required>@ <input
						type="text" name="mail2" maxlength="50" required> <select
						name="mail2_select" onchange="selectDomain(this)">
						<option disabled="disabled" selected="selected">선택</option>
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
						<option value="">직접입력</option>
					</select> <input type="button" value="중복 확인" class="btn btn-info" />
				</div>
			</div>
   
             <hr class="container">
			<div class="form-group row">
				<label class="col-sm-2">*휴대폰</label>
				<div class="col-sm-5">
					<select name="phone1" required>
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select> - <input maxlength="4" size="4" name="phone2" required> -
					<input maxlength="4" size="4" name="phone3" required>
				</div>
			</div>
             <hr class="container">
			<div class="form-group row">
				<label class="col-sm-2">*주소</label>
				<div class="col-sm-3">
					<input name="roadAddress" id="roadAddress" type="text"
						class="form-control" placeholder="주소" required>
				</div>
			</div>
			<hr class="container">
			<div class="form-group row">
				<label class="col-sm-2">*상세주소</label>
				<div class="col-sm-3">
					<input name="detailAddress" id="detailAddress" type="text"
						class="form-control" placeholder="상세주소" required>
				</div>
			</div>
			<br>

			<div class="form-gorup row"  align="center" style="top: 10%; left:10%; margin: -10px 0 50px 120px;">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-secondary" style="margin-right: 20px" value="수정">
					<input type="reset" class="btn btn-secondary" value="목록"
						onclick="reset()">
				</div>
			</div>
		</form>
	</div>
</body>
</html>