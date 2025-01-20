package com.example

class UrlMappings {
    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
            }
        }

        "/" {
            controller = "main"
            action = "index"
        }

        "/main/deleteArticle/$id"(controller: "main", action: "deleteArticle")


        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}