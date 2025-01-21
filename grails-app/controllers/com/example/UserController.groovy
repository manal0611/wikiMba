package com.example

class UserController {

    def login() {
        if (params.username == "admin" && params.password == "123") {
            session.user = [username: "admin"]
        }
        redirect(controller: "main", action: "index")
    }

    def logout() {
        session.user = null
        redirect(controller: "main", action: "index")
    }
}