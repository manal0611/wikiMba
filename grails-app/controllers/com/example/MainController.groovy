package com.example

import grails.gorm.transactions.Transactional
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


    @Transactional
    def saveArticle() {
        def article = new Article(title: params.title)
        def content = new Content(body: params.body)
        content.article = article
        article.content = content

        article.save(flush: true)
        content.save(flush: true)


        params.list('categories')?.each { categoryId ->
            def category = Category.get(categoryId as Long)
            if (category) {
                article.addToCategories(category)
            }
        }
        article.save(flush: true)
        redirect(action: "index")
    }

    def editArticle(Long id) {
        def article = Article.get(id)
        [
                article: article,
                categories: Category.list()
        ]
    }



    @Transactional
    def saveEditedArticle() {
        def article = Article.get(params.long('id'))
        def revision = new Revision(
                article: article,
                oldTitle: article.title,
                oldContent: article.content,
                oldCategorie: article.categories ? article.categories.first() : null
        )
        revision.save(flush: true)
        article.title = params.title
        article.content.body = params.body


        article.categories.clear()
        params.list('categories')?.each { categoryId ->
            article.addToCategories(Category.get(categoryId as Long))
        }
        article.save(flush: true)

        redirect(action: "index")
    }


    def viewRevisions(Long id) {
        def article = Article.get(id)
        if (!article) {
            redirect(action: "index")
            return
        }

        [
                article: article,
                revisions: Revision.findAllByArticle(article, [sort: 'dateCreated', order: 'desc'])
        ]
    }


    def viewRevision(Long id) {
        def revision = Revision.get(id)
        if (!revision) {
            redirect(action: "index")
            return
        }
        [
                revision: revision,
                article: revision.article
        ]
    }


    @Transactional
    def deleteArticle(Long id) {
        def article = Article.get(id)
        if (article) {
            Revision.where { article == article }.deleteAll()
            article.categories?.clear()
            article.content?.delete()
            article.delete(flush: true)
            redirect(action: "index")
        } else {
            redirect(action: "index")
        }
    }

}