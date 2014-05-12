class BootStrap {

    def init = { servletContext ->
        if (linksharing.Person.count() == 0) {
            new linksharing.Person(firstName: 'EXAMPLE APPLICATIONS John', lastName: 'Doe', age: 20).save()
            new linksharing.Person(firstName: 'Jane', lastName: 'Smith', age: 18).save()
            new linksharing.Person(firstName: 'Simple Scott', lastName: 'Robinson', age:42).save()
        }
    }
    def destroy = {
    }
}
