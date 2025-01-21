function initializeArticleFilters() {
    const articleItems = document.querySelectorAll('.article-item');
    const articleContent = document.getElementById('article-content');
    const categoryLinks = document.querySelectorAll('.category-link');
    const listContainer = document.getElementById('list');

    function filterArticlesByCategory(categoryId) {
        let hasVisibleArticles = false;

        articleItems.forEach(item => {
            const categoriesAttr = item.getAttribute('data-categories');
            const articleCategories = categoriesAttr ? categoriesAttr.split(',') : [];

            if (articleCategories.includes(categoryId.toString())) {
                item.style.display = '';
                hasVisibleArticles = true;
            } else {
                item.style.display = 'none';
            }
        });

        const noArticlesMessage = document.querySelector('.no-articles-message');
        if (!hasVisibleArticles) {
            if (!noArticlesMessage) {
                const messageDiv = document.createElement('div');
                messageDiv.className = 'no-articles-message email-item pure-g';
                messageDiv.innerHTML = `
                    <div class="pure-u-3-4">
                        <h4 class="email-subject">No articles in this category</h4>
                    </div>
                `;
                listContainer.appendChild(messageDiv);
            }
        } else if (noArticlesMessage) {
            noArticlesMessage.remove();
        }
    }

    categoryLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();

            categoryLinks.forEach(l => l.classList.remove('pure-menu-selected'));
            this.classList.add('pure-menu-selected');

            const categoryId = this.getAttribute('data-category-id');
            filterArticlesByCategory(categoryId);
        });
    });

    articleItems.forEach(item => {
        item.addEventListener('click', function() {
            const articleId = this.getAttribute('data-article-id');

            fetch(viewArticleUrl + '?articleId=' + articleId)
                .then(response => {
                    if (!response.ok) throw new Error('Network response was not ok');
                    return response.text();
                })
                .then(html => {
                    articleContent.innerHTML = html;
                })
                .catch(error => {
                    articleContent.innerHTML = '<p>Error loading the article</p>';
                });

            articleItems.forEach(el => el.classList.remove('email-item-selected'));
            this.classList.add('email-item-selected');
        });
    });
}