package wcl.grademana.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wcl.grademana.bean.Page;
import wcl.grademana.bean.User;
import wcl.grademana.mapper.UserMapper;

import java.util.List;

//翻页用
@Service
public class pageSwither {

    @Autowired
    private UserMapper mapper;

    public Page<User> getUserPage(int pageNum) {
        List<User> users = mapper.getUsersByPage((pageNum - 1) * 15, 15);
        Page<User> page = new Page<>();
        page.setIndices(users);
        // 每15项翻页
        int totalNum = mapper.getTotalNum();
        int totalPageNum = totalNum / 15;
        if (totalNum % 15 != 0)
            totalPageNum++;
        page.setPageNum(totalPageNum);
        return page;
    }

}
