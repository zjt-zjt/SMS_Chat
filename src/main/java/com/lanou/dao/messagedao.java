package com.lanou.dao;

import com.lanou.bean.Message;
import com.lanou.bean.Paganation;

public interface messagedao {

    Paganation<Message> findByPageWithPhysical(Paganation<Message> pageParam);


}
