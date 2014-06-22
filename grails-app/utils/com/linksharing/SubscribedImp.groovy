package com.linksharing

/**
 * Created by sanjeev on 20/5/14.
 */
class SubscribedImp {
    public static boolean isUserSubscribed(Subscribed subscribed){
        return Subscribed.countByUserAndTopic(subscribed.user,subscribed.topic)>0

    }
}
