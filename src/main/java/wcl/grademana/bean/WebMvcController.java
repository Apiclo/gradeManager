package wcl.grademana.bean;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcController implements WebMvcConfigurer {
    // 解决127.0.0.1与localhost跨域访问的问题
    // 现已废弃
    @SuppressWarnings("null")
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("http://127.0.0.1:8080")
                .allowedMethods("*");
    }
}
