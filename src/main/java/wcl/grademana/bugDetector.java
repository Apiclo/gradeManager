package wcl.grademana;

import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

//返回错误信息
@ControllerAdvice
public class bugDetector {

    @ExceptionHandler(Exception.class)
    public ResponseEntity<Result> error(Exception e) {
        e.printStackTrace();
        return new ResponseEntity<>(Result.error("Internal Error!", null), HttpStatusCode.valueOf(200));
    }

}
