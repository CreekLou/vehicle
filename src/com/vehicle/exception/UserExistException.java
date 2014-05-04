package com.vehicle.exception;

/**
 * @author louxuezheng
 */
public class UserExistException extends Exception
{
    public UserExistException(String errorMsg)
    {
        super(errorMsg);
    }
}
