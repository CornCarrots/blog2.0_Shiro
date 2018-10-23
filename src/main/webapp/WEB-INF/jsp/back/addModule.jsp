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
    <div class="module">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/admin/index">首页</a></li>
            <li ><a href="${pageContext.request.contextPath}/admin/modules">模块列表</a></li>
            <li class="active">添加模块</li>
        </ul>
        <div class="myModule">
            <table class="table table-striped table-bordered table-hover  table-condensed">
                <thead>
                <tr>
                    <th class="myModule_id">id</th>
                    <th class="myModule_pid">pid</th>
                    <th class="myModule_name">模块名称</th>
                    <th class="myModule_desc">模块描述</th>
                    <th class="myModule_status">url</th>
                    <th class="myModule_edit">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${modules}" var="modu">
                    <tr>
                        <td <c:if test="${!empty modu.childs}">class="parentNode"</c:if>>
                                ${modu.id}
                        </td>
                        <td>
                                ${modu.modulePid}
                        </td>
                        <td>
                                ${modu.moduleName}
                        </td>
                        <td>
                                ${modu.moduleDesc}
                        </td>
                        <td>
                                ${modu.moduleUrl}
                        </td>
                        <td>
                            <button class="btn btn-default editOneModule" data-toggle="modal" mid="${modu.id}">编辑</button>
                            <button class="btn btn-warning deleteOneModule" mid="${pageContext.request.contextPath}/admin/system/modules/${modu.id}">删除</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="addModule">
            <div class="panel panel-success">
                <div class="panel-heading">添加模块</div>
                <div class="panel-body" style="padding: 0">
                    <form action="${pageContext.request.contextPath}/admin/system/modules" method="post">
                        <table>
                            <tr>
                                <td>
                                    <label for="moduleName">模块名称<span class="alarm">*</span></label>
                                </td>
                                <td>
                                    <input type="text" placeholder="请输入模块名称" name="moduleName" id="moduleName" class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="moduleParent">父节点<span class="alarm">*</span></label>
                                </td>
                                <td>
                                    <select  class="selectpicker" data-style="btn-success" tabindex="-98" id="moduleParent" name="modulePid">
                                        <option value="0">无</option>
                                        <c:forEach items="${modules}" var="modu">
                                            <option value="${modu.id}">${modu.moduleDesc}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="moduleDescripate">模块描述</label>
                                </td>
                                <td>
                                    <input type="text" placeholder="请输入模块描述" id="moduleDescripate" class="form-control" name="moduleDesc">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="moduleURL">URL</label>
                                </td>
                                <td>
                                    <input type="text" placeholder="请输入模块链接" id="moduleURL" class="form-control" name="moduleUrl">
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
<%@include file="../../model/back/back_module_edit.jsp" %>
<%@include file="../../model/back/back_module_delete.jsp" %>