// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "listes_des_klaxons_SFP_Maxou") exitwith {hint "! KLAXON SFP ! \n -------------------------------------------- \n \n Désolé, vous n'avez pas le launcher. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (isnil "le_vehicule_a_tunner_by_maxou") exitwith {hint "! KLAXON SFP ! \n -------------------------------------------- \n \n Erreur sur la selection du véhicule ... Recommence. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (isnil {le_vehicule_a_tunner_by_maxou getvariable "vehicule_info_parvariable"}) exitwith {hint "! KLAXON SFP ! \n -------------------------------------------- \n \n Désolé, ce n'est pas le véhicule d'un joueur ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (le_vehicule_a_tunner_by_maxou getvariable "vehicule_info_parvariable" select 0 != name player) exitwith {hint "! KLAXON SFP ! \n -------------------------------------------- \n \n Désolé, ce n'est pas ton véhicule ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

closedialog 0;

_nom_du_menu = "Menu_Voitures_Tuning_Klaxon";

createDialog _nom_du_menu;
disableSerialization;

_numero_add = 1500;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

// Titre principal
((uiNamespace getVariable _nom_du_menu) displayCtrl 1004) ctrlSetText format ["Personnalisation de votre %1.", getText ( configFile >> "CfgVehicles" >> typeof le_vehicule_a_tunner_by_maxou >> "displayName")];
((uiNamespace getVariable _nom_du_menu) displayCtrl 1004) ctrlSetTextColor _couleur_rouge;

// Choix option tuning
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetTextColor _couleur_verte;

for "_i" from 0 to count listes_des_klaxons_SFP_Maxou do
{
	lbAdd[_numero_add, listes_des_klaxons_SFP_Maxou select _i]; 
};

le_vehicule_a_tunner_by_maxou = nil;
klaxon_sfp_selectionne_pour_achat = nil;