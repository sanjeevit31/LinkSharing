package linksharing

class HelloController {

    def index() {
        Person person = new Person(
                firstName: 'John', lastName:'Doe',
                age:55)
        [ person:person ]
    }
    def show(){
        Person person = new Person(
                firstName: 'Sanjeev kr', lastName:'jha',age:25)

        [ person:person ]

    }
    def list(){
       /* def list = []
        list << new Person(firstName: 'John', lastName:'Doe', age:50)
        list << new Person(firstName: 'Jane', lastName:'Smith', age:45)
        list << new Person(firstName: 'Sam', lastName:'Robinson', age:47)
        [ list:list ]
        */
        def persons=Person.list()

        [persons:persons]

    }
    def form(){
        Person person = new Person(
                firstName: 'John', lastName:'Doe',
                age:55)
        person.save()
        [ person:person ]
    }
    def Save(){
        Person p=new Person(params)
        p.save()
        params.each {it->
            request.getDateHeader()
            render(it)
        }
        render('Success...............'+params.size())

    }
    def test1(){

    }

}
