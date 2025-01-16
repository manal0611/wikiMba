package com.example

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // Appliquer des contraintes si nécessaire
            }
        }

        "/"(controller: "main", action: "index") // Utilise "main" car c'est le nom du contrôleur
        "/createArticle"(controller: "main", action: "createArticle")
        "/editArticle/$articleId"(controller: "main", action: "editArticle")
        "/viewArticle/$articleId"(controller: "main", action: "viewArticle")
        "/viewRevision/$id"(controller: "main", action: "viewRevision")
        "/listArticlesByCategory/$categoryId"(controller: "main", action: "listArticlesByCategory")

        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}





//package com.example
//
//class UrlMappings {
//    static mappings = {
//        "/$controller/$action?/$id?(.$format)?"{
//            constraints {
//                // apply constraints here
//            }
//        }
//
//        "/"(view:"/index")
//        "500"(view:'/error')
//        "404"(view:'/notFound')
//
//    }
//}
//


