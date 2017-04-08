package exception;

import dto.SeckillExecution;
import entity.SuccessKilled;

/**
 * 重复秒杀异常
 * Created by Zz on 2017/4/8 0008.
 */
public class RepeatKillException extends SeckillException {

    public RepeatKillException(String message) {
        super(message);
    }

    public RepeatKillException(String message, Throwable cause) {
        super(message, cause);
    }
}