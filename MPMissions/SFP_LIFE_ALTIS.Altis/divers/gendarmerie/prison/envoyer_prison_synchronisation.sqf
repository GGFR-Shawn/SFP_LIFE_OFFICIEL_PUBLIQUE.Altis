// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_victim = _this select 0;
_shooter = _this select 1;
_letemps = _this select 2;

player globalChat format["%1 à été mit en prison par %2 pour %3 minutes !",(name _victim),(name _shooter),_letemps];

if (player == _victim) then
{
	removeheadgear player;
	removeAllWeapons player; 	
	
	mon_temps_de_prison = _letemps;
	jaitricheralaprison = 0;
	if (isnil "mon_temps_de_prison") exitwith {hint "Bug de prison, signale le !";};
	sleep 0.5;
    player playMove "";
    
    ["Jail",["ARRESTED!", "Tu es placé en état d'arrestation !"]] call bis_fnc_showNotification;
    
	if (!isnil "joueur_en_prison") then {joueur_en_prison = nil;};
	if (isnil {player getvariable "joueur_arreter"}) then {player setVariable["joueur_arreter",true,true];};
	if (!isnil {player getvariable "joueur_menotte"}) then {player setVariable["joueur_menotte",nil,true];};
	if (player getvariable "evade_de_prison" > 0) then {player setVariable["evade_de_prison",0,false];};
	if (!isnil {player getvariable "jai_un_sac_sur_la_tete"}) then {player setVariable["jai_un_sac_sur_la_tete",nil,true];};
	if (!isnil {player getvariable "bombe_porte_prison"}) then {player setVariable["bombe_porte_prison",nil,true];};
	if (!isnil {player getvariable "jai_fait_un_cambriolage_news"}) then {player setVariable["jai_fait_un_cambriolage_news",nil,true];};
	if (!isnil {player getvariable "recherche_pour_armes_illegales"}) then {player setVariable["recherche_pour_armes_illegales",nil,true];};
	if (!isnil {player getvariable "recherche_pour_braquage"}) then {player setVariable["recherche_pour_braquage",nil,true];};
	if (!isnil {player getvariable "recherche_pour_conduite_sans_permis"}) then {player setVariable["recherche_pour_conduite_sans_permis",nil,true];};

	[player,["0","1"]] spawn supprimer_inventaire_farming_etc;
    
	jai_le_droit_de_me_tp = 1; 
	_position = getMarkerPos "marker_prison";
	_position set [2,3.5];
    player setPos _position;

    hint "Tu as été démenotté automatiquement ! Appuis sur V ! \n\n N'oublie pas que tu peux essayer de soudoyer le garde ...";
	if (!isnil "noesckey") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown", noesckey];};
	sleep 1;
	
	while {mon_temps_de_prison > 0 && alive player && player in list jesuisdevantlaprison} do
	{
		call compile format ["['Jail',['ARRESTED','Encore %1 minutes de prison !']] call bis_fnc_showNotification;",mon_temps_de_prison];
		sleep 60;
		mon_temps_de_prison = mon_temps_de_prison - 1;
		if (jaitricheralaprison >= 1) exitWith {};
		if (isnil "soudoyerlegarde") then {soudoyerlegarde = 0;};
		if (soudoyerlegarde == 1) exitwith {soudoyerlegarde = 0;mon_temps_de_prison = nil;};
		
		if !(player in list jesuisdevantlaprison) exitwith 
		{
			hint "Vous vous êtes echappé de prison !";
			
			if (!isnil {player getvariable "joueur_arreter"}) then 
			{
				player setVariable["joueur_arreter",nil,true];
			};
		};
	};
	
	if (jaitricheralaprison >= 1) exitWith {mon_temps_de_prison = nil;};
	if (isnil "soudoyerlegarde") then {soudoyerlegarde = 0;};
	if (soudoyerlegarde == 1) exitwith {soudoyerlegarde = 0;mon_temps_de_prison = nil;};
	if !(player in list jesuisdevantlaprison) exitwith 
	{
		hint "Vous vous êtes echappé de prison ! \n\n Attention pendant environs 2 heures de jeu réél (voir inventaire), tu ne pourras plus : \n\n - Changer d'habit. \n - Acheter de véhicule. \n - Manger \n - Boire \n\n Joue en équipe pour ne pas te faire attraper ! ;)";
		random_temps_de_prison_evade = round (80 + (120));
		player setVariable["evade_de_prison",random_temps_de_prison_evade,true]; // En minutes
		if (!isnil {player getvariable "joueur_arreter"}) then {player setVariable["joueur_arreter",nil,true];};
		sleep 0.5; random_temps_de_prison_evade = nil;
		execvm "divers\gendarmerie\prison\systeme_de_prisonnier_quand_evade\action_quand_evader_de_prison.sqf";
	};
	mon_temps_de_prison = nil;
	if (!alive player) exitWith {};

	["Jail",["Free to go!", "Tu es libéré ! Attention la prochaine fois !"]] call bis_fnc_showNotification;
	jai_le_droit_de_me_tp = 1; 
	player setPos (getmarkerpos "respawn_civilian");
	if (!isnil {player getvariable "joueur_arreter"}) then {player setVariable["joueur_arreter",nil,true];};
	jaitricheralaprison = 0;
};

