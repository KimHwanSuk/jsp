<%@page import="kr.or.ddit.paging.model.PageVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.ZoneOffset"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="kr.or.ddit.user.model.UserVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>사용자리스트</title>

<!-- css, js -->
<%@include file="/common/basicLib.jsp" %>

</head>

<body>


	<!-- header -->
	<%@include file="/common/header.jsp" %>
	
	<div class="container-fluid">

		<div class="row">

			<!-- left -->
			<%@include file="/common/left.jsp" %>
			
			
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


			<div class="row">
					<div class="col-sm-8 blog-main">
						<h2 class="sub-header">사용자</h2>
						<div class="table-responsive">
							<table class="table table-striped">
								<tr>
									<th>사용자 아이디</th>
									<th>사용자 이름</th>
									<th>사용자 별명</th>
									<th>등록일시</th>
								</tr>
							
								<%
									Map<String,Object> resultMap = (Map<String,Object>)request.getAttribute("userPage");
									
									List<UserVO> userList = (List<UserVO>)resultMap.get("userList");
								
									for(int i=0; i < userList.size(); i++){	
										UserVO tmp = userList.get(i);
									%>
										<tr>
											<td><%=tmp.getName() %></td>										
											<td><%=tmp.getUserId() %></td>										
											<td><%=tmp.getAlias() %></td>
											<td><%=LocalDate.now() %></td>										
										</tr>
								<% } %>

							</table>
						</div>

						<a class="btn btn-default pull-right">사용자 등록</a>

						<div class="text-center">
							<ul class="pagination" >
								<%
									PageVO pageVO = (PageVO)request.getAttribute("pageVO");
									if(pageVO.getPage() == 1){ %>
										<li class="previous disabled">
											<span>«</span>
										</li>
									<%
									}else{%>
										<li class="previous">
											<a href="<%=request.getContextPath() %>/userPagingList?page=<%=pageVO.getPage()-1 %>&pageSize=<%=pageVO.getPageSize() %>">«</a>
										</li>
								  <%} %>
								<% 
// 									int pageSize = Integer.parseInt( request.getAttribute("pageSize").toString() );	
								
									int usersCnt = (Integer)resultMap.get("usersCnt");
									
									int pageLength = (Integer)resultMap.get("paginationSize");
									/* int pageLength = 0;
									if(usersCnt % pageSize ==0){
										pageLength = usersCnt / pageSize;
									} else{
										pageLength = usersCnt / pageSize + 1;
									} */
// 									PageVO pageVO = (PageVO)request.getAttribute("pageVO");
									
									for(int i=1; i <= pageLength; i++){%>
										<% if( pageVO.getPage() == i ) {%>
												<li class = "active">
													<span><%=i %></span>
												</li>
										<% 		continue; 
											} %>
											
										<li><a href="<%=request.getContextPath() %>
										/userPagingList?page=<%=i %>&pageSize=<%=pageVO.getPageSize() %>"><%=i %></a></li>
								<% 	} %>
								
								<% if(pageVO.getPage() == pageLength){%>
									<li class="next disabled">
										<span>»</span>
									</li>	
								 <%} else{%>
								 	<li class="next">
								 		<a href="<%=request.getContextPath() %>/userPagingList?page=<%=pageVO.getPage() +1 %>&pageSize=<%=pageVO.getPageSize() %>">»</a>
								 	</li>
								 <%} %>		
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>