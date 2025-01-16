<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${article?.title}</title>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/purecss@2.1.0/build/pure-min.css">
</head>
<body>
<div id="layout" class="content pure-g">
    <div id="main" class="pure-u-1">
        <h1>${article?.title}</h1>
        <p>${article?.content?.body}</p>

        <h2>Images associées :</h2>
        <ul>
            <g:each var="image" in="${images}">
                <li>
                    <img src="${image?.url}" alt="${image?.description}" style="max-width: 200px;">
                    <p>${image?.description}</p>
                </li>
            </g:each>
        </ul>

        <h2>Révisions disponibles :</h2>
        <ul>
            <g:each var="revision" in="${revisions}">
                <li><g:link action="viewRevision" id="${revision?.id}">${revision?.dateCreated?.format('dd/MM/yyyy')}</g:link></li>
            </g:each>
        </ul>
    </div>
</div>
</body>
</html>
