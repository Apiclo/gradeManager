package wcl.grademana.utils;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import wcl.grademana.interceptor.AuthInterceptor;
import wcl.grademana.interceptor.UniversalInterceptor;

@Configuration
public class MyInterceptorRegistry implements WebMvcConfigurer {

    @SuppressWarnings("null")
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new UniversalInterceptor());
        registry.addInterceptor(new AuthInterceptor());
        WebMvcConfigurer.super.addInterceptors(registry);
    }

}
