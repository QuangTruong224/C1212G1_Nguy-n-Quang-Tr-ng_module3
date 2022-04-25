<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/22/2022
  Time: 10:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Employee Management Application</title>

</head>
<body style="background-color: gray">
<center>
    <h1>Employee Management</h1>
    <h2>
        <a href="employees?action=employees">List All Employees</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit Employee
                </h2>
            </caption>
            <c:if test="${employee != null}">
                <input type="hidden" name="employeeId" value="<c:out value='${employee.employeeId}' />"/>
            </c:if>


            <tr>
                <th>Name:</th>
                <td>
                    <input type="text" name="employeeName" size="45"
                           value="<c:out value='${employee.employeeName}' />"/>
                </td>
            </tr>

            <tr>
                <th>Birth day:</th>
                <td><input type="text" name="employeeBirthDay" size="45"
                    value="<c:out value='${employee.employeeBirthday}'  />"/>
                </td>
            </tr>
            <tr>
                <th>Id card:</th>
                <td><input type="text" name="employeeIdCard" size="45"
                           value="<c:out value='${employee.employeeIdCard}'  />"/>

                </td>

            </tr>
            <tr>
                <th>Salary:</th>
                <td><input type="text" name="employeeSalary"  size="45"
                           value="<c:out value='${employee.employeeSalary}'  />"/>
                </td>
            </tr>
            <tr>

                <th>Phone:</th>
                <td><input type="text" name="employeePhone" size="30"
                           value="<c:out value='${employee.employeePhone}'  />"/>
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td><input type="text" name="employeeEmail"  size="30"
                           value="<c:out value='${employee.employeeEmail}'  />"/>
                </td>
            </tr>

            <tr>
                <th>Address:</th>
                <td><input type="text" name="employeeAdress"  size="30"
                           value="<c:out value='${employee.employeeAdress}'  />"/>
                </td>
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

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
