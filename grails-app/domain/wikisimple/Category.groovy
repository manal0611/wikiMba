package wikisimple


class Category {
    String name

    static hasMany = [articles: Article]

    static constraints = {
        name blank: false, unique: true
    }

    @Override
    String toString() {
        return name
    }
}
