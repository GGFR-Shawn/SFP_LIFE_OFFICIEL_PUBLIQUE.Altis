// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnull player};
waituntil {player == player};
waituntil {alive player};
waituntil {!isnil "fn_SaveToServer"};

if (isServer) exitWith {systemChat "Anti-Hack Divers V3.3 : Initialisation terminée car vous êtes le serveur !"};
[] spawn {sleep (10 + (random 10)); systemChat "Anti-Hack Divers V3.3 : Initialisation terminée.";};
if (getPlayerUID player in sfp_config_liste_admin) exitWith {};

#define GVAR getVariable
#define GVAR_UINS uiNamespace getVariable

[] spawn
{
	// AutoBan script Maxou serveur
	waitUntil {sleep 0.5; !isnil "listes_joueurs_banni_automatiquement"};
	if (getplayeruid player in listes_joueurs_banni_automatiquement) then
	{
		disableUserInput true;
		player setDamage 1;
		sleep 1;
		closeDialog 0;
		["Banni_du_serveur_end_mission",false,true] call BIS_fnc_endMission;	
	};
};

_temps_attente = 60;
while {isnil "Menu_Valide_Hackeur" or isnil "blacklist_variable_hackeur" or isnil "sfp_config_liste_addons_autorise_anti_hack" or isnil "boutton_de_dialogue_autorise"} do
{
	sleep 2;
	player globalchat "attente valeur hack ...";
	_temps_attente = round (_temps_attente - 2);
	if (_temps_attente < 0 && isnil "jai_avertit_de_mon_soucis_de_lanti_hack") then
	{
		jai_avertit_de_mon_soucis_de_lanti_hack = true;
		if (isnil "Menu_Valide_Hackeur") then {menu_valide_hack_check = "ok";}else{menu_valide_hack_check = "Erreur";};
		if (isnil "blacklist_variable_hackeur") then {blacklist_hack_check = "ok";}else{blacklist_hack_check = "Erreur";};
		if (isnil "sfp_config_liste_addons_autorise_anti_hack") then {liste_addon_autorise_hackeur_check = "ok";}else{liste_addon_autorise_hackeur_check = "Erreur";};
		if (isnil "boutton_de_dialogue_autorise") then {boutton_de_dialogue_autorise_check = "ok";}else{boutton_de_dialogue_autorise_check = "Erreur";};
		_detail_du_soucis = format ["Le joueur %1 avec comme id %2 n'a pas bien lancé la protection anti hack ! Listes : Menu_Valide_Hackeur %3 , blacklist_variable_hackeur %4 , sfp_config_liste_addons_autorise_anti_hack %5 , boutton_de_dialogue_autorise %6",name player, getplayeruid player, menu_valide_hack_check, blacklist_hack_check, liste_addon_autorise_hackeur_check, boutton_de_dialogue_autorise_check];
		_heure_du_hack = format ["%1/%2/%3 à %4H%5Min :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
		["Beug initialisation anti hack", "Initialisation anti hack", _heure_du_hack, _detail_du_soucis] call fn_SaveToServer;
	};
};

// ================================================================================================================================================================================
avertir_que_je_compil_menu_hackeur = {[{hint format ["! PROTECTION HACKEUR (KEVIN) ! \n ------------------------------ \n\n Attention, le joueur : \n\n Nom : %1 \n Temps de jeu : %2 Minutes  \n\n Vient de compiler un menu de hack !!! \n\n Mon script va tuer kevin (%1) sans scrupule ! \n\n ------------------------------ \n www.sfpteam.fr \n By SFP Maxou",son_nom_hackeur,sa_date_hackeur];},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;};
avertir_que_j_ouvre_menu_hackeur = {[{hint format ["! PROTECTION HACKEUR (KEVIN) ! \n ------------------------------ \n\n Attention, le joueur : \n\n Nom : %1 \n Temps de jeu : %2 Minutes  \n\n Vient d'ouvrir un menu de hack !!! \n\n Mon script va tuer kevin (%1) sans scrupule ! \n\n ------------------------------ \n www.sfpteam.fr \n By SFP Maxou",son_nom_hackeur,sa_date_hackeur];},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;};
avertir_que_j_ai_un_menu_pour_hacker = {[{hint format ["! PROTECTION HACKEUR (KEVIN) ! \n ------------------------------ \n\n Attention, le joueur : \n\n Nom : %1 \n Temps de jeu : %2 Minutes  \n\n Possède un menu pour hacker mais ne l'a pas encore ouvert !!! \n\n Mon script va tuer kevin (%1) sans scrupule ! \n\n ------------------------------ \n www.sfpteam.fr \n By SFP Maxou",son_nom_hackeur,sa_date_hackeur];},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;};
avertir_que_j_ai_addon_non_autorise_hackeur = {[{hint format ["! PROTECTION HACKEUR (KEVIN) ! \n ------------------------------ \n\n Attention, le joueur : \n\n Nom : %1 \n Temps de jeu : %2 Minutes  \n\n A passé la protection des addons en hackant avec un PBO HIDE !!! \n\n Mon script va tuer kevin (%1) sans scrupule ! \n\n ------------------------------ \n www.sfpteam.fr \n By SFP Maxou",son_nom_hackeur,sa_date_hackeur];},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;};
uiNamespace setVariable ["RscDisplayRemoteMissions",displayNull];

// ================================================================================================================================================================================
// Addons cachés
detection_d_un_addon_cache = [];
_liste_des_configs_patch = configFile >> "CfgPatches";
for "_i" from 0 to count (_liste_des_configs_patch)-1 do 
{
	_config_selectionne = _liste_des_configs_patch select _i;
	if (isClass _config_selectionne) then 
	{
		if (!((configName _config_selectionne) in (sfp_config_liste_addons_autorise_anti_hack))) then
		{
			detection_d_un_addon_cache = detection_d_un_addon_cache + [configName _config_selectionne];
		};
	};
};
	
if (count detection_d_un_addon_cache >= 1) then
{
	son_nom_hackeur = name player;
	publicvariable "son_nom_hackeur";
	sa_date_hackeur = player getvariable "ma_date_de_naissance";
	publicvariable "sa_date_hackeur";
	sleep 1;
	detail_du_hack = format ["Le joueur %1 avec comme id %2 et %3 minutes de jeu à bypassé la protection des addons ! Nom CFG detecté : %4.",name player, getplayeruid player, player getvariable "ma_date_de_naissance",detection_d_un_addon_cache];
	_heure_du_hack = format ["%1/%2/%3 à %4H%5Min :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
	["Hack By Pass Addons", "Les hacks de bypass addons", _heure_du_hack, detail_du_hack] call fn_SaveToServer;
		
	[] call avertir_que_j_ai_addon_non_autorise_hackeur;
	while {true} do
	{
		disableUserInput true;
		closeDialog 0;
		player setDamage 1;
		sleep 1;
		closeDialog 0;
		["Hackeur",false,true] call BIS_fnc_endMission;
	};
};

// ================================================================================================================================================================================
// Devcon cachés
private["_cfg","_patches","_sel","_name","_patches"];
_cfg = configFile >> "CfgPatches";
_patches = [];
for "_i" from 0 to count (_cfg)-1 do
{
	_sel = _cfg select _i;
	if (isClass _sel) then
	{
		_name = configName _sel;
		_patches set[count _patches,_name];
	};
};

if ("DevCon" in _patches) then
{
	son_nom_hackeur = name player;
	publicvariable "son_nom_hackeur";
	sa_date_hackeur = player getvariable "ma_date_de_naissance";
	publicvariable "sa_date_hackeur";
	sleep 1;
	detail_du_hack = format ["Le joueur %1 avec comme id %2 et %3 minutes de jeu avait une console de hack non lancé !",name player, getplayeruid player, player getvariable "ma_date_de_naissance"];
	_heure_du_hack = format ["%1/%2/%3 à %4H%5Min :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
	["Hack Console", "Les hacks de console", _heure_du_hack, detail_du_hack] call fn_SaveToServer;
	
	[] call avertir_que_j_ai_un_menu_pour_hacker;
	mettre_a_jour_liste_ban_auto = (getplayeruid player); sleep 1; publicvariable "mettre_a_jour_liste_ban_auto";
	
	while {true} do
	{
		disableUserInput true;
		closeDialog 0;
		player setDamage 1;
		sleep 1;
		closeDialog 0;
		["Hackeur",false,true] call BIS_fnc_endMission;
	};
};

// ================================================================================================================================================================================
// Compilation variables hack
W_O_O_K_I_E_ANTI_ANTI_HAX = compileFinal "";
W_O_O_K_I_E_FUD_ANTI_ANTI_HAX = compileFinal "";

[] spawn 
{
	while {true} do
	{
		private ["_var_une","_var_deux"];
		{
			_var_une = _x;
			{
				_var_deux = _x GVAR _var_une;
				if(!isNil {_var_deux}) then
				{
					_x setVariable [_var_une,nil];
					missionNamespace setVariable [_var_une,nil];
					son_nom_hackeur = name player;
					publicvariable "son_nom_hackeur";
					sa_date_hackeur = player getvariable "ma_date_de_naissance";
					publicvariable "sa_date_hackeur";
					sleep 1;
					detail_du_hack = format ["Le joueur %1 avec comme id %2 et %3 minutes de jeu à compile une variable interdite sur le serveur ! (valeur %4)",name player, getplayeruid player, player getvariable "ma_date_de_naissance", _var_une];
					_heure_du_hack = format ["%1/%2/%3 à %4H%5Min :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
					["Hack Variable", "Les hacks de variable", _heure_du_hack, detail_du_hack] call fn_SaveToServer;
					
					[] call avertir_que_je_compil_menu_hackeur;
					mettre_a_jour_liste_ban_auto = (getplayeruid player); sleep 1; publicvariable "mettre_a_jour_liste_ban_auto";
					
					while {true} do
					{
						disableUserInput true;
						closeDialog 0;
						titletext ["! SECURITE ANTI HACK ! \n 	------------------------------------------------ \n\n Hack detecté ... Aurevoir :) \n -------------------------------------- \n By SFP Maxou \n www.sfpteam.fr","BLACK OUT",1];
						player setDamage 1;
						sleep 1;
						closeDialog 0;
						["Hackeur",false,true] call BIS_fnc_endMission;
					};
				};
			} forEach [missionNamespace, uiNamespace, profileNamespace, parsingNamespace];
		} foreach blacklist_variable_hackeur;
		sleep 2;
	};
};

// ================================================================================================================================================================================
// Displays de hack
[] spawn
{
	private["_listes_displays","_detection","_display","_timeStamp"];
	disableSerialization;

	_listes_displays = 
	[
		[3030,"BIS_configviewer_display"],[162,"RscDisplayFieldManual"],["RscDisplayRemoteMissions","RscDisplayRemoteMissions"],[316000,"RscDisplayDebugPublic"],[125,"RscDisplayEditDiaryRecord"],
		[69,"UnknownDisplay"],[19,"UnknownDisplay"],[71,"UnknownDisplay"],[45,"UnknownDisplay"],[132,"UnknownDisplay"],[32,"UnknownDisplay"],[165,"RscDisplayPublishMission"],[2727,"RscDisplayLocWeaponInfo"],
		["RscDisplayMovieInterrupt","RscDisplayMovieInterrupt"],[157,"UnknownDisplay"],[30,"UnknownDisplay"],["RscDisplayArsenal","RscDisplayArsenal"],[166,"RscDisplayPublishMissionSelectTags"],[167,"RscDisplayFileSelect"]
	];

	_detection = false;
	_timeStamp = time;
	while {true} do 
	{
		{
			_targetDisplay = _x select 0;
			_targetName = _x select 1;
			switch (typeName _targetDisplay) do 
			{
				case (typeName ""): {if(!isNull (GVAR_UINS [_targetDisplay,displayNull])) exitWith {_detection = true;};};
				default {if(!isNull (findDisplay _targetDisplay)) exitWith {_detection = true;};};
			};
				
			if (_detection) exitWith 
			{
				son_nom_hackeur = name player;
				publicvariable "son_nom_hackeur";
				sa_date_hackeur = player getvariable "ma_date_de_naissance";
				publicvariable "sa_date_hackeur";
				sleep 1;
				detail_du_hack = format ["Le joueur %1 avec comme id %2 et %3 minutes de jeu à lancer un display interdit sur le serveur ! (valeur %4 - %5)",name player, getplayeruid player, player getvariable "ma_date_de_naissance", _targetDisplay, _targetName];
				_heure_du_hack = format ["%1/%2/%3 à %4H%5Min :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
				["Hack Display", "Les hacks de display", _heure_du_hack, detail_du_hack] call fn_SaveToServer;
				
				[] call avertir_que_j_ouvre_menu_hackeur;
				mettre_a_jour_liste_ban_auto = (getplayeruid player); sleep 1; publicvariable "mettre_a_jour_liste_ban_auto";
				
				while {true} do
				{
					showCommandingMenu "";
					disableUserInput true;
					closeDialog 0;
					titletext ["! SECURITE ANTI HACK ! \n 	------------------------------------------------ \n\n Hack detecté ... Aurevoir :) \n -------------------------------------- \n By SFP Maxou \n www.sfpteam.fr","BLACK OUT",1];
					player setDamage 1;
					sleep 1;
					closeDialog 0;
					["Hackeur",false,true] call BIS_fnc_endMission;
				};
			};
		} foreach _listes_displays;
			
		if (_detection) exitWith {};

		if (!isNull (findDisplay 129)) then 
		{
			closeDialog 0;
		};
			
		if(!isNull (findDisplay 148)) then 
		{
			sleep 0.5;
			if ((lbSize 104)-1 > 3) exitWith 
			{
				son_nom_hackeur = name player;
				publicvariable "son_nom_hackeur";
				sa_date_hackeur = player getvariable "ma_date_de_naissance";
				publicvariable "sa_date_hackeur";
				sleep 1;
				detail_du_hack = format ["Le joueur %1 avec comme id %2 et %3 minutes de jeu à lancer un display interdit sur le serveur ! (valeur %4)",name player, getplayeruid player, player getvariable "ma_date_de_naissance", "findDisplay 148"];
				_heure_du_hack = format ["%1/%2/%3 à %4H%5Min :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
				["Hack Display", "Les hacks de display", _heure_du_hack, detail_du_hack] call fn_SaveToServer;
				
				[] call avertir_que_j_ouvre_menu_hackeur;
				mettre_a_jour_liste_ban_auto = (getplayeruid player); sleep 1; publicvariable "mettre_a_jour_liste_ban_auto";
				
				while {true} do
				{
					showCommandingMenu "";
					disableUserInput true;
					closeDialog 0;
					titletext ["! SECURITE ANTI HACK ! \n 	------------------------------------------------ \n\n Hack detecté ... Aurevoir :) \n -------------------------------------- \n By SFP Maxou \n www.sfpteam.fr","BLACK OUT",1];
					player setDamage 1;
					sleep 1;
					closeDialog 0;
					["Hackeur",false,true] call BIS_fnc_endMission;
				};
			};
		};
		
		_display = findDisplay 54;
		if(!isNull _display) then 
		{
			{
				if (_x && !isNull _display) exitWith 
				{
					son_nom_hackeur = name player;
					publicvariable "son_nom_hackeur";
					sa_date_hackeur = player getvariable "ma_date_de_naissance";
					publicvariable "sa_date_hackeur";
					sleep 1;
					detail_du_hack = format ["Le joueur %1 avec comme id %2 et %3 minutes de jeu à lancer un display interdit sur le serveur ! (valeur %4)",name player, getplayeruid player, player getvariable "ma_date_de_naissance", "findDisplay 54"];
					_heure_du_hack = format ["%1/%2/%3 à %4H%5Min :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
					["Hack Display", "Les hacks de display", _heure_du_hack, detail_du_hack] call fn_SaveToServer;
					
					[] call avertir_que_j_ouvre_menu_hackeur;
					mettre_a_jour_liste_ban_auto = (getplayeruid player); sleep 1; publicvariable "mettre_a_jour_liste_ban_auto";
					
					while {true} do
					{
						showCommandingMenu "";
						disableUserInput true;
						closeDialog 0;
						titletext ["! SECURITE ANTI HACK ! \n 	------------------------------------------------ \n\n Hack detecté ... Aurevoir :) \n -------------------------------------- \n By SFP Maxou \n www.sfpteam.fr","BLACK OUT",1];
						player setDamage 1;
						sleep 1;
						closeDialog 0;
						["Hackeur",false,true] call BIS_fnc_endMission;
					};
				};
			} forEach 
			[
				(toLower ctrlText (_display displayCtrl 1001) != toLower localize "STR_A3_RscDisplayInsertMarker_Title"),
				{if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,2]
			];
		};
			
		_display = findDisplay 131;
		if(!isNull _display) then 
		{
			(_display displayCtrl 102) ctrlRemoveAllEventHandlers "LBDblClick";
			(_display displayCtrl 102) ctrlRemoveAllEventHandlers "LBSelChanged";
			
			{
				if (_x && !isNull _display) exitWith 
				{
					son_nom_hackeur = name player;
					publicvariable "son_nom_hackeur";
					sa_date_hackeur = player getvariable "ma_date_de_naissance";
					publicvariable "sa_date_hackeur";
					sleep 1;
					detail_du_hack = format ["Le joueur %1 avec comme id %2 et %3 minutes de jeu à lancer un display interdit sur le serveur ! (valeur %4)",name player, getplayeruid player, player getvariable "ma_date_de_naissance", "findDisplay 131"];
					_heure_du_hack = format ["%1/%2/%3 à %4H%5Min :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
					["Hack Display", "Les hacks de display", _heure_du_hack, detail_du_hack] call fn_SaveToServer;
					
					[] call avertir_que_j_ouvre_menu_hackeur;
					mettre_a_jour_liste_ban_auto = (getplayeruid player); sleep 1; publicvariable "mettre_a_jour_liste_ban_auto";
					
					while {true} do
					{
						showCommandingMenu "";
						disableUserInput true;
						closeDialog 0;
						titletext ["! SECURITE ANTI HACK ! \n 	------------------------------------------------ \n\n Hack detecté ... Aurevoir :) \n -------------------------------------- \n By SFP Maxou \n www.sfpteam.fr","BLACK OUT",1];
						player setDamage 1;
						sleep 1;
						closeDialog 0;
						["Hackeur",false,true] call BIS_fnc_endMission;
					};
				};
			} forEach 
			[
				(toLower ctrlText (_display displayCtrl 1000) != toLower localize "STR_A3_RscDisplayConfigureAction_Title"),
				{if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,104,105,106,107,108,109]
			];
		};
			
		_display = findDisplay 163;
		if(!isNull _display) then 
		{
			(_display displayCtrl 101) ctrlRemoveAllEventHandlers "LBDblClick";
			(_display displayCtrl 101) ctrlRemoveAllEventHandlers "LBSelChanged";
			
			{
				if (_x && !isNull _display) exitWith 
				{
					son_nom_hackeur = name player;
					publicvariable "son_nom_hackeur";
					sa_date_hackeur = player getvariable "ma_date_de_naissance";
					publicvariable "sa_date_hackeur";
					sleep 1;
					detail_du_hack = format ["Le joueur %1 avec comme id %2 et %3 minutes de jeu à lancer un display interdit sur le serveur ! (valeur %4)",name player, getplayeruid player, player getvariable "ma_date_de_naissance", "findDisplay 163"];
					_heure_du_hack = format ["%1/%2/%3 à %4H%5Min :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
					["Hack Display", "Les hacks de display", _heure_du_hack, detail_du_hack] call fn_SaveToServer;
					
					[] call avertir_que_j_ouvre_menu_hackeur;
					mettre_a_jour_liste_ban_auto = (getplayeruid player); sleep 1; publicvariable "mettre_a_jour_liste_ban_auto";
					
					while {true} do
					{
						showCommandingMenu "";
						disableUserInput true;
						closeDialog 0;
						titletext ["! SECURITE ANTI HACK ! \n 	------------------------------------------------ \n\n Hack detecté ... Aurevoir :) \n -------------------------------------- \n By SFP Maxou \n www.sfpteam.fr","BLACK OUT",1];
						player setDamage 1;
						sleep 1;
						closeDialog 0;
						["Hackeur",false,true] call BIS_fnc_endMission;
					};
				};
			} forEach 
			[
				(toLower ctrlText (_display displayCtrl 1000) != toLower localize "STR_DISP_OPTIONS_SCHEME"),
				{if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,2]
			];
		};
		
		if((unitRecoilCoefficient player) < 1) then 
		{
			son_nom_hackeur = name player;
			publicvariable "son_nom_hackeur";
			sa_date_hackeur = player getvariable "ma_date_de_naissance";
			publicvariable "sa_date_hackeur";
			sleep 1;
			detail_du_hack = format ["Le joueur %1 avec comme id %2 et %3 minutes de jeu à lancer un display interdit sur le serveur ! (valeur %4)",name player, getplayeruid player, player getvariable "ma_date_de_naissance", "unitRecoilCoefficient (munitions illimités)"];
			_heure_du_hack = format ["%1/%2/%3 à %4H%5Min :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
			["Hack Display", "Les hacks de display", _heure_du_hack, detail_du_hack] call fn_SaveToServer;
			
			[] call avertir_que_j_ouvre_menu_hackeur;
			mettre_a_jour_liste_ban_auto = (getplayeruid player); sleep 1; publicvariable "mettre_a_jour_liste_ban_auto";
			
			while {true} do
			{
				showCommandingMenu "";
				disableUserInput true;
				closeDialog 0;
				titletext ["! SECURITE ANTI HACK ! \n 	------------------------------------------------ \n\n Hack detecté ... Aurevoir :) \n -------------------------------------- \n By SFP Maxou \n www.sfpteam.fr","BLACK OUT",1];
				player setDamage 1;
				sleep 1;
				closeDialog 0;
				["Hackeur",false,true] call BIS_fnc_endMission;
			};
		};
			
		uiSleep 2;
	};
};

[] spawn 
{
	// Dayz
	private ["_Dernier_Menu_SFP"];
	
	while {true} do
	{
		_Dernier_Menu_SFP = "";
		waitUntil {sleep 1; commandingMenu != _Dernier_Menu_SFP};
		_Dernier_Menu_SFP = commandingMenu;
		
		if(!(commandingMenu in Menu_Valide_Hackeur)) then 
		{
			son_nom_hackeur = name player;
			publicvariable "son_nom_hackeur";
			sa_date_hackeur = player getvariable "ma_date_de_naissance";
			publicvariable "sa_date_hackeur";
			sleep 1;
			detail_du_hack = format ["Le joueur %1 avec comme id %2 et %3 minutes de jeu à lancer un display interdit sur le serveur ! (valeur %4)",name player, getplayeruid player, player getvariable "ma_date_de_naissance", commandingMenu];
			_heure_du_hack = format ["%1/%2/%3 à %4H%5Min :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
			["Hack Display", "Les hacks de display", _heure_du_hack, detail_du_hack] call fn_SaveToServer;
			
			[] call avertir_que_j_ouvre_menu_hackeur;
			while {true} do
			{
				showCommandingMenu "";
				disableUserInput true;
				closeDialog 0;
				titletext ["! SECURITE ANTI HACK ! \n 	------------------------------------------------ \n\n Hack detecté ... Aurevoir :) \n -------------------------------------- \n By SFP Maxou \n www.sfpteam.fr","BLACK OUT",1];
				player setDamage 1;
				sleep 1;
				closeDialog 0;
				["Hackeur",false,true] call BIS_fnc_endMission;
			};
		};		
	};
};

// ================================================================================================================================================================================
// Hack Boutton De Dialogue
[] spawn 
{
	private ["_boutton_de_dialogue"];
	_boutton_de_dialogue = [configFile >> "RscDisplayMPInterrupt" >> "controls",0] call BIS_fnc_returnChildren;

	{
		if(!((configName _x) in boutton_de_dialogue_autorise)) exitWith 
		{
			son_nom_hackeur = name player;
			publicvariable "son_nom_hackeur";
			sa_date_hackeur = player getvariable "ma_date_de_naissance";
			publicvariable "sa_date_hackeur";
			sleep 1;
			detail_du_hack = format ["Le joueur %1 avec comme id %2 et %3 minutes de jeu à lancer un dialogue avec des bouttons interdit dedans ! (valeur %4). Ma liste = (%5)",name player, getplayeruid player, player getvariable "ma_date_de_naissance", configName _x, _boutton_de_dialogue];
			_heure_du_hack = format ["%1/%2/%3 à %4H%5Min :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
			["Hack Dialogues Bouttons", "Les hacks de dialogues", _heure_du_hack, detail_du_hack] call fn_SaveToServer;
			
			[] call avertir_que_j_ouvre_menu_hackeur;
			mettre_a_jour_liste_ban_auto = (getplayeruid player); sleep 1; publicvariable "mettre_a_jour_liste_ban_auto";
			
			while {true} do
			{
				showCommandingMenu "";
				disableUserInput true;
				closeDialog 0;
				titletext ["! SECURITE ANTI HACK ! \n 	------------------------------------------------ \n\n Hack detecté ... Aurevoir :) \n -------------------------------------- \n By SFP Maxou \n www.sfpteam.fr","BLACK OUT",1];
				player setDamage 1;
				sleep 1;
				closeDialog 0;
				["Hackeur",false,true] call BIS_fnc_endMission;
			};
		};
	} foreach _boutton_de_dialogue;
};