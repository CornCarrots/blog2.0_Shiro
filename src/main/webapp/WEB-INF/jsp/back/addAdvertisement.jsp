<%--
  Created by IntelliJ IDEA.
  User: 林浩
  Date: 2018/10/18
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../include/back/back_header.jsp" %>
<%@include file="../../include/back/back_top.jsp" %>
<%@include file="../../include/back/back_nav_show.jsp" %>
<div class="container">
    <div class="advertisement">
        <table class="table table-bordered table-hover table-striped table-condensed">
            <thead>
            <tr>
                <th>order</th>
                <th>图片</th>
                <th>编辑</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${advertisements}" var="adv" varStatus="st">
                <tr>
                    <td>${adv.advertisementRole}</td>
                    <td><img height="160px" width="400px" src=${pageContext.request.contextPath}/${adv.advertisementPath}></td>
                    <td><a href="${pageContext.request.contextPath}/admin/show/advertisements/${adv.id}" class="editAdvButton"><span class="glyphicon glyphicon-edit"></span></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%@include file="../../model/back/back_advertise_edit.jsp" %>