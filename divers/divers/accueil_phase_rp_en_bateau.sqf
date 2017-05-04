// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {alive player && !isnil "fin_verification_apres_chargement"};

private ["_position_de_la_marie","_suppression_bateau_rp","_position_spawn_bateau_phase_rp"];
_position_de_la_marie = getmarkerpos "mairie";
_suppression_bateau_rp = {{if ((typeof _x == "C_Boat_Civil_01_rescue_F") && (count crew _x < 1)) then {if (_x getvariable "vehicule_info_parvariable" select 0 == "bateau_phase_rp") then{deletevehicle _x;};};} foreach vehicles;};
verification_camera_by_maxou = 0;
1 fadeSound 1; 1 fadeMusic 1; 
if (player getvariable "ma_date_de_naissance" >= 2) exitwith {player globalchat "Chargement sauvegarde terminée ! Vous ne vous trouvez peut être pas à l'endroit de votre dernière déconnection. Ceci est normal, pour eviter de spammer la sauvegarde."; cutText["","BLACK IN"];};

player globalchat "Aucune sauvegarde trouvée ! Démarrage d'une nouvelle configuration ...";

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Choisir_Phase_RP";

createDialog _nom_du_menu;
disableSerialization;

_description = "Bonjour jeune naufragé et bienvenue sur l'ile SFP,<br/><br/>Choisit ton mode de débarquement sur l'ile en cliquant sur bateau ou parachute ci dessous ...<br/><br/>Il te suffira ensuite de continuer à suivre la flèche qui se créera.<br/><br/>Bonne chance parmis nous ! ;)";
((uiNamespace getVariable _nom_du_menu) displayCtrl 1005) ctrlSetStructuredText parseText _description;

waitUntil {!isnil "debarquement_choisit_sfp" or !dialog};
cutText["","BLACK IN"];	
if (isnil "debarquement_choisit_sfp") exitwith {hint "Choix obligatoire ..."; execvm "divers\divers\accueil_phase_rp_en_bateau.sqf";};

switch debarquement_choisit_sfp do
{	
	case 1 :
	{
		0 cutText [format["Bonjour jeune naufragé et bienvenue sur l'ile SFP ... \n\n Fraichement prit la direction de notre ile, continue à suivre la boussole (flèche) de ton bateau pour commencer ta nouvelle vie ... ;) \n\n Les habitants de notre île t'accueillerons les bras ouverts si besoin. \n\n Bonne chance !", name player], "BLACK OUT"]; 
		sleep 6;
		0 cutText [format["Bonjour jeune naufragé et bienvenue sur l'ile SFP ... \n\n Fraichement prit la direction de notre ile, continue à suivre la boussole (flèche) de ton bateau pour commencer ta nouvelle vie ... ;) \n\n Les habitants de notre île t'accueillerons les bras ouverts si besoin. \n\n Bonne chance !", name player], "BLACK IN",11]; 
		
		[] spawn _suppression_bateau_rp;

		object_direction_by_maxou = "Sign_Arrow_Direction_Blue_F" createVehicleLocal (position player);
		_position_bateau_phase_rp = false;
		_position_de_spawn = [(14310) - (random 100),(13572) + (random 100), 0];
		while {!_position_bateau_phase_rp} do
		{
			_position_spawn_bateau_phase_rp = [(_position_de_spawn select 0) - (random 30),(_position_de_spawn select 1) + (random 30), 0];
			if (count (nearestObjects [_position_spawn_bateau_phase_rp, ["Car","Ship","Air"], 5]) < 1 && surfaceiswater _position_spawn_bateau_phase_rp) then
			{
				_position_bateau_phase_rp = true;
			};
		};

		_bateau_de_bienvenu_by_maxou = createVehicle ["C_Boat_Civil_01_rescue_F", _position_spawn_bateau_phase_rp, [], 0, ""];
		_bateau_de_bienvenu_by_maxou setDir 10;
		_bateau_de_bienvenu_by_maxou setvariable ["vehicule_info_parvariable",["bateau_phase_rp"], true];
		jai_le_droit_de_me_tp = 1;
		player moveIndriver _bateau_de_bienvenu_by_maxou;

		if (cameraView == "External") then {object_direction_by_maxou attachTo [_bateau_de_bienvenu_by_maxou, [0, - 4, - 0.5] ];};
		if (cameraView == "Internal") then {object_direction_by_maxou attachTo [_bateau_de_bienvenu_by_maxou, [0, 2, 0.5] ];};
		[object_direction_by_maxou, -50, -0.00364812] call BIS_fnc_setPitchBank;
		
		sleep 1;

		while {surfaceiswater (position (vehicle player))} do
		{
			if (verification_camera_by_maxou < 1) then {verification_camera_by_maxou = 1; position_camera_by_maxou = cameraView;};
			if (cameraView != position_camera_by_maxou) then
			{
				verification_camera_by_maxou = 0;
				position_camera_by_maxou = cameraView;
				if (cameraView == "External") then {object_direction_by_maxou attachTo [_bateau_de_bienvenu_by_maxou, [0, - 4, - 0.5] ];};
				if (cameraView == "Internal") then {object_direction_by_maxou attachTo [_bateau_de_bienvenu_by_maxou, [0, 2, 0.5] ];};
			};

			object_direction_by_maxou setDir ([player, [(position Neochori select 0) - (0),(position Neochori select 1) - (0),0]] call BIS_fnc_relativedirTo);
			sleep 0.001;
		};
	};
	
	case 2 :
	{
		0 cutText [format["Bonjour jeune clandestin et bienvenue sur l'ile SFP ... \n\n Fraichement prit la direction de notre ile, continue à suivre la boussole (flèche) de ton parachute pour commencer ta nouvelle vie ... ;) \n\n Les habitants de notre île t'accueillerons les bras ouverts si besoin. \n\n Bonne chance !", name player], "BLACK OUT"]; 
		sleep 6;
		0 cutText [format["Bonjour jeune clandestin et bienvenue sur l'ile SFP ... \n\n Fraichement prit la direction de notre ile, continue à suivre la boussole (flèche) de ton parachute pour commencer ta nouvelle vie ... ;) \n\n Les habitants de notre île t'accueillerons les bras ouverts si besoin. \n\n Bonne chance !", name player], "BLACK IN",11]; 

		object_direction_by_maxou = "Sign_Arrow_Direction_Blue_F" createVehicleLocal (position player);
		object_direction_by_maxou attachTo [vehicle player, [0, 2, -1]];
		
		player addBackpack "B_Parachute";
		
		jai_le_droit_de_me_tp = 1;
		player setPos [13255.8,14051.2,2500];

		while {!isTouchingGround player && typeof (vehicle player) != "Steerable_Parachute_F"} do
		{
			if (verification_camera_by_maxou < 1) then {verification_camera_by_maxou = 1; position_camera_by_maxou = cameraView;};
			if (cameraView != position_camera_by_maxou) then
			{
				verification_camera_by_maxou = 0;
				position_camera_by_maxou = cameraView;
				if (cameraView == "External") then {object_direction_by_maxou attachTo [vehicle player, [0, 2, -1]];};
				if (cameraView == "Internal") then {object_direction_by_maxou attachTo [vehicle player, [0, 2, -1]];};
			};
			addCamShake [16, 3, 2];
			object_direction_by_maxou setDir ([player, [(position Neochori select 0) - (200),(position Neochori select 1) - (0),0]] call BIS_fnc_relativedirTo);
			sleep 0.001;
		};
		
		waitUntil {sleep 4; typeof (vehicle player) == "Steerable_Parachute_F" or !alive player};

		object_direction_by_maxou attachTo [vehicle player, [0, 2, -1]];
		
		sleep 1; 
		
		while {!isTouchingGround (vehicle player)} do
		{
			if (verification_camera_by_maxou < 1) then {verification_camera_by_maxou = 1; position_camera_by_maxou = cameraView;};
			if (cameraView != position_camera_by_maxou) then
			{
				verification_camera_by_maxou = 0;
				position_camera_by_maxou = cameraView;
				if (cameraView == "External") then {object_direction_by_maxou attachTo [vehicle player, [0, 2, -1]];};
				if (cameraView == "Internal") then {object_direction_by_maxou attachTo [vehicle player, [0, 2, -1]];};
			};
			addCamShake [1, 1, 1];
			object_direction_by_maxou setDir ([vehicle player, [(position Neochori select 0) - (200),(position Neochori select 1) - (0),0]] call BIS_fnc_relativedirTo);
			sleep 0.001;
		};
	};
};

titletext ["Tu es bien arrivé à destination ! \n Prend maintenant la direction de la mairie pour créér ta carte d'identité ...","PLAIN"];

[] spawn _suppression_bateau_rp;

if (cameraView == "External") then {object_direction_by_maxou attachTo [player, [0, 2, 2] ];};
if (cameraView == "Internal") then {object_direction_by_maxou attachTo [player, [0, 2, 0.5] ];};
[object_direction_by_maxou, -50, -0.00364812] call BIS_fnc_setPitchBank;
verification_camera_by_maxou = 0;

while {player distance _position_de_la_marie > 5} do
{
	if (verification_camera_by_maxou < 1) then {verification_camera_by_maxou = 1; position_camera_by_maxou = cameraView;};
	if (cameraView != position_camera_by_maxou) then
	{
		verification_camera_by_maxou = 0;
		position_camera_by_maxou = cameraView;
		if (cameraView == "External") then {object_direction_by_maxou attachTo [player, [0, 2, 2] ];};
		if (cameraView == "Internal") then {object_direction_by_maxou attachTo [player, [0, 2, 0.5] ];};
	};

	object_direction_by_maxou setDir ([player, (_position_de_la_marie)] call BIS_fnc_relativedirTo);
	sleep 0.001;
};

titletext ["Tu es bien arrivé à la mairie ! Créer ta carte et rends toi ensuite à la boutique licence pour acheter le necessaire ;)","PLAIN"];

if (cameraView == "External") then {object_direction_by_maxou attachTo [player, [0, 2, 2] ];};
if (cameraView == "Internal") then {object_direction_by_maxou attachTo [player, [0, 2, 0.5] ];};
[object_direction_by_maxou, -50, -0.00364812] call BIS_fnc_setPitchBank;
verification_camera_by_maxou = 0;

while {player distance (getmarkerpos "carshoplicense") > 5} do
{
	if (verification_camera_by_maxou < 1) then {verification_camera_by_maxou = 1; position_camera_by_maxou = cameraView;};
	if (cameraView != position_camera_by_maxou) then
	{
		verification_camera_by_maxou = 0;
		position_camera_by_maxou = cameraView;
		if (cameraView == "External") then {object_direction_by_maxou attachTo [player, [0, 2, 2] ];};
		if (cameraView == "Internal") then {object_direction_by_maxou attachTo [player, [0, 2, 0.5] ];};
	};

	object_direction_by_maxou setDir ([player, (getmarkerpos "carshoplicense")] call BIS_fnc_relativedirTo);
	sleep 0.001;
};

deletevehicle object_direction_by_maxou;
titletext ["Tu es bien arrivé a la boutique licences ! Achète maintenant tes licences, permis, etc ... \n Bon jeu à toi ;) \n\n Saches également que nous n'utilisons pas de PNJ pour les menus, \n il te suffit d'aller sur l'endroit désiré et de mettre un coup de roulette pour avoir les menus.","PLAIN"];
