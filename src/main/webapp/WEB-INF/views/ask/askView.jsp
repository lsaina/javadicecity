<%@page import="com.herejava.ask.vo.AskComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.herejava.ask.vo.Ask"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Ask a = (Ask)request.getAttribute("a");
    	ArrayList<AskComment> commentList = (ArrayList<AskComment>)request.getAttribute("commentList");
		ArrayList<AskComment> reCommentList = (ArrayList<AskComment>)request.getAttribute("reCommentList");
		int askNo = (int)request.getAttribute("askNo");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		#noticeEview td, #noticeEview th{
			border: 1px solid #A7A7A7;
		}
		#noticeView th, #noticeView td{
			border: 1px solid #A7A7A7;
		}
		.tbl{
			border-radius: 10px;
		}
		#noticeContent{
			min-height: 400px;
			text-align: left;
			font-family: ns-light;
		}
		.page1-content{
		width: 900px;
		margin: 0 auto;
		overflow: hidden;
		margin-bottom: 40px;
		flex-grow: 1;
		}
		.page1-title{
		font-family: ns-bold;
   	    padding: 10px 0px;
    	font-size: 1.2rem;
    	border-bottom: solid 1px #A7A7A7;
		}
		.nc_title{
			font-family: ns-light;
			text-align: left;
			font-size: 20px;
			 width: 700px;
		}
		.home {
			width:90px;
			height: 40px;
			border-radius: 5px;
			margin-left: 720px;
		}
		.tbl>.tr-1,.tr-2{
			border-radius: 10px;
		}
		.page1-title>.btn{
			font-size: 14px;
			text-align: center;
			line-height: 10px;
		}
		.tbl>tr>.nc_title {
			text-align: left;
		}
		.eTitle{
			width: 100px;
			background-color: rgb(245, 245, 245);
			line-height: 30px;
		}
		.file{
			width: 100px;
			background-color: rgb(245, 245, 245);
		}
		.tr-2>.nc_title{
			text-align: left;
		}
		
		.bss6 {
			margin: 0 auto;
			margin-top: 30px;
		}
		
		.inputRecommentBox{
			margin: 30px 0px;
			display: none;
		}
		.inputRecommentBox>form>ul{
			list-style-type: none;
			display: flex;
		}
		.inputRecommentBox>form>ul>li:first-child{
			width: 15%;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		.inputRecommentBox>form>ul>li:first-child>span{
			font-size: 50px;
			color: #ccc;
		}
		.inputRecommentBox>form>ul>li:nth-child(2) {
			width: 70%;
			margin-top: 25px;
		}
		.inputRecommentBox>form>ul>li:nth-child(2)>textarea.input-form{
			height: 100px;
			min-height: 96px;
		}
		.inputRecomentBox>form>ul>li:last-child{
			width:10%;
		}
		
		
		
	</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
		<div class="page1-content">
		<div class="belt">NOTICE</div>
		<br>
		<%@include file="/WEB-INF/views/common/notice_submenu.jsp" %>
		<br>
		<br>
		<Br>
		<br>
		<div class="page1-title">????????????
			<button class="btn bc1 home" onclick="location.href ='askList.do?reqPage=1'">????????????</button> 
		</div>
		<br>
		<br>
		<table class="tbl" id="noticeView">
			<tr class="tr-2">
				<th class="nc_title"><%=a.getAskTitle() %></th>
				<th><%=a.getAskEnrollDate() %></th>
			</tr>
			<tr class="tr-1">
				<td colspan="2">
					<div id="noticeContent"><%=a.getAskContentBr() %></div>
				</td>
			</tr>
			 
		</table>
		<span style="line-height:80%"></span>
		<table class="tbl" id="noticeView" style="line-height:140%">
			<tr class="tr-1">
				<th class="td-3 file">????????????</th>
				<td colspan="5">
					<%if(a.getFilepath1() != null) {%>
						<a href="/fileDown.do?askNo=<%=a.getFilepath1() %>"><%=a.getFilepath1() %></a>
					<%} %>
				</td>
				<!--
				<td colspan="5">
					<%if(a.getFilepath2() != null) {%>
						<a href="/fileDown.do?noticeNo=<%=a.getFilepath2() %>"><%=a.getFilepath2() %></a>
					<%} %>
				</td>
				<td colspan="5">
					<%if(a.getFilepath3() != null) {%>
						<a href="/fileDown.do?noticeNo=<%=a.getFilepath3() %>"><%=a.getFilepath3() %></a>
					<%} %>
				</td>  -->
			</tr>
		</table>
		<%if(m != null && m.getMemberNo() == a.getMemberNo()) {%>
		<table class="tbl" id="noticeView">
			<tr class="tr-1">
			</tr>
			</table>
			<table class="bss6">
				<tr>
					<td>
						<a class="btn bc1 bs6" href="/askUpdateFrm.do?askNo=<%=a.getAskNo() %>">??????</a>
						<button class="btn bc1 bs6" onclick="askDelete('<%=a.getAskNo() %>');">??????</button>
					</td>
				</tr>
			</table>
		<%} %>
		
			
		<span style="line-height:150%;">
		<br>
		</span>
		
		<%if(m!=null && m.getMemberLevel() == 0) {%>
		<div class="inputCommentBox">
			<form action="/insertCommentAsk.do" method="post">
				<ul class="ask-comment-write">
					<li>
						<span class="material-icons">account_circle</span>
						<input type="hidden" name="askCommentWriter" value="<%=m.getMemberNick() %>">
						<input type="hidden" name="askRef"	value="<%=a.getAskNo() %>">
						<input type="hidden" name="askCommentRef" value="0">
					</li>
					<li>
						<textarea class="input-form1" name="askCommentContent" placeholder="????????? ??????????????????."></textarea>
					</li>
					<li>
						<button type="submit" class="bc2">??????</button>
					</li>
				</ul>
			</form>
		</div>
		<%} 	%>
		
		<div class="commentBox">
			<%for(AskComment ac : commentList) {%>
				<table class="ask-comment" style="width:100%;">
					<tr class="comment-info">
						<td><i class="fa-solid fa-square-h"></i> <span><%=ac.getAskCommentWriter() %> </span></td>
						<td><%=ac.getAskCommentEnrollDate() %></td>
					</tr>
					<tr class="comment-content">
						<td colspan="2">
							<p><%=ac.getAskCommentContent() %>
							<textarea name="askCommentContent" class="input-form" style="display:none;min-height:90px;"><%=ac.getAskCommentContent() %></textarea></p>
						</td>
					</tr>
					
					
					
					
					
						<tr class="comment-link">
							<td colspan="2">
							<%if(m != null) {%>
								<%if(m.getMemberLevel() == 0){%>
									<a href="javascript:void(0)" onclick="deleteComment(this,'<%=ac.getAskCommentNo()%>','<%=a.getAskNo()%>')">??????</a>
								<%} %>
							<%} //?????? ?????? ?????? ????????? ?????? %>
							
							
							
							
							
							
							
							
							
							</td>
						</tr> 
				</table>
			<!-- 
				<%for(AskComment acc : reCommentList){ %>
					<%if(acc.getAskRef() == ac.getAskCommentNo()) {%>
						<ul class="posting-comment reply">
							<li>
								<span class="material-icons">subdirectory_arrow_right</span>
								<span class="material-icons">account_circle</span>
							</li>
							<li>
								<p class="comment-info">
									<span><%=acc.getAskCommentWriter() %></span>
									<span><%=acc.getAskCommentEnrollDate() %></span>
								</p>
								<p class="comment-content"><%=acc.getAskCommentContent() %></p>
								<textarea name="askcommentContent" class="input-form" style="display:none;min-height:90px;"><%=acc.getAskCommentContent() %></textarea>
								<p class="comment-link">
									<%if(m!=null) {%>
										<%if(m.getMemberId().equals(acc.getAskCommentWriter())) {%>
											<a href="javascript:void(0)" onclick="modifyComment(this,'<%=acc.getAskCommentNo()%>','<%=a.getAskNo()%>')">??????</a>
											<a href="javascript:void(0)" onclick="deleteComment(this,'<%=acc.getAskCommentNo()%>','<%=a.getAskNo()%>')">??????</a>
										<%} %>
									<%} %>
								</p>
							</li>
						</ul>
					<%} //?????? ????????? ???????????????%>
				<%} //????????? ????????? for??? ??????%>
				<%if(m != null) {%>
					<div class="inputRecommentBox">
					<form action="/insertComment.do" method="post">
						<ul class="ask-comment-write">
							<li>
								<span class="material-icons">subdirectory_arrow_right</span>
							</li>
							<li>
								<input type="hidden" name="askWriter" value="<%=m.getMemberNick() %>">
								<input type="hidden" name="askRef" value="<%=a.getAskNo() %>">
								<input type="hidden" name="askCommentRef" value="<%=ac.getAskCommentNo()%>"> 
								<textarea class="input-form" name="askContent" placeholder="????????? ??????????????????."></textarea>
							</li>
							<li>
								<button type="submit" class="bc2">??????</button>
							</li>
						</ul>
					</form>
					</div>
				<%} //????????? ?????? form ?????? ??????%>  -->
			<%} //?????? ????????? for??? ?????? %>
		</div>
		
	<script>
		function askDelete(askNo) {
			if(confirm("?????????????????????????")){
				location.href="/askDelete.do?askNo="+askNo;
			}
		}
		$(".recShow").on("click",function(){
			const idx = $(".recShow").index(this);
			if($(this).text() == "????????????") {
				$(this).text("??????");
			}else{
				$(this).text("????????????");
			}
			$(".inputRecommentBox").eq(idx).toggle();
			$(".inputRecommentBox").eq(idx).find("textarea").focus();
		});
		function modifyComment(obj,askCommentNo,askNo){
			$(obj).parent().prev().prev().show(); //textarea??? ????????? ?????? ???
			$(obj).parent().prev().prev().hide(); //?????? ????????? ???????????? ??????
			//?????? -> ?????? ??????
			$(obj).text("????????????");
			$(obj).attr("onclick","modifyComplete(this,'"+askCommentNo+"','"+askNo+"')");
			//?????? -> ?????? ??????
			$(obj).next().text("????????????");
			$(obj).next().attr("onclick","modifyCancel(this,'"+askCommentNo+"','"+askNo+"')");
			//?????? ?????? ?????? ??????
			$(obj).next().next().hide();
		}
		function modifyCancel(obj,askCommentNo,askNo){
			$(obj).parent().prev().hide();		//textarea ??????
			$(obj).parent().prev().prev().show();	//?????? ?????? ?????? ???
			//?????? ?????? -> ??????
			$(obj).prev().text("??????");
			$(obj).prev().attr("onclick","modifyComment(this,'"+askCommentNo+"','"+askNo+"')");
			//?????? ?????? -> ??????
			$(obj).text("??????");
			$(obj).attr("onclick","deleteComment(this,'"+askCommentNo+"','"+askNo+"')");
			//?????? ?????? ?????? ?????? ???
			$(obj).next().show();
		}
		function modifyComplete(obj,askCommentNo,askNo){
			//form ?????? ??????
			const form = $("<form action='/askCommentUpdate.do' method='post'></form>");
			//form ?????? ???????????? input ?????? ??????(ncNo)
			form.append($("<input type='text' name='askCommentNo' value='"+askNo+"'>"));
			//form?????? ???????????? input?????? ??????(noticeNo)
			form.append($("<input type='text' name=askNo' value='"+askNo+"'>"));
			//form?????? ???????????? ????????? ?????? ????????? ???????????? textarea??? ??????
			form.append($(obj).parent().prev());
			//????????? form????????? html ???????????? ??????
			$("body").append(form);
			//form?????? submit
			form.submit();
		}
		function deleteComment(obj,askCommentNo,askNo){
			if(confirm("????????? ?????????????????????????")){
				$.ajax({
					url: "/deleteAskComment.do",
					type: "get",
					data: {askNo:askNo, askCommentNo:askCommentNo},
					success: function(data){
						if(data == "1"){
							const title = "????????? ??????????????????.";
							const icon = "success";
							toastShow(title,icon);
							setTimeout(function(){
								location.href="/askView.do?askNo="+askNo;
							},1000)
						}else if(data == "0"){
							const title = "????????? ??????????????????.";
							const icon = "error";
							toastShow(title,icon);
						}
						   
					},
				})
			}
		}
	//????????? ?????? ??????		
		function toastShow(title, icon){
			const Toast = Swal.mixin({
		    toast: true,
		    position: 'center-center',
		    showConfirmButton: false,
		    timer: 1500,
		    timerProgressBar: true,
		    didOpen: (toast) => {
		     // toast.addEventListener('mouseenter', Swal.stopTimer)
		      toast.addEventListener('mouseleave', Swal.resumeTimer)
		    }
		 	})
		
		  Toast.fire({
		    title: title,
		    icon: icon
		  })
		}//????????? ???
		
		
		function home(){
			history.back();
		}
		</script>
		</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>