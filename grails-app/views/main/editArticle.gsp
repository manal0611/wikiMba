<g:each in="${categories}" var="category">
    <li class="pure-menu-item">
        <a href="#" class="pure-menu-link category-link" data-category-id="${category.id}">
            ${category.name}
        </a>
    </li>
</g:each>