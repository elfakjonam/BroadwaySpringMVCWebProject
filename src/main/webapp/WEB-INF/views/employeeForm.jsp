<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">


<head>


	
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/apptbl/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/apptbl/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/apptbl/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/apptbl/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/apptbl/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/apptbl/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/apptbl/css/util.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/apptbl/vendor/bootstrap/css/bootstrap.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/apptbl/css/main.css">
<!--===============================================================================================-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



</head>


<body>

	<div class="limiter"
		 class="container-table100"
			 class="wrap-table100"
				 class="table100">
					<div id="employeeFormDialog"> </div>
					<h2 class="title" align="center">Employee Information</h2>
					<button class="btn btn-primary" onclick="addEmpInfo()">
	<i class="fa fa-plus" aria-hidden="true"></i> Add Employee
			</button>
							
					<table id="employeeTable">
					
			
		<thead>
			<tr class="table100-head">
				<th>EmpID</th>
				<th>Edit</th>
				<th>Delete</th>
				<th>Image</th>
				<th>FirstName</th>
				<th>MiddleName</th>
				<th>LastName</th>
				<th>DateOfBirth</th>
				<th>ContactNo</th>
				<th>Email</th>
				<th>Address</th>
				<th>Gender</th>
				<th>Designation</th>
				<th>Department</th>
				<th>Status</th>
				<th>ContractStartDate</th>
				<th>ContractEndDate</th>
				<th>JoinedDate</th>
				<th>BasicSalary</th>
			</tr>
		</thead>
				
			<tbody>
			<c:forEach var="row" items="${employeeList }">
				<tr>
					<td>${row.id }</td>
					<td>
						<button class="btn btn-success" onclick="editEmpInfo(${row.id})">
						<i class="fa fa-edit" aria-hidden="true"></i></button></td>
						
						<td><button class="btn btn-danger" onclick="deleteEmpInfo(${row.id})">
						 <i class="fa fa-trash" aria-hidden="true"></i></button> 
						<td> 
						<img alt="" src="${pageContext.request.contextPath }/download?file=${row.imageName}" width="50" height="50" /> 
						</td>
					
					<td>${row.firstName }</td>
					<td>${row.midName }</td>
					
					<td> ${row.lastName }</td>
					<td><fmt:formatDate value="${row.birthDate }" pattern="MM/dd/yyyy" /></td>
					<td>${row.contactNo }</td>
					<td>${row.email }</td>
					<td>${row.address }</td>
					<td>${row.gender }</td>
					<td>${row.designation }</td>
					<td>${row.department }</td>
					<td>${row.status }</td>
					<td><fmt:formatDate value="${row.contractStartDate }" pattern="MM/dd/yyyy" /></td>
					<td><fmt:formatDate value="${row.contractEndDate }" pattern="MM/dd/yyyy" /></td>
					<td><fmt:formatDate value="${row.joinedDate }" pattern="MM/dd/yyyy" /></td>
					<td>${row.salary }</td>
					
				</tr>
			</c:forEach>
								
						</tbody>
					</table>
					<spring:url value="/report" var="xlsURL"></spring:url>
 <a href="${xlsURL}">Export in Excel</a>
				
				</div>
			


		<script type="text/javascript">
	
		function addEmpInfo(){
			var addEmpUrl = "${pageContext.request.contextPath}/empInfo/add";
			$.get(addEmpUrl)
				.then(function(employeeFormDialog){
					$("#employeeFormDialog").html(employeeFormDialog);
					$("#employeeFormModal").modal('show');
				});
		}
		
		function editEmpInfo(id){
			var editEmpInfoUrl="${pageContext.request.contextPath}/empInfo/" + id + "/edit";
			$.get(editEmpInfoUrl)
					.then(function(empInfoFormDialog){
					$("#employeeFormDialog").html(empInfoFormDialog);
					$("#employeeFormModal").modal('show');
				});
		}
		
		function deleteEmpInfo(id){
			var r = confirm("Are you sure you want to delete this record?");
			if(r == true){
				location.href="${pageContext.request.contextPath}/empInfo/" + id + "/delete";
			}
		}
		
		$(document).ready(function(){
			$('#empInfoTable').DataTable();
		});
		
	</script>

<!--===============================================================================================-->	
	<script src="${pageContext.request.contextPath }/resources/apptbl/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath }/resources/apptbl/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath }/resources/apptbl/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath }/resources/apptbl/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath }/resources/apptbl/js/main.js"></script>

</body>
</html>