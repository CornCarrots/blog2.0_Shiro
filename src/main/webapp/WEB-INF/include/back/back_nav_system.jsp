<%--
  Created by IntelliJ IDEA.
  User: 林浩
  Date: 2018/10/18
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="back_navigation pull-left">
    <nav>
        <div class="accordion" id="accordion2">
            <div class="accordion-group">
                <a href="${pageContext.request.contextPath}/admin/system/roles">
                    <div class="accordion-heading">
                        角色管理
                    </div>
                </a>
            </div>
            <div class="accordion-group">
                <a href="${pageContext.request.contextPath}/admin/system/modules">
                    <div class="accordion-heading">
                        模块管理
                    </div>
                </a>
            </div>
            <div class="accordion-group">
                <a href="${pageContext.request.contextPath}/admin/system/operations">
                    <div class="accordion-heading">
                        操作管理
                    </div>
                </a>
            </div>

        </div>
    </nav>
</div>