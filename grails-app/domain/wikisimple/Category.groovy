package wikisimple

class Category {
    String name

    static hasMany = [articles: Article]
    static belongsTo = Article  // Ajoutez cette ligne

    static constraints = {
        name blank: false, unique: true
    }

    @Override
    String toString() {
        return name
    }
}