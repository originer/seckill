package exception;

import dto.SeckillExecution;

/**
 * Created by Zz on 2017/4/8 0008.
 */
public class SeckillCloseException extends SeckillException{
    public SeckillCloseException(String message) {
        super(message);
    }

    public SeckillCloseException(String message, Throwable cause) {
        super(message, cause);
    }
}