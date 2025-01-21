package wikisimple


class Image {

    String url
    String name

    static belongsTo = [article: Article]

    static constraints = {
        url blank: false
        name nullable: true
    }

    static mapping = {
        url type: 'text'
    }
}
