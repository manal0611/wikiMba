package wikisimple

class Article {
    String title
    Content content
    Date dateCreated

    static hasMany = [categories: Category, images: Image, revisions: Revision]
    // Ajoutez cette ligne pour définir la relation bidirectionnelle
    static mappedBy = [categories: 'articles']

    static constraints = {
        title blank: false, unique: true
        content blank: false, nullable: true
    }

    static mapping = {
        content type: 'text'
        // Ajoutez ceci pour assurer un chargement EAGER des catégories
        categories lazy: false
    }

    @Override
    String toString() {
        return title
    }
}