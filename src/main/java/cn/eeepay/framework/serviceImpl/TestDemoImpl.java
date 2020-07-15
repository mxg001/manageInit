package cn.eeepay.framework.serviceImpl;

import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2019/3/15/015.
 */
@Service("testImpl")
public class TestDemoImpl {

    //事物支持模式，直接配置事物管理对象名称，配置在方法上,针对单条记录开启事物
//    @Transactional(value = "transactionManager")
    public int updateTableOne(String str){
//        int a=happyBackHistoryDao.updateTableOne("1");
//        if(a>0){
//            throw new RuntimeException("aaaa");
//        }
//        int b=happyBackHistoryDao.updateTableTwo("2");
//        System.out.println("aaa");
        return 0;
    }

}
