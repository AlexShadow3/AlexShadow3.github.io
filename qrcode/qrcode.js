const background = document.querySelector('html');
const contentContainer = document.querySelector('.content-container');
const parallaxSpeed = 0.5;
window.addEventListener('scroll', function () {
    const scrollPosition = window.scrollY;
    background.style.backgroundPositionY = -scrollPosition * parallaxSpeed + 'px';
});