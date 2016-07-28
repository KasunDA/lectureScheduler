<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h1> createSchedule.jsp</h1>


<button type="button" class="btn btn-primary">등록하기</button>

<button class="btn btn-default" data-target="#layerpop" data-toggle="modal">모달출력버튼</button><br/>
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title text-center">일정등록하기</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
      	<form action="/teacher" class="form-horizontal">
			<div class="form-group">
				<label for="lecutre" class="col-md-2 control-label"> 선생님 : </label>
					<div class="col-md-6">
						<select name="lecture" id="lecutre" class="form-control">
							<option>Sara</option>
							<option>Miky</option>
							<option>Bobby</option>
						</select>
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
		</form>
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">등록하기</button>
      </div>
    </div>
  </div>
</div>