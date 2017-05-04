// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_condition";
waituntil {!isnull player};
waituntil {player == player};
waituntil {alive player};
waitUntil {sleep 1; !isNil "fin_verification_apres_chargement"};
sleep 6;
if (player getvariable "ma_date_de_naissance" <= 2) exitwith {};

_condition = false;
if (player getvariable "mon_argent_banque_by_sfp_maxou" == sfp_config_montant_de_depart_banque && player getvariable "mon_argent_poche_by_sfp_maxou" == sfp_config_montant_de_depart_poche) then {_condition = true;};

if (_condition) then
{
	_heure_soucis = format ["%1/%2/%3 à %4H%5Min %6:",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, name player];
	_detail_soucis = format ["Nom Joueur : %1 , GUID : %2 , Position : %3 a l argent de depart !! Soucis sauvegarde.",name player, getplayeruid player, getPosATL player],
	["Beug Initialisation Argent", "Listes des soucis", _heure_soucis, _detail_soucis] call fn_SaveToServer;
};
