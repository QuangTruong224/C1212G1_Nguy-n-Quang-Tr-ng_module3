<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/22/2022
  Time: 9:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee Management Application</title>
    <title>Customers Management Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/datatables/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
</head>
</head>
<body style="text-align: center">
<div style="text-align: left;margin: auto">
    <h2>
        <a href="view/customer/index.jsp">Home</a>
    </h2>
</div>
<h1>Employee Management</h1>
<p>
    <c:if test='${requestScope["mess"] != null}'>
        <span class="message" style="color: violet;font-size: large">${requestScope["mess"]}</span>
    </c:if>
</p>
<h2>
    <a href="/employees?action=create">Add New Employee</a>
</h2>
<%--<form method="post" action="/employees?action=search">--%>
<%--    <label> Search employee by name</label>--%>
<%--    <input type="text" name="searchName">--%>
<%--    <button type="submit">Search</button>--%>
<%--</form>--%>
<form method="post" action="/employees?action=search2">
    <input type="text" placeholder="Name" name="searchName">
    <input type="text" placeholder="Adress" name="searchAdress">
    <select name="searchDivision">
        <option value="" >-select division-</option>
        <c:forEach var="division" items="${divisionList}">
            <option value="${division.divisionId}">${division.divisionName}</option>
        </c:forEach>
    </select>
    <button type="submit">Search</button>
</form>

</center>

<div style="text-align: center" class="container">
    <div class="row">
        <div class="col-xl-12">
            <table id="tableStudent" class="table table-striped m-xl-0" style="width:100%">
                <caption><h2>List of Employee</h2></caption>
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Họ tên nhân viên</th>
                    <th>Ngày sinh</th>
                    <th>Căn cước công dân</th>
                    <th>Lương</th>
                    <th>Số điện thoại</th>
                    <th>Email</th>
                    <th>Địa chỉ</th>
                    <th>Vị trí</th>
                    <th> Trình độ</th>
                    <th>Bộ phận</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="employee" items="${employeeList}">
                    <tr>
                        <td><c:out value="${employee.employeeId}"/></td>
                        <td><c:out value="${employee.employeeName}"/></td>
                        <td><c:out value="${employee.employeeBirthday}"/></td>
                        <td><c:out value="${employee.employeeIdCard}"/></td>
                        <td><c:out value="${employee.employeeSalary}"/></td>
                        <td><c:out value="${employee.employeePhone}"/></td>
                        <td><c:out value="${employee.employeeEmail}"/></td>
                        <td><c:out value="${employee.employeeAdress}"/></td>
                            <%--                        <td><c:out value="${employee.positionId}"/></td>--%>
                        <td>
                            <c:forEach var="position" items="${positionList}">
                                <c:if test="${employee.positionId == position.positionId}">
                                    ${position.positionName}
                                </c:if>
                            </c:forEach>
                        </td>

                            <%--                        <td><c:out value="${employee.educationDegreeId}"/></td>--%>
                        <td>
                            <c:forEach var="educationDegree" items="${educationDegreeList}">
                                <c:if test="${employee.educationDegreeId == educationDegree.educationDegreeId}">
                                    ${educationDegree.educationDegreeName}
                                </c:if>
                            </c:forEach>
                        </td>
                            <%--                        <td><c:out value="${employee.divisionId}"/></td>--%>
                        <td>
                            <c:forEach var="division" items="${divisionList}">
                                <c:if test="${employee.divisionId == division.divisionId}">
                                    ${division.divisionName}
                                </c:if>
                            </c:forEach>
                        </td>

                        <td>
                            <a href="/employees?action=update&employeeId=${employee.employeeId}">
                                <button class="btn-primary">Edit</button>
                            </a>
                            <button onclick="deleteEmployee('${employee.employeeId}','${employee.employeeName}')"
                                    type="button" class="btn btn-danger" data-toggle="modal"
                                    data-target="#deleteModal">Delete
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure delete <span class="text-danger" id="name-employee"></span> ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button onclick="submitFormDelete()" type="button" class="btn btn-danger">Delete</button>
            </div>
        </div>
    </div>
</div>


<form hidden id="form-delete" method="post" action="/employees">
    <input type="text" name="action" value="delete">
    <input type="text" name="employeeId" id="id-employee">
</form>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
</script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script>

    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });

    function deleteEmployee(employeeId, name) {
        document.getElementById("id-employee").value = employeeId;
        document.getElementById("name-employee").innerText = name;
    }
    function submitFormDelete() {
        document.getElementById("form-delete").submit();
    }
</script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.4/js/dataTables.bootstrap4.min.js"></script>
</body>
</html>
