package wcl.grademana.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import wcl.grademana.utils.Locals;

import org.springframework.web.servlet.HandlerInterceptor;

public class UniversalInterceptor implements HandlerInterceptor {

    @SuppressWarnings("null")
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        Locals.servletRequest.set(request);
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }

}
