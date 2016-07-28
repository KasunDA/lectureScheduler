<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-md-6 col-md-offset-3">
<form action="/teacher" class="form-horizontal">
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
				<select name="lecture" id="lecutre" class="form-control">
					<option>HTML</option>
					<option>JAVA</option>
					<option>PHP</option>
					<option>Android</option>
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

<table class="table table-striped">
	<thead>
		<tr>
			<th>강사 번호</th>
			<th>강사 이름</th>
			<th>이 메 일 </th>
			<th>과 목 명 </th>
		</tr>			
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td>Sara</td>
			<td>sara@gmail.com</td>
			<td>HTML</td>
		</tr>
		<tr>
			<td>2</td>
			<td>Miky</td>
			<td>miky@yahoo.co.jp</td>
			<td>JAVA</td>
		</tr>
		<tr>
			<td>3</td>
			<td>Bobby</td>
			<td>bobby@gmail.com</td>
			<td>PHP</td>
		</tr>
	</tbody>
</table>
