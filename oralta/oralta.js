const isScrolling = () => {
    const headerEl = document.querySelector('.primary-header')
    let windowPosition = window.scrollY > 250
    headerEl.classList.toggle('active', windowPosition)
}
window.addEventListener('scroll', isScrolling)