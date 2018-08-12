<!-- http://getbootstrap.com/javascript/   : Static example -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="employeeFormModal" class="modal fade" tabindex="-1"
	role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

			<form:form action="empInfo" method="POST" modelAttribute="employee"
				enctype="multipart/form-data">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Employee Form</h4>
				</div>
				<div class="modal-body">
					<div class="form-horizontal">


						<table style="width: 100%">
							<tr>
								<td><label>Select a Photo to Upload: <form:input
											path="file" type="file" class="form-control" /></label></td>
								<td><img id="image" alt=""
									src="${pageContext.request.contextPath }/download?file=${employee.imageName}"
									width="150" height="100" /></td>
							</tr>

							<tr>
								<td><form:label path="firstName"> First Name </form:label></td>
								<td><form:input path="firstName" class="form-control" /></td>
							</tr>
							<tr>
								<td><form:label path="midName"> Middle Name </form:label></td>
								<td><form:input path="midName" class="form-control" /></td>
							</tr>
							<tr>
								<td><form:label path="lastName"> Last Name </form:label></td>
								<td><form:input path="lastName" class="form-control" /></td>
							</tr>
							<tr>
								<td><form:label path="birthDate"> Birth Date </form:label></td>
								<td><form:input path="birthDate" type="date"
										class="form-control" /></td>
							</tr>

							<tr>
								<td><form:label path="contactNo"> Contact Number </form:label></td>
								<td><form:input path="contactNo" class="form-control" /></td>
							</tr>
							<tr>
								<td><form:label path="Email"> Email </form:label></td>
								<td><form:input path="Email" class="form-control" /></td>
							</tr>

							<tr>
								<td><form:label path="address"> Address </form:label></td>
								<td><form:input path="address" class="form-control" /></td>
							</tr>
							<tr>
								<td><input type="radio" name="gender" value="male" checked>
								Male
								<br>
								<input type="radio" name="gender" value="female"> Female
								<br>
								<input type="radio" name="gender" value="other"> Other
								</td>
							</tr>

							<tr>
								<td><form:label path="designation"> Designation </form:label></td>
								<td><form:input path="designation" class="form-control" /></td>
							</tr>

							<tr>
								<td><form:label path="department"> Department </form:label></td>
								<td><form:input path="department" class="form-control" /></td>
							</tr>
							<tr>
								<td><form:label path="status"> Status </form:label></td>
								<td><form:input path="status" class="form-control" /></td>
							</tr>

							<tr>
								<td><form:label path="contractStartDate"> Contract Start Date </form:label></td>
								<td><form:input path="contractStartDate" type="date"
										class="form-control" /></td>
							</tr>

							<tr>
								<td><form:label path="contractEndDate"> Contract End Date </form:label></td>
								<td><form:input path="contractEndDate" type="date"
										class="form-control" /></td>
							</tr>
							<tr>
								<td><form:label path="salary"> Salary </form:label></td>
								<td><form:input path="salary" class="form-control" /></td>
							</tr>
							<tr>
								<td><form:label path="joinedDate"> Joined Date </form:label></td>
								<td><form:input path="joinedDate" type="date"
										class="form-control" /></td>
							</tr>
						</table>
						<form:hidden path="id" />
						<form:hidden path="imageName" />

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Save changes</button>
				</div>

			</form:form>

		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<script type="text/javascript">
	document.getElementById("file").onchange = function() {

		var reader = new FileReader();
		reader.onload = function(e) {
			// get loaded data and render thumbnail.
			document.getElementById("image").src = e.target.result;
		};

		// read the image file as a data URL.
		reader.readAsDataURL(this.files[0]);
	};
</script>


