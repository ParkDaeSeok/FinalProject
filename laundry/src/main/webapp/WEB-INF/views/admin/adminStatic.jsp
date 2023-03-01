<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ include file="../common/util.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

	<style>
		.sta-admin{
			width: 95%;
		margin-bottom: 5rem;
		position: relative;
		}
		
		#dashboard{
	    float: right;
    position: absolute;
   		 top: 0;
 	   right: 2rem;
	}
	  .static-manage {
        margin: auto;
        margin-top: 50px;
        padding: 1.5rem;
      }

      #toTop {
        width: 50px;
        height: 50px;
        background: #423bad;
        text-align: center;
        border-radius: 50px;
        color: white;
        font-weight: bold;
        position: fixed;
        z-index: 100;
        top: 20rem;
        right: 1rem;
        line-height: 50px;
        cursor: pointer;
      }
      #toTop:hover {
        background-color: #302b7a;
      }
		
	</style>


</head>
<body>

    <%@ include file="../common/manubar.jsp" %>

<div class="sta-admin static-manage" >
		<div id="staticHome">
		<h1 align="center" style="font-weight:bold; maring:3rem">관리자모드 통계관리</h1>
		</div>
	<br><br><br>
			<a href="${pageContext.request.contextPath}/admin/adminDash.do" id="dashboard" class="btn btn-danger" style="float:right;">대시보드</a>
		
	 
	<br><br><br><br>
	
	
	<h3 id="member">총 회원수 : ${result } 명</h3>
	
	<br/><br><br><br><br>
	
	
	<h3 id="review">총 후기수 : ${resultReview } 건</h3>
	
	<br/><br><br><br><br>
	
	
	<h3 id="ask">총 문의수 : ${resultAsk }</h3> 
	
	<br/><br><br><br><br>
	
	<h3 id="subscribe">총 구독자 수 : ${resultSubscribe } 명 </h3> 
	
	<br/><br><br><br><br>
	

	<h3 id="laundry">총 세탁 수 : ${resultLaundry }건 </h3>
	
	<br/><br><br><br><br>
	
	
	<h3 id="repair">총 수선 수 : ${resultRepair }건 </h3>
	
	<br/><br><br><br><br>
	
	<h3 id="monthSubscribe">월별 구독자 수</h3>
	 <div id="chart_div" style="width:900px; height: 500px"></div>
	 
	 <script>
     	// totalList = 2차원 배열 형태로 가공한거 (list 로부터 뽑아낸거)
	 	var totalList = new Array(new Array(), new Array());
	 	totalList[0][0] = "월"; // x축
	 	totalList[0][1] = "구독자 수"; // y축
	 	
	 	var index = 0; // 전역변수로 배열의 index 초기값 설정
	 </script>
	 
	<c:if test="${ !empty list }">
		<c:forEach var="m" items="${list }">
		<!-- 
			varStatus : 반복문 안에서 사용하고싶은 변수 
			변수명.count = 해당 변수값이 1부터 시작하여 반복 한번 돌릴때마다 1씩 증가
			변수명.index = 해당 변수값이 0부터 시작하여 반복 한번 돌릴때마다 1씩 증가
			=> JSTL 이라서 script 태그 안에서는 안먹힘
		-->
			<script>
				// 반복 한번 돌릴때마다 값을 다 뽑아서 totalList 로 가공
				index++; // 반복 한번 돌때마다 index 1씩 증가!
				var month = "${m.MONTH}월"; // 문자열 타입으로 바꿨더니 됨!
				var count = ${m.COUNT};
				totalList[index] = [month, count];
				
			</script>
		</c:forEach>
	</c:if>
	 
    <script type="text/javascript">
    
    console.log(totalList);
    
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
    	  
        // Some raw data (not necessarily accurate)
        // 구글 그래프 API 에서 원하는 데이터 : 그림은 그려줄테니까 적어도 자바스크립트 타입의 2차원 배열을 넘겨줘 
        // totalList = 2차원 배열 형태로 가공한거 (list 로부터 뽑아낸거)
        var data = google.visualization.arrayToDataTable(totalList);

        var options = {
          title : '월별 구독자 수',
          vAxis: {title: '명'},
          hAxis: {title: '월'},
          seriesType: 'bars',
          series: {1: {type: 'line'}}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    
    <a href="#top"><div id="toTop">TOP</div></a>
    
       <jsp:include page="../common/footer.jsp"></jsp:include>
    </div>
</body>
</html>