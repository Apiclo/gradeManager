package wcl.grademana;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

//主程序
@SpringBootApplication
@EnableCaching
public class gradeManaApplication {

    public static void main(String[] args) {
        SpringApplication.run(gradeManaApplication.class, args);
    }

}
