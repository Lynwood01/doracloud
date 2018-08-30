package com.doraemon.cloud.bpm.config;

import com.doraemon.cloud.bpm.config.interceptor.AuthorizationInterceptor;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.ResourceUtils;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.annotation.Resource;


/**
 * @Description:
 * @Author lw
 * @date 2018/8/23 15:45
 */
//@Configuration
//@EnableWebMvc
//@ComponentScan(basePackages = {"com.doraemon.cloud.bpm.config.interceptor"})
public class WebConfig extends WebMvcConfigurerAdapter {

    @Resource
    private AuthorizationInterceptor authorizationInterceptor;
    /**
     * Add interceptors.
     *
     * @param registry the registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
       super.addInterceptors(registry);
        registry.addInterceptor(authorizationInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/swagger-resources/**", "*.js", "/**/*.js", "*.css", "/**/*.css", "*.html", "/**/*.html");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**")
                .addResourceLocations(ResourceUtils.CLASSPATH_URL_PREFIX +"/META-INF/resources/",
                        ResourceUtils.CLASSPATH_URL_PREFIX +"../resources/",
                        ResourceUtils.CLASSPATH_URL_PREFIX + "/static/",
                        ResourceUtils.CLASSPATH_URL_PREFIX + "/templates/");
    }


//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        // 自定义拦截器，添加拦截路径和排除拦截路径
//        registry.addInterceptor(authorizationInterceptor).addPathPatterns("/**").excludePathPatterns("/static/**");
//    }



}
