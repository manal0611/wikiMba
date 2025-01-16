package wikisimple

class Content {
    String body

    static belongsTo = [article: Article]

    static constraints = {
        body blank: false
    }

    static mapping = {
        body type: 'text'
    }
}
