<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example that shows off a responsive email layout.">
    <title>Edit article</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css" integrity="sha384-X38yfunGUhNzHpBaEBsWLO+A0HDYOQi8ufWDkZ0k9e0eXz/tH3II7uKZ9msv++Ls" crossorigin="anonymous">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'createArticle.css')}">
</head>

<body>

<div id="layout" class="content pure-g">
    <!-- Sidebar: Navigation -->
    <div id="nav" class="pure-u-1-4">
        <div class="logo-wiki">
            <h1 class="title-wiki">My Wiki</h1>
        </div>
        <div class="nav-inner">
            <a class="primary-button pure-button" href="${createLink(uri: '/')}">Back to Home</a>
        </div>
    </div>

    <div id="main" class="pure-u-3-4">
        <h1>Edit Article</h1>
        <g:form controller="main" action="saveEditedArticle" class="pure-form pure-form-stacked">
            <g:hiddenField name="id" value="${article.id}" />
            <fieldset>
                <label for="title">Title</label>
                <g:textField name="title" id="title" required="true" class="pure-input-1" value="${article.title}"/>

                <label for="content">Content</label>
                <g:textArea name="body" id="content" required="true" rows="10" class="pure-input-1" value="${article.content.body}"/>

                <label for="categories">Categories</label>
                <g:select name="categories"
                          from="${categories}"
                          optionKey="id"
                          optionValue="name"
                          multiple="true"
                          value="${article.categories*.id}"
                          class="pure-input-1"/>

                <g:actionSubmit action="saveEditedArticle" value="Save Changes" class="primary-button pure-button"/>
                <g:link action="index" class="secondary-button pure-button">Cancel</g:link>
            </fieldset>
        </g:form>
    </div>
</div>

</body>
</html>