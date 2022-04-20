<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/20/2022
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer Management Application</title>
</head>
<body>
<center>
    <h1>Customer Management</h1>
    <h2>
        <a href="/customers?action=customers">List All Customers</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit Customer
                </h2>
            </caption>
            <c:if test="${customer != null}">
                <input type="hidden" name="id" value="<c:out value='${customer.id}' />"/>
            </c:if>
            <tr>
                <th>Tên khách hàng:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${customer.name}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Ngày sinh:</th>
                <td>
                    <input type="text" name="birthday" size="45"
                           value="<c:out value='${customer.birthday}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Giới tính:</th>
                <td>
                    <input type="text" name="gender" size="15"
                           value="<c:out value='${customer.gender}' />"
                    />
                </td>
            </tr>

            <tr>
                <th>Chứng minh nhân dân:</th>
                <td>
                    <input type="text" name="card" size="15"
                           value="<c:out value='${customer.card}' />"
                    />
                </td>
            </tr>

            <tr>
                <th>Số điện thoại:</th>
                <td>
                    <input type="text" name="phone" size="15"
                           value="<c:out value='${customer.phone}' />"
                    />
                </td>
            </tr>

            <tr>
                <th>Email:</th>
                <td>
                    <input type="text" name="email" size="45"
                           value="<c:out value='${customer.email}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Địa chỉ:</th>
                <td>
                    <input type="text" name="dress" size="15"
                           value="<c:out value='${customer.dress}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Mã loại khách</th>
                <td>
                    <input type="text" name="idType" size="15"
                           value="<c:out value='${customer.idType}' />"
                    />
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
