<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>게시판 수정</title>
<%
    String board_seq = request.getParameter("board_seq");
%>
<c:set var="board_seq" value="<%=board_seq %>"/>
<script>
$(document).ready(function(){        
    getBoardDetail();        
});

/* 게시판 - 목록 페이지 이동 */
function goBoardList(){                
    location.href = "./board/list.jsp";
}

/* 게시판 - 상세 조회  */
function getBoardDetail(boardSeq){
    
    var boardSeq = $("#board_seq").val();

    if(boardSeq != ""){
        
        $.ajax({    
            
            url     : "/board/getBoardDetail",
            data    : $("#boardForm").serialize(),
            dataType: "JSON",
            cache   : false,
            async   : true,
            type    : "POST",    
            success : function(obj) {
                       getBoardDetailCallback(obj);                
                      },           
            error   : function(xhr, status, error) {}
            
         });
        
    } else {
        alert("오류가 발생했습니다.");
    }    
}


/** 게시판 - 수정  */
function updateBoard(){

    var boardSubject = $("#board_subject").val();
    var boardContent = $("#board_content").val();
        
    if (boardSubject == ""){            
        alert("제목을 입력해주세요.");
        $("#board_subject").focus();
        return;
    }
    
    if (boardContent == ""){            
        alert("내용을 입력해주세요.");
        $("#board_content").focus();
        return;
    }
    
    var yn = confirm("게시글을 수정하시겠습니까?");        
    if(yn){
            
        var filesChk = $("input[name='files[0]']").val();
        if(filesChk == ""){
            $("input[name='files[0]']").remove();
        }
        
        $("#boardForm").ajaxForm({
        
            url        : "./board/writeUpdateForm",
            enctype    : "multipart/form-data",
            cache   : false,
            async   : true,
            type    : "POST",                         
            success : function(obj) {
                updateBoardCallback(obj);                
            },           
            error     : function(xhr, status, error) {}
            
        }).submit();
    }
}


/** 게시판 - 수정 콜백 함수 */
function updateBoardCallback(obj){

    if(obj != null){        
        
        var result = obj.result;
        
        if(result == "SUCCESS"){                
            alert("게시글 수정을 성공하였습니다.");                
            goBoardList();                 
        } else {                
            alert("게시글 수정을 실패하였습니다.");    
            return;
        }
    }
}

/** 게시판 - 삭제할 첨부파일 정보 */
function setDeleteFile(boardSeq, fileSeq){
    
    var deleteFile = boardSeq + "!" + fileSeq;        
    $("#delete_file").val(deleteFile);
            
    var fileStr = "<input type='file' id='files[0]' name='files[0]' value=''>";        
    $("#file_td").html(fileStr);        
}
</script>
</head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
   <div class="container">
      <h1 class="display-3">게시판 수정</h1>
   </div>
</div>
<div class="container">
   <form name="newWrite" action="./BoardWriteAction.do"
      class="form-horizontal" 
      method="post" 
      enctype="multipart/form-data" 
      onsubmit="return checkForm()">
      <input name="id" type="hidden" class="form-control" value="${sessionId}">
      <div class="form-group row">
        <label class="col-sm-2 control-label">성명</label>
        <div class="col-sm-3">
              <%-- ${}의 속성값은 자동 형변환처리 및 null 처리, String 인 경우 빈 문자열("")로 처리 --%>
           <input name="name" class="form-control" value="${name}" placeholder="${name}" readonly>
        </div>
      </div>
      
      <div class="form-group row">
        <label class="col-sm-2 control-label">제목</label>
        <div class="col-sm-5">
           <input name="subject" class="form-control" placeholder="subject">
        </div>
      </div>
      
      <div class="form-group row">
        <label class="col-sm-2 control-label">내용</label>
        <div class="col-sm-8">
           <textarea rows="5" cols="50" class="form-control" placeholder="content" name="content"></textarea>
        </div>
      </div>
   
     <div class="form-group row">
        <div class="col-sm-offset-2 col-sm-10">
           <input type="submit" class="btn btn-success" value="등록">
           <input type="reset" class="btn btn-primary" value="취소">
        </div>
      </div>
      
     <div class="form-group row">
      <label class="col-sm-2">이미지</label>
       <div class="col-sm-5">
         <img style="width: 500px;" id="preview-image" >
         <input type="file" name="attachFile" class="form-control" id="input-image">
       </div>
   </div>
   </form>
</div>
<script>
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {readImage(e.target)})
</script>
<jsp:include page="../footer.jsp"/>
</body>
</html>