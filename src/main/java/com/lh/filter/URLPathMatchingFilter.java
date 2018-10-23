package com.lh.filter;

import com.lh.service.PermissionService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.HttpMethodPermissionFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class URLPathMatchingFilter extends HttpMethodPermissionFilter {
    @Autowired
    PermissionService permissionService;

    @Override
    public boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        String requestURL = getPathWithinApplication(request);
        String requestMethod = getHttpMethodAction(request);
        System.out.println(requestURL+"-"+requestMethod);
        Subject subject = SecurityUtils.getSubject();
        if (!subject.isAuthenticated()) {
            System.out.println("未登录");
            WebUtils.issueRedirect(request, response, "/loginPage");
            return false;
        } else {
            System.out.println("已登录");
            boolean need = permissionService.needInterceptor(requestURL);
            if (!need)
            {
                System.out.println("无需拦截");
                return true;
            }
            else {
                System.out.println("需要拦截");
                boolean hasPermission = permissionService.hasPermission(subject.getPrincipal().toString(), requestURL, requestMethod);
                if (hasPermission)
                {
                    System.out.println("拥有权限");
                    return true;
                }

                else {
                    System.out.println("没有权限");
                    UnauthorizedException ex = new UnauthorizedException("当前用户没有访问路径 " + requestMethod + " 的权限");
                    subject.getSession().setAttribute("ex", ex);
                    WebUtils.issueRedirect(request, response, "/unauthorized");
                    return false;
                }
            }
        }

    }
}
