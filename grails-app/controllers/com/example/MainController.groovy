package com.example

import grails.gorm.transactions.Transactional
import wikisimple.Article
import wikisimple.Category
import wikisimple.Content
import wikisimple.Revision
import wikisimple.Image


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



    def editArticle(Long id) {
        def article = Article.get(id)
        [
                article: article,
                categories: Category.list()
        ]
    }


    def saveEditedArticle() {
        Article.withTransaction { status ->
            def article = Article.get(params.long('id'))

            article.properties = params
            article.content.body = params.body
            article.categories.clear()
            params.list('categories')?.each { categoryId ->
                article.addToCategories(Category.get(categoryId as Long))
            }
            article.save()
            redirect(action: "index")
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




    @Transactional
    def deleteArticle(Long id) {
        def article = Article.get(id)
        if (article) {
            Revision.where { article == article }.deleteAll()
            Image.where { article == article }.deleteAll()
            article.categories?.clear()
            article.content?.delete()
            article.delete(flush: true)
            redirect(action: "index")
        } else {
            redirect(action: "index")
        }
    }










}








