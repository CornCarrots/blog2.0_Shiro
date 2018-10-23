<%--
  Created by IntelliJ IDEA.
  User: 林浩
  Date: 2018/10/21
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../include/back/back_header.jsp" %>
<%@include file="../../include/back/back_top.jsp" %>
<%@include file="../../include/back/back_nav_system.jsp" %>
<script>
    $.post(getContentPath() + "/admin/system/roles/permission/${role.id}", {}, function (result) {
        //var t='[{"text": "父节点 1","nId":4,"nodeId":4,"tags":["44"],"nodes": [{"text": "子节点 1","nId":3,"tags":["45"],"nodeId":"2","nodes": [{"text": "孙子节点 1","nId":2,"tags":["42"],"nodeId":"3"},{"text": "孙子节点 2","nId":1,"tags":["41"],"nodeId":"8"}]},{"text": "子节点 2","nId":1,"tags":["45"],"nodeId":"7"}  ]}]';
        if (result.result == "success") {
            t = result.data;
            console.log(t);
            var $checkableTree = $("#treeview-checkable").treeview({
                data: t,
                showTags: true,
                showCheckbox: true,   //是否显示复选框
                highlightSelected: true,    //是否高亮选中
                emptyIcon: '',    //没有子节点的节点图标
                multiSelect: false,    //多选
                checkboxes: true,
                onNodeChecked: nodeChecked,
                onNodeUnchecked: nodeUnchecked,
                onNodeSelected : nodeSelected ,
                onNodeUnSelected : nodeUnselected
            });

        }
    }, 'json');
</script>
<div class="container">
    <div class="roleList">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/admin/index">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/system/roles">角色列表</a></li>
            <li class="active">权限列表</li>
        </ul>
        <div class="myRole">
            <span style="display:none;" id="rid">${role.id}</span>
            <div id="treeview-checkable" style="width: 50%;display: inline-block"></div>
            <div id="showTree" style="float: right;margin-right: 300px">
                <div id="checkBox">
                    <c:forEach items="${operations}" var="ope" varStatus="st">
                        <div class="checkbox checkbox-success" style="margin-bottom: 10px">
                            <input type="checkbox" name="operationCheckBox" class="styled" id="tree_${ope.id}" value="${ope.id}">
                            <label for="${ope.id}"> ${ope.operationDesc} </label>
                        </div>
                    </c:forEach>
            </div>
        </div>
    </div>
</div>
<%@include file="../../model/back/back_role_edit.jsp" %>
<%@include file="../../model/back/back_role_delete.jsp" %>