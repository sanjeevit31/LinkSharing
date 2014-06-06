package com.linksharing

/**
 * Created by sanjeev on 6/6/14.
 */
class HelpUtil {

    public static getApplicationContext(StringBuffer requestUrl){
        int len=requestUrl.lastIndexOf('/')
        len=requestUrl.lastIndexOf('/',len-1)
        len=requestUrl.lastIndexOf('/',len-1)
        String applicationContext   =   requestUrl.substring(0,len)
        return applicationContext
    }
}
