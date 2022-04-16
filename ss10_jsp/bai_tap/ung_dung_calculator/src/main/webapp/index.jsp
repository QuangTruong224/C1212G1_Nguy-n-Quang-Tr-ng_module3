<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/13/2022
  Time: 8:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1>Simple Calculator</h1>
  <form method="post" action="/CalculatorServlet">
    <fieldset>
      <legend>Calculator</legend>
      <table>
        <tr>
          <td>First number: </td>
          <td><input name="first-number" type="text"/></td>
        </tr>
        <tr>
          <td>Operator: </td>
          <td>
            <select name="operator">
              <option value="+">Addition</option>
              <option value="-">Subtraction</option>
              <option value="*">Multiplication</option>
              <option value="/">Division</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Second number: </td>
          <td><input name="second-number" type="text"/></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="submit" value="Calculate"/></td>
        </tr>
      </table>
    </fieldset>
  </form>
  </body>
</html>
