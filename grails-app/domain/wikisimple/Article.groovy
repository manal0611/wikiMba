package wikisimple


class Article {
    String title
    Content content
    Date dateCreated

    static hasMany = [categories: Category, images: Image, revisions: Revision]

    static constraints = {
        title blank: false, unique: true
        content blank: false, nullable: true

    }
    static mapping = {
        content type: 'text'
    }

    @Override
    String toString() {
        return title
    }


}
