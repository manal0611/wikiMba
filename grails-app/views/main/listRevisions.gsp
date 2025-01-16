<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Révisions</title>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/purecss@2.1.0/build/pure-min.css">
</head>
<body>
<div id="layout" class="content pure-g">
    <div id="main" class="pure-u-1">
        <h1>Révisions pour l'article : ${article?.title}</h1>
        <table class="pure-table pure-table-striped">
            <thead>
            <tr>
                <th>Date</th>
                <th>Titre précédent</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="revision" in="${revisions}">
                <tr>
                    <td>${revision?.dateCreated?.format('dd/MM/yyyy HH:mm')}</td>
                    <td>${revision?.oldTitle}</td>
                    <td>
                        <g:link action="restoreRevision" id="${revision?.id}" class="pure-button">Restaurer</g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
