<%--
  Created by IntelliJ IDEA.
  User: 林浩
  Date: 2018/10/13
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../include/fore/fore_header.jsp" %>
<div>
    <%@include file="../../include/fore/fore_top.jsp" %>
    <script type="text/javascript">
        function home(){
            location.href=getContentPath()+"/home";
        }
        setTimeout(home,4000)
    </script>
    <img src="${pageContext.request.contextPath}/img/error/erro.jpg" alt="">

<div class="clearfix"></div>
</div>
<%@include file="../../include/fore/fore_footer.jsp" %>

