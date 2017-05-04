// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

hint format ["! TRANSFORMATION SERPENT ! \n ---------------------------------- \n Le prix pour cette transformation est de %1 Euros par unité en argent de poche ... \n\n Bonne transfo ! \n -------------------------------- \n www.sfpteam.fr\n By Maxou", 50];

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "choix_montant_transformation_serpent";

createDialog _nom_du_menu;
disableSerialization;

_titre_add_id = 1007;
_texte_add_id = 1400;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
_couleur_blanche = [1,1,1,1];

((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["Transformation des serpents (%1 dans votre inventaire /\ %2 par transfo)", player getvariable "serpent_non_transforme", listes_des_farming_avec_parametre select 47 select 2];
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor _couleur_rouge;

((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_add_id) ctrlSetText "Taper le montant du venin que vous souhaitez obtenir ...";
((uiNamespace getVariable _nom_du_menu) displayCtrl _texte_add_id) ctrlSetTextColor _couleur_blanche;

waituntil {!dialog;};
cutText["","BLACK IN"];

