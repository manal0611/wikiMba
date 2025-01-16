<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><g:layoutTitle default="WikiMba"/></title>

    <!-- Pure CSS -->
    <link rel="stylesheet" href="https://unpkg.com/purecss@2.1.0/build/pure-min.css">
    <link rel="stylesheet" href="${assetPath(src: 'styles.css')}">

    <g:layoutHead/>
</head>
<body>
<div id="layout" class="content pure-g">
    <!-- Navigation -->
    <div id="nav" class="pure-u">
        <a href="#" id="menuLink" class="nav-menu-button">Menu</a>

        <div class="nav-inner">
            <div class="pure-menu">
                <ul class="pure-menu-list">
                    <li class="pure-menu-item">
                        <g:link controller="wiki" action="index" class="pure-menu-link">Accueil</g:link>
                    </li>
                    <li class="pure-menu-item">
                        <g:link controller="wiki" action="createArticle" class="pure-menu-link">Créer un article</g:link>
                    </li>

                </ul>
            </div>
        </div>
    </div>

    <div id="wiki" class="pure-u-1">
        <g:layoutBody/>
    </div>
</div>

<!-- Scripts -->
<script src="${assetPath(src: 'menu.js')}"></script>
</body>
</html>