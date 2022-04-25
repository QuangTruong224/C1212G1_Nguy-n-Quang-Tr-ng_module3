<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/22/2022
  Time: 9:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h2><a href="/employees?action=employees">List All Employees</a></h2>

<form method="post" action="/employees?action=create">
    <fieldset style="text-align: center ;background-color: gray ">
        <legend><h3>Add New Employee</h3></legend>
        <table>

            <tr>
                <th>Name:</th>
                <td><input type="text" name="employeeName" id="employeeName" size="30">
                    <p style="color: #ff0000">${error.get("name")}</p></td>
            </tr>

            <tr>
                <th>Birth day:</th>
                <td><input type="text" name="employeeBirthday" id="employeeBirthday"></td>
            </tr>
            <tr>
                <th>Id card:</th>
                <td><input type="text" name="employeeIdCard" id="employeeIdCard"></td>

            </tr>
            <tr>
                <th>Salary:</th>
                <td><input type="text" name="employeeSalary" id="employeeSalary" size="30"></td>
            </tr>
            <tr>
                <th>Phone:</th>
                <td><input type="text" name="employeePhone" id="employeePhone" size="30"></td>
            </tr>
            <tr>
                <th>Email:</th>
                <td><input type="text" name="employeeEmail" id="employeeEmail" size="30">
                    <p style="color: #ff0000">${error.get("email")}</p></td>
            </tr>

            <tr>
                <th>Address:</th>
                <td><input type="text" name="employeeAdress" id="employeeAdress" size="30"></td>
            <tr>
                <th> Position :</th>
                <td>
                    <select name="positionId">
                        <c:forEach var="positionId" items="${positionList}">
                            <option value="${positionId.positionId}">${positionId.positionName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>


            <tr>
                <th>Education Degree :</th>
                <td>
                    <select name="educationDegreeId">
                        <c:forEach var="educationDegreeId" items="${educationDegreeList}">
                            <option value="${educationDegreeId.educationDegreeId}">${educationDegreeId.educationDegreeName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>


            <tr>
                <th>Division :</th>
                <td>
                    <select name="divisionId">
                        <c:forEach var="divisionId" items="${divisionList}">
                            <option value="${divisionId.divisionId}">${divisionId.divisionName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            </tr>


        </table>
    </fieldset>
    <input type="submit" value="Save"/>
</form>


</body>
</html>
