// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_condition = false;
if (!isnil "variable_banque_peut_etre_braque") then
{
	if (variable_banque_peut_etre_braque < 1 && player in list trigger_banque) then 
	{
		_condition = true;
	};	
};
if (_condition) exitwith {hint "Désolé, cet ATM est bloqué lorsqu'il y à eu un braquage de banque ! Reviens plus tard ...";};


hintSilent format ["! SFP BANQUE ! \n ------------------------------------- \n\n N'oubliez pas, vous pouvez obtenir jusqu'a %1 Euros en pret bancaire directement en vous rendant à la banque ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", (sfp_config_reglage_credit_sfp select 0) call retour_formatage_chiffre_sfp];

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Banque_news";

createDialog _nom_du_menu;
disableSerialization;

_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];

// Banque
if (player getvariable "mon_argent_banque_by_sfp_maxou" <= 0) then {couleur_banque = _couleur_rouge;}else{couleur_banque = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetTextColor couleur_banque;
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetText format ["%1 €", (player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp];

// Poche
if (player getvariable "mon_argent_poche_by_sfp_maxou" <= 0) then {couleur_poche = _couleur_rouge;}else{couleur_poche = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1006) ctrlSetTextColor couleur_poche;
((uiNamespace getVariable _nom_du_menu) displayCtrl 1006) ctrlSetText format ["%1 €", (player getVariable "mon_argent_poche_by_sfp_maxou") call retour_formatage_chiffre_sfp];

// Livret A
if (player getvariable "mon_livret_a" <= 0) then {couleur_livret_a = _couleur_rouge;}else{couleur_livret_a = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl 1009) ctrlSetTextColor couleur_livret_a;
((uiNamespace getVariable _nom_du_menu) displayCtrl 1009) ctrlSetText format ["%1 €", (player getVariable "mon_livret_a")];


waituntil {!dialog;};
cutText["","BLACK IN"];