<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="js/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
		
		//��й�ȣ ���� üũ �̺�Ʈ
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
	<h2>�α���</h2>
	<div class="modal-body agileits_modal_body">
		<form action="loginCheck.do" method="post">
			<span><input type="text" name="id"
				placeholder="���̵�" required />
			</span> <span class="w3_modal"><input type="password" name="pw"
				placeholder="��й�ȣ" required />
			</span>
			<div class="agile_remember">
				<div class="agile_remember_left">
					<div class="check">
						<label class="checkbox"><input type="checkbox"
							name="checkbox"><i> </i>���̵� �����ϱ�</label>
					</div>
				</div>
				<div class="agile_remember_right">
					<a href="#">��й�ȣ ã��</a>
				</div>
				<div class="clearfix"></div>
			</div>
			<input type="submit" value="�α���">
		</form>
		<h5>
			������ �����Ű���? 
				<a href="#small-dialog1"
				class="play-icon popup-with-zoom-anim">ȸ������</a>
		</h5>
	</div>
</div>
<div id="small-dialog1" class="mfp-hide">
	<h2>ȸ������</h2>
	<div class="modal-body w3_agileits_modal_body">
		<form action="signUp.do" method="post" name="vForm">
			<div class="w3_modal_body_grid w3_modal_body_grid1">
				<span>���̵�</span><input id="idCheck1" style="padding:10px;font-size:14px;display:inline-block;float:left; type="text" name="ID" required autofocus/>
				<input type="button" value="�ߺ�Ȯ��" id="id_check">
			</div>
			<div class="clearfix"></div>
			<div class="w3_modal_body_grid w3_modal_body_grid1">
				<span>��й�ȣ</span> <input id="signUpPw" type="password" name="Password" required />
			</div>
			<div class="w3_modal_body_grid w3_modal_body_grid1">
				<span>��Ȯ��</span> <input style="display:inline-block;float:left;" id="signUpPwCk" type="password" name="Password-check" required />
				<span id="pwch" style="font-size:9pt;display:block;">&nbsp;</span>
			</div>
			<div class="clearfix"></div>
			<div class="w3_modal_body_grid w3_modal_body_grid1">
				<span>����</span> <input type="text" name="Region" required />
			</div>
			<div class="w3_modal_body_grid w3_modal_body_grid1">
				<span>Email</span> <input type="email" name="Email" required />
			</div>
			<div class="w3_modal_body_grid w3_modal_body_grid1">
				<span>���ڵ�</span> <input type="text" name="team_code" />
			</div>
			
			<input type="submit" value="Sign Up">
		</form>
		<h5>
			�̹� ȸ���̽ʴϱ�? <a href="#small-dialog"
				class="play-icon popup-with-zoom-anim">�α���</a>
		</h5>
	</div>
</div>