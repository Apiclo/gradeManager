package wcl.grademana.mapper;

import org.apache.ibatis.annotations.Mapper;

import wcl.grademana.bean.Course;
import wcl.grademana.bean.Teach;
import wcl.grademana.bean.User;

import java.util.List;

@Mapper
public interface TeachMapper {

    List<Teach> getAllTeach();

    void addTeach(String teacherNo, int courseId);

    List<User> getAllTeachers();

    List<Course> getAllCourses();

    List<User> getAllStudents();

    void registerStudents(int courseId, String teacherNo, List<String> students);

    List<User> getStudentsByTeach(String teacherNo, int courseId);

    void removeTeach(String teacherNo, int courseId);
}
