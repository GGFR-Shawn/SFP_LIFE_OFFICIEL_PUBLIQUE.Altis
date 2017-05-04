// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// ====================================================================================================================================================================================
												// PRIX LEGAUX
// ====================================================================================================================================================================================

prixdelatruffes = round ((random 5) + 20); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdelatruffes";
bourse_marge_max_a_ne_pas_descendre_truffe = 2; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_truffe = 3; // Marge à ne pas depasser pour la bourse lors de la vente

prixdubois = round ((random 3) + 20); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdubois";
bourse_marge_max_a_ne_pas_descendre_bois = 4; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_bois = 4; // Marge à ne pas depasser pour la bourse lors de la vente

prixserpentnontransforme = round ((random 2) + 14); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixserpentnontransforme";
bourse_marge_max_a_ne_pas_descendre_serpent_non_tranfo = 2; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_serpent_non_tranfo = 4; // Marge à ne pas depasser pour la bourse lors de la vente

prixducuivre = round ((random 5) + 40); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixducuivre";
bourse_marge_max_a_ne_pas_descendre_cuivre = 7; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_cuivre = 7; // Marge à ne pas depasser pour la bourse lors de la vente

prixdulapins = round ((random 3) + 18); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdulapins";
bourse_marge_max_a_ne_pas_descendre_lapins = 2; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_lapins = 5; // Marge à ne pas depasser pour la bourse lors de la vente

prixdelor = round ((random 300) + 2000); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdelor";
bourse_marge_max_a_ne_pas_descendre_or = 250; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_or = 200; // Marge à ne pas depasser pour la bourse lors de la vente

prixdupetrole = round ((random 30) + 300); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdupetrole";
bourse_marge_max_a_ne_pas_descendre_petrole = 60; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_petrole = 60; // Marge à ne pas depasser pour la bourse lors de la vente

prixdupoisson = round ((random 2) + 12); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdupoisson";
bourse_marge_max_a_ne_pas_descendre_poissons = 2; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_poissons = 3; // Marge à ne pas depasser pour la bourse lors de la vente

prixdupoissonspanes = round ((random 2) + 12); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdupoissonspanes";
bourse_marge_max_a_ne_pas_descendre_poissons_panes = 2; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_poissons_panes = 5; // Marge à ne pas depasser pour la bourse lors de la vente

prixdespommes = round ((random 2) + 5); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdespommes";
bourse_marge_max_a_ne_pas_descendre_pommes = 1; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_pommes = 3; // Marge à ne pas depasser pour la bourse lors de la vente

prixdespommesdeterre = round ((random 3) + 5); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdespommesdeterre";
bourse_marge_max_a_ne_pas_descendre_pommes_de_terre = 1; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_pommes_de_terre = 3; // Marge à ne pas depasser pour la bourse lors de la vente

prixdusel = round ((random 3) + 21); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdusel";
bourse_marge_max_a_ne_pas_descendre_sel = 5; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_sel = 6; // Marge à ne pas depasser pour la bourse lors de la vente

// ====================================================================================================================================================================================
									// PRIX ILLEGAUX
// ====================================================================================================================================================================================
prixdelabaleine = round ((random 100) + 2200); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdelabaleine";
bourse_marge_max_a_ne_pas_descendre_baleine = 100; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_baleine = 200; // Marge à ne pas depasser pour la bourse lors de la vente

prixducannabis = round ((random 10) + 110); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixducannabis";
bourse_marge_max_a_ne_pas_descendre_cannabis = 10; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_cannabis = 10; // Marge à ne pas depasser pour la bourse lors de la vente

prixdelacocaine = round (70 + (random 10)); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdelacocaine";
bourse_marge_max_a_ne_pas_descendre_cocaine = 4; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_cocaine = 10; // Marge à ne pas depasser pour la bourse lors de la vente

prixdelheroine = round ((random 10) + 62); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdelheroine";
bourse_marge_max_a_ne_pas_descendre_heroine = 10; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_heroine = 12; // Marge à ne pas depasser pour la bourse lors de la vente

prixdesorganesanimaux = round ((random 5) + 20); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdesorganesanimaux";
bourse_marge_max_a_ne_pas_descendre_organes_animaux = 2; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_organes_animaux = 5; // Marge à ne pas depasser pour la bourse lors de la vente

prixdelaplante = round ((random 2500) + 45000); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdelaplante";
bourse_marge_max_a_ne_pas_descendre_plante = 10000; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_plante = 4000; // Marge à ne pas depasser pour la bourse lors de la vente

prixdesmedicaments = round ((random 5) + 20); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdesmedicaments";
bourse_marge_max_a_ne_pas_descendre_medicaments = 2; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_medicaments = 3; // Marge à ne pas depasser pour la bourse lors de la vente

prixdurequins = round ((random 100) + 1500); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixdurequins";
bourse_marge_max_a_ne_pas_descendre_requins = 300; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_requins = 310; // Marge à ne pas depasser pour la bourse lors de la vente

prixserpenttransforme = round ((random 10) + 170); /* Ne pas toucher à droite !!! */ sleep 0.2; publicvariable "prixserpenttransforme";
bourse_marge_max_a_ne_pas_descendre_serpent_tranfo = 5; // Marge à ne pas descendre pour la bourse lors de la vente
bourse_marge_max_a_ne_pas_depasser_serpent_tranfo = 100; // Marge à ne pas depasser pour la bourse lors de la vente

