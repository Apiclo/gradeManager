package wcl.grademana.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import wcl.grademana.Result;
import wcl.grademana.bean.StudentCourseAndScore;
import wcl.grademana.bean.User;
import wcl.grademana.mapper.StudentMapper;
import wcl.grademana.utils.Locals;

import java.util.List;

@RestController
@RequestMapping("/api/student")
public class StudentController {

    @Autowired
    private StudentMapper mapper;

    @GetMapping("/scores")
    public Result getAllScores() {
        List<StudentCourseAndScore> scaList = mapper.getAllScores(getNo());
        return Result.success(scaList);
    }

    private String getNo() {
        return ((User) Locals.servletRequest.get().getSession().getAttribute("user")).getNo();
    }

}
