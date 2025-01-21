<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Revision history - ${article.title}</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'revisionHistory.css')}">
</head>
<body>
<div class="pure-g">
    <div class="pure-u-1">
        <div class="revision-history-container">
            <h2 class="revision-history-title">Revision history of "${article.title}"</h2>

            <g:if test="${revisions}">
                <div class="pure-u-1">
                    <table class="pure-table pure-table-bordered">
                        <thead>
                        <tr>
                            <th>Date</th>
                            <th>Old title</th>
                            <th>Old category</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${revisions}" var="revision">
                            <tr>
                                <td><g:formatDate date="${revision.dateCreated}" format="dd/MM/yyyy HH:mm"/></td>
                                <td>${revision.oldTitle}</td>
                                <td>${revision.oldCategorie?.name}</td>
                                <td>
                                    <g:link action="viewRevision" id="${revision.id}" class="pure-button">
                                        View this version
                                    </g:link>
                                </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </g:if>
            <g:else>
                <p class="no-revisions">No revisions found for this article.</p>
            </g:else>

            <div class="revision-actions">
                <g:link action="index" class="pure-button">Back to the list</g:link>
            </div>
        </div>
    </div>
</div>
</body>
</html>