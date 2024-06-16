package wcl.grademana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FrontendController {

    @GetMapping({ "/index", "/login", "/admin/**", "/teacher/**", "/student/**" })
    public String redirect() {
        return "forward:/index.html";
    }

}
