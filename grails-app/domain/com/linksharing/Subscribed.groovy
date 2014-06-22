package com.linksharing

import grails.orm.PagedResultList
import org.grails.datastore.mapping.query.api.Criteria

class Subscribed {
    String interestLevel
    Date createdDate = new Date()
    static belongsTo = [user: User, topic: Topic]

    static mapping = {}
    static constraints = {}

    public static List<Topic> getHotTopics(Integer offset) {
        List<Topic> hotTopics = []
        def subscribedList = Subscribed.createCriteria().list([max:5,offset:offset]) {
            projections {
                groupProperty('topic')
                rowCount('total')
            }
            order('total', 'desc')
            'topic'{
                eq('visibility', 'public')
            }
        }
        hotTopics = subscribedList.collect{it[0]}
        return hotTopics
    }

    public static int hotTopicCount(){

       Integer hotTopicCount = Subscribed.createCriteria().list(){
           projections {
               groupProperty('topic')
           }
           'topic'{
               eq('visibility', 'public')
           }
       }.size()

        return hotTopicCount
    }

   public static List<User> getPopularAuthors(){
       List<User> popularUsers=new ArrayList()
       def subscribedList = Subscribed.createCriteria().list {
           projections {
               groupProperty('topic')
               rowCount('total')
           }
           order('total', 'desc')
       }

       subscribedList.each {
           if(!popularUsers.contains(it[0].user))
           popularUsers.add(it[0].user)
       }
       return popularUsers
   }

    public static long getTotalSubscriber(User user){
        println 'userName:'+user.firstName
        long totalSubscriber = Subscribed.createCriteria().count(){
            'topic'{
                eq('user', user)
            }
            rowCount()
        }
        return totalSubscriber
    }

}
