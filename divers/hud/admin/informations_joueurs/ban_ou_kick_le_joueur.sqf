// =====================================================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =====================================================================================================================================================================================================================

private "_condition_deux";
_condition = _this select 0;
_condition_deux = true;
_sur_quel_joueur = _this select 1;
_le_moderateur = _this select 2;
if (isnil "_condition" or isnil "_sur_quel_joueur" or isnil "_le_moderateur") exitwith {hint "Erreur, recommence ...";};
if (isnil "sfp_config_liste_moderateur") exitWith {hint "Erreur, la liste des modérateurs est vide !";};					

if (getPlayerUID player in sfp_config_liste_moderateur) then 
{
	if ((_condition == "1" or _condition == "2") && name le_joueur_selectionne_informations_admin == "[SFP] Maxou") exitwith {_condition_deux = false; hint "Mais bien sur ...";};
	if (isnil "le_joueur_selectionne_informations_admin") then {_condition_deux = false; hint "Erreur sur la personne recherché !";};
	if (nom_du_menu_informations_des_joueurs select 0 == "Aucun joueur connecté ...") then {_condition_deux = false; hint "Nonnnnn ! Même ici je dois ajouter des sécurités !!! ^^ Tu sais pas lire ?!!! :D";};	
};					
if (!_condition_deux) exitwith {};

/*
	Condition :
	1 = Moderateur action kick
	2 = Moderateur action ban
	3 = Action Kick sur le joueur
	4 = Action Ban sur le joueur
*/

switch _condition do
{
	case "1" :
	{
		hint format ["%1 va être kické !", name le_joueur_selectionne_informations_admin];
		[[["3",le_joueur_selectionne_informations_admin, _le_moderateur],"divers\hud\admin\informations_joueurs\ban_ou_kick_le_joueur.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
		
		_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
		_detail_du_log = format ["%1 a kicke %2",name player, name le_joueur_selectionne_informations_admin];
		["Historique action modo", "Historique action modo", _heure_du_log, _detail_du_log] call fn_SaveToServer;
	};
	case "2" :
	{
		hint format ["%1 va être BAN !", name le_joueur_selectionne_informations_admin];
		[[["4",le_joueur_selectionne_informations_admin, _le_moderateur],"divers\hud\admin\informations_joueurs\ban_ou_kick_le_joueur.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
		
		_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
		_detail_du_log = format ["%1 a banni %2",name player, name le_joueur_selectionne_informations_admin];
		["Historique action modo", "Historique action modo", _heure_du_log, _detail_du_log] call fn_SaveToServer;
	};
	case "3" :
	{
		if (player == _sur_quel_joueur) then
		{
			hint format["Tu as été kické du serveur par %1 !", _le_moderateur];
			["Kick_du_serveur_end_mission",false,true] call BIS_fnc_endMission;	
		};
	};
	case "4" :
	{
		if (player == _sur_quel_joueur) then
		{
			mettre_a_jour_liste_ban_auto = (getplayeruid player); sleep 1; publicvariable "mettre_a_jour_liste_ban_auto";
			hint format["Tu as été banni du serveur par %1 !", _le_moderateur];
			["Banni_du_serveur_end_mission",false,true] call BIS_fnc_endMission;	
		};
	};
};