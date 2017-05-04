// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_joueur = _this select 0;
_argent_prit = _this select 1;
_par_qui = _this select 2;
if (isnil "_le_joueur" or isnil "_argent_prit" or isnil "_par_qui") exitwith {hint "Erreur, contact Maxou.";};
if (player != _le_joueur) exitwith {};

player setvariable ["mon_argent_poche_by_sfp_maxou",0, true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp"; 

_heure_du_log = format ["%1/%2/%3 à %4H%5Min %6 1):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, name player];
_detail_du_log = format ["C est fait voler %1 Euros par %2.",_argent_prit, name _par_qui];
["Historique Vol Des Joueurs", "Historique Vol Des Joueurs", _heure_du_log, _detail_du_log] call fn_SaveToServer;

for "_i" from 0 to 2 do
{
	sleep 3;
	hint format ["%1 vous à prit vos %2 %3 lorsqu'il vous à frappé !", name _par_qui, (_argent_prit) call retour_formatage_chiffre_sfp, "€"];	
};

