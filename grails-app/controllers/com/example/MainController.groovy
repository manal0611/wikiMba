package com.example

import wikisimple.Article
import wikisimple.Category
import wikisimple.Content
import wikisimple.Image
import wikisimple.Revision

class MainController {

    def index() {
        render(view: "/main/index", model: [
                articles  : Article.list(),
                categories: Category.list()
        ])
    }

    def listArticlesByCategory(Long categoryId) {
        def category = Category.get(categoryId)
        render(view: "/main/index", model: [
                articles        : category ? Article.findAllByCategories(category) : [],
                categories      : Category.list(),
                selectedCategory: category
        ])
    }

    def viewArticle(Long articleId) {
        def article = Article.get(articleId)
        if (!article) {
            flash.message = "Article not found."
            redirect(action: "index")
            return
        }
        render(view: "/main/viewArticle", model: [
                article   : article,
                categories: Category.list(),
                revisions : Revision.findAllByArticle(article),
                images    : Image.findAllByArticle(article)
        ])
    }

    def createArticle() {
        render(view: "/main/createArticle", model: [
                categories: Category.list()
        ])
    }

    def saveArticle() {
        def content = new Content(body: params.body).save(flush: true)
        def article = new Article(
                title: params.title,
                content: content
        )

        params.categories?.each { categoryId ->
            article.addToCategories(Category.get(categoryId))
        }

        if (article.save(flush: true)) {
            redirect(action: "index")
        } else {
            flash.message = "Erreur lors de la création de l'article."
            render(view: "/main/createArticle", model: [categories: Category.list()])
        }
    }

    def editArticle(Long articleId) {
        def article = Article.get(articleId)
        if (!article) {
            flash.message = "Article not found."
            redirect(action: "index")
            return
        }

        render(view: "/main/editArticle", model: [
                article   : article,
                categories: Category.list()
        ])
    }

    def saveEditedArticle() {
        def article = Article.get(params.id)
        if (!article) {
            flash.message = "Article not found."
            redirect(action: "index")
            return
        }

        // Créer une révision
        new Revision(
                article     : article,
                oldContent  : article.content,
                oldTitle    : article.title,
                oldCategorie: article.categories?.first()
        ).save(flush: true)

        // Modifier l'article
        article.title = params.title
        article.content.body = params.body
        article.categories.clear()
        params.categories?.each { categoryId ->
            article.addToCategories(Category.get(categoryId))
        }

        if (article.save(flush: true)) {
            redirect(action: "viewArticle", params: [articleId: article.id])
        } else {
            flash.message = "Erreur lors de la modification de l'article."
            render(view: "/main/editArticle", model: [article: article, categories: Category.list()])
        }
    }

    def deleteArticle(Long articleId) {
        def article = Article.get(articleId)
        if (article) {
            article.delete(flush: true)
        } else {
            flash.message = "Article not found."
        }
        redirect(action: "index")
    }

    def createCategory() {
        if (params.categoryName) {
            new Category(name: params.categoryName).save(flush: true)
        }
        redirect(action: "index")
    }

    def deleteCategory(Long categoryId) {
        def category = Category.get(categoryId)
        if (category) {
            category.delete(flush: true)
        } else {
            flash.message = "Catégorie introuvable."
        }
        redirect(action: "index")
    }

    def viewRevision(Long id) {
        def revision = Revision.get(id)
        if (!revision) {
            flash.message = "Révision introuvable."
            redirect(action: "index")
            return
        }
        render(view: "/main/viewRevision", model: [revision: revision, articleId: revision.article.id])
    }
}
