// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

le_vehicule_a_tunner_by_maxou = cursortarget;
if (isnil "le_vehicule_a_tunner_by_maxou") exitwith {hint "Erreur, recommence ...";};
if (revive_mon_side != civilian) exitwith {hint "Opération impossible, il n'y à que les civils qui y sont autorisés ...";};
if (isnil {le_vehicule_a_tunner_by_maxou getvariable "vehicule_info_parvariable"}) exitwith {hint "Opération impossible, ce n'est pas ton véhicule ...";};
if (le_vehicule_a_tunner_by_maxou getvariable "vehicule_info_parvariable" select 0 != name player) exitwith {hint "Opération impossible, ce n'est pas ton véhicule ...";};

_nom_du_menu = "Menu_Voitures_Tuning";

createDialog _nom_du_menu;
disableSerialization;

_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

// Titre principal
((uiNamespace getVariable _nom_du_menu) displayCtrl 1004) ctrlSetText format ["Personnalisation de votre %1.", getText ( configFile >> "CfgVehicles" >> typeof le_vehicule_a_tunner_by_maxou >> "displayName")];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1004) ctrlSetTextColor _couleur_rouge;

// Choix option tuning
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetTextColor _couleur_verte;

lbAdd[1500," Neon de couleur : 500 €"]; ((uiNamespace getVariable _nom_du_menu) displayCtrl 1500) lbSetTooltip [0, "Double cliquez pour installer ce néon."];
lbAdd[1500," Radar de recul  : 300 €"]; ((uiNamespace getVariable _nom_du_menu) displayCtrl 1500) lbSetTooltip [1, "Double cliquez pour installer ce radar."];
lbAdd[1500," Repeindre véhicule  : 340 €"]; ((uiNamespace getVariable _nom_du_menu) displayCtrl 1500) lbSetTooltip [2, "Double cliquez pour repeindre ce véhicule."];
lbAdd[1500," Changer klaxon  : 260 €"]; ((uiNamespace getVariable _nom_du_menu) displayCtrl 1500) lbSetTooltip [3, "Double cliquez pour changer le klaxon."];
lbAdd[1500," Detecteur de radar  : 560 €"]; ((uiNamespace getVariable _nom_du_menu) displayCtrl 1500) lbSetTooltip [4, "Double cliquez pour installer le detecteur."];
lbAdd[1500," Poids du véhicule  : 11 € par KiloSFP."]; ((uiNamespace getVariable _nom_du_menu) displayCtrl 1500) lbSetTooltip [5, "Double cliquez pour modifier le poids du véhicule."];

// Choix option moteur
((uiNamespace getVariable _nom_du_menu) displayCtrl 1009) ctrlSetText "Choix puce moteur :";
((uiNamespace getVariable _nom_du_menu) displayCtrl 1009) ctrlSetTextColor _couleur_verte;

prix_des_puces_moteurs = [1700,2700,4400,5900,13860,30800,514000];

lbAdd[1501," Niveau 1 : 1 700 €"]; ((uiNamespace getVariable _nom_du_menu) displayCtrl 1501) lbSetTooltip [0, "Gain performance 3 %"];
lbAdd[1501," Niveau 2 : 2 700 €"]; ((uiNamespace getVariable _nom_du_menu) displayCtrl 1501) lbSetTooltip [1, "Gain performance 6 %"];
lbAdd[1501," Niveau 3 : 4 400 €"]; ((uiNamespace getVariable _nom_du_menu) displayCtrl 1501) lbSetTooltip [2, "Gain performance 9 %"];
lbAdd[1501," Niveau 4 : 5 900 €"]; ((uiNamespace getVariable _nom_du_menu) displayCtrl 1501) lbSetTooltip [3, "Gain performance 12 %"];
lbAdd[1501," Niveau 5 : 13 860 €"]; ((uiNamespace getVariable _nom_du_menu) displayCtrl 1501) lbSetTooltip [4, "Gain performance 15 %"];
lbAdd[1501," Niveau 6 : 30 800 €"]; ((uiNamespace getVariable _nom_du_menu) displayCtrl 1501) lbSetTooltip [5, "Gain performance 20 %"];
lbAdd[1501," Niveau F1 : 514 000 €"]; ((uiNamespace getVariable _nom_du_menu) displayCtrl 1501) lbSetTooltip [6, "Gain performance 80 %"];

