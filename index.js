// Define a dictionary of translations for each language
const translations = {
    'en-gb': {
        "HOME": "Home",
        "ABOUT": "About",
        "CONTACT": "Contact",
        "MELIODAS": "Welcome on my personal website !",
        "ORALTA": "You can also discover my Oralta project by clicking on the image",
    },
    'fr-fr': {
        "HOME": "Accueil",
        "ABOUT": "À propos",
        "CONTACT": "Contact",
        "MELIODAS": "Bienvenue sur mon site web personnel !",
        "ORALTA": "Vous pouvez aussi découvrir mon projet Oralta en cliquant sur l'image",
    }
};

  // Get the language buttons and the elements with the lang class
const langButtons = document.querySelectorAll('.translate');
const langElements = document.querySelectorAll('.lang');

  // Add click event listeners to the language buttons
langButtons.forEach(button => {
    button.addEventListener('click', () => {
      // Get the selected language from the button id
        const lang = button.id;

      // Update the text content of the elements with the lang class
        langElements.forEach(element => {
        const key = element.getAttribute('key');
        element.textContent = translations[lang][key];
        });
    });
});