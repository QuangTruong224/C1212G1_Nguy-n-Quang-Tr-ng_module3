<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/16/2022
  Time: 9:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>User Management</h1>
<h2>
    <a href="/users?action=list"> List User</a>
</h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>

        </tr>
        <c:forEach var="user" items="${users}">
<%--            <tr>--%>
<%--                <td><c:out value="${user.id}"/></td>--%>
<%--                <td><c:out value="${user.name}"/></td>--%>
<%--                <td><c:out value="${user.email}"/></td>--%>
<%--                <td><c:out value="${user.country}"/></td>--%>
<%--            </tr>--%>
<%--            <td><a href="/user?action=list&name=${user.getId()}">${user.getName()}</a></td>--%>
<%--            <td>${user.getEmail()}</td>--%>
<%--            <td>${user.getCountry()}</td>--%>
<%--            <td><a href="/user?action=edit&name=${user.getName()}">edit</a></td>--%>
<%--            <td><a href="/user?action=delete&name=${user.getName()}">delete</a></td>--%>
            <td>${user.getId()}</td>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>

        </c:forEach>
    </table>
</div>
</body>
</html>
