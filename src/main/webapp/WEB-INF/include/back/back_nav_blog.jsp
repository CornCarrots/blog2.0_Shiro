<%--
  Created by IntelliJ IDEA.
  User: 林浩
  Date: 2018/10/18
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="back_navigation pull-left">
    <nav>
        <div class="accordion" id="accordion2">
            <div class="accordion-group">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                    <div class="accordion-heading">
                        文章
                        <div class="triangle-down"></div>
                    </div>
                </a>
                <div id="collapseOne" class="accordion-body collapse in">
                    <div class="accordion-inner">
                        <a href="${pageContext.request.contextPath}/admin/blog/articles">全部文章</a>
                    </div>
                    <div class="accordion-inner">
                        <a href="${pageContext.request.contextPath}/admin/blog/articles/page/add">创建文章</a>
                    </div>
                </div>
            </div>
            <div class="accordion-group">
                <a href="${pageContext.request.contextPath}/admin/blog/categories">
                    <div class="accordion-heading">
                        分类管理
                    </div>
                </a>
            </div>
            <div class="accordion-group">
                <a href="${pageContext.request.contextPath}/admin/blog/tags">
                    <div class="accordion-heading">
                        标签管理
                    </div>
                </a>
            </div>
        </div>
    </nav>
</div>
