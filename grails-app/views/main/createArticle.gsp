<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Créer un article</title>
    <link rel="stylesheet" href="https://unpkg.com/purecss@2.1.0/build/pure-min.css">
    <link rel="stylesheet" href="${assetPath(src: 'styles.css')}">
</head>
<body>
<div id="layout" class="content pure-g">
    <div id="nav" class="pure-u">
        <h1>Créer un article</h1>
        <hr>
    </div>
    <div id="main" class="pure-u-1">
        <g:form action="saveArticle">
            <div class="pure-form">
                <label for="title">Titre</label>
                <g:textField name="title" class="pure-input-rounded"/>

                <label for="categorie">Catégorie</label>
                <g:select name="categories" from="${categories}" optionKey="id" class="pure-input-rounded"/>

                <label for="content">Contenu</label>
                <g:textArea name="content" placeholder="Écrivez votre article ici" class="pure-input-rounded"/>

                <g:actionSubmit action="saveArticle" value="Sauvegarder" class="pure-button pure-button-primary"/>
            </div>
        </g:form>
    </div>
</div>
</body>
</html>
