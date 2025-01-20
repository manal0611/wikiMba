<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Révision - ${revision.oldTitle}</title>
</head>
<body>
    <div class="pure-g">
        <div class="pure-u-1">
            <h2>Version du <g:formatDate date="${revision.dateCreated}" format="dd/MM/yyyy HH:mm"/></h2>

            <div class="pure-u-1">
                <h3>${revision.oldTitle}</h3>
                <p><strong>Catégorie :</strong> ${revision.oldCategorie?.name}</p>
                <div class="content">
                    ${revision.oldContent.body}
                </div>
            </div>

            <div class="pure-u-1" style="margin-top: 20px;">
                <g:link action="viewRevisions" id="${article.id}" class="pure-button">
                    Retour à l'historique
                </g:link>
                <g:link action="index" class="pure-button">Retour à la liste</g:link>
            </div>
        </div>
    </div>
</body>
</html>