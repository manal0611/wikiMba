<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Historique des révisions - ${article.title}</title>
</head>
<body>
    <div class="pure-g">
        <div class="pure-u-1">
            <h2>Historique des révisions de "${article.title}"</h2>

            <g:if test="${revisions}">
                <div class="pure-u-1">
                    <table class="pure-table pure-table-bordered">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Ancien titre</th>
                                <th>Ancienne catégorie</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${revisions}" var="revision">
                                <tr>
                                    <td><g:formatDate date="${revision.dateCreated}" format="dd/MM/yyyy HH:mm"/></td>
                                    <td>${revision.oldTitle}</td>
                                    <td>${revision.oldCategorie?.name}</td>
                                    <td>
                                        <g:link action="viewRevision" id="${revision.id}" class="pure-button">
                                            Voir cette version
                                        </g:link>
                                    </td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>
            </g:if>
            <g:else>
                <p>Aucune révision trouvée pour cet article.</p>
            </g:else>

            <div class="pure-u-1" style="margin-top: 20px;">
                <g:link action="index" class="pure-button">Retour à la liste</g:link>
            </div>
        </div>
    </div>
</body>
</html>