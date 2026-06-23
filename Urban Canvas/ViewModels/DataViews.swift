

import Foundation

struct StreetArts : Identifiable, Hashable{
    
    var id = UUID()
    let name : String
    let image : String
    let type : String
    let date : String
    let description : String
    let artist : String
    let city : String
    let localization : String
    let condition : String
    let longitude : Double
    let latitude : Double
    
    
}

var oeuvres : [StreetArts] = [
    StreetArts(name: "Liberté Egalité Fraternité", image: "liberte-egalite-fraternite", type: "Calligraffiti", date: "Avril 2025", description: """
                      Fidèle à son langage singulier — le calligraffiti — l’artiste franco-tunisien El Seed , aujourd’hui reconnu à l’international, a marqué de nombreuses villes à travers le monde par ses fresques monumentales. Il avait déjà laissé une empreinte mémorable dans le 13e arrondissement lors de l'aventure de la Tour Paris 13.
                      Sa nouvelle fresque, intitulée « Liberté, égalité, fraternité », fait directement écho aux valeurs de la République française, et dialogue, par-delà le boulevard Vincent Auriol, avec la célèbre Marianne de Shepard Fairey située juste en face. Un geste artistique fort, en lettres et en couleurs ! 
                      """
               , artist: "El Seed", city: "Paris", localization: "Square Gustave Mesureur, 105 Rue Jeanne d'Arc, 75013 Paris", condition: "Bonne", longitude: 2.3627, latitude: 48.8338),
    
    StreetArts(name: "La Joconde de Marseille", image: "joconde-marseille", type: "Harlftone", date: "Mars 2022", description: "Dans le cadre de l'exposition \" La Joconde, exposition immersive \" au Palais de la Bourse à Marseille, coproduite par le Grand Palais Immersif et le Musée du Louvre, le MauMA : Musée des arts urbains de Marseille a donné \" carte blanche \" à l'artiste Kan / DMV pour la réalisation de l'oeuvre \" La Joconde de Marseille \". Produite et coordonée par Méta 2, elle est la première représentation urbaine de la célèbre Monna Lisa au sein de la cité phocéenne.", artist: "KAN DMV" , city: "Marseille", localization: "Palais de la Bourse, 13001 Marseille", condition: "Bonne", longitude: 5.3756, latitude: 43.2965),
    
    StreetArts(name: "La maison de Cécile", image: "maison-de-cecile", type: "Street art figuratif poétique", date: "Aout 2021", description: "La dernière des immenses fresques peintes par Seth dans un quartier emblématique de Paris.", artist: "Seth Globepainter", city: "Paris", localization: "Rue Mouffetard, Paris, France", condition: "Bonne", longitude: 2.3497, latitude: 48.8421),
    
    StreetArts(name: "Chloé", image: "chloe", type: "Street art figuratif réaliste", date: "Décembre 2020", description: "Voici le portrait de Chloé, une célèbre skateuse marseillaise. Il a été peint à La Friche Belle de Mai, un centre culturel, au-dessus du skatepark.", artist: "Mahn Cloix", city: "Marseille", localization: "Friche Belle de Mai, 41 Rue Jobin, 13003 Marseille", condition: "Bonne", longitude: 5.3903, latitude: 43.3096),
    
    StreetArts(name: "PA_278", image: "pa-278", type: "Pixel art", date: "Septembre 2025", description: "PA_278 est une mosaïque de street art en pixel art, réalisée par Invader. Elle s’inscrit dans une esthétique rétro-gaming 8-bit, avec des carreaux qui remplacent les pixels numériques dans l’espace urbain.", artist: "Invader", city: "Paris", localization: "53 rue des Maraîchers, 75020 Paris", condition: "Bonne", longitude: 2.4065, latitude: 48.8530),
    
    StreetArts(name: "Chuuut...", image: "chuuut", type: "Street art figuratif", date: "Janvier 2011", description: """
    Deux célèbres fresques murales se côtoyaient à Paris (trois désormais, avec la nouvelle et immense œuvre d'Invader).
    La première est un autoportrait de Jef Aerosol. La seconde, organisée par la Galerie Itinerrance, est une peinture de Shepard Fairey, alias Obey.
    """, artist: "Jef Aérosol", city: "Paris", localization: "Place Igor Stravinsky,2 rue Brisemiche, 75004 Paris", condition: "Bonne", longitude: 2.3514, latitude: 48.8595),
    
    StreetArts(name: "Le Tigre et la Cigale", image: "le-tigre-et-la-cigale", type: "Fresque murale onirique ", date: "Mars 2024", description: """
               Brésilien résident à Marseille, Nhobi est particulièrement habité par la forêt et les esprits qui la peuplent. Il réalise des fresques où la faune et la végétation sont omniprésentes. Sa fresque fait référence à la dévastation forestière et particulièrement à la forêt amazonienne qui brûle.
               """
               , artist: "Nhobi", city: "Bessèges", localization: "175 Rue du Portail de Fer, 30160 Bessèges, France", condition: "Bonne", longitude: 5.3903, latitude: 43.3096)
                            ]
