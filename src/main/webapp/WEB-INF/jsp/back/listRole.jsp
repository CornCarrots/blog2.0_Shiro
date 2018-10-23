<%--
  Created by IntelliJ IDEA.
  User: 林浩
  Date: 2018/10/18
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../include/back/back_header.jsp" %>
<%@include file="../../include/back/back_top.jsp" %>
<%@include file="../../include/back/back_nav_system.jsp" %>

<div class="container">
    <div class="roleList">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/admin/index">首页</a></li>
            <li class="active">角色列表</li>
        </ul>
        <div class="myRole">
            <table class="table table-striped table-bordered table-hover  table-condensed">
                <thead>
                <tr>
                    <th>id</th>
                    <th>角色名</th>
                    <th>角色描述</th>
                    <th class="role_edit">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${roles}" var="role">
                    <tr>
                        <td>
                                ${role.id}
                        </td>
                        <td>
                               ${role.roleName}
                        </td>
                        <td>
                                ${role.roleDesc}
                        </td>
                        <td class="roleEdit">
                            <a class="btn btn-default editPermissionButton" href="${pageContext.request.contextPath}/admin/system/roles/permission/${role.id}">查看权限</a>

                            <a class="btn btn-default editRoleButton" href="${pageContext.request.contextPath}/admin/system/roles/${role.id}">编辑</a>
                            <button class="btn btn-warning deleteRoleOne" data-toggle="modal"
                                    rid="${pageContext.request.contextPath}/admin/system/roles/${role.id}">删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="addRole">
        <div class="panel panel-success">
            <div class="panel-heading">添加角色</div>
            <div class="panel-body" style="padding: 0">
                <form action="${pageContext.request.contextPath}/admin/system/roles" method="post">
                    <table>
                        <tr>
                            <td>
                                <label for="roleName">角色名称<span class="alarm">*</span></label>
                            </td>
                            <td>
                                <input type="text" placeholder="请输入角色名称" name="roleName" id="roleName" class="form-control">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="roleDesc">角色描述</label>
                            </td>
                            <td>
                                <input type="text" placeholder="请输入角色描述" id="roleDesc" class="form-control" name="roleDesc">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <button type="submit" class="btn btn-success">提交</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

    </div>
</div>
<%@include file="../../model/back/back_role_edit.jsp" %>
<%@include file="../../model/back/back_role_delete.jsp" %>
