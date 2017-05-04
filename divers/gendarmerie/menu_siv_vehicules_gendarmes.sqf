// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_SIV_Vehicules_Gendarmerie";

createDialog _nom_du_menu;
disableSerialization;

_titre_add_id = 1004;
_numero_add = 1500;
_numero_tableau = -1;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor _couleur_rouge;

liste_des_vehicules_detectes = [];
{
	if (!isnil {_x getvariable "plaque_immatriculation_news"}) then
	{
		_format = format ["%1 (%2) - Proprio : %3.", getText ( configFile >> "CfgVehicles" >> typeOf(_x) >> "displayName"), _x getvariable "plaque_immatriculation_news" select 0, _x getvariable 'vehicule_info_parvariable' select 0];
		lbAdd [_numero_add, _format];
		
		liste_des_vehicules_detectes pushback _x;
	};
} foreach vehicles;

if (count liste_des_vehicules_detectes < 1) then
{
	lbAdd [_numero_add, ""];
	lbAdd [_numero_add, "Aucun véhicule détecté."];
};

waituntil {!dialog;};
cutText["","BLACK IN"];