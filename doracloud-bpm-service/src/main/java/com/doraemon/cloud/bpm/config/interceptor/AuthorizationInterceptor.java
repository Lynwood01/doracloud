package com.doraemon.cloud.bpm.config.interceptor;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * @Description: 权限拦截器
 * @Author lw
 * @date 2018/8/25 12:31
 */
@Component
public class AuthorizationInterceptor implements HandlerInterceptor {
    private  static final Logger LOG= LoggerFactory.getLogger(AuthorizationInterceptor.class);

    private static final String OPTIONS = "OPTIONS";
    private static final String AUTH_PATH1 = "/auth";
    private static final String AUTH_PATH2 = "/oauth";
    private static final String AUTH_PATH3 = "/error";
    private static final String AUTH_PATH4 = "/api";
    private static final String LOGIN_PATH = "/login";
    private static final String INDEX_PATH = "/index";

    /**
     * After completion.
     *
     * @param request  the request
     * @param response the response
     * @param arg2     the arg 2
     * @param ex       the ex
     *
     * @throws Exception the exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception ex) throws Exception {
        if (ex != null) {
            LOG.error("<== afterCompletion - 解析token失败. ex={}", ex.getMessage(), ex);
            this.handleException(response);
        }
    }

    /**
     * Pre handle boolean.
     *
     * @param request  the request
     * @param response the response
     * @param handler  the handler
     *
     * @return the boolean
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException{
        String uri = request.getRequestURI();
        LOG.info("<== preHandle - 权限拦截器.  url={}", uri);
       if (uri.contains(INDEX_PATH) || uri.contains(LOGIN_PATH)||uri.contains(AUTH_PATH1) || uri.contains(AUTH_PATH2)
               || uri.contains(AUTH_PATH3) || uri.contains(AUTH_PATH4)) {
            LOG.info("<== preHandle - 配置URL不走认证.  url={}", uri);
            return true;
        }
        Object user=request.getSession().getAttribute("user");
        if (null!=user) {
            LOG.info("<== preHandle - 用户已经登录成功不走认证.  user={}", user);
            return true;
        }
        LOG.info("<== preHandle - 权限拦截器.  url={}", uri);
        response.sendRedirect(request.getContextPath()+"/modelIndex");
//        LOG.info("<== preHandle - 调试模式不走认证.  OPTIONS={}", request.getMethod().toUpperCase());

//        if (OPTIONS.equalsIgnoreCase(request.getMethod())) {
//            LOG.info("<== preHandle - 调试模式不走认证.  url={}", uri);
//            return true;
//        }

       /* if (isHaveAccess(handler)) {
            LOG.info("<== preHandle - 不需要认证注解不走认证.  token={}");
            return true;
        }*/

//        String token = StringUtils.substringAfter(request.getHeader(HttpHeaders.AUTHORIZATION), "Bearer ");
//        LOG.info("<== preHandle - 权限拦截器.  token={}", token);
//        LoginAuthDto loginUser = (UserTokenDto) redisTemplate.opsForValue().get(RedisKeyUtil.getAccessTokenKey(token));
       /* if (loginUser == null) {
            LOG.error("获取用户信息失败, 不允许操作");
            return false;
        }*/
//        LOG.info("<== preHandle - 权限拦截器.  loginUser={}", loginUser);
//        ThreadLocalMap.put(GlobalConstant.Sys.TOKEN_AUTH_DTO, loginUser);
//        LOG.info("<== preHandle - 权限拦截器.  url={}, loginUser={}", uri, loginUser);
        return false;
    }

    private void handleException(HttpServletResponse res) throws IOException {
        res.resetBuffer();
        res.setHeader("Access-Control-Allow-Origin", "*");
        res.setHeader("Access-Control-Allow-Credentials", "true");
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        res.getWriter().write("{\"code\":100009 ,\"message\" :\"解析token失败\"}");
        res.flushBuffer();
    }

    private boolean isHaveAccess(Object handler) {
        HandlerMethod handlerMethod = (HandlerMethod) handler;

        Method method = handlerMethod.getMethod();

//        NoNeedAccessAuthentication responseBody = AnnotationUtils.findAnnotation(method, NoNeedAccessAuthentication.class);
        return "responseBody" != null;
    }
}
