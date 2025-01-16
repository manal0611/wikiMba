package com.example

import wikisimple.User


class UserController {

    def index() {
        respond User.list(params)
    }

    def create() {
        respond new User()
    }

    def save(User user) {
        if (user.save(flush: true)) {
            redirect action: "index"
        } else {
            render(view: "create", model: [user: user])
        }
    }

    def delete(Long id) {
        def user = User.get(id)
        if (user) {
            user.delete(flush: true)
        }
        redirect action: "index"
    }
}
















