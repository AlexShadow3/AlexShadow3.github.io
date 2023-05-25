var arrLang = {
    "fr-fr": {
        "HOME": "Accueil",
        "ABOUT": "A Propos",
        "CONTACT": "Me Contacter",
        "MELIODAS": "Bienvenue sur mon site web personnel !",
    },
    "en-gb": {
        "HOME": "Home",
        "ABOUT": "About Us",
        "CONTACT": "Contact Us",
        "MELIODAS": "Welcome on my personal website !",
    }
};

$(document).ready(function() {
    // The default language is French
    var lang = "fr-fr";
    $(".lang").each(function(index, element) {
        $(this).text(arrLang[lang][$(this).attr("key")]);
    });
});

  // get/set the selected language
$(".translate").click(function() {
    var lang = $(this).attr("id");

    $(".lang").each(function(index, element) {
        $(this).text(arrLang[lang][$(this).attr("key")]);
    });
});
