package wcl.grademana.mapper;

import org.apache.ibatis.annotations.Mapper;

import wcl.grademana.bean.Course;
import wcl.grademana.bean.StatisticInfo;
import wcl.grademana.bean.StudentScore;

import java.util.List;

@Mapper
public interface TeacherMapper {
    List<Course> getTeacherCourses(String teacherNo);

    List<StudentScore> getStudentScores(String teacherNo, int courseId);

    void updateScore(int courseId, Integer score, String studentNo, String teacherNo);

    StatisticInfo getStatisticInfo(int courseId, String teacherNo);
}
