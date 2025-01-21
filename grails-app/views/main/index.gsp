<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example that shows off a responsive email layout.">
    <title>Wiki Simple</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css" integrity="sha384-X38yfunGUhNzHpBaEBsWLO+A0HDYOQi8ufWDkZ0k9e0eXz/tH3II7uKZ9msv++Ls" crossorigin="anonymous">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'styles.css')}">
    <script src="${resource(dir: 'javascripts', file: 'filter-articles.js')}"></script>
</head>
<body>

<div id="layout" class="content pure-g">

<!-- Messages conteneur -->
    <g:if test="${flash.error}">
        <div class="flash-message error" style="display: none;">
            ${flash.error}
        </div>
    </g:if>
    <g:if test="${flash.message}">
        <div class="flash-message success" style="display: none;">
            ${flash.message}
        </div>
    </g:if>

    <!-- Sidebar -->

    <div id="nav" class="pure-u">
        <a href="#" id="menuLink" class="nav-menu-button">Menu</a>

        <a class="primary-button pure-button" href="${createLink(uri: '/')}">List articles</a>
        <a class="primary-button pure-button" href="${createLink(action:'createArticle', controller:'main')}">write article</a>
        <hr>

        <div class="pure-menu">


            <div class="nav-inner">
                <g:form controller="main" action="createCategory" class="pure-form" style="margin-bottom: 1em;">
                    <g:textField name="categoryName"
                                 class="pure-input-1"
                                 placeholder="new category"
                                 style="width: 70%; margin-right: 5px;"/>
                    <button type="submit" class="secondary-button pure-button" style="padding: 0.5em 1em;">+</button>
                </g:form>
            </div>

            <span class="pure-menu-heading">Categories</span>
            <ul class="pure-menu-list">
                <g:each in="${categories}" var="category">
                    <li class="pure-menu-item">
                        <a href="#" class="pure-menu-link category-link" data-category-id="${category.id}">
                            ${category.name}
                        </a>
                        <g:form controller="main"
                                action="deleteCategory"
                                method="POST"
                                class="category-delete-form"
                                onclick="return confirm('Are you sure you want to delete the category \'${category.name}\'?');">
                            <g:hiddenField name="id" value="${category.id}"/>
                            <button type="submit" class="category-delete-button">×</button>
                        </g:form>
                    </li>
                </g:each>
            </ul>


           <div class="pure-menu">
               <hr>
               <g:if test="${session.user}">
                   <div class="nav-inner" style="padding: 1em;">
                       <p style="color: white;">Logged in as <strong style="color: white;">admin</strong></p>
                       <g:link controller="user" action="logout" class="pure-button pure-button-primary" style="width: 100%;">
                           Logout
                       </g:link>
                   </div>
               </g:if>
               <g:else>
                   <div class="nav-inner">
                       <g:form controller="user" action="login" class="pure-form pure-form-stacked" style="padding: 1em;">
                           <input type="text" name="username" placeholder="username" class="pure-input-1"/>
                           <input type="password" name="password" placeholder="password" class="pure-input-1"/>
                           <button type="submit" class="pure-button pure-button-primary" style="width: 100%;">
                               Login
                           </button>
                       </g:form>
                   </div>
               </g:else>
           </div>



        </div>
    </div>

    <!-- list des articles -->
    <div id="list" class="pure-u-1">

       <g:if test="${articles?.size() == 0}">
           <div class="email-item pure-g">
               <div class="pure-u-3-4">
                   <h4 class="email-subject">No articles</h4>
               </div>
           </div>
       </g:if>
       <g:else>
           <g:each in="${articles}" var="article">
               <div class="email-item pure-g article-item"
                    data-article-id="${article.id}"
                    data-categories="${article.categories?.collect { it.id }?.join(',') ?: ''}"
                    style="cursor: pointer;">
                   <div class="pure-u-3-4">
                       <h5 class="email-name">
                           <g:if test="${article.categories}">
                               <g:each in="${article.categories}" var="category" status="j">
                                   ${category.name}<g:if test="${j < article.categories.size() - 1}">, </g:if>
                               </g:each>
                           </g:if>
                       </h5>
                       <h4 class="email-subject">${article.title}</h4>
                       <p class="email-desc">
                           ${article.content?.body?.take(100)}...
                       </p>
                   </div>
               </div>
           </g:each>
       </g:else>
    </div>


    <!-- corps vide -->

    <div id="main" class="pure-u-1">
        <div id="article-content" class="email-content">
            <div class="email-content-body">
                <p>Select an article to display its content</p>
            </div>
        </div>
    </div>



    <script>

        const viewArticleUrl = '${createLink(action: 'viewArticle')}';
        document.addEventListener('DOMContentLoaded', function() {
            initializeArticleFilters();
        });

        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.flash-message').forEach(function(message) {
                message.style.display = 'block';
                setTimeout(function() {
                    message.remove();
                }, 4000);
            });
        });
    </script>

</div>
</body>
</html>