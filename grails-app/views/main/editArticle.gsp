<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un article</title>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/purecss@2.1.0/build/pure-min.css">
</head>
<body>
<div id="layout" class="content pure-g">
    <div id="main" class="pure-u-1">
        <h1>Modifier l'article : ${article?.title}</h1>
        <g:form action="saveEditedArticle" class="pure-form pure-form-stacked">
            <fieldset>
                <g:hiddenField name="id" value="${article?.id}"/>

                <label for="title">Titre :</label>
                <g:textField name="title" value="${article?.title}" class="pure-input-1" required="true"/>

                <label for="body">Contenu :</label>
                <g:textArea name="body" rows="10" value="${article?.content?.body}" class="pure-input-1" required="true"></g:textArea>

                <label for="categories">Catégories :</label>
                <g:select name="categories" from="${categories}" optionKey="id" multiple="true" value="${article?.categories*.id}" class="pure-input-1"/>

                <button type="submit" class="pure-button pure-button-primary">Enregistrer</button>
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
