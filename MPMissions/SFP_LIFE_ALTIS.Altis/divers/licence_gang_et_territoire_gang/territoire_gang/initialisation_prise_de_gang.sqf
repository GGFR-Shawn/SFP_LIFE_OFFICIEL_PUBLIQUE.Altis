// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "possession_camp_gang") exitwith {hint "Désolé, la variable est inconnue, contact maxou !";};

if (isnil "fin_compilation_listes_prise_de_gang") then {[] call compile PreprocessFileLineNumbers "config\compilation_listes_achat_prise_de_gang.sqf";};
waituntil {!isnil "fin_compilation_listes_prise_de_gang";};

private ["_gang_le_possedant_actuellement","_gang_voulant_le_capturer","_temps_pour_capture","_listes_des_gangs_sur_l_ile","_mon_gang_actuel"];
_gang_le_possedant_actuellement = possession_camp_gang select 0;
_gang_voulant_le_capturer = possession_camp_gang select 1;
_temps_pour_capture = temps_capture_camp_de_gang;
_listes_des_gangs_sur_l_ile = ["licence_gang_v2",sfp_config_famille_une_nom_pour_variable, sfp_config_famille_deux_nom_pour_variable];
menu_prise_de_gang = nil;

_mon_gang_actuel = "";
{if (!isnil {player getvariable _x}) then{_mon_gang_actuel = _x;};} foreach _listes_des_gangs_sur_l_ile;
if (_mon_gang_actuel == "") exitwith {hint "Capture impossible, vous ne faite pas partie d'un gang officiel ou reconnu ...";};

if (_mon_gang_actuel == _gang_le_possedant_actuellement) then 
{
	if (_gang_voulant_le_capturer != _mon_gang_actuel) then 
	{
		if (temps_capture_camp_de_gang != (round (60 * 15))) then 
		{
			temps_capture_camp_de_gang = round (60 * 15);
			publicvariable "temps_capture_camp_de_gang";
			
			hint "! CAPTURE DE GANG ! \n --------------------------------------- \n\n Un autre gang à voulu prendre votre camp !!! \n Le temps de capture à été réinitialisé suite à votre visite ;) \n ------------------------------------------ \n www.sfpteam.fr, by Maxou.";
		};
			
		possession_camp_gang set [1, _mon_gang_actuel];
		publicvariable "possession_camp_gang";
	};
};

if (_mon_gang_actuel == _gang_le_possedant_actuellement) exitwith 
{
	hint "! CAPTURE DE GANG ! \n --------------------------------------- \n\n Bienvenu dans votre camp ;) \n ------------------------------------------ \n www.sfpteam.fr, by Maxou.";
	menu_prise_de_gang = true;
};

if (_gang_le_possedant_actuellement != "") then
{
	_personne_connecte_ayant_le_camp = [];
	{
		if (_x getvariable _gang_le_possedant_actuellement) then
		{
			_personne_connecte_ayant_le_camp pushBack _x;
		};
	} foreach playableUnits;

	[[[_mon_gang_actuel, _personne_connecte_ayant_le_camp],"divers\licence_gang_et_territoire_gang\territoire_gang\avertir_qu_un_gangster_capture_le_camp.sqf"],"BIS_fnc_execVM",true, false] spawn BIS_fnc_MP;
};

[_mon_gang_actuel] execvm "divers\licence_gang_et_territoire_gang\territoire_gang\demarrage_prise_de_gang.sqf";




