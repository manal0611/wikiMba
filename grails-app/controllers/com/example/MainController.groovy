package com.example

import wikisimple.Article
import wikisimple.Category
import wikisimple.Content
import wikisimple.Image
import wikisimple.Revision


class MainController {

    def index() {
       [
                articles  : Article.list(),
                categories: Category.list()
        ]
    }

    def listArticlesByCategory(Long categoryId) {
        def category = Category.get(categoryId)
        [
                articles        : category ? category.articles.toList() : [],
                categories      : Category.list(),
                selectedCategory: category
        ]
    }

    def viewArticle(Long articleId) {
        def article = Article.get(articleId)
        if (!article) {
            flash.message = "Article not found."
            redirect(action: "index")
            return
        }
        [
                article   : article,
                categories: Category.list(),
                revisions : Revision.findAllByArticle(article),
                images    : Image.findAllByArticle(article)
        ]
    }

    def createArticle() {
        [
                categories: Category.list()
        ]
    }

    def saveArticle() {
        def content = new Content(body: params.body).save(flush: true)
        def article = new Article(
                title: params.title,
                content: content
        )

        def categoryIds = params.list('categories')?.collect { it as Long }
        categoryIds?.each { Long categoryId ->
            def category = Category.get(categoryId)
            if (category) {
                article.addToCategories(category)
            }
        }

        if (article.save(flush: true)) {
            redirect(action: "index")
        } else {
            flash.message = "Error while editing the article."
            [categories: Category.list()]
        }
    }

    def editArticle(Long articleId) {
        def article = Article.get(articleId)
        if (!article) {
            flash.message = "Article not found."
            redirect(action: "index")
            return
        }

         [
                article   : article,
                categories: Category.list()
        ]
    }

    def saveEditedArticle() {
        def articleId = params.long('id')
        def article = articleId ? Article.get(articleId) : null
        if (!article) {
            flash.message = "Article not found."
            redirect(action: "index")
            return
        }

        new Revision(
                article     : article,
                oldContent  : article.content,
                oldTitle    : article.title,
                oldCategorie: article.categories?.first()
        ).save(flush: true)

        article.title = params.title
        article.content.body = params.body
        article.categories.clear()

        def categoryIds = params.list('categories')?.collect { it as Long }
        categoryIds?.each { Long categoryId ->
            def category = Category.get(categoryId)
            if (category) {
                article.addToCategories(category)
            }
        }

        if (article.save(flush: true)) {
            redirect(action: "viewArticle", params: [articleId: article.id])
        } else {
            flash.message = "Error while editing the article."
            [article: article, categories: Category.list()]
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
            flash.message = "Category not found."
        }
        redirect(action: "index")
    }

    def viewRevision(Long id) {
        def revision = Revision.get(id)
        if (!revision) {
            flash.message = "Revision not found."
            redirect(action: "index")
            return
        }
        [revision: revision, articleId: revision.article.id]
    }
}
