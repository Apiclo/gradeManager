package wcl.grademana.mapper;

import org.apache.ibatis.annotations.Mapper;

import wcl.grademana.bean.Course;

import java.util.List;

@Mapper
public interface CourseMapper {

    List<Course> getAllCourse();

    void addCourse(String name, int courseScore, int courseTime);

    void deleteCourse(int id);
}
