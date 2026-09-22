import { translations } from './translations.js';

// Get the language buttons and the elements with the lang class
const langButtons = document.querySelectorAll('.translate');
const langElements = document.querySelectorAll('.lang');

// Function to set language and save preference
function setLanguage(lang) {
    localStorage.setItem('preferredLang', lang);
    langElements.forEach(element => {
        const key = element.getAttribute('key');
        if (translations[lang] && translations[lang][key]) {
            element.innerHTML = translations[lang][key];
        }
    });

    // Handle dynamic text elements (e.g. copied state in QR code)
    window.currentLanguage = lang;
}

// Add click event listeners to the language buttons
langButtons.forEach(button => {
    button.addEventListener('click', () => {
        setLanguage(button.id);
    });
});

// Load preferred language on start
const savedLang = localStorage.getItem('preferredLang') || 'fr-fr';
setLanguage(savedLang);