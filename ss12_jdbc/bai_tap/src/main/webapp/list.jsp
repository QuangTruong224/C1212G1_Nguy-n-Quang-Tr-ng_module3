<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/16/2022
  Time: 8:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>User Management Application</title>--%>
<%--<link  rel="stylesheet"  href="datatables/css/dataTables.bootstrap4.min.css">--%>
<%--    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css">--%>
<%--</head>--%>

<%--<body>--%>

<%--&lt;%&ndash;<h1 style="text-align: center">User Management</h1>&ndash;%&gt;--%>
<%--&lt;%&ndash;<h2 style="text-align: center">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <a href="/users?action=create">Add New User</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;<form action="/users" style="text-align: center">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <input type="hidden" name="action" value="search">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <input type="text" name="country">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <input type="submit" value="Seach by country">&ndash;%&gt;--%>
<%--&lt;%&ndash;</form>&ndash;%&gt;--%>
<%--&lt;%&ndash;<form action="/users" style="padding-left:666px ">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <input type="hidden" name="action" value="sort">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <button type="submit">Sort by name</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;</form>&ndash;%&gt;--%>
<%--&lt;%&ndash;<div class="col-lg-12">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <table id="tableUser" class="table table-striped table-bordered" style="width:100%">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <caption><h2>List of Users</h2></caption>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <thead>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th>ID</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th>Name</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th>Email</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th>Country</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th>Actions</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </thead>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <tbody>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <c:forEach var="user" items="${listUser}">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td><c:out value="${user.id}"/></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td><c:out value="${user.name}"/></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td><c:out value="${user.email}"/></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td><c:out value="${user.country}"/></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td>&ndash;%&gt;--%>

<%--&lt;%&ndash;                <a href="/users?action=edit&id=${user.id}">Edit</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                <a href="/users?action=delete&id=${user.id}">Delete</a>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                <button type="button" class="btn btn-primary" data-bs-toggle="modal"&ndash;%&gt;--%>
<%--&lt;%&ndash;                           onclick="deleteModal(${user.id})"&ndash;%&gt;--%>
<%--&lt;%&ndash;                           data-bs-target="#exampleModal">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    delete&ndash;%&gt;--%>
<%--&lt;%&ndash;                </button>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </c:forEach>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </tbody>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </table>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</body>&ndash;%&gt;--%>
<%--&lt;%&ndash;<form action="/user?action=delete">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div class="modal" tabindex="-1" role="dialog">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="modal-dialog" role="document">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="modal-content">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="modal-header">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <h5 class="modal-title">Modal title</h5>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <span aria-hidden="true">&times;</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="modal-body">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <input type="hidden" name="id" id="idUserDelete">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <p>Modal body text goes here.</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="modal-footer">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <button type="button" class="btn btn-primary">Save changes</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <button type="submit" class="btn btn-secondary" data-dismiss="modal">Close</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</form>&ndash;%&gt;--%>

<%--&lt;%&ndash;<script>&ndash;%&gt;--%>
<%--&lt;%&ndash;    $(document).ready(function() {&ndash;%&gt;--%>
<%--&lt;%&ndash;        $('#tableUSer').dataTable( {&ndash;%&gt;--%>
<%--&lt;%&ndash;            "dom": 'lrtip',&ndash;%&gt;--%>
<%--&lt;%&ndash;            "lengthChange": false,&ndash;%&gt;--%>
<%--&lt;%&ndash;            "pageLength": 3&ndash;%&gt;--%>
<%--&lt;%&ndash;        } );&ndash;%&gt;--%>
<%--&lt;%&ndash;    } );&ndash;%&gt;--%>
<%--&lt;%&ndash;    function deleteModal(id){&ndash;%&gt;--%>
<%--&lt;%&ndash;        document.getElementById(idUser).innerText=id;&ndash;%&gt;--%>
<%--&lt;%&ndash;        document.getElementById(idUserDelete).value=id;&ndash;%&gt;--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>
<%--&lt;%&ndash;</script>&ndash;%&gt;--%>
<%--<script src="jquery/jquery-3.5.1.min.js"></script>--%>
<%--<script src="datatables/js/jquery.dataTables.min.js"></script>--%>
<%--<script src="datatables/js/dataTables.bootstrap4.min.js"></script>--%>

<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>

<h1 style="text-align: center">User Management</h1>
<h2 style="text-align: center">
    <a href="/users?action=create">Add New User</a>
</h2>
<form action="/users" style="text-align: center">
    <input type="hidden" name="action" value="search">
    <input type="text" name="country">
    <input type="submit" value="Seach by country">
</form>
<form action="/users" style="padding-left:666px ">
    <input type="hidden" name="action" value="sort">
    <button type="submit">Sort by name</button>
</form>
<div align="center">
    <table  class="table" border="1" style="width: 100%;margin: auto">
        <caption><h2>List of Users</h2></caption>
        <head>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th>Actions</th>
            </tr>
        </head>
        <body>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <button onclick="deleteUserModal(${user.id},'${user.name}')" type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </body>
    </table>
    <form action="/user">
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete user?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="id" id="idUserDelete">
                        <input type="hidden" name="action" value="delete">
                        Do you want to delete this user? <br>
                        User id: <p id="idUser"></p>
                        User name: <p id="nameUser"></p>
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
    function deleteUserModal(id, name) {
        document.getElementById("idUser").innerText = id;
        document.getElementById("idUserDelete").value = id;
        document.getElementById("nameUser").innerText = name;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</html>
