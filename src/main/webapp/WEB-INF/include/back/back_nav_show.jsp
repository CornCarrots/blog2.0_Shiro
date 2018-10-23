<%--
  Created by IntelliJ IDEA.
  User: 林浩
  Date: 2018/10/18
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="back_navigation pull-left">
    <nav>
        <div class="accordion" id="accordion2">
            <div class="accordion-group">
                <a href="${pageContext.request.contextPath}/admin/show/menus">
                    <div class="accordion-heading">
                        菜单管理
                    </div>
                </a>
            </div>
            <div class="accordion-group">
                <a href="${pageContext.request.contextPath}/admin/show/advertisements">
                    <div class="accordion-heading">
                        广告管理
                    </div>
                </a>
            </div>
            <div class="accordion-group">
                <a href="${pageContext.request.contextPath}/admin/show/options">
                    <div class="accordion-heading">
                        信息管理
                    </div>
                </a>
            </div>
        </div>
    </nav>
</div>
