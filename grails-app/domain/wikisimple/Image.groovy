package wikisimple


class Image {

    String url
    String description
    Date uploadDate

    static belongsTo = [article: Article]

    static constraints = {
        url blank: false
        description nullable: true
    }

    static mapping = {
        url type: 'text'
    }
}
