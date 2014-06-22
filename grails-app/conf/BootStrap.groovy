import com.linksharing.BootStrapService
import com.linksharing.User
import com.linksharing.UserRole
import com.linksharing.Role
import com.linksharing.Topic

class BootStrap {
    def springSecurityService
     BootStrapService bootStrapService
    def init = { servletContext ->
        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

        List<User> users =   bootStrapService.userEntry()

        if(users){
            users.each { it->

                if(it.username=='admin'){
                    if (!it.authorities.contains(adminRole)) {
                        UserRole.create it, adminRole,true
                    }
                }
                else{
                    if (!it.authorities.contains(userRole)) {
                        UserRole.create it, userRole,true
                    }
                }
            }
        }

        List<Topic> topics  =   bootStrapService.topicEntry(users)
        println topics
        println users


        bootStrapService.subscriberEntry(topics,users)



    }
    def destroy = {
    }
}
