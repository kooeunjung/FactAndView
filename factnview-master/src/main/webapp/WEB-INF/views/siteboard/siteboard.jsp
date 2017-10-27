<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<jsp:useBean id="now" class="java.util.Date" />

<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);


.hanna{
	font-family: 'Hanna', serif;
}
.jeju{
	font-family: 'Jeju Gothic', serif;
}
.nanum{
	font-family: 'Nanum Myeongjo', serif;
}

.nanumgothic{
	font-family: 'Nanum Gothic', serif;
}

/* -------------------------상단목록이동----------------------------- */
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
	/* background: #dd5d58;
/* box-shadow: 0px 0px 0px 2px rgba(255,255,255,0.90); */ */
	transition: width 0.5s cubic-bezier(0.65, -0.5, 0.4, 1.5);
	background: #337ab7;
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0
		rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
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
/* ----------------------검색창 수정------------ */
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
/* ---------------------------------------------- */
.caption {
	position: absolute;
	left: 0;
	padding: 10px 20px 20px 20px;
	background: 7f7f7f;
	background: rgba(0, 0, 0, 0.5);
	width: 100%;
	max-height: 32%;
}

.slider .slides li .caption {
	width: 100%;
	left: 0px;
	top: auto;
	bottom: 0;
}

.collection {
	margin: 0px;
	/* margin-right: 30px; */
	background-color: #fff;
}

.collection.with-header .collection-item {
	height: 270px;
	width: 100%;
}

.best {
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.12);
	margin-bottom: 16px;
}

.collection .collection-item {
	border-bottom: none;
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

.circle {
	border-radius: 0%;
	border: 1px solid #e9e9e9;
}

.collection .collection-item.avatar .circle {
	width: 46px;
	height: 66px;
}

/*Start site-list */
.list-item {
	min-height: 96px;
	padding-left: 22px;
	position: relative;
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
	right: 176px;
	top: 50%;
	height: 32px;
	margin: -45px 0;
	text-align: right;
}

.url-warpper img {
	border: 0;
	height: 96px;
	width: 96px;
}

.like-warpper {
	position: absolute;
	top: 16px;
	right: 16px;
}

@media screen and (max-width: 640px) {
	.list-item .title {
		font-size: 16px;
		line-height: 67px;
		margin-left: 48px;
		margin-right: 90px;
		padding-top: 16px;
		white-space: normal;
	}
	.writer-warpper {
		display: none;
	}
	.url-warpper {
		right: 0px;
	}
	.writer-warpper {
		border: 0;
		height: 96px;
		width: 96px;
	}
	.like-warpper {
		display: none;
	}
}

/*End site-list  */
.collection-header.flex {
	align-items: center;
}

.collection-header .btn {
	padding: 0px;
	padding-left: 2px;
	padding-right: 2px;
	font-size: 5px;
	height: 17px;
	line-height: 17px;
	letter-spacing: 0px;
	background-color: #fb6226;
}

.contain.container {
	margin-top: 20px;
	margin-bottom: 60px;
}

@media screen and (max-width: 1330px) {
}
</style>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
	
<main id="main">

<!--///////////////////////////////////////////검색창 ///////////////////////////////////////////>
<form class="searchbar1" action="${root }/siteboard/siteboard" method="GET">
	<div class="broker-expanding-search" data-expanding-search>
		<div class="broker-expanding-search__column broker-expanding-search__column--left">
			<input type="hidden" name="p" value="1" /> 
			<input name="q" type="text"
				class="broker-expanding-search__input broker-expanding-search__input--text"
				value="${param.q}" placeholder="Search" data-expanding-search-text>
		</div>
		<div class="broker-expanding-search__column broker-expanding-search__column--right">
			<input type="submit"
				class="broker-expanding-search__input broker-expanding-search__input--submit"
				value="Search" data-expanding-search-button>
		</div>
	</div>
</form>

<div style="display: none">
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
</div>
	
<!--/////////////////////////////////////////// Fact Board List/////////////////////////////////////////// -->
			<div class="col-xs-12 col-md-8 container contain">
				<div class="flex">
					<div class="main-div">
			
						<div style="display: none">
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
						</div>
						<div style="display: none;">
							<fmt:formatDate value="${v.regDate}" pattern="yyyy-MM-dd HH:mm:ss"
								var="writedate" />
						</div>
						<ul id="breadcrumb" class="headdd">
							<li><a href="../main/index"><span class="icon icon-home"></span></a></li>
							<li><a href="?p=1"><span class="icon icon-double-angle-right"> </span>${now} 오늘의 Fact</a></li>
						</ul>
						
				<!-- 	Fact 글쓰러 넘어가는 부분	
						<div class="collection">
							<div class="write right">
								<a class="waves-effect waves-light sitego" href="#"> <i class="material-icons ">mode_edit</i></a>
							</div>
						</div> -->
						
						<div class="free-list">
							<c:forEach var="v" items="${pageList}">
								<ul class="collection">
									
									<!--//////////// 아무거나 누르면 넘어갈꺼야! ///////////////-->
									<li class="list-item flex">
									<a href="site-reg?c=${v.id}" class="url">
											<div>
											<div class="title nanum"> <!-- 오늘 쓴 글에 new 아이콘 달기 -->
												<span>${v.title} <c:if test="${writedate>=today }">	<img src="../resource/images/new.jpg" /> </c:if></span>
											</div>
											<div class="title2 nanumgothic">
												<span>에 대한 view 작성하러가기...</span>
											</div>
											</div>
											
											<div class="writer-warpper">
												<p>
													<fmt:formatDate value="${v.regDate}" pattern="yyyy.MM.dd" />
												</p>
											</div>
									</a>
									</li>
									<!--//////////// 아무거나 누르면 넘어갈꺼야! ///////////////-->
								</ul>
							</c:forEach>
						</div>

						<fmt:parseNumber var="pageInt" integerOnly="true" value="${paging/10 }" />
						<c:set var="last" value="${(paging%5)>0 ? pageInt+1 : pageInt }" />
							<c:if test="${empty param.p }">
								<c:set var="param.p" value="1" />
							</c:if>
						<ul style="text-align: center" class="pagination">
							<c:forEach var="i" begin="1" end="${last }">
								<c:choose>
									<c:when test="${i eq param.p or empty param.p and i eq '1'}">
										<li class="waves-effect  active"><a href="?p=${i}">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="waves-effect "><a href="?p=${i}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
<!--///////////////////////////////////////////hot 이슈 보여주기 /////////////////////////////////////////// -->
<!--///////////////////////////////////////////hot 이슈 보여주기 /////////////////////////////////////////// -->
	
<div class="col-xs-12 col-md-8 container contain">
	<div class="flex">
		<div class="main-div">
			<ul id="breadcrumb" class="headdd">
				<li><a href="../main/index"><span class="icon icon-home"></span></a></li>
				<li><a href="?p=1"><span
						class="icon icon-double-angle-right"> </span>Hot 이슈</a></li>
			</ul>
			<div class="collection with-header best">
				<div class="collection-header flex center">
					<div>
						<h4>핫이슈</h4>
					</div>
					<div>
						<button id="likebtn" class="waves-effect waves-light btn" type="submit" name="action">hot</button>
					</div>
				</div>
				
				<div class="flex">
					<c:forEach var="hotlist" items="${likelist }" begin="0" varStatus="status" end="2">
						<div class="collection-item center">
							<a href="site-detail?c=${hotlist.id}&p=${param.p}"> <img src="http://api.thumbalizr.com/?url=http://${hotlist.url}&width=450%&heigt=270" />
								<span class="caption_box"> <span class="title"></span> <span class="info">${hotlist.title }</span>
							</span>
							</a>
						</div>
					</c:forEach>
				</div>
				
			</div>
		</div>
	</div>
</div>
<!--///////////////////////////////////////////View 게시판 리스트 보여주기 /////////////////////////////////////////// -->
<!--///////////////////////////////////////////View 게시판 리스트 보여주기 /////////////////////////////////////////// -->
<div class="col-xs-12 col-md-8 container contain">
	<div class="flex">
		<div class="main-div">
			<input class="sitein" type="hidden" name="memberId"	value=<security:authentication property="name"/>>
			<ul id="breadcrumb" class="headdd">
				<li><a href="../main/index"><span class="icon icon-home"></span></a></li>
				<li><a href="?p=1"><span class="icon icon-double-angle-right"> </span>View</a></li>
			</ul>
			
			<div class="site-list">
				<div class="collection mvaside">
					<div class="sitgo">
						<a class="waves-effect waves-light sitego right" href="#"> 
						<i class="material-icons">mode_edit</i> <!-- 글작성 아이콘 -->
						</a>
					</div>
				</div>

				<c:forEach var="n" items="${sitelist}">
					<ul class="collection">

						<div style="display: none">
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
						</div>
						<div style="display: none;">
							<fmt:formatDate value="${n.regDate}"
								pattern="yyyy-MM-dd HH:mm:ss" var="writedate" />
						</div>
						
						<!--//////////// 아무거나 누르면 넘어갈꺼야! ///////////////-->
						<li class="list-item flex">
						<a href="site-detail?c=${n.id}&f=${n.factBoardId}" class="url">
								<div class="index">
									<p>${n.id }</p>
								</div>
												 		
								<div class="title nanum">
									<span>${n.title} <span class="orange-text text-accent-3">[${n.countcomment }]</span>
										<c:if test="${writedate>=today }">
											<img src="../resource/images/new.jpg" />
										</c:if></span>
								</div>
								
								<div class="title2 nanum">
									<span>[${n.factBoardName}]에 대한 view 입니다.  </span>
										
								</div> 
								
								<div class="writer-warpper">
									<p>${n.memberId }<br>
										<fmt:formatDate value="${n.regDate}" pattern="yy.MM.dd HH:mm" />
									</p>
								</div>
								<div class="like-warpper">
									<i class="material-icons">grade</i>
									<!-- <div><label class="like-s">좋아요개수</label></div> -->
								</div>
								<%-- <div class="url-warpper">
									<img src="http://api.thumbalizr.com/?url=http://${n.url}" />
								</div> --%>
						</a></li>
					</ul>
				</c:forEach>
			</div>

			<br>
			
			<!-- <div class="site-button">
			<a class="waves-effect waves-light btn sitego" href="#">
			<div class="write">Write<i class="tiny material-icons">mode_edit</i></div>
			</a>
			</div> -->
			
		<%-- 	<fmt:parseNumber var="sizeInt" integerOnly="true" value="${size/10 }" />
			<c:set var="last" value="${(size%10)>0 ? sizeInt+1 : sizeInt }" />
				<div>${empty param.p ? 1 : param.p}/${last }pages</div>
				<div>${size}</div>
			<ul class="pagination center">
				<li class="disabled">
			  	<c:if test="${((listPerFive-1)*5 + 5) > 1 }">
					<a href="?p=${(listPerFive-1)*5 + 5 }&q=${parma.q}">
						<i class="material-icons">chevron_left</i>
					</a>
					
				 		  <a href="?p=${(listPerFive-1)*5 + 5 }&q=${parma.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}">
						<i class="material-icons">chevron_left</i>
						</a>
				</c:if></li>
				
				<c:forEach var="i" begin="${(listPerFive*5) + 1 }" end="${checkLast }">
					<c:choose>
						<c:when test="${i eq param.p or empty param.p and i eq '1'}">
							<li class="waves-effect  active">
							<a href="?p=${i }&q=${param.q}">${i}</a></li>
									<a href="?p=${i }&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="waves-effect ">
							<a href="?p=${i }&q=${param.q}">${i}</a></li>
							<a href="?p=${i }&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<li class="waves-effect">
					<c:if test="${cnt > ((listPerFive+1)*5 + 1) }">
						<a href="?p=${(listPerFive+1)*5 + 1 }&q=${param.q}">
						<a href="?p=${(listPerFive+1)*5 + 1 }&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}">
							<i class="material-icons">chevron_right</i>
						</a>
					</c:if></li>
			</ul> --%>
		</div>
	</div>

</div>



<!--///////////////////////////////////////////JAVA SCRIPT ////////////////////////////////////////// -->
<!--///////////////////////////////////////////JAVA SCRIPT ////////////////////////////////////////// -->
<!--///////////////////////////////////////////JAVA SCRIPT ////////////////////////////////////////// -->
	<script>
	$(document).ready(function() {
		$('.sitego').on('click', function() {
 			var value = $('.sitein').val();

 			if (value == 'anonymousUser') {
				alert("로그인을 한 회원만 이용이 가능합니다.");
				 $('#modal10').modal('open');
			} else {
				$('.sitego').prop('href', "site-reg");
			} 
		});
	});
	</script>
	<script>
	 $(document).ready(function() {
		 $('.slider').slider();
		  $('[data-expanding-search-button]').on('click', function() {
		    var parent = $(this).closest('[data-expanding-search]');
		    if (parent.find('[data-expanding-search-text]').val() === '${param.q}') {
		      parent.toggleClass('broker-expanding-search--open');
		      return false;
		    }
		  });
	});
	
	 $(".pagination").on('click','li',function(){
	    // remove classname 'active' from all li who already has classname 'active'
	    $(".pagination li.active").removeClass("active"); 
	    // adding classname 'active' to current click li 
	    $(this).addClass("active"); 
	});
	</script>

</main>