document.addEventListener('DOMContentLoaded', function () {
    const menuButton = document.querySelector('.nav-menu-button');
    const nav = document.getElementById('nav');

    if (menuButton && nav) {
        menuButton.addEventListener('click', function () {
            nav.classList.toggle('active');
        });
    }
});
