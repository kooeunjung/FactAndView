<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>


<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
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

#breadcrumb {
	display: flex;
}
/* ------------------------------------------------------------- */

span.title {
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

.btn:hover {
	/* background: rgb(210, 178, 149); */
	background-color: #1abc9c !important;
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

.detail-content {
	font-weight: 700;
	display: block;
	color: #6d6e71;
	font-size: 13px;
	font-family: Microsoft YaHei, "NS";
	margin-top: 5px;
	line-height: 1.5;
}

.detail-address {
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
	border: 1px solid #ededed;
	display: flex;
	margin-top: 30px;
}

.box_write textarea {
	/*   width: 535px; */
	height: 71px;
	box-sizing: border-box;
	border: 1px solid #fcfcfc;
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
	background-color: #a0a0a0;
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
	border: 1px solid #a0a0a0;
	margin-top: 10px;
	margin-bottom: 10px;
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
	background: #f4f4f4 !important;
}



</style>
<script type="text/javascript">
	$(function() {
		$("#imgInp").on('change',function() {
			
			readURL(this);
			
			$("#blah").attr('style', " visibility:visible; width:500px; height:500px; "
					+ "margin-top: 42px; -webkit-box-shadow: 9px 11px 22px -3px rgba(151,151,151,1); "
					+ " -moz-box-shadow: 9px 11px 22px -3px rgba(151,151,151,1); "
					+ " box-shadow: 9px 11px 22px -3px rgba(151,151,151,1); ");
			});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
	
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}
	
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>


<main id="main">

<div class="container">
	<div class="section">
		<div class="row">
			
			<!-- 왼쪽화면 -->
			<div class="col s12 l6">
				<h4 class="title">Free Board</h4>
				<div class="preview">
					<img id="blah" src="#" style="width: 500px; height: 500px; visibility: hidden;" />
				</div>
			</div>
			
			<!-- 오른쪽 화면 -->
			<div class="col s12 l6">
					<form action="reg" method="post" enctype="multipart/form-data"  class="card-panel">
						<div class="row">
							<div class="input-field col s12">
								<input placeholder=" title " id="titleinput" type="text"
									name="title" class="validate" value="" required="required">
								<label for="name" class="active"><i
									class="tiny material-icons">mode_edit</i> 제목 </label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								<input placeholder=" http:// " id="contentSrc" type="text"
									name="contentSrc" class="contentSrc" value=""
									required="required"> <label for="name" class="active"><i
									class="tiny material-icons">language</i> 주소 </label>
							</div>
						</div>

						<div class="file-field input-field">
							<div class="btn">
								<span>파일 첨부 </span> <input type="file" id="imgInp" class="btn" name="file" />
							</div>
							<div class="file-path-wrapper">
								<input class="file-path validate" type="text">
							</div>

						</div>

						<div class="row">
							<div class="input-field col s12">
								<textarea name="content" class="form-control materialize-textarea" rows="15"
									id="comment" data-length="300" required="required"></textarea>
								<label for="name" class="active">
								<i class="tiny material-icons">textsms</i> 내용 </label>
							</div>
						</div>

						<div id="btn">
							<button class="btn waves-effect waves-light right" type="submit" name="action" id="test">등록</button>
						</div>

						<script>
							$(function() {
								/* var comment = $("#comment"); */
								$("#comment").keydown(function(e) {
									if ($("#comment").val().length > 300) {
										if (e.keyCode != 8) {
											alert("글자수 초과!!");
										}
									}
								});
							});
						</script>

						<input type="hidden" name="memberId" value=<security:authentication property="name"/> />
					</form>

				</div>
				
		</div>
	</div>
</div>

	<!------------------------------------------------------  Scripts----------------------------------------------------->
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="${root }/resource/js/materialize.js"></script>
	<script type="text/javascript">
	$('select').material_select('destroy');
		$(document).ready(function() {
			$('select').material_select();
		});

		$(document).ready(function() {
			// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
			$('.modal').modal();
		});
		$(".button-collapse").sideNav();
		
	
	</script>

</main>