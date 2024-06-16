package wcl.grademana.controller;

import jakarta.servlet.http.HttpServletRequest;
import wcl.grademana.Result;
import wcl.grademana.bean.User;
import wcl.grademana.mapper.UserMapper;
import wcl.grademana.utils.Locals;
import wcl.grademana.utils.LoginManager;
import wcl.grademana.utils.hashSecu;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SuppressWarnings("unused")
@RestController
// @CrossOrigin(origins = "http://127.0.0.1:8080")
// 将前端写死的127改为windwo.location.host,上一行作废
@RequestMapping("/api")
public class LoginController {

    @Autowired
    private LoginManager loginManager;

    @Autowired
    private UserMapper mapper;

    @PostMapping("/login")
    public Result login(String no, String password) {
        User user = loginManager.tryLogin(no, password);
        if (user == null) {
            return Result.error("Login error!", null);
        }
        return Result.success(user.getRole() + "/" + user.getName());
    }

    @PostMapping("/login/change-password")
    public Result changePassword(String oldPass, String newPass) {
        User user = (User) Locals.servletRequest.get().getSession().getAttribute("user");
        if (user == null) {
            return Result.error("Not Login!", null);
        }
        int changed = mapper.changePasswordNotPrivilege(user.getNo(), hashSecu.shaEncode(oldPass),
                hashSecu.shaEncode(newPass));
        if (changed == 1)
            return Result.success(null);
        return Result.error("Error!", null);
    }

}