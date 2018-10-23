<%--
  Created by IntelliJ IDEA.
  User: 林浩
  Date: 2018/10/18
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="back_navigation pull-left">
    <nav>
        <div class="accordion" id="accordion2">
            <div class="accordion-group">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFive">
                    <div class="accordion-heading">
                        链接
                        <div class="triangle-down"></div>

                    </div>
                </a>
                <div id="collapseFive" class="accordion-body collapse in">
                    <div class="accordion-inner">
                        <a href="${pageContext.request.contextPath}/admin/links">全部链接</a>
                    </div>
                    <div class="accordion-inner">
                        <a href="${pageContext.request.contextPath}/admin/links/page/add">添加链接</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</div>
