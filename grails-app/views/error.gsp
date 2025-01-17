<!doctype html>
<html>
<head>
    <title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
    <meta name="layout" content="main">
    <g:if env="development">
        <link rel="stylesheet" href="${createLink(uri: '/css/errors.css')}"/>
    </g:if>
</head>
<body>
<g:if env="development">
    <g:if test="${Throwable.isInstance(exception)}">
        <div class="error-details">
            <h2>Error Details</h2>
            <div class="stack-trace">
                <pre>${exception?.stackTrace?.join('\n')}</pre>
            </div>
        </div>
    </g:if>
    <g:elseif test="${request.getAttribute('javax.servlet.error.exception')}">
        <div class="error-details">
            <h2>Error Details</h2>
            <div class="stack-trace">
                <pre>${request.getAttribute('javax.servlet.error.exception')?.stackTrace?.join('\n')}</pre>
            </div>
        </div>
    </g:elseif>
    <g:else>
        <ul class="errors">
            <li>An error has occurred</li>
            <li>Exception: ${exception}</li>
            <li>Message: ${message}</li>
            <li>Path: ${path}</li>
        </ul>
    </g:else>
</g:if>
<g:else>
    <ul class="errors">
        <li>An error has occurred</li>
    </ul>
</g:else>
</body>
</html>