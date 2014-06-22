package com.linksharing

class Topic {

    String name
    String summery
    String visibility
    Date dateCreated
    Date lastUpdated

    static belongsTo = [user: User]

    static hasMany = [
            subscribers: Subscribed,
            resources: Resource,
            topicInvitations: TopicInvitation]

    static constraints = {
        name blank: false, nullable: false, unique: true
        summery maxSize: 1024
    }

    @Override
    public String toString() {
        return name
    }


    public static List getAuthorsHotTopics(User author) {
        Topic.findAllByUser(author, [sord: 'dateCreated', order: 'desc'])

    }

    public static List<Topic> getUserRecentTopics(User user){

        List<Topic> userRecentTopic = Topic.findAllByUser(user,
                [max: 3, sort: "dateCreated"])

       return userRecentTopic
    }

    public static List<Topic> getUserTopics(User user , Integer offset) {
       List<Topic> userTopics=Topic.createCriteria().list(max:5,offset: offset){
           order('dateCreated','asc')
           eq('user',user)
       }
        println 'size:'+userTopics.size()+'total:'+userTopics.size()
        return userTopics
    }

    public static List getTopicAndTheirSubscriptionCount(User user){
        List subscribedList = Subscribed.createCriteria().list() {
            projections {
                groupProperty('topic')
                rowCount('total')
            }
            order('total', 'desc')
            'topic'{
                eq('user',user)
            }

        }
    return subscribedList
    }

    public static List<Topic> topicSearch(String searchKey,Integer offset){
        println 'from Topic topicSearch'
        List topics=[]
        topics  = Topic.createCriteria().list(max:5,offset: offset){
            or{
                ilike('name' , "%${searchKey}%")
                ilike('visibility',"%${searchKey}%")
                ilike('summery',"%${searchKey}%")
                'user'{
                         or{
                             ilike('firstName',"%${searchKey}%")
                             ilike('lastName',"%${searchKey}%")
                    }
                }
            }
        }
        println 'count....'+topics.totalCount
        return topics

    }

 }
