import { translations } from './translations.js';

// Language switcher
export function setLanguage(lang) {
    try {
        localStorage.setItem('preferredLang', lang);
    } catch (e) {}
    window.currentLanguage = lang;

    // Update active state on buttons
    document.querySelectorAll('.translate').forEach(btn => {
        btn.classList.toggle('active', btn.id === lang);
    });

    // Translate DOM elements
    document.querySelectorAll('.lang').forEach(element => {
        const key = element.getAttribute('key');
        if (translations[lang] && translations[lang][key]) {
            element.innerHTML = translations[lang][key];
        }
    });

    // Update html lang attribute
    document.documentElement.lang = lang.startsWith('en') ? 'en' : 'fr';
}

window.setLanguage = setLanguage;

// Add event listeners for language selection
document.querySelectorAll('.translate').forEach(button => {
    button.addEventListener('click', () => {
        setLanguage(button.id);
    });
});

// Project filtering logic (for portfolio)
const filterButtons = document.querySelectorAll('.filter-btn');
const projectCards = document.querySelectorAll('.project-card');

if (filterButtons.length > 0 && projectCards.length > 0) {
    filterButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            const filter = btn.getAttribute('data-filter');

            // Update active filter button
            filterButtons.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');

            // Filter project cards
            projectCards.forEach(card => {
                const categories = (card.getAttribute('data-category') || '').split(' ');
                if (filter === 'all' || categories.includes(filter)) {
                    card.classList.remove('hidden');
                } else {
                    card.classList.add('hidden');
                }
            });
        });
    });
}

// Mobile navigation toggle
const mobileToggle = document.querySelector('.mobile-toggle');
const navMenu = document.querySelector('.nav-menu');

if (mobileToggle && navMenu) {
    mobileToggle.addEventListener('click', () => {
        navMenu.classList.toggle('open');
        const isOpen = navMenu.classList.contains('open');
        mobileToggle.setAttribute('aria-expanded', isOpen);
    });

    // Close menu when clicking a nav link
    const navLinks = navMenu.querySelectorAll('.nav-link');
    navLinks.forEach(link => {
        link.addEventListener('click', () => {
            navMenu.classList.remove('open');
        });
    });
}

// Initialize saved or browser language
const savedLang = localStorage.getItem('preferredLang') || (navigator.language.startsWith('en') ? 'en-gb' : 'fr-fr');
setLanguage(savedLang);