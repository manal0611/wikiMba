<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Révision - ${revision.oldTitle}</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'revision.css')}">

</head>
<body>
<div class="pure-g">
    <div class="pure-u-1">
        <div class="revision-container">
            <div class="revision-header">
                <h2 class="revision-date">Version of <g:formatDate date="${revision.dateCreated}" format="dd/MM/yyyy HH:mm"/></h2>
            </div>

            <div class="pure-u-1">
                <h3 class="revision-title">${revision.oldTitle}</h3>
                <div class="revision-category">
                    <strong>Category:</strong> ${revision.oldCategorie?.name}
                </div>
                <div class="revision-content">
                    ${revision.oldContent.body}
                </div>
            </div>

            <div class="revision-actions">
                <g:link action="viewRevisions" id="${article.id}" class="pure-button">
                    Back to history
                </g:link>
                <g:link action="index" class="pure-button">Back to the list</g:link>
            </div>
        </div>
    </div>
</div>
</body>
</html>