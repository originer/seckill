package dao;

import entity.SuccessKilled;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Zz on 2017/4/7 0007.
 */
public interface SuccessKilledDao {
    /**
     * 插入购买明细（可过滤重复）
     * @param seckillId
     * @param userPhone
     * @return
     */
    int insertSuccessKilled(@Param("seckillId") long seckillId,@Param("userPhone") long userPhone);

    /**
     * 根据id查询SuccessKilled并携带秒杀产品对象
     * @param seckillId
     * @return
     */
    SuccessKilled queryByIdWithSeckill(@Param("seckillId") long seckillId,@Param("userPhone") long userPhone);


}
