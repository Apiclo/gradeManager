package wcl.grademana.mapper;

import org.apache.ibatis.annotations.Mapper;

import wcl.grademana.bean.StudentCourseAndScore;

import java.util.List;

@Mapper
public interface StudentMapper {

    List<StudentCourseAndScore> getAllScores(String studentNo);

}
