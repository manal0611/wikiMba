package wikisimple


class Article {
    String title
    Content content
    Date dateCreated
    Date lastUpdated

    static hasMany = [categories: Category, images: Image, revisions: Revision]

    static constraints = {
        title blank: false, unique: true
        content blank: false
    }
    static mapping = {
        content type: 'text'
    }

    @Override
    String toString() {
        return title
    }




}
