import com.alibaba.fastjson.JSON;
import com.lanou.bean.Message;
import org.junit.Test;

import java.sql.Timestamp;

public class TestFastJSON {

    @Test
    public void testFormatDate() {

        Message message = new Message();
        message.setCreatetime(new Timestamp(System.currentTimeMillis()));

        String jsonString = JSON.toJSONString(message);

        System.out.println(jsonString);
    }

}
