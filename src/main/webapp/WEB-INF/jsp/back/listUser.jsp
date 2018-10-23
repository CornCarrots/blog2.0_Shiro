<%--
  Created by IntelliJ IDEA.
  User: 林浩
  Date: 2018/9/27
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../include/back/back_header.jsp" %>
<%@include file="../../include/back/back_top.jsp" %>
<%@include file="../../include/back/back_nav_user.jsp" %>
<div class="container">
    <div class="userList">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/admin/index">首页</a></li>
            <li class="active">用户列表</li>
        </ul>
        <div class="myUser">
            <table class="table table-striped table-bordered table-hover  table-condensed">
                <thead>
                <tr>
                    <th>id</th>
                    <th>用户</th>
                    <th>昵称</th>
                    <th>电子邮件</th>
                    <th>文章</th>
                    <th>状态</th>
                    <th>角色</th>
                    <th style="width: 26%;">编辑</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${users}" var="user">
                    <script>

                    </script>
                    <tr>
                        <td>
                            ${user.id}
                        </td>
                        <td style="display:none;">
                            ${user.userName}
                        </td>
                        <td style="display:none;">
                            ${user.userPassword}
                        </td>
                        <td class="userImage">
                            <img src="${pageContext.request.contextPath}/${user.userPhoto}" alt="" width="48px" height="48px">
                            <a href="${pageContext.request.contextPath}/home/users/${user.id}">${user.userName}</a>
                        </td>
                        <td>
                            ${user.userNickName}
                        </td>
                        <td>
                            ${user.userEmail}
                        </td>
                        <td>
                            ${user.articles.size()}
                        </td>
                        <td>
                            ${user.userStatusDesc()}
                        </td>
                        <td>
                            <c:forEach items="${user.roles}" var="role">
                                ${role.roleDesc}
                                <br>
                            </c:forEach>
                        </td>
                        <td class="userEdit">
                            <div class="dropdown bootstrap-select">
                                <select class="selectpicker userRole" multiple data-style="btn-success" tabindex="-98" uid="${pageContext.request.contextPath}/admin/users/role/${user.id}">
                                    <c:forEach items="${roles}" var="role">
                                        <c:set var="found" value="false"></c:set>
                                        <c:set var = "endid" value="${fn:length(user.roles)}"/>
                                        <c:forEach items="${user.roles}" var="role1" end="${endid}">
                                            <c:if test="${role.id eq role1.id}">
                                                <c:set var="found" value="true"></c:set>
                                                <c:set var="endid" value="0"></c:set>
                                            </c:if>
                                        </c:forEach>
                                        <option value="${role.id}" <c:if test="${found eq 'true'}">selected</c:if>>${role.roleDesc}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <button class="btn btn-warning deleteUserOne" data-toggle="modal"
                                    uid="${pageContext.request.contextPath}/admin/users/${user.id}">删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@include file="../../model/back/back_user_delete.jsp" %>