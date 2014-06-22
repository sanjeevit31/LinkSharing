package com.linksharing

class User {

    transient static passwordEncoder
    transient static springSecurityService

    String firstName
    String lastName
    String emailId
    String username
    String password
    String confirmPassword
    String mobile
    String country
    String state
    String gender
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static transients = ['confirmPassword', 'springSecurityService']

    static hasMany = [subscribed: Subscribed, resource: Resource]

    static constraints = {
        firstName blank: false, nullable: false
        lastName blank: false, nullable: false
        emailId blank: false, nullable: false, unique: true
        password nullable: false
        mobile nullable: false;
        country nullable: false
        gender nullable: false
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role }
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }

    protected void encodePassword(String password) {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }

    @Override
    public String toString() {
        return emailId
    }

    public static Map changePassword(Map map) {
        Map responseMap = [:]
        responseMap.status = 'fails'
        int userId = map?.userId
        String oldPassword = map?.oldPassword
        String newPassword = map?.newPassword
        String confirmPassword = map?.confirmPassword

        User user = User.get(springSecurityService.principal.id)
        if ((newPassword == confirmPassword) && (passwordEncoder.isPasswordValid(user.password, oldPassword, null))) {
            println 'CORRECT'
            println 'from if of changePassword2'
            user.password = newPassword
            if (user.save()) {
                responseMap.status = 'success'
            }
        } else
            println 'NOT CORRECT'

        return responseMap

    }
}