/**
 *  강사 등록에 대한 유효성 검사
 */
// 이름 정규표현식 ( 한글, 한국만 )
$.validator.addMethod("nameChk", function(value, element){
	return this.optional(element) ||  /^[가-힣]{2,20}$/.test(value);
});


// 이메일 정규표현식
$.validator.addMethod("emailRegChk", function(value, element){
	return this.optional(element) || /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i.test(value);
});

// 이메일 중복 검사
var chkResult = true;
$.validator.addMethod(
		"uniqueMail",
		function(value, element){
			var eMail = $('#eMail').val();
			$.ajax({
				type : "GET",
				url : "/teacher/chkMail",
				cache : false,
				data : "eMail=" + eMail,
				success : function(data){
					chkResult = (data == 0) ? true : false;
				}
			});
			return chkResult;
		}
);

// 모달창 이메일 중복 검사
var isUsedMail = true;
$.validator.addMethod(
		"modal_uniqueMail",
		function(value, element){
			var teacherID = $('#modalTeacherID').val();
			var eMail = $('#modalEmail').val();
			$.ajax({
				type : "POST",
				url : "/teacher/chkMail",
				cache : false,
				data : "teacherID=" + teacherID + "&eMail=" + eMail,
				success : function(data){
					isUsedMail = (data == "true") ? true : false;
				}
			});
			return isUsedMail;
		}
);


// 등록Form에 대한 유효성 검사
	$('#addForm').validate({
		debug : false,
		rules : {
			teacherName : {
				required : true,
				rangelength : [2, 20],
				nameChk : true
			},
			eMail : {
				required : true,
				emailRegChk : true,
				uniqueMail : true,
				rangelength : [5, 30]
			}
		},
		messages : {
			teacherName : {
				required : "필수 입력 항목입니다",
				nameChk : "올바른 이름을 넣어주세요",
				rangelength : "이름은 최소 {0} 글자 이상 {1}글자 이하로 넣어주세요"
			},
			eMail : {
				required : "필수 입력 항목입니다",
				emailRegChk : "유효한 이메일 형식을 넣어주세요",
				uniqueMail : "이미 존재하는 이메일입니다",
			}
		}
	});
	
/*
 *  강사정보 편집 Modal창 유효성 검사
 */
	$('#teacherInfoForm').validate({
		debug : false,
		rules : {
			teacherName : {
				required : true,
				rangelength : [2, 20],
				nameChk : true
			},
			eMail : {
				required : true,
				emailRegChk : true,
				rangelength : [5, 30],
				modal_uniqueMail : true
			}
		},
		messages : {
			teacherName : {
				required : "필수 입력 항목입니다",
				nameChk : "올바른 이름을 넣어주세요",
				rangelength : "이름은 최소 {0} 글자 이상 {1}글자 이하로 넣어주세요"
			},
			eMail : {
				required : "필수 입력 항목입니다",
				emailRegChk : "유효한 이메일 형식을 넣어주세요",
				modal_uniqueMail : "이미 존재하는 이메일입니다"
			}
		}
               
	});
	
	
	
	

/*
 * 삭제예정 Ajax 버튼
 */
// 이메일 중복 검사
$('#eMailChk').click(function(){
	var eMail = $('#eMail').val();
	if(eMail == ""){
		alert("이메일을 입력해 주세요");
	}else{
		$.ajax({
			type : "GET",
			url : "/teacher/chkMail",
			cache : false,
			data : "eMail=" + eMail,
			success : function(data){
				if(data > 0){
					alert("사용할 수 없는 이메일입니다.");
				}else{
					alert("사용 가능한 이메일입니다");
				}
			}
		});
	}
});
