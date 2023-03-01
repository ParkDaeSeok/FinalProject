<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/util.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <style>
        
           html, body{
            height: 100%;
           }
            #restable {
                text-align: center;
            }
			.myReserve{
			 margin: 3rem auto;
			}
			.myReserve h4{
			 text-align: center;
			 margin-bottom: 2rem;
			 font-weight: bold;
			}
			
			#selectSearch{
			padding: 0.2rem 0;
			}
			
			.reserveTable tr{
			cursor: pointer;
			}

        </style>
        </head>
    <body>
        <jsp:include page="../common/manubar.jsp"></jsp:include>
        <div class="outer">
            <jsp:include page="common/sideMenuBar.jsp"></jsp:include>
            <div class="myReserve">
                <h4>나의 예약 내역</h4>
                <div id="selectSearch">
                    <select name="service" onchange="if(this.value) location.href=(this.value);">
                        <option value="${ pageContext.request.contextPath }/myPage/reserveList.do?currentPage=1">서비스선택</option>
                        <option value="${ pageContext.request.contextPath }/myPage/reserveList.do?currentPage=1">전체</option>
                        <option value="${ pageContext.request.contextPath }/myPage/reserveList.do?&resType=세탁&currentPage=1">세탁</option>
                        <option value="${ pageContext.request.contextPath }/myPage/reserveList.do?&resType=수선&currentPage=1">수선</option>
                    </select>
                </div>
                <div class="reserveTable">
                    <table class="table table-striped" id="restable">
                        <thead>
                            <th>예약번호</th>
                            <th>예약날짜</th>
                            <th>서비스유형</th>
                            <th>수거날짜</th>
                            <th>도착예정날짜</th>
                            <th>세탁/수선 상태</th>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${ empty list }">
                                    <tr>
                                        <td colspan="6">조회 결과가 없습니다.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="r" items="${ list }">
                                        <tr>
                                            <td>${ r.resNum }</td>
                                            <fmt:parseDate value="${r.resDate }" var="resdate" pattern="yyyy-MM-dd"/> 
                                            <td> <fmt:formatDate value="${resdate }" type="date" dateStyle="long"/></td>
                                            <td>${ r.resType }</td>
                                            <fmt:parseDate value="${r.pickupDate }" var="pickupdate" pattern="yyyy-MM-dd"/> 
                                            <td><fmt:formatDate value="${pickupdate }" type="date" dateStyle="long"/></td>
                                            <fmt:parseDate value="${r.delDate }" var="deldate" pattern="yyyy-MM-dd"/> 
                                            <td><fmt:formatDate value="${deldate }" type="date" dateStyle="long"/></td>
                                            <td>
                                            	<c:choose>
                                            		<c:when test="${ r.resStatus == 'N' }">미완료</c:when>
                                            		<c:otherwise>완료</c:otherwise>
                                            	</c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>

                    <div align="center" class="paging-area">
                        <!-- 페이징바에서 < 를 담당 : 이전페이지로 이동 -->
                        <c:if test="${pi.startPage != 1 }">
                            <button onclick="location.href='${ pageContext.request.contextPath }/myPage/reserveList.do?currentPage=${ pi.currentPage - 1 }'">
                                &lt;
                            </button>
                        </c:if>
            
                        <!-- 페이징바에서 숫자를 담당 -->
                        <c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
                            <!-- 버튼이 눌렸을 때 해당 페이지로 이동하게끔 -->
                            <c:choose>
                                <c:when test="${i != currentPage}">
                                    <button onclick="location.href='${ pageContext.request.contextPath }/myPage/reserveList.do?currentPage=${ i }'">
                                        ${ i }
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 막고싶다. -->
                                    <button disabled>${ i }</button>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
            
                        <!-- 페이징바에서 > 를 담당 : 다음페이지로 이동 -->
                        <c:if test="${pi.currentPage != pi.maxPage }">
                            <button onclick="location.href='${ pageContext.request.contextPath }/myPage/reserveList.do?currentPage=${ pi.currentPage + 1 }'">
                                &gt;
                            </button>
                        </c:if>
                    </div>


                    <script>
                        $(function() {
                            $("table tr").click(function() {
                                
                                var rno = $(this).children().eq(0).text();
                                
                                location.href="${ pageContext.request.contextPath }/myPage/resListDetail.do?resNum=" + rno;
                                
                            });
                        });
                    </script>
                </div>
            </div>
            
        </div>
    </body>
</html>