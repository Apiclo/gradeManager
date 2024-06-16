package wcl.grademana.utils;

import jakarta.servlet.http.HttpServletRequest;
import wcl.grademana.bean.User;

@SuppressWarnings("unused")
public interface LoginManager {

    User tryLogin(String no, String password);

    String getName();
}
