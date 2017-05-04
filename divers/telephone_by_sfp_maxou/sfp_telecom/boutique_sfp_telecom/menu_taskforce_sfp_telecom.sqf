// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
private ["_argent_du_menu","_prix_de_depart"];

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_TaskForce_Telecom";

createDialog _nom_du_menu;
disableSerialization;

_argent_du_menu = "mon_argent_banque_by_sfp_maxou";
_titre_add_id = 1001;
_numero_add = 1002;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

// Action 1 = Addbackpack
// Action 2 = AddItems

listes_taskforce_sfp_telecom = [
									["Radio courte portée (TaskForce)", "tf_anprc152", 215, 2],
									["Radio véhicule (TaskForce)", "tf_rt1523g", 525, 1],
									["Radio aéroporté (TaskForce)", "tf_anarc210", 780, 1]
							   ];

if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText "TaskForce SFP Télécom";

for "_i" from 0 to (count listes_taskforce_sfp_telecom - 1) do
{
	lbAdd [_numero_add, format ["%1 (%2 %3).", listes_taskforce_sfp_telecom select _i select 0, listes_taskforce_sfp_telecom select _i select 2, "€"]];
	
	if (player getvariable _argent_du_menu < (listes_taskforce_sfp_telecom select _i select 2)) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  
	lbSetColor [_numero_add, _i, couleur_valeur];
};

waituntil {!dialog;};
cutText["","BLACK IN"];