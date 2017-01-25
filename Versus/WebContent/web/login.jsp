<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="js/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
		
		//비밀번호 동일 체크 이벤트
		$('#signUpPwCk').keyup(function(){
			var result = "";
			var pw = $('#signUpPw').val();
			var pw2 = $('#signUpPwCk').val();
			
			if(pw == pw2){
				result = "Match!";
				$('#pwch').css('padding-top','1em');
				$('#pwch').css('color','green');
			}else{
				result = "Not Match!";
				$('#pwch').css('padding-top','4px');
				$('#pwch').css('color','red');
			}
			
			$('#pwch').html(result);	
		});	
	});
</script>
<div id="small-dialog" class="mfp-hide w3ls_small_dialog">
	<h2>로그인</h2>
	<div class="modal-body agileits_modal_body">
		<form action="loginCheck.do" method="post">
			<span><input type="text" name="id"
				placeholder="아이디" required />
			</span> <span class="w3_modal"><input type="password" name="pw"
				placeholder="비밀번호" required />
			</span>
			<div class="agile_remember">
				<div class="agile_remember_left">
					<div class="check">
						<label class="checkbox"><input type="checkbox"
							name="checkbox"><i> </i>아이디 저장하기</label>
					</div>
				</div>
				<div class="agile_remember_right">
					<a href="#">비밀번호 찾기</a>
				</div>
				<div class="clearfix"></div>
			</div>
			<input type="submit" value="로그인">
		</form>
		<h5>
			계정이 없으신가요? 
				<a href="#small-dialog1"
				class="play-icon popup-with-zoom-anim">회원가입</a>
		</h5>
	</div>
</div>
<div id="small-dialog1" class="mfp-hide">
	<h2>회원가입</h2>
	<div class="modal-body w3_agileits_modal_body">
		<form action="signUp.do" method="post" name="vForm">
			<div class="w3_modal_body_grid w3_modal_body_grid1">
				<span>아이디</span><input id="idCheck1" style="padding:10px;font-size:14px;display:inline-block;float:left; type="text" name="ID" required autofocus/>
				<input type="button" value="중복확인" id="id_check">
			</div>
			<div class="clearfix"></div>
			<div class="w3_modal_body_grid w3_modal_body_grid1">
				<span>비밀번호</span> <input id="signUpPw" type="password" name="Password" required />
			</div>
			<div class="w3_modal_body_grid w3_modal_body_grid1">
				<span>재확인</span> <input style="display:inline-block;float:left;" id="signUpPwCk" type="password" name="Password-check" required />
				<span id="pwch" style="font-size:9pt;display:block;">&nbsp;</span>
			</div>
			<div class="clearfix"></div>
			<div class="w3_modal_body_grid w3_modal_body_grid1">
				<span>지역</span> <input type="text" name="Region" required />
			</div>
			<div class="w3_modal_body_grid w3_modal_body_grid1">
				<span>Email</span> <input type="email" name="Email" required />
			</div>
			<div class="w3_modal_body_grid w3_modal_body_grid1">
				<span>팀코드</span> <input type="text" name="team_code" />
			</div>
			
			<input type="submit" value="Sign Up">
		</form>
		<h5>
			이미 회원이십니까? <a href="#small-dialog"
				class="play-icon popup-with-zoom-anim">로그인</a>
		</h5>
	</div>
</div>