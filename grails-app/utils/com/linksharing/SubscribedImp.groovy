package com.linksharing

/**
 * Created by sanjeev on 20/5/14.
 */
class SubscribedImp {
    public static boolean subscriptionuniquness(Subscribed subscribed){

        println 'from subscriptionuniquness'
        def flag= Subscribed.findByNewUsersAndTopic(subscribed.newUsers,subscribed.topic)
        if(flag!=null)
        return true
        else
        return false
    }
}
