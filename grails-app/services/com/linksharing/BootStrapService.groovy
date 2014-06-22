package com.linksharing

import grails.transaction.Transactional

@Transactional
class BootStrapService {

    public List<User> userEntry() {
        println 'from start of userEntry'
        User admin = User.findByUsername('admin') ?: new User(
                username: 'admin',
                country: 'India',
                emailId: 'sanjeev.jha@intelligrape.com',
                firstName: 'Amit',
                lastName: 'Tripathi',
                state: 'Delhi',
                gender: 'male',
                mobile: '8802668433',
                password: 'admin',
                enabled: true).save(failOnError: true)
        User user1 = User.findByUsername('sanjeev') ?: new User(
                username: 'sanjeev',
                country: 'India',
                emailId: 'skj.it31@gmail.com',
                firstName: 'Sanjeev',
                lastName: 'Jha',
                state: 'Delhi',
                gender: 'male',
                mobile: '8802668433',
                password: 'sanjeev',
                enabled: true).save(failOnError: true)
        User user2 = User.findByUsername('manoj') ?: new User(
                username: 'manoj',
                country: 'India',
                emailId: 'manoj@gmail.com',
                firstName: 'Manoj',
                lastName: 'Kumar',
                state: 'Delhi',
                gender: 'male',
                mobile: '8802668433',
                password: 'manoj',
                enabled: true).save(failOnError: true)
        User user3 = User.findByUsername('salil') ?: new User(
                username: 'salil',
                country: 'India',
                emailId: 'salil@gmail.com',
                firstName: 'Salil',
                lastName: 'Kaliya',
                state: 'Delhi',
                gender: 'male',
                mobile: '8802668433',
                password: 'salil',
                enabled: true).save(failOnError: true)
        User user4 = User.findByUsername('lokendra') ?: new User(
                username: 'lokendra',
                country: 'India',
                emailId: 'lokendra@gmail.com',
                firstName: 'Lokendra',
                lastName: 'Kumar',
                state: 'Delhi',
                gender: 'male',
                mobile: '8802668433',
                password: 'lokendra',
                enabled: true).save(failOnError: true)
        println 'from end of userEntry'
        return [admin, user1, user2, user3, user4]

    }

    public List<Topic> topicEntry(List<User> users) {
        println 'from start of topicEntry'

        List topics = []
        if (Topic.count() < 1)
            users.each { it ->

                if (it.username == 'admin') {
                    Topic topic1 = new Topic(name: 'java1', visibility: 'public', summery: 'java is plateform independent language', user: it)
                    Topic topic2 = new Topic(name: 'grails1', visibility: 'public', summery: 'java is plateform independent language', user: it)
                    Topic topic3 = new Topic(name: 'C++1', visibility: 'public', summery: 'java is plateform independent language', user: it)
                    Topic topic4 = new Topic(name: 'Groovy1', visibility: 'public', summery: 'java is plateform independent language', user: it)
                    Topic topic5 = new Topic(name: '.Net1', visibility: 'public', summery: 'java is plateform independent language', user: it)

                    topic1.addToSubscribers(new Subscribed(interestLevel: 'active', user: it)).save(failOnError: true)
                    topic2.addToSubscribers(new Subscribed(interestLevel: 'active', user: it)).save(failOnError: true)
                    topic3.addToSubscribers(new Subscribed(interestLevel: 'active', user: it)).save(failOnError: true)
                    topic4.addToSubscribers(new Subscribed(interestLevel: 'active', user: it)).save(failOnError: true)
                    topic5.addToSubscribers(new Subscribed(interestLevel: 'active', user: it)).save(failOnError: true)

                    topics.add(topic1)
                    topics.add(topic2)
                    topics.add(topic3)
                    topics.add(topic4)
                    topics.add(topic5)

                }

                if (it.username == 'sanjeev') {
                    Topic topic1 = new Topic(name: 'Node Js2', visibility: 'public', summery: 'java is plateform independent language', user: it)
                    Topic topic2 = new Topic(name: 'AWS2', visibility: 'public', summery: 'java is plateform independent language', user: it)
                    Topic topic3 = new Topic(name: 'CQ2', visibility: 'public', summery: 'java is plateform independent language', user: it)
                    Topic topic4 = new Topic(name: 'C2', visibility: 'public', summery: 'java is plateform independent language', user: it)

                    topic1.addToSubscribers(new Subscribed(interestLevel: 'active', user: it)).save(failOnError: true)
                    topic2.addToSubscribers(new Subscribed(interestLevel: 'active', user: it)).save(failOnError: true)
                    topic3.addToSubscribers(new Subscribed(interestLevel: 'active', user: it)).save(failOnError: true)
                    topic4.addToSubscribers(new Subscribed(interestLevel: 'active', user: it)).save(failOnError: true)

                    topics.add(topic1)
                    topics.add(topic2)
                    topics.add(topic3)
                    topics.add(topic4)
                }

                if (it.username == 'salil') {
                    Topic topic1 = new Topic(name: 'J2ee3', visibility: 'public', summery: 'java is plateform independent language', user: it)
                    Topic topic2 = new Topic(name: 'Spring3', visibility: 'public', summery: 'java is plateform independent language', user: it)
                    Topic topic3 = new Topic(name: 'Hibernate3', visibility: 'public', summery: 'java is plateform independent language', user: it)

                    topic1.addToSubscribers(new Subscribed(interestLevel: 'active', user: it)).save(failOnError: true)
                    topic2.addToSubscribers(new Subscribed(interestLevel: 'active', user: it)).save(failOnError: true)
                    topic3.addToSubscribers(new Subscribed(interestLevel: 'active', user: it)).save(failOnError: true)

                    topics.add(topic1)
                    topics.add(topic2)
                    topics.add(topic3)

                }

                if (it.username == 'manoj') {
                    Topic topic1 = new Topic(name: 'HTML4', visibility: 'public', summery: 'java is plateform independent language', user: it)
                    Topic topic2 = new Topic(name: 'JQuery4', visibility: 'public', summery: 'java is plateform independent language', user: it)

                    topic1.addToSubscribers(new Subscribed(interestLevel: 'active', user: it)).save(failOnError: true)
                    topic2.addToSubscribers(new Subscribed(interestLevel: 'active', user: it)).save(failOnError: true)

                    topics.add(topic1)
                    topics.add(topic2)

                }


            }
        println 'from end of topicEntry'
        return topics
    }

    public void subscriberEntry(List<Topic> topics, List<User> users) {
        println 'from start of subscriberEntry'
        int status = -1;
        topics.each { it ->
            status++
            if (status == 1)
                users.remove(1)
            if (status == 2)
                users.remove(1)
            if (status == 2)
                users.remove(1)
            users.eachWithIndex { item, index ->


                Subscribed subscribed = new Subscribed(user: users.get(index), topic: it, interestLevel: 'active')
                subscribed.save(failOnError: true)

            }

        }
        println 'from end of subscriberEntry'
    }

    def serviceMethod() {

    }
}
