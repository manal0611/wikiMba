<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example that shows off a responsive email layout.">
    <title>Wiki Simple</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css" integrity="sha384-X38yfunGUhNzHpBaEBsWLO+A0HDYOQi8ufWDkZ0k9e0eXz/tH3II7uKZ9msv++Ls" crossorigin="anonymous">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'styles.css')}">
</head>
<body>

<div id="layout" class="content pure-g">
    <!-- Sidebar: Navigation -->

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

            <span class="pure-menu-heading">Catégories</span>

            <ul class="pure-menu-list">
                <g:each in="${categories}" var="category">
                    <li class="pure-menu-item">
                        <a href="#" class="pure-menu-link category-link" data-category-id="${category.id}">
                            ${category.name}
                        </a>
                    </li>
                </g:each>
            </ul>



        </div>
    </div>


    <div id="list" class="pure-u-1">

       <g:if test="${articles?.size() == 0}">
           <div class="email-item pure-g">
               <div class="pure-u-3-4">
                   <h4 class="email-subject">Aucun article</h4>
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

    <div id="main" class="pure-u-1">
        <div id="article-content" class="email-content">
            <div class="email-content-body">
                <p>Sélectionnez un article pour afficher son contenu</p>
            </div>
        </div>
    </div>

    <script>

      document.addEventListener('DOMContentLoaded', function() {
          const articleItems = document.querySelectorAll('.article-item');
          const articleContent = document.getElementById('article-content');
          const categoryLinks = document.querySelectorAll('.category-link');
          const listContainer = document.getElementById('list');

          function filterArticlesByCategory(categoryId) {
              let hasVisibleArticles = false;

              articleItems.forEach(item => {
                  const categoriesAttr = item.getAttribute('data-categories');
                  const articleCategories = categoriesAttr ? categoriesAttr.split(',') : [];

                  if (articleCategories.includes(categoryId.toString())) {
                      item.style.display = '';
                      hasVisibleArticles = true;
                  } else {
                      item.style.display = 'none';
                  }
              });

              const noArticlesMessage = document.querySelector('.no-articles-message');
              if (!hasVisibleArticles) {
                  if (!noArticlesMessage) {
                      const messageDiv = document.createElement('div');
                      messageDiv.className = 'no-articles-message email-item pure-g';
                      messageDiv.innerHTML = `
                          <div class="pure-u-3-4">
                              <h4 class="email-subject">Aucun article dans cette catégorie</h4>
                          </div>
                      `;
                      listContainer.appendChild(messageDiv);
                  }
              } else if (noArticlesMessage) {
                  noArticlesMessage.remove();
              }
          }

          categoryLinks.forEach(link => {
              link.addEventListener('click', function(e) {
                  e.preventDefault();

                  categoryLinks.forEach(l => l.classList.remove('pure-menu-selected'));
                  this.classList.add('pure-menu-selected');

                  const categoryId = this.getAttribute('data-category-id');
                  filterArticlesByCategory(categoryId);
              });
          });

          articleItems.forEach(item => {
              item.addEventListener('click', function() {
                  const articleId = this.getAttribute('data-article-id');

                  fetch('${createLink(action: 'viewArticle')}?articleId=' + articleId)
                      .then(response => {
                          if (!response.ok) throw new Error('Network response was not ok');
                          return response.text();
                      })
                      .then(html => {
                          articleContent.innerHTML = html;
                      })
                      .catch(error => {
                          articleContent.innerHTML = '<p>Erreur lors du chargement de l\'article</p>';
                      });

                  articleItems.forEach(el => el.classList.remove('email-item-selected'));
                  this.classList.add('email-item-selected');
              });
          });
      });



    </script>

</div>


</body>
</html>