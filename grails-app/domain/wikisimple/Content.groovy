package wikisimple

class Content {
    String body

    static belongsTo = [article: Article]

    static constraints = {
        body blank: false
        article nullable: true
    }

    static mapping = {
        body type: 'text'
    }
}
