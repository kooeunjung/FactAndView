<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="root" value="${pageContext.request.contextPath}" />
<security:authentication property="name" var="loginID"/>

<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

/*--------------------font--------------------------*/

@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);

.hanna{
	font-family: 'Hanna', serif;
}
.jeju{
	font-family: 'Jeju Gothic', serif;
}
.nanum{
	font-family: 'Nanum Myeongjo', serif;
}


/*--------------------common--------------------------*/
span.title {
	padding:4px;
	color: #839705;
	font-family: Microsoft YaHei, 'NSL';
	font-size: 15px;
}

time {
	color: #c1c1c1;
	font-size: 13px;
	font-family: Microsoft YaHei, 'NSL';
}

p {
	color: #6d6e71;
	font-size: 13px;
	font-family: Microsoft YaHei, "NS";
	margin-top: 5px;
	line-height: 1.5;
}

.head td:first-child {
	height: 15px;
}

#btn {
	float: right;
	background: #999999;
}

.btn {
	background: #3498db;
}

hr {
	border-bottom: 0;
	border-right: 0;
	border-top: 1px solid rgba(144, 135, 135, 0.59);
}

body {
	background-color: rgb(238, 238, 238);
}

body, html {
	font-family: 'Abel', sans-serif;
	color: #686868;
}

.alcaramel {
	background-color: #d3d3d3 !important;
}

.card-panel {
	transition: box-shadow .25s;
	padding: 20px;
	margin: 0.5rem 0 1rem 0;
	border-radius: 2px;
	background-color: #fff;
}

.card-panel {
	transition: box-shadow .25s;
	padding: 20px;
	margin: 0.5rem 0 1rem 0;
	border-radius: 2px;
	background-color: #bababa !important;
	min-height: 640px;
}

.detail-title {
	font-weight: 700;
	display: block;
	color: #6d6e71;
	font-size: 13px;
	font-family: Microsoft YaHei, "NS";
	margin-top: 5px;
	line-height: 1.5;
	/* text-transform: uppercase; */
}


i {
	line-height: inherit;
}

.opening-hours {
	margin: 0;
}

ul {
	padding: 0;
	list-style-type: none;
}

hr {
	border-bottom: 0;
	border-right: 0;
	border-top: 1px solid rgba(144, 135, 135, 0.59);
}

a {
	text-decoration: none;
}

h6 {
	font-size: 1rem;
	line-height: 110%;
	margin: 0.5rem 0 0.4rem 0;
}

h2 {
	margin-top: 10px;
	text-shadow: skyblue 0px 0px 0px 4px;
}

i {
	font-family: "Material-Design-Icons";
}

i.tiny {
	padding-top: 3px;
}

span.title {
	color: #606060;
	font-family: Microsoft;
}

time {
	margin-left: 17px;
}

.box_write {
	background-color: #f7f7f7;
	height: 98px;
	box-sizing: border-box;
	padding: 13px 18px;
	border: 1px solid #e6e6e6;
	display: flex;
	margin-top: 30px;
}

.box_write textarea {
	/*   width: 535px; */
	height: 71px;
	box-sizing: border-box;
	border: 1px solid #8c8c8c;
	resize: none;
	float: left;
	color: #c7c7c7;
	font-size: 16px;
	font-family: Microsoft YaHei, 'NSL';
	text-align: center;
	padding-top: 20px;
	color: #313131;
	overflow: auto;
}

.box_write button {
	/* display: block; */
	width: 123px;
	height: 71px;
	background-color: #3498db;
	border: none;
	color: #fff;
	font-size: 17px;
	font-family: Microsoft YaHei, 'NSL';
	float: right;
	line-height: 80px\0;
	margin-left: 10px;
}

.margin {
	margin-left: 3px;
}

.content-box {
	padding-top: 5px;
	padding-bottom: 10px;
	border: 1px solid rgba(144, 135, 135, 0.59);
	margin-top: 10px;
	margin-bottom: 10px;
}

.detail-title {
	font-weight: 700;
	display: block;
	/* text-transform: uppercase; */
}

#main {
	width: 100%;
	min-height: 500px;
	font-size: 14px;
	line-height: 1.5em;
	border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 3px;
	box-shadow: 1px 1px 5px #383838;
	background: #F6F4F1 !important;
}

/* ----------------------검색창 수정------------ */
.broker-expanding-search, .broker-expanding-search *,
	.broker-expanding-search *:after, .broker-expanding-search *:before {
	box-sizing: border-box;
}

.broker-expanding-search {
	display: table;
	table-layout: fixed;
	width: 50px;
	margin: 0;
	border-radius: 40px;
	overflow: hidden;
	background: #dd5d58;
	/* box-shadow: 0px 0px 0px 2px rgba(255,255,255,0.90); */
	transition: width 0.5s cubic-bezier(0.65, -0.5, 0.4, 1.5);
}

.broker-expanding-search--open {
	width: 250px;
}

.broker-expanding-search__column {
	display: table-cell;
	vertical-align: top;
}

.broker-expanding-search__column--left {
	width: 100%;
	padding-left: 15px;
}

.broker-expanding-search__column--right {
	width: 50px;
}

.broker-expanding-search__input {
	display: block;
	margin: 0;
	padding: 0;
	display: block;
	border: none;
	outline: none;
	color: white;
	border-radius: 0;
	background: none;
	font-size: 16px;
}

.broker-expanding-search__input--text {
	width: 100%;
	height: 50px;
	line-height: 50px;
}

.broker-expanding-search__input--submit {
	font-size: 0;
	width: 50px;
	height: 50px;
	cursor: pointer;
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 50px 50px;
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFQAAABUCAMAAAArteDzAAAB7FBMVEX////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////zN5IfAAAAo3RSTlMAAQIDBAUGBwgJCgsNDg8QERITFhcaGxweICIjJCUoKSorLC0uLzIzNjc4OTo7PD5AREVGSEpLTE5PUFFSU1RVVldYWl1eX2BjZGZoaWtsbW5vcHZ5fH6AgYKDhYqNjo+Vl5ucoaKjpqerrq+wsbW3ubzCw8TGx8jJysvMzc7P0NHT1NXW19na3ODi4+Xm6Onq6+zt7vDx8vP09vf4+fr7/P3+BP089AAAAiVJREFUGBntwflbTFEABuAvyVQixGTLlCVRdg0RDVKWlJAsSQoJKRXRoFJiVMzQYumSvn9U95yZVHP1POd0f/G47wuHw+FwOP5ZsZtKbz14/OTRvSqvG/ZwX/KPM2KoIS8W87bsWpAztedhnrx9jHZ7CeajbJxWXmyAvuv8i/4c6KrglPFBf1vPCKd88ECPlxGdFzYmA3Gr9taNMOzlYuhY0U8pWBKPiLS7DKuCjpuUujyYrsSgMLYZ6tZ+pdCxEjMdNyjUQ90NCu/dmO0chR8ZUJUUoFCAaE0UrkDVDgqtMYi2m4I/BoouUyiGBVcvTUMpUFRP0/c1sFJD08QWKGqlKZAIKycpeKGom6ZXC2BlJ4VCKOqjqQOWtlE4A0WdNPUshJV9FE5AUTNNoeWwcpHCLiiqpWkiC1YaaTLWQ9FpCtWwkDpC02ASFKX9pCmYgmjlFB5CVUwLhVpEcX+kUARlRZSKMYurmcJAMpQlvKUwlo8ZXHcoVUBDPqVflYvwR0YLpeeJ0NHAsPZDcZBWXx1mWAW0pLxjRHd18cHcI+fvf+aUUR+0ZIY4B6MAWrIHOYex/dCS1sY5fDkKLfGVo5ztWdkwJcMHPZ6aT5yuuyQBe4YpGT5oSj3bNEDhW2/dARcm5YQoGQXQtnTr4cJTx3LXxSEsO0TJ8ME+WQFKhhf2SQ9Q8sNG6QEKA7BTRpCmN7DV9iAnlcNemY2vn5bC4XA4HI7/3m/UtMhMrbR7mQAAAABJRU5ErkJggg==);
}

.searchbar1 input[type=text] {
	font-family: Verdana, Geneva, sans-serif;
	color: white;
	margin: 0 0 0 0;
}

.searchbar1 {
	position: fixed;
	bottom: 50px;
	right: 50px;
}

a.waves-effect.waves-light {
	/* position: absolute; */
	top: 9px;
	right: 7px;
}
/* ---------------------------------------------- */

/*Start site-list */
.list-item {
	min-height: 96px;
	padding-left: 22px;
	position: relative;
	left
}

.list-item:HOVER {
	background-color: #e0e0e0;
}

.list-item .index {
	top: 15px;
	position: absolute;
	font-size: 20px;
	color: rgba(0, 0, 0, 0.87);
}

.list-item .title {
	color: rgba(0, 0, 0, 0.87);
	font-size: 20px;
	font-weight: 400;
	margin-left: 30px;
	margin-right: 100px;
	max-width: 700px;
	overflow: hidden;
	padding-top: 10px;
	padding-bottom: 10px;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-align: left;
}

.list-item .title2 {
	color: rgba(0, 1, 0, 0.87);
	font-size: 15px;
	font-weight: 200;
	margin-left: 50px;
	margin-right: 100px;
	max-width: 700px;
	overflow: hidden;
	padding-top: 10px;
	padding-bottom: 10px;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.url-warpper {
	position: absolute;
	top: 0px;
	bottom: 0px;
	right: 70px;
}

.url {
	width: 100%
}

.collection-header h4 {
	font-size: 15px;
	line-height: 110%;
	margin: 1.14rem 0 0.912rem 0;
}

.best.collection.with-header .collection-header {
	padding: 0px 20px;
}

.best.collection.with-header .collection-item {
	padding-left: 0px;
}

.best.collection .collection-item {
	padding: 10px 0px;
}

.collection-item:hover .caption_box {
	bottom: 0px;
}

.collection-item .caption_box {
	position: absolute;
	display: block;
	bottom: -100px; /* 캡션을 안보이게 처리 */
	height: 70px;
	background: 7f7f7f;
	background: rgba(0, 0, 0, 0.5);
	width: 33.333%;
	color: #fff;
	font-size: 25px;
	padding-top: 20px;
}

.writer-warpper {
	position: absolute;
	right: 50px;
	top: 50%;
	height: 32px;
	margin: -30px 0;
	text-align: right;
}

.title-warpper {
	position: absolute;
	right: 200px;
	top: 50%;
	height: 32px;
	margin: -30px 0;
	text-align: left;
}

.url-warpper img {
	border: 0;
	height: 96px;
	width: 96px;
}

.like-warpper {
	/* position: absolute;
	top: 16px;
	right: 16px; */
	position: absolute;
	right: 5px;
	top: 60%;
	height: 50px;
	margin: -30px 0;
	text-align: right;
}

@media screen and (max-width: 640px) {
	.list-item .title {
		position: absolute;
		font-size: 16px;
		line-height: 10px;
		margin-left: 30px;
		margin-right: 0px;
		padding-top: 10px;
		white-space: normal;
		text-align: left;
		margin: -30px 0;
	}
	.writer-warpper {
		display: none;
		}
	.url-warpper {
		display: none;
	}
	.like-warpper {
		display: none;
	}
}

/*End site-list  */
#breadcrumb {
	list-style: none;
	display: inline-block;
}

#breadcrumb .icon {
	font-size: 14px;
}

#breadcrumb li {
	
}

#breadcrumb li a {
	color: #FFF;
	display: block;
	background: #3498db;
	text-decoration: none;
	position: relative;
	height: 40px;
	line-height: 40px;
	padding: 0 10px 0 5px;
	text-align: center;
	margin-right: 23px;
}

#breadcrumb li:nth-child(even) a {
	background-color: #2980b9;
}

#breadcrumb li:nth-child(even) a:before {
	border-color: #2980b9;
	border-left-color: transparent;
}

#breadcrumb li:nth-child(even) a:after {
	border-left-color: #2980b9;
}

#breadcrumb li:first-child a {
	padding-left: 15px;
	-moz-border-radius: 4px 0 0 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px 0 0 4px;
}

#breadcrumb li:first-child a:before {
	border: none;
}

#breadcrumb li:last-child a {
	padding-right: 15px;
	-moz-border-radius: 0 4px 4px 0;
	-webkit-border-radius: 0;
	border-radius: 0 4px 4px 0;
}

#breadcrumb li:last-child a:after {
	border: none;
}

#breadcrumb li a:before, #breadcrumb li a:after {
	content: "";
	position: absolute;
	top: 0;
	border: 0 solid #3498db;
	border-width: 20px 10px;
	width: 0;
	height: 0;
}

#breadcrumb li a:before {
	left: -20px;
	border-left-color: transparent;
}

#breadcrumb li a:after {
	left: 100%;
	border-color: transparent;
	border-left-color: #3498db;
}

#breadcrumb li a:hover {
	background-color: #1abc9c;
}

#breadcrumb li a:hover:before {
	border-color: #1abc9c;
	border-left-color: transparent;
}

#breadcrumb li a:hover:after {
	border-left-color: #1abc9c;
}

#breadcrumb li a:active {
	background-color: #16a085;
}

#breadcrumb li a:active:before {
	border-color: #16a085;
	border-left-color: transparent;
}

#breadcrumb li a:active:after {
	border-left-color: #16a085;
}
/* ------------------------------------------------------------- */

.collection .collection-item:not (.active ):hover {
	background-color: #ddd;
}

.site-list {
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.12);
}

.mvaside {
	display: flex;
	width: 100%;
}

.collection {
	border: none;
	margin: 0px;
	margin-right: 30px;
	border-bottom: 1px solid #e0e0e0;
}

.main-div {
	width: 100%;
}

.table {
	background-color: #fff;
}

.write {
	display: flex;
}

.site-button {
	margin-top: 10px;
	display: flex;
	justify-content: flex-end;
	font-family: 'Nanum Gothic Coding', serif;
}

#breadcrumb {
	display: flex;
}

.broker-expanding-search, .broker-expanding-search *,
	.broker-expanding-search *:after, .broker-expanding-search *:before {
	box-sizing: border-box;
}

.broker-expanding-search {
	display: table;
	table-layout: fixed;
	width: 50px;
	margin: 0;
	border-radius: 40px;
	overflow: hidden;
	transition: width 0.5s cubic-bezier(0.65, -0.5, 0.4, 1.5);
	background: #337ab7;
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0
		rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
}
.sitgo {
	width: 100%;
}
.sitgo i {
	margin-top: 10px;
	margin-right: 16px;
}

.sitego i:hover {
	border-radius: 3px;
	background-color: #337ab7;
	color: #fff;
}

.collection a.collection-item {
	width: 100%;
}

.collection .collection-item.avatar .circle {
	width: 46px;
	height: 66px;
}

</style>

<script>
$(document).ready(function(){                           
   $(".list-btn").on("click",function(){
      $('.back').prop('href', history.back());
   });
});
</script>
<!--------------------------------------------------- HTML ------------------------------------------------>
<main id="main">

<div class="container">
      <div class="section">
         <div class="row">
            
<!--//////////////////왼쪽에 보여주는 그림/////////////// -->
     
            
            <div class="col s12 l6">
               
               <div class="card-panel">
                  
                  <h5>${n.title }</h5>
                  <hr /><br />
                  
                  <div>
                     <span class="detail-title"><i class="tiny material-icons">person_pin</i>Writer</span>
                     <span> ${n.memberId } </span>
                     <hr /><br />
                  </div>
                  
                  <div>
                     <span class="detail-title"><i class="tiny material-icons">av_timer</i>Write Time</span>
                     <span><fmt:formatDate value="${n.regDate }" pattern="yyyy-MM-dd HH:mm:ss" /></span>
                     <hr /><br />
                  </div>
                  
                <div>
				<span class="detail-title"><i class="tiny material-icons">language</i>
					<a href="${n.contentSrc }" target="_blank"> news 보러가기 </a> </span>
				<hr />
				<br />
				</div>
                  <div>
                     <span class="detail-title"><i class="tiny material-icons">textsms</i> Comment </span>
                     <c:set var="newLine" value="\r" />
                     <span>${n.content }</span>
                     <hr /><br />
                  </div>
                  
                  <div>
                  <c:if test="${n.memberId eq  loginID}">
	                  <a id="btn" class="waves-effect waves-light btn list-btn" href="#modal2" id="freeArticleDel">삭제</a>                     
	                  <a id="btn" class="waves-effect waves-light btn list-btn" href="free-edit?c=${n.id}">수정</a>
                  </c:if>
                  <a class="waves-effect waves-light btn list-btn" id="back" >목록으로</a>
              	 </div>
           <!-----------------------Start 댓글 영역 ------------------------- -->
		   <form class="box_write" id="comment-add-form"
								action="freeBoard-comment-add" method="post">
                         <textarea placeholder="한 줄 댓글을 남겨주세요." name="content" required="required"></textarea>
                      
           <button name="button" type="button" onclick="onCreate();">등록</button>
                     
     	     <input type="hidden" name="freeBoardId" value=${n.id }>
        	 <input type="hidden" name="memberId"
									value=<security:authentication property="name"/>>
         	</form>
			<ul id="commentList" class="collection">

			</ul>
			<ul id="pagination" class="pagination center">
			</ul>
			<!-------------------------End 댓글 영역-----------------------  -->
               </div>

               <div id="modal2" class="modal">
                  <div class="modal-content">
                     <h4>게시물 삭제</h4>
                     <p>정말 삭제하시겠습니까?</p>
                  </div>
                  <div class="modal-footer">
                     <button class="btn waves-effect waves-light" type="button" id="ArticleDelCancel">Cancel</button>

                     <button class="btn waves-effect waves-light" type="button" id="ArticleDelBtn">Submit</button>
   
                  </div>
               </div>
               
            </div>
            
            <!-- 관련 view 보여주기 -->
             <div class="col s12 l6">
            	 <ul id="breadcrumb" class="headdd">
						<li><a href="../main/index"><span class="icon icon-home"></span></a></li>
						<li><a href="?p=1"><span
								class="icon icon-double-angle-right"> </span>연관 view 보기</a></li>
					</ul>
              <%--    <div>
						<c:if test="${file.src != null }">
			            	<img src=${file.src }${file.name } style="width:400px; height:500px; margin-top:42px;" />
			            </c:if>
				</div> --%>
				
				
	<!--/////////////////////////////////////// view 리스트//////////////////////////////////// -->
				 
				<div class="site-list">
				<div class="collection mvaside">
					<div class="sitgo">
						<a class="waves-effect waves-light sitego right" href="#"> 
						<i class="material-icons">mode_edit</i> <!-- 글작성 아이콘 -->
						</a>
					</div>
				</div>

				<c:forEach var="s" items="${sitelist}">
					<ul class="collection">

						<div style="display: none">
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
						</div>
						<div style="display: none;">
							<fmt:formatDate value="${s.regDate}"
								pattern="yyyy-MM-dd HH:mm:ss" var="writedate" />
						</div>
						
						<!--//////////// 아무거나 누르면 넘어갈꺼야! ///////////////-->
						<li class="list-item flex">
						<a href="../siteboard/site-detail?c=${s.id}&f=${s.factBoardId}" class="url">
								<div class="index">
									<p>${s.id }</p>
								</div>
												 		
								<!-- <div class="title nanum"> -->
								<div class="title-warpper title nanum">
									<span>${s.title} <span class="orange-text text-accent-3">[${s.countcomment }]</span>
										<c:if test="${writedate>=today }">
											<img src="../resource/images/new.jpg" />
										</c:if></span>
								</div>
																						
								<div class="writer-warpper">
									<p>${s.memberId }<br>
										<span><fmt:formatDate value="${s.regDate}" pattern="yy.MM.dd HH:mm" /></span>
									</p>
								</div>
								<div class="like-warpper">
								<div>
									<i class="material-icons">grade</i>
									<label class="like-s">${s.good }개</label></div>
								</div>
								<%-- <div class="url-warpper">
									<img src="http://api.thumbalizr.com/?url=http://${n.url}" />
								</div> --%>
						</a></li>
					</ul>
				</c:forEach>
			</div>
				<!--/////////////////////////// view 리스트///////////////////////// -->
				
				
            </div>
            
            
         </div>
      </div>
   </div>

   <script>
   $(function(){
         
      $("#ArticleDelBtn").on('click', function(){
         
         var id = ${n.id};
         
         $.post("free-del", {"id":id});
         location.href='freeboard';
         
      });

      $("#ArticleDelCancel").on('click', function(){
         
         location.href='${root }/freeboard/free-details?c='+${n.id};
         
      });
         
   });
   </script>


</div>
</div>


<form class="searchbar1" action="${root }/siteboard/siteboard" method="GET">
  <div class="broker-expanding-search" data-expanding-search>
    <div class="broker-expanding-search__column broker-expanding-search__column--left">
       <input type="hidden" name="p" value="1" />
       <input name="q" type="text" class="broker-expanding-search__input broker-expanding-search__input--text" value="${param.q}" placeholder="Siteboard Search" data-expanding-search-text>
    </div>
    <div class="broker-expanding-search__column broker-expanding-search__column--right">
      <input type="submit" class="broker-expanding-search__input broker-expanding-search__input--submit" value="Search" data-expanding-search-button>
    </div>
  </div>
</form>
				
	<script>
 $(document).ready(function() {
	 
	  // toggle search bar and disable request if blank...
	  $('[data-expanding-search-button]').on('click', function() {
	    var parent = $(this).closest('[data-expanding-search]');
	    if (parent.find('[data-expanding-search-text]').val() === '${param.q}') {
	      parent.toggleClass('broker-expanding-search--open');
	      return false;
	    }
	  });
	 
	});
</script>
</main>


<!------------------------------------------------------------- 댓글 영역 ------------------------------------------------------------------------>
<!-----//////////////////////////////////SCRIPT/////////////////////////////////////////////--->

<script>


<!-----------------------------------------목록버튼--------------------------------------------->
$(document).ready(function(){									
	$(".list-btn").on("click",function(){
		$('#back').prop('href', "freeboard");
	});
});

page(${page});

var currentPage = ${page};
	
	function onCreate(){
		
		console.log('${loginID}');
 		if('${loginID}' == 'anonymousUser') {
			alert("로그인한 유저만 사용 가능합니다.");
			return ;
		} 

		var count = 0;
		
		var text = $("#comment-add-form").find("textarea");
		
	
		var tt= text.val();
		tt = tt.trim();//공백 제거
        
        if(!tt){
            alert("내용이 없습니다.");
            text.focus();//해당입력란으로 포커싱
            return;
        }
		
		var data = $("#comment-add-form").serialize();
			
		$.post("freeBoard-comment-add", data, function(z) {

			if(z =="1"){
				page(1);
				text.val('');
			}
			
		});
			}
	
		function onDelete(d){
		
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			$.post("freeCommentDelete", {"id":d}, function(z) {
				if(z =="1"){
					alert("삭제했습니다.");
					
					page(currentPage);
								
				}
				
			});
			
		}else{   //취소
		    return;
		}

	}
		function page(page){
			   currentPage = page;
				console.log(currentPage);
			   $.post("commentPage", {"page":page ,"id":${n.id }}, function(d) {
				      
				      $("#commentList").empty();
				      $("#pagination").empty();
				      var obj = JSON.parse(d);
				      var src ="";
				     
				      if(obj.length != 0){
			
							for (var i = 0; i < obj.length; i++) {
								
								src = "${root}/resource/profile/" +obj[i].profile;
								
				 				if(obj[i].memberId=='${loginID}'){
								
									$("#commentList").append($('<li class="collection-item avatar">' + + '</li>')
											 .append($('<img src='+ src   +' class="circle"> '))
										 .append($('<span class="title">'+obj[i].memberId+'</span>'))
										 .append($('<time>'+js_yyyy_mm_dd_hh_mm_ss(obj[i].regDate)+'</time>'))
										 .append($('<p>'+obj[i].content+'</p>'))
										 .append($('<a class="del waves-effect waves-light" onclick="onDelete('+obj[i].id+ ');" value='+obj[i].id+'><i class="material-icons">clear</i></a>')));
								}
								else{
									$("#commentList").append($('<li class="collection-item avatar">' + + '</li>')
											 .append($('<img src='+ src   +' class="circle"> '))
											 .append($('<span class="title">'+obj[i].memberId+'</span>'))
											 .append($('<time>'+js_yyyy_mm_dd_hh_mm_ss(obj[i].regDate)+'</time>'))
											 .append($('<p>'+obj[i].content+'</p>')));
								} 
							}
					 	   $("#commentList img").error(function() {
					 
						         this.src ="${root}/resource/images/avatar.png";
						      }); 
					 	 
					    	
					    	
							 var lastPage = ${size/10+(1-(size/10%1))%1};
							  
							 var last_block = Math.ceil(lastPage / 5);
			
							
					        //현재 블럭 구하기 
					        var n_block = Math.ceil(currentPage / 5);
					        //페이징의 시작페이지와 끝페이지 구하기
					        var s_page = (n_block - 1) * 5 + 1; // 현재블럭의 시작 페이지
					        var e_page = n_block * 5; // 현재블럭의 끝 페이지
						
						
							 if(n_block != 1){
								  	$("#pagination").append($('<li class="waves-effect"><a onclick="prevButton();"><i class="material-icons">chevron_left</i></a></li>'));
								 }
							 
							 for (var i = s_page; i <= e_page; i++){
								 if (i > lastPage)    break;
								 
				
								 if(page == i){
									 $("#pagination").append($(' <li class="waves-effect active"><a class="page" onclick="page('+i+');" value='+i+'>'+i+'</a></li>'));
								 }
								 else{
									 $("#pagination").append($(' <li class="waves-effect"><a class="page" onclick="page('+i+');" value='+i+'>'+i+'</a></li>'));
								 }
							 }
					        
				
							 if(n_block != last_block){
								$("#pagination").append($('<li class="waves-effect"><a onclick="nextButton();"><i class="material-icons">chevron_right</i></a></li>')); 
							 }
							  
						}
				   
				    
				   	});
		 	}
		  
		   
 function js_yyyy_mm_dd_hh_mm_ss (date) {
	  
	  now = new Date(date);
	  year = "" + now.getFullYear();
	  month = "" + (now.getMonth() + 1); if (month.length == 1) { month = "0" + month; }
	  day = "" + now.getDate(); if (day.length == 1) { day = "0" + day; }
	  hour = "" + now.getHours(); if (hour.length == 1) { hour = "0" + hour; }
	  minute = "" + now.getMinutes(); if (minute.length == 1) { minute = "0" + minute; }
	  second = "" + now.getSeconds(); if (second.length == 1) { second = "0" + second; }
	  return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
	}
 
 function prevButton(){
	  var n_block = Math.ceil(currentPage / 5);

     //페이징의 시작페이지와 끝페이지 구하기
     var s_page = (n_block-1) * 5 -4 ; // 현재블럭의 시작 페이지
     page(s_page);
 }
 
 function nextButton(){
	  var n_block = Math.ceil(currentPage / 5);

     //페이징의 시작페이지와 끝페이지 구하기
     var s_page = (n_block) * 5 + 1; // 현재블럭의 시작 페이지
     page(s_page);
 }

</script>