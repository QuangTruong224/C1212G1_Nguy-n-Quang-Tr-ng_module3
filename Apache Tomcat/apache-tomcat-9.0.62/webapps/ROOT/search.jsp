<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/15/2022
  Time: 12:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>
  <a href="/product">Back to product list</a>
</p>
<table border="1">
  <tr>
    <td>Name</td>
    <td>Price</td>
    <td>Description</td>
    <td>Producer</td>
    <td>Edit</td>
    <td>Delete</td>
  </tr>
  <c:forEach items='${requestScope["products"]}' var="product">
    <tr>
      <td><a href="/product?action=view&id=${product.getIdProduct()}">${product.getNameProduct()}</a></td>
      <td>${product.getPriceProduct()}</td>
      <td>${product.getDescriptionProduct()}</td>
      <td>${product.getProducer()}</td>
      <td><a href="/product?action=edit&id=${product.getIdProduct()}">edit</a></td>
      <td><a href="/product?action=delete&id=${product.getIdProduct()}">delete</a></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
