<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Révision - ${revision?.oldTitle}</title>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/purecss@2.1.0/build/pure-min.css">
</head>
<body>
<div id="layout" class="content pure-g">
    <div id="main" class="pure-u-1">
        <h1>Révision de : ${revision?.oldTitle}</h1>
        <p><strong>Date :</strong> ${revision?.dateCreated?.format('dd/MM/yyyy HH:mm')}</p>
        <p><strong>Contenu :</strong></p>
        <p>${revision?.oldContent?.body}</p>

        <h2>Actions :</h2>
        <a href="${createLink(action: 'restoreRevision', id: revision?.id)}" class="pure-button pure-button-primary">Restaurer cette révision</a>
        <a href="${createLink(action: 'viewArticle', params: [articleId: articleId])}" class="pure-button">Retour à l'article</a>
    </div>
</div>
</body>
</html>
