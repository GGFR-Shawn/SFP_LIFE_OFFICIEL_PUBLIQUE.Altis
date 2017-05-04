// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

sur_quoi_supprimer_gendarme = _this select 0;
if (isnil "sur_quoi_supprimer_gendarme") exitwith {hint "Erreur sur le choix, recommence ...";};
if (!alive sur_quoi_supprimer_gendarme) exitwith {hint "! SUPPRESSION GENDARMES ! \n ------------------------------------- \n\n Désolé, \n\n Ce véhicule est HS ... \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Suppression_Gendarmes";

createDialog _nom_du_menu;
disableSerialization;

_titre_menu = 11172;
_objet_en_face = 1009;
_numero_add = 11173;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_menu) ctrlSetText "MENU SUPPRESSION GENDARME SFP";

((uiNamespace getVariable _nom_du_menu) displayCtrl _objet_en_face) ctrlSetTextColor _couleur_verte;
((uiNamespace getVariable _nom_du_menu) displayCtrl 1008) ctrlSetText "Type véhicule à modifier :";
((uiNamespace getVariable _nom_du_menu) displayCtrl _objet_en_face) ctrlSetText format ["%1 (%2).", getText ( configFile >> "CfgVehicles" >> typeof sur_quoi_supprimer_gendarme >> "displayName"), sur_quoi_supprimer_gendarme getvariable "plaque_immatriculation_news" select 0];

((uiNamespace getVariable _nom_du_menu) displayCtrl 1001) ctrlSetTextColor _couleur_rouge;

((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbAdd "1)  Supprimer le farming légal.";
((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbAdd "2)  Supprimer le farming illégal.";
((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbAdd "3)  Supprimer le farming légal ET illégal.";
((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbAdd "4)  Supprimer la puce.";
((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbAdd "5)  Supprimer le détecteur de radar.";
((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbAdd "6)  Réinitialiser l'inventaire du véhicule.";

waituntil {!dialog;};
cutText["","BLACK IN"];

sur_quoi_supprimer_gendarme = nil;
