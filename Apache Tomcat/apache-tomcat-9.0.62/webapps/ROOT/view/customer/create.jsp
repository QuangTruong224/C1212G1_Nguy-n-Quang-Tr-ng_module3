<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/20/2022
  Time: 1:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

    <title>Title</title>
</head>
<body>
<h2><a href="/customers?action=customers">List All Customers</a></h2>

<form method="post" action="/customers?action=create" >
    <fieldset style="text-align: center ;background-color: gray ">
        <legend><h4>Add New Customer</h4></legend>
        <table   >

            <tr>
                <th>Name:</th>
                <td><input type="text" name="customerName" id="customerName" size="30"></td>
            </tr>

            <tr>
                <th>Customer type id:</th>
                <td>
                    <select name="customerTypeId">
                        <c:forEach var="customerTypeId" items="${customerTypeList}">
                            <option value="${customerTypeId.customerTypeId}">${customerTypeId.customerTypeName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Birth day:</th>
                <td><input type="date" name="customerBirthday" id="customerBirthday"></td>
            </tr>
            <tr>
                <th>Gender:</th>
                <td>
                    <select  id="gender" name="customerGender" required >
                        <option  value="${customer.customerGender}">Chọn giới tính</option>
                        <option value="1" ${customer.customerGender}  >Nam</option>
                        <option value="0" ${customer.customerGender} >Nữ</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Id card:</th>
                <td><input type="text" name="customerIdCard" id="customerIdCard" size="30"></td>
            </tr>
            <tr>
                <th>Phone:</th>
                <td><input type="text" name="customerPhone" id="customerPhone" size="30"></td>
            </tr>
            <tr>
                <th>Email:</th>
                <td><input type="text" name="customerEmail" id="customerEmail" size="30"></td>
            </tr>
            <tr>
                <th>Address:</th>
                <td><input type="text" name="customerAddress" id="customerAddress" size="30"></td>
            </tr>
        </table>
    </fieldset>
    <input type="submit" value="Save"/>
</form>
<script src="${pageContext.request.contextPath}/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assert/bootstrap413/js/bootstrap.bundle.js"></script>
</body>
</html>
