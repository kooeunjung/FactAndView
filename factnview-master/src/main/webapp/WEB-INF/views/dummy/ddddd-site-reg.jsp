<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="reg" method="post" class="card-panel"">
						<div class="row">
							<div class="input-field">
								<%-- 	<select name="bigCategoryId" id="bigCategoryId" required>
								<option id="default" value="" disabled selected>대분류를 선택하세요.</option>
								<c:forEach var="bc" items="${bcList }">
									<option value="${bc.id }">${bc.name }</option>
								</c:forEach>
							</select> --%>

								<!-- <script>
								$(function() {
									$("#bigCategoryId")
											.on(
													'change',
													function() {

														var data = $("#bigCategoryId");
														var smallCategory = $("#smallCategoryId");
														var smli = $("#scList>div>select");

														smli.empty();

														$
																.post(
																		"getListWithBC",
																		data,
																		function(
																				d) {

																			var obj = JSON
																					.parse(d);

																			smallCategory
																					.append($('<option disabled selected><span> 소분류 선택 </span></option'));

																			if (obj.length != 0) {
																				for (var i = 0; i < obj.length; i++) {

																					smallCategory
																							.append($('<option value=' +obj[i].id +  '><span>'
																									+ obj[i].name
																									+ '</span></option>'));

																					$(
																							'select')
																							.material_select();
																				}
																			} else if (obj.length == 0) {
																				$(
																						'select')
																						.material_select();
																			}
																		});

														var bcDelpost = $("#bcdel");
														var bcModpost = $("#bcmod");
														var scCheckpost = $("#scAddCheck");

														bcDelpost.val($(this)
																.val());
														bcModpost.val($(this)
																.val());
														scCheckpost.val($(this)
																.val());

													});
								});
							</script> -->
							</div>

							<!-- <div class="input-field" id="scList">
							<select name="smallCategoryId" id="smallCategoryId" required>
								<option id="default" value="" disabled selected>소분류를 선택하세요.</option>
							</select>

							<script>
								$(function() {
									$("#smallCategoryId")
											.on(
													'change',
													function() {

														var smList = $("#smallCategoryId");

														var scDelpost = $("#scdel");
														var scModpost = $("#scmod");

														scDelpost.val($(this)
																.val());
														scModpost.val($(this)
																.val());

													});
								});
							</script> -->
						</div>
				</div>

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
								name="url" class="contentSrc" value="" required="required">
							<label for="name" class="active"><i
								class="tiny material-icons">language</i> 주소 </label>
						</div>
					</div>


					<div class="row">
						<div class="input-field col s12">
							<textarea name="content"
								class="form-control materialize-textarea" rows="15" id="comment"
								data-length="130" required="required"></textarea>
							<label for="name" class="active"> <i
								class="tiny material-icons">textsms</i> 내용
							</label>
						</div>
					</div>

					<div class="chips chips-placeholder">
						<!-- <!-- add생성될곳 -->
						<input class="tag" id="e385bafe-7ce5-436e-e3f3-12af51285ada"
							type="text" placeholder="+Tag 스페이스바를 누르면 추가됩니다." />
						add가생성되는곳 -->
					</div>

					<div class="row">
						<div id="btn">
							<button class="btn waves-effect waves-light right" type="submit"
								name="action" id="test">등록</button>
						</div>
						<input type="hidden" name="memberId"
							value=<security:authentication property="name"/> />

					</div>
				</form>
				
				
				<script>
			$('.tag').keydown(function(e) {
								if (e.keyCode == 32) {
									var value = $(this).val();
									/*  $("<div class='chip'>"+value+"<i class='material-icons close'>close</i></div>").appendTo('.chips');  */
									$(
											"<div class='chip'><input type='hidden' name='tag' value='"+value+"'>"
													+ value
													+ "</input><i class='material-icons close'>close</i></div>")
											.appendTo('.chips');
									/* alert(value); */
									$(this).val(null);
								}
							});
		</script>
</body>
</html>