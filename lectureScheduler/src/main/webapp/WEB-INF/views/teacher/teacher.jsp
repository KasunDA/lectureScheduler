<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="col-md-6 col-md-offset-3">
<form action="/teacher/add" method="POST" class="form-horizontal">
	<div class="form-group">
		<label for="teacherName" class="col-md-2 control-label">이 름 :</label>
			<div class ="col-md-6 ">
				<input type="text" name="teacherName" id="teacherName" class="form-control">
			</div>
	</div>
	<div class="form-group" >
		<label for="eMail" class="col-md-2 control-label"> 이메일 : </label>
			<div class="col-md-6 ">
				<input type="email" name="eMail" id="eMail" class="form-control">
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
			<button type="submit" class="btn btn-default">등록하기</button>
		</div>
	</div>
</form>
</div>

<table id="teacherTable" class="table table-striped">
	<thead>
		<tr>
			<th>강사 번호</th>
			<th>강사 이름</th>
			<th>이 메 일 </th>
			<th>과 목 명 </th>
		</tr>			
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(teacherList) != null }">
				<c:forEach var="teacher" items="${teacherList}">
					<tr>
						<td>${teacher.id}</td>
						<td><a href="#" data-toggle="modal" data-target="#teacherInfo" onclick="showModal(${teacher.id})">${teacher.teacherName}</a></td>
						<td>${teacher.eMail}</td>
						<td>${teacher.lectureName}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4"> 등록된 강사가 없습니다.</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

<!-- Modal -->
<div class="modal fade" id="teacherInfo" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title text-center">강사정보편집하기</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
      	<form id="teacherInfoForm" class="form-horizontal">
      		<div class="form-group">
				<label for="modalID" class="col-md-2 control-label"> 강사번호 : </label>
					<div id="modalID" class="col-md-6">
					</div>
			</div>
			<div class="form-group">
				<label for="modalTeacherName" class="col-md-2 control-label"> 이름 : </label>
					<div class="col-md-6">
						<input type="text" name="teacherName" id="modalTeacherName" class="form-control">
					</div>
			</div>
			<div class="form-group" >
				<label for="modalEmail" class="col-md-2 control-label"> 이메일 : </label>
					<div class="col-md-6 ">
						<input type="email" name="eMail" id="modalEmail" class="form-control">
					</div>
			</div>
			<div class="form-group">
				<label for="lecutre" class="col-md-2 control-label"> 과목명 : </label>
					<div class="col-md-6">
						<select name="lecture_id" id="mlecture" class="form-control">
							<option value="1">HTML</option>
							<option value="2">CSS</option>
							<option value="3">Javascript</option>
							<option value="4">JAVA</option>
							<option value="5">PHP</option>
						</select>
					</div>
			</div>
		</form>
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        <button type="button" id="modifyTeacherInfo" class="btn btn-primary" data-dismiss="modal">수정하기</button>
        <button type="button" id="deleteTeacherInfo" class="btn btn-danger" data-dismiss="modal">삭제하기</button>
      </div>
    </div>
  </div>
</div>

<script>
	jQuery(function($){
		// 선생님 리스트를 보여주는 테이블 [한번에 보여줄 데이터수와, 페이지 수 설정]
		$('#teacherTable').DataTable({
			"aLengthMenu" : [[5, 10, 15, -1], [5, 10, 15, "All"]],
			"pageLength" : 5
		});
		
	});
	
	// 모달 팝업창
	function showModal(teacherID){
		var teacherID = teacherID;
		$.ajax({
			type : "GET",
			url : "/teacher/find/" + teacherID,
			cache : false,
			data : teacherID,
			success : function(data){
				$('#modalID').text(teacherID);
				$('#mteacherName').attr('value', data.teacherName);
				$('#meMail').attr('value', data.eMail);
				$('#teacherModal').modal('show');
			}
		});
		
	}
	
	// 모달 팝업창 - 강사 정보 수정
	$('#modifyTeacherInfo').click(function(){
		var teacherID = $('#modalID').val();
		var formData = $('#teacherInfoForm').serialize();
		$.ajax({
			type : "POST",
			url : "/teacher/modify/",
			cache : false,
			data : formData
		});
	});
	
	// 모달 팝업창 - 강사 정보 삭제
	$('#deleteTeacherInfo').click(function(){
		var teacherID = $('#modalID').val();
		var formData = $('#teacherInfoForm').serialize();
		$.ajax({
			type : "POST",
			url : "/teacher/delete/" + teacherID,
			cache : false,
			data : formData
		});
	});
</script>