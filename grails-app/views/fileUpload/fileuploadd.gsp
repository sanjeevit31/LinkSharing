<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 26/5/14
  Time: 12:43 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<g:form action="save" method="post" >
    <div class="dialog">
        <table>
            <tbody>
            <!-- SNIP -->
            <tr class="prop">
                <td valign="top" class="name">
                    <label for="author">Author:</label>
                </td>
                <td valign="top"
                    class="value ${hasErrors(bean:entryInstance,
                            field:'author','errors')}">
                    <g:select optionKey="id"
                              from="${User.list()}"
                              name="author.id"
                              value="${entryInstance?.author?.id}" ></g:select>
                </td>
            </tr>
            <!-- SNIP -->
            </tbody>
        </table>
    </div>
</g:form>
</body>
</html>
