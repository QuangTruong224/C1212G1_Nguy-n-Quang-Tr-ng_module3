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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap413/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/datatables/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css"></head>
<body>
<center>
  <h1>Customer Management</h1>
  <h2>
    <a href="/customers?action=create">Add New Customer</a>
  </h2>
</center>

<div align="center" class="container">
  <div class="row">
    <div class="col-lg-12">
      <table id="tableStudent" class="table table-striped m-4" style="width:100%">
        <caption><h2>List of Customer</h2></caption>
        <thead>
        <tr>
          <th>STT</th>
          <th>Loại khách hàng</th>
          <th>Tên khách hang</th>
          <th>Ngày sinh</th>
          <th>Giới tính</th>
          <th>Căn cước công dân</th>
          <th>Số điện thoại</th>
          <th>Email</th>
          <th>Địa chỉ</th>
          <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${customerList}">
          <tr>
            <td><c:out value="${customer.customerId}"/></td>
            <td><c:out value="${customer.customerTypeId}"/></td>
            <td><c:out value="${customer.customerName}"/></td>
            <td><c:out value="${customer.customerBirthday}"/></td>
            <td><c:out value="${customer.customerGender}"/></td>
            <td><c:out value="${customer.customerIdCard}"/></td>
            <td><c:out value="${customer.customerPhone}"/></td>
            <td><c:out value="${customer.customerEmail}"/></td>
            <td><c:out value="${customer.customerAddress}"/></td>
            <td>
              <a href="/customers?action=update&customerId=${customer.customerId}">
                <button class="btn-primary">Edit</button>
              </a>
              <button onclick="deleteCustomer(${customer.customerId},'${customer.customerName}')"
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
<form action="/customers?action=delete" method="post">
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
          Are you sure delete <span class="text-danger" id="name-customer"></span> ?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          <button onclick="submitFormDelete()" type="button" class="btn btn-danger">Delete</button>
        </div>
      </div>
    </div>
  </div>
</form>



<form hidden id="form-delete" action="/customers?action=delete">
  <input type="text" name="action" value="delete">
  <input type="text" name="customerId" id="id-customer">
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
  function deleteCustomer(id, name) {
    document.getElementById("id-customer").value = id;
    document.getElementById("name-customer").innerText = name;
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
