package com.example

import wikisimple.Article
import wikisimple.Category
import wikisimple.Content
import wikisimple.Revision

class MainController {


    def index() {
        [
                articles: Article.list(),
                categories: Category.list()
        ]
    }


    def viewArticle(Long articleId) {
        def selectedArticle = Article.get(articleId)
        render(template: "articleContent", model: [articleSelected: selectedArticle])
    }




    def listArticlesByCategory(Long categoryId) {
        def category = Category.get(categoryId)
        [
                articles: category ? category.articles.toList() : [],
                categories: Category.list(),
                selectedCategory: category
        ]
    }



    def createArticle() {
        [categories: Category.list()]
    }

    def createCategory() {
        def categoryName = params.categoryName?.trim()
        def category = new Category(name: categoryName)
        category.save()
        redirect(action: "index")
    }


    def saveArticle() {
        Article.withTransaction { status ->
            def article = new Article(title: params.title)
            def content = new Content(body: params.body, article: article)



            if (article.save(flush: true) && content.save(flush: true)) {
                flash.success = "Article '${article.title}' créé avec succès"
                redirect(action: "index")
            } else {
                redirect(action: "createArticle")
            }
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
                article: article,
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
                article: article,
                oldContent: article.content,
                oldTitle: article.title,
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