<%--
  Created by IntelliJ IDEA.
  User: 林浩
  Date: 2018/9/21
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<header class="back_header">
    <span class="header_Bigtitle"><a href="${pageContext.request.contextPath}/admin/index">博客后台</a></span>
    <span class="btn bg-primary"><a href="${pageContext.request.contextPath}/home">前台</a></span>
    <c:forEach items="${user.roles}" var="role">
        <c:if test="${role.id eq 3 or role.id eq 1 or role.id eq 2}">
            <span class="btn bg-primary"><a href="${pageContext.request.contextPath}/admin/blog/articles">博客管理</a></span>
        </c:if>
        <c:if test="${role.id eq 4 or role.id eq 1 or role.id eq 2}">
            <span class="btn bg-primary"><a href="${pageContext.request.contextPath}/admin/show/menus">前台管理</a></span>
        </c:if>
        <c:if test="${role.id eq 5 or role.id eq 1 or role.id eq 2}">
            <span class="btn bg-primary"><a href="${pageContext.request.contextPath}/admin/comments">评论管理</a></span>
        </c:if>
        <c:if test="${role.id eq 6 or role.id eq 1 or role.id eq 2}">
            <span class="btn bg-primary"><a href="${pageContext.request.contextPath}/admin/links">链接管理</a></span>
        </c:if>
        <c:if test="${role.id eq 7 or role.id eq 1 or role.id eq 2}">
            <span class="btn bg-primary"><a href="${pageContext.request.contextPath}/admin/notices">公告管理</a></span>
        </c:if>
        <c:if test="${role.id eq 8 or role.id eq 1 or role.id eq 2}">
            <span class="btn bg-primary"><a href="${pageContext.request.contextPath}/admin/users">用户管理</a></span>
        </c:if>
        <c:if test="${role.id eq 9 or role.id eq 1 or role.id eq 2}">
            <span class="btn bg-primary"><a href="${pageContext.request.contextPath}/admin/system/roles">系统管理</a></span>
        </c:if>
    </c:forEach>
    <div class="btn-group">
        <a class="btn btn-success  dropdown-toggle" data-toggle="dropdown" href="#">
            新建
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><a href="${pageContext.request.contextPath}/admin/blog/articles/page/add">文章</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/blog/categories#insert">分类</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/blog/tags/#insert">标签</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/notices/page/add">公告</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/links/page/add">链接</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/show/menus/page/add">菜单</a></li>
        </ul>
    </div>
    <span class="pull-right">
        <span>
            <img src="${pageContext.request.contextPath}/${user.userPhoto}" alt="" width="30px" height="30px">
            <span style="color: white">${user.userName}</span>
        </span>
    <span><a href="${pageContext.request.contextPath}/admin/logout">退出</a></span>
    </span>
    </span>
</header>
