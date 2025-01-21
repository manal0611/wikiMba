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


        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}