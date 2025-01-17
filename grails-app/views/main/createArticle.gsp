<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example that shows off a responsive email layout.">
    <title>Create article</title>
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
            <a class="primary-button pure-button" href="${createLink(uri: '/')}">View Articles</a>

        </div>
    </div>


    <div id="main" class="pure-u-3-4">
        <h1>Create a New Article</h1>
        <g:form controller="main" action="saveArticle" class="pure-form pure-form-stacked">
            <fieldset>
                <label for="title">Title</label>
                <g:textField name="title" id="title" placeholder="Enter the title of the article" required="required" class="pure-input-1"/>

                <label for="content">Content</label>
                <g:textArea name="body" id="content" placeholder="Write your article content here..." required="required" rows="10" class="pure-input-1">Sample content to test
                </g:textArea>


                <label for="categories">Categories</label>
                <g:select name="categories" from="${categories}" optionKey="id" optionValue="name" multiple="true" class="pure-input-1"/>

                <button type="submit" class="primary-button pure-button">Save Article</button>
                <a href="${createLink(action:'index', controller:'main')}" class="secondary-button pure-button">Cancel</a>
            </fieldset>
        </g:form>
    </div>
</div>

</body>
</html>
