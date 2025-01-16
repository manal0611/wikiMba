package wikisimple

class User {
    String username
    String password
    String email
    Date dateCreated

    static hasMany = [roles: Role, revisions: Revision]

    static constraints = {
        username blank: false, unique: true
        password blank: false
        email blank: false, email: true, unique:true
    }

    static mapping =  {
        password column: '`password`'
    }

    @Override
    String toString(){
        return username
    }
}
