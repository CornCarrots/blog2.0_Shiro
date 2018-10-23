<%--
  Created by IntelliJ IDEA.
  User: 林浩
  Date: 2018/10/19
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../include/back/back_header.jsp" %>
<%@include file="../../include/back/back_top.jsp" %>
<%@include file="../../include/back/back_nav_system.jsp" %>
<div class="container">
    <div class="operation">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/admin/index">首页</a></li>
            <li ><a href="${pageContext.request.contextPath}/admin/operations">权限列表</a></li>
            <li class="active">添加权限</li>
        </ul>
        <div class="myOperation">
            <table class="table table-striped table-bordered table-hover  table-condensed">
                <thead>
                <tr>
                    <th class="myOperation_id">id</th>
                    <th class="myOperation_name">模块名称</th>
                    <th class="myOperation_desc">模块描述</th>
                    <th class="myOperation_edit">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${operations}" var="ope">
                    <tr>
                        <td>
                                ${ope.id}
                        </td>
                        <td>
                                ${ope.operationName}
                        </td>
                        <td>
                                ${ope.operationDesc}
                        </td>
                        <td>
                            <button class="btn btn-default editOneOperation" data-toggle="modal" oid="${ope.id}">编辑</button>
                            <button class="btn btn-warning deleteOneOperation" oid="${pageContext.request.contextPath}/admin/system/operations/${ope.id}">删除</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <%@include file="../../include/back/BackPage.jsp" %>
        <div class="addOperation">
            <div class="panel panel-success">
                <div class="panel-heading">添加模块</div>
                <div class="panel-body" style="padding: 0">
                    <form action="${pageContext.request.contextPath}/admin/system/operations" method="post">
                        <table>
                            <tr>
                                <td>
                                    <label for="operationName">权限名称<span class="alarm">*</span></label>
                                </td>
                                <td>
                                    <input type="text" placeholder="请输入权限名称" name="operationName" id="operationName" class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="operationDescripate">权限描述</label>
                                </td>
                                <td>
                                    <input type="text" placeholder="请输入权限描述" id="operationDescripate" class="form-control" name="operationDesc">
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
        <a name="insert"></a>
    </div>
</div>
<%@include file="../../model/back/back_operation_edit.jsp" %>
<%@include file="../../model/back/back_operation_delete.jsp" %>