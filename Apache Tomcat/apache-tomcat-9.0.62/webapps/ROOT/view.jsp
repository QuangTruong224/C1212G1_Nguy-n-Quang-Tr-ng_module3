<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/15/2022
  Time: 12:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Customer details</h1>
<p>
  <a href="/product">Back to product list</a>
</p>
<table>
  <tr>
    <td>Name:</td>
    <td>${requestScope["product"].getNameProduct()}</td>
  </tr>
  <tr>
    <td>Price:</td>
    <td>${requestScope["product"].getPriceProduct()}</td>
  </tr>
  <tr>
    <td>Description:</td>
    <td>${requestScope["product"].getDescriptionProduct()}</td>
  </tr>
  <tr>
    <td>Producer:</td>
    <td>${requestScope["product"].getProducer()}</td>
  </tr>
</table>
</body>
</html>
