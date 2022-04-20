<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/17/2022
  Time: 7:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Customers Management Application</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>

<h1 style="text-align: center">Customers Management</h1>
<h2 style="text-align: center">
  <a href="/customers?action=create">Add New Customers</a>
</h2>
<form action="/customers" style="text-align: center">
  <input type="hidden" name="action" value="search">
  <input type="text" name="name">
  <input type="submit" value="Seach by name">
</form>

<div align="center">
  <table  class="table" border="1" style="width: 100%;margin: auto">
    <caption><h2>List of Customers</h2></caption>
    <head>
      <tr>
        <th>Id</th>
        <th>Tên khách hàng</th>
        <th>Ngày Sinh</th>
        <th>Giới tính</th>
        <th>Chứng minh nhân dân</th>
        <th>Số điện thoại</th>
        <th>Email</th>
        <th>Dịa chỉ</th>
        <th>Mã loại khách</th>
      </tr>
    </head>
    <body>
    <c:forEach var="customer" items="${listCustomer}">
      <tr>
        <td><c:out value="${customer.id}"/></td>
        <td><c:out value="${customer.name}"/></td>
        <td><c:out value="${customer.birthday}"/></td>
        <td><c:out value="${customer.gender}"/></td>
        <td><c:out value="${customer.card}"/></td>
        <td><c:out value="${customer.phone}"/></td>
        <td><c:out value="${customer.email}"/></td>
        <td><c:out value="${customer.dress}"/></td>
        <td><c:out value="${customer.idType}"/></td>
        <td>
          <a href="/customers?action=edit&id=${customer.id}">Edit</a>
          <button onclick="deleteCustomerModal(${customer.id},'${customer.name}')" type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
            Delete
          </button>
        </td>
      </tr>
    </c:forEach>
    </body>
  </table>
  <form action="/customers">
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Delete customer?</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <input type="hidden" name="id" id="idCustomerDelete">
            <input type="hidden" name="action" value="delete">
            Do you want to delete this customer? <br>
            Customer id: <p id="idCustomer"></p>
            Customer name: <p id="nameCustomer"></p>
            <p>Can not undo</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Delete</button>
          </div>
        </div>
      </div>
    </div>
  </form>
</div>
</body>
<script>
  function deleteCustomerModal(id, name) {
    document.getElementById("idCustomer").innerText = id;
    document.getElementById("idCustomerDelete").value = id;
    document.getElementById("nameCustomer").innerText = name;
  }
</script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</html>
