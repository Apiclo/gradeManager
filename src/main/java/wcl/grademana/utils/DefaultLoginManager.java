package wcl.grademana.utils;

import jakarta.servlet.http.HttpSession;
import wcl.grademana.bean.User;
import wcl.grademana.mapper.UserMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;

@SuppressWarnings("unused")
@Component
public class DefaultLoginManager implements LoginManager {

    @Autowired
    private UserMapper mapper;

    @Override
    public User tryLogin(String no, String password) {
        User user = mapper.getUserByUsernameAndPassword(no, hashSecu.shaEncode(password));
        HttpSession session = Locals.servletRequest.get().getSession(user != null);
        if (session != null)
            session.setAttribute("user", user);
        return user;
    }

    @Override
    public String getName() {
        return ((User) Locals.servletRequest.get().getAttribute("user")).getName();
    }

}
