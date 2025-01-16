package wikisimple


class Role {
    String name

    static hasMany = [users: User]

    static constraints = {
        name blank: false, unique: true
    }

    @Override
    String toString(){
        return name
    }

}
