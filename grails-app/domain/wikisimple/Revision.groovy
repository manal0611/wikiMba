package wikisimple


class Revision {
    Date dateCreated
    Content oldContent
    String oldTitle
    Category oldCategorie

    static belongsTo = [article: Article]

    static constraints = {
        oldTitle nullable: false
        oldContent nullable: false
        oldCategorie nullable: true
    }

    @Override
    String toString() {
        return dateCreated.toString()
    }
}
