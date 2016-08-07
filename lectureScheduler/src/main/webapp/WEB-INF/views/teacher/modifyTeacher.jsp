<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h1>편집페이지입니다</h1><br/>
<div class="col-md-6 col-md-offset-3">
<form action="/teacher/modify" method="POST" id="modifyForm" class="form-horizontal validate-form">
	<input type="hidden" name="id" id="id" value="${teacher.id }">
	
	<div class="form-group">
		<label for="teacherName" class="col-md-2 control-label">이 름 :</label>
			<div class ="col-md-6 ">
				<input type="text" name="teacherName" id="teacherName" class="form-control" value="${teacher.teacherName }">
			</div>
	</div>
	<div class="form-group" >
		<label for="eMail" class="col-md-2 control-label"> 이메일 : </label>
			<div class="col-md-6 ">
				<input type="email" name="eMail" id="eMail" class="form-control" value="${teacher.eMail }">
			</div>
	</div>
	<div class="form-group">
		<label for="lecutre" class="col-md-2 control-label"> 과목명 : </label>
			<div class="col-md-6">
				<select name="lecture_id" id="lecutre" class="form-control">
					<option value="1">HTML</option>
					<option value="2">CSS</option>
					<option value="3">Javascript</option>
					<option value="4">JAVA</option>
					<option value="5">PHP</option>
				</select>
			</div>
	</div>
	<div class="form-group">
		<div class="col-md-offset-3 col-md-9">
			<button type="button" id="modifyTeacherInfo" class="btn btn-primary">수정하기</button>
        	<button type="button" id="deleteTeacherInfo" class="btn btn-danger">삭제하기</button>
		</div>
	</div>
</form>
</div>

<script src="/resources/js/validation.js"></script>
<script>

	// 강사 정보 수정
	$('#modifyTeacherInfo').click(function(){
		var formData = $('#modifyForm').serialize();
		$.ajax({
			type : "POST",
			url : "/teacher/modify/",
			cache : false,
			data : formData,
			success : function(data){
				console.log(data);
				location.href = "/teacher/list";
			}
		});
	});
	
	// 강사 정보 삭제
	$('#deleteTeacherInfo').click(function(){
		var teacherID = $('#id').val();
		var formData = $('#modifyForm').serialize();
		$.ajax({
			type : "POST",
			url : "/teacher/delete/" + teacherID,
			cache : false,
			data : formData,
			success : function(data){
				console.log(data);
				location.href = "/teacher/list";
			}
		});
	});

</script>