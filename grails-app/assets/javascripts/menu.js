document.addEventListener('DOMContentLoaded', function () {
    const menuLink = document.getElementById('menuLink');
    const nav = document.getElementById('nav');

    if (menuLink) {
        menuLink.addEventListener('click', function (e) {
            nav.classList.toggle('active');
            e.preventDefault();
        });
    }
});
