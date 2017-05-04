// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
private ["_argent_du_menu","_prix_de_depart"];

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_SFP_Telecom";

createDialog _nom_du_menu;
disableSerialization;

_argent_du_menu = "mon_argent_banque_by_sfp_maxou";
_titre_add_id = 1001;
_numero_add = 1002;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText "Boutique SFP Télécom";

for "_i" from 0 to (count sfp_config_liste_des_forfaits_telecoms - 1) do
{
	if (sfp_config_liste_des_forfaits_telecoms select _i select 2 < 1) then
	{
		lbAdd [_numero_add, format ["%1 (%2 %3).", sfp_config_liste_des_forfaits_telecoms select _i select 0, sfp_config_liste_des_forfaits_telecoms select _i select 1, "€"]];
	}else
	{	
		lbAdd [_numero_add, format ["%1 (%2 %3) - (%4 SMS).", sfp_config_liste_des_forfaits_telecoms select _i select 0, sfp_config_liste_des_forfaits_telecoms select _i select 1, "€", sfp_config_liste_des_forfaits_telecoms select _i select 2]];
	};
	((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_i, "Nos forfaits sont à la carte, il n'y à pas d'abonnement."];
};

waituntil {!dialog;};
cutText["","BLACK IN"];