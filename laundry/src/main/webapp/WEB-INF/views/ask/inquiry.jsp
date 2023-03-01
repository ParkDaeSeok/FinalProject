<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   
<style>

  .inquiry_container{
    margin: 3rem;
  }

  .inquiry_container legend{
    padding: 1rem 0;
    font-weight: bold;
  }

  .inquiry_container form{
    width: 50%;
    margin: auto;
  }

  .inquiry_container form select{

    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    background-color: #fff;
    transition: border-color .15s
  }
  .inquiry_container form label{
    font-weight: bold;
  }
  #inq_btn_container{
    text-align: center;
    margin: 1.2rem;
    margin-top: 2rem;
  }

  #inq_btn_container button{
    width: 100px;
  }

 

</style>

</head>
<body>
    <c:when test="${!empty loginUser }">
    	
    </c:when>
    <div class="inquiry_container">
      <form action="inq.do" method="post" enctype="multipart/form-data" onsubmit="wpcnf();">
        <fieldset >
          <legend>문의 및 신고</legend>
          <div class="mb-3">
            <label for="inq_type" class="form-label" style="padding-right: 1rem;">문의유형</label>
            <select name="inqtype" class="form-select" aria-label="Default select example">
              <option value="서비스">서비스</option>
              <option value="계정관리">계정관리</option>
              <option value="구독">구독</option>
              <option value="결제/환불">결제/환불</option>
              <option value="기타">기타</option>
              <option value="신고">신고</option>
           </select>
     
          </div>

        
          <div class="mb-3">
            <label for="inq_title" class="form-label">문의 제목</label>
            <input type="text" class="form-control" name="inqtitle" aria-describedby="emailHelp">
     
          </div>
          <div class="mb-3 form-floating">
            <label for="inq_content">문의 내용</label>
            <textarea class="form-control" placeholder="내용을 입력해주세요" name="inqcontent" rows="20" cols="50" style="resize:none;"></textarea>
           
          </div>
          
          <div class="mb-3">
            <label for="inq_attac" class="form-label">첨부 파일</label>
            <input type="file" name="upfile" accept=".jpg, .png, .gif" />
          </div>
          
          <div class="mb-3" id="inq_btn_container">
          <button type="submit">제출</button>
          
          
        </div>
        </fieldset>
      </form>

    </div>
</body>
</html>