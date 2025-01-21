<div id="main" class="pure-u-1">
    <div class="email-content">
        <div class="email-content-header pure-g">

            <!-- Catégories -->
            <div class="pure-u-1">
                <g:if test="${articleSelected?.categories}">
                    <div class="email-content-categories">
                        <p class="email-content-subtitle" style="font-size: 1.2em; margin-bottom: 15px;">
                            <strong style="font-size: 1.3em; color: #333;">Catégories : </strong>
                            <span style="font-weight: bold;">
                                <g:each in="${articleSelected.categories}" var="category" status="i">
                                    ${category.name}<g:if test="${i < articleSelected.categories.size() - 1}">, </g:if>
                                </g:each>
                            </span>
                        </p>
                    </div>
                </g:if>
            </div>

            <!-- Titre et date -->
            <div class="pure-u-1-2">
                <h1 class="email-content-title">${articleSelected?.title}</h1>
                <p class="email-content-subtitle">
                    Created on <span><g:formatDate date="${articleSelected?.dateCreated}" format="dd/MM/yyyy HH:mm"/></span>
                </p>
            </div>

            <!-- Boutons -->
            <div class="email-content-controls pure-u-1-2">
                <g:link action="editArticle" id="${articleSelected?.id}" class="secondary-button pure-button">edit</g:link>
                <g:link action="viewRevisions" id="${articleSelected?.id}" class="secondary-button pure-button">History</g:link>
                <g:link action="deleteArticle" id="${articleSelected?.id}" class="secondary-button pure-button"
                        onclick="return confirm('Are you sure you want to delete this article? ?')">delete</g:link>
            </div>
        </div>

        <!-- Corps de l'article -->
        <div class="email-content-body">
            <g:if test="${articleSelected?.content?.body}">
                <g:each in="${articleSelected.content.body.split('\\r?\\n')}" var="paragraph">
                    <p>${paragraph}</p>
                </g:each>
            </g:if>
        </div>
    </div>
</div>