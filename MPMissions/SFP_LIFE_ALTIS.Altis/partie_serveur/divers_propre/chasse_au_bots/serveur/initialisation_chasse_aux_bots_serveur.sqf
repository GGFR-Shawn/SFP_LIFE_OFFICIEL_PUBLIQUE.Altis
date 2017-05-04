//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_choix_demarrage = ["1","2"] call bis_fnc_selectrandom;
if (_choix_demarrage != "1") exitwith {};

"DIAG SFP : Chasse aux bots : Lancement du script." spawn historique_creation_log_sfp;

// -------------------------------------------------------------------- La position -------------------------------------------------------- //
_nomdusecteur_valide = [Neochori,Alikampos,Edessa,Dorida,kalithea,Zaros,Chalkeia,poliakko,Kavala,Lakka,Therisa,Neochori,Pyrgos,Agios_dionysios,Charkia,Stravos,Panochori] call BIS_fnc_selectRandom;

// ----------------------------------------------------------------- verifier si joueur en ville -------------------------------------------------------- //
_random_un = [1000,-1000] call bis_fnc_selectrandom;
_random_deux = [1000,-1000] call bis_fnc_selectrandom;

_pos = [((getPosATL _nomdusecteur_valide select 0) + (random _random_un)),((getPosATL _nomdusecteur_valide select 1) + (random _random_deux)),0];
_verifierjoueurautour = _pos nearEntities [["man"], 300];
if ({isPlayer _x} count (_verifierjoueurautour) > 0) exitwith {sleep 0.3; execvm "partie_serveur\divers_propre\chasse_au_bots\serveur\initialisation_chasse_aux_bots_serveur.sqf";};

// ----------------------------------------------------------------- verifier de la surface -------------------------------------------------------- //
if (surfaceIsWater _pos) exitwith {sleep 0.3; execvm "partie_serveur\divers_propre\chasse_au_bots\serveur\initialisation_chasse_aux_bots_serveur.sqf";};

// -------------------------------------------------------------- Choix des bots --------------------------------------------------------------------
sleep (1200 + (random 1200));

// =================================================================================================================================================================
															// ENREGISTRER INIDB HISTORIQUE //
// =================================================================================================================================================================
_heure_du_log = format ["%1/%2/%3 à %4H%5Min:",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
["Historique Chasse Aux Bots", "Historique Chasse Aux Bots", _heure_du_log, "Demarrage de la chasse aux bots."] call saveToDB;
"DIAG SFP : Chasse aux bots : Script choisit." spawn historique_creation_log_sfp;
// =================================================================================================================================================================

combien_de_bot = round ( 1 + (random 14));
combien_de_bot_pour_avertir = combien_de_bot;
publicvariable "combien_de_bot_pour_avertir";

group2 = Creategroup EAST; 

_quel_bots_un = ["O_Soldier_AAA_F","O_Soldier_AAT_F","O_Soldier_AAR_F","O_engineer_F","O_Soldier_AA_F","O_Soldier_AT_F","O_sniper_F","O_spotter_F","O_diver_exp_F","O_medic_F","O_Soldier_LAT_F","O_Soldier_TL_F","O_Soldier_SL_F","O_Soldier_AR_F","O_Soldier_GL_F","O_Soldier_lite_F"];

quel_objet_prendre_choisit_un = _quel_bots_un call BIS_fnc_selectRandom;
quel_objet_prendre_choisit_un_confirmation = group2 createUnit [quel_objet_prendre_choisit_un, _pos, [], 0, "CAN_COLLIDE"];
[quel_objet_prendre_choisit_un_confirmation] join group2; 
publicvariable "quel_objet_prendre_choisit_un_confirmation";
_le_bot = quel_objet_prendre_choisit_un_confirmation;


if ((1 - combien_de_bot) != 0) then 
{
	combien_de_bot = combien_de_bot - 1;
	quel_objet_prendre_choisit_deux = _quel_bots_un call BIS_fnc_selectRandom;
	quel_objet_prendre_choisit_un_confirmation_deux = group2 createUnit [quel_objet_prendre_choisit_deux, _pos, [], 0, "CAN_COLLIDE"];
	[quel_objet_prendre_choisit_un_confirmation_deux] join group2; 
	publicvariable "quel_objet_prendre_choisit_un_confirmation_deux";
	_le_bot = quel_objet_prendre_choisit_un_confirmation_deux;
};
if ((1 - combien_de_bot) != 0) then 
{
	combien_de_bot = combien_de_bot - 1;
	quel_objet_prendre_choisit_trois = _quel_bots_un call BIS_fnc_selectRandom;
	quel_objet_prendre_choisit_un_confirmation_trois = group2 createUnit [quel_objet_prendre_choisit_trois, _pos, [], 0, "CAN_COLLIDE"];
	[quel_objet_prendre_choisit_un_confirmation_trois] join group2; 
	publicvariable "quel_objet_prendre_choisit_un_confirmation_trois";
	_le_bot = quel_objet_prendre_choisit_un_confirmation_trois;
};
if ((1 - combien_de_bot) != 0) then 
{
	combien_de_bot = combien_de_bot - 1;
	quel_objet_prendre_choisit_quatre = _quel_bots_un call BIS_fnc_selectRandom;
	quel_objet_prendre_choisit_un_confirmation_quatre = group2 createUnit [quel_objet_prendre_choisit_quatre, _pos, [], 0, "CAN_COLLIDE"];
	[quel_objet_prendre_choisit_un_confirmation_quatre] join group2; 
	publicvariable "quel_objet_prendre_choisit_un_confirmation_quatre";
	_le_bot = quel_objet_prendre_choisit_un_confirmation_quatre;
};
if ((1 - combien_de_bot) != 0) then 
{
	combien_de_bot = combien_de_bot - 1;
	quel_objet_prendre_choisit_cinq = _quel_bots_un call BIS_fnc_selectRandom;
	quel_objet_prendre_choisit_un_confirmation_cinq = group2 createUnit [quel_objet_prendre_choisit_cinq, _pos, [], 0, "CAN_COLLIDE"];
	[quel_objet_prendre_choisit_un_confirmation_cinq] join group2; 
	publicvariable "quel_objet_prendre_choisit_un_confirmation_cinq";
	_le_bot = quel_objet_prendre_choisit_un_confirmation_cinq;
};
if ((1 - combien_de_bot) != 0) then 
{
	combien_de_bot = combien_de_bot - 1;
	quel_objet_prendre_choisit_six = _quel_bots_un call BIS_fnc_selectRandom;
	quel_objet_prendre_choisit_un_confirmation_six = group2 createUnit [quel_objet_prendre_choisit_six, _pos, [], 0, "CAN_COLLIDE"];
	[quel_objet_prendre_choisit_un_confirmation_six] join group2; 
	publicvariable "quel_objet_prendre_choisit_un_confirmation_six";
	_le_bot = quel_objet_prendre_choisit_un_confirmation_six;
};
if ((1 - combien_de_bot) != 0) then 
{
	combien_de_bot = combien_de_bot - 1;
	quel_objet_prendre_choisit_sept = _quel_bots_un call BIS_fnc_selectRandom;
	quel_objet_prendre_choisit_un_confirmation_sept = group2 createUnit [quel_objet_prendre_choisit_sept, _pos, [], 0, "CAN_COLLIDE"];
	[quel_objet_prendre_choisit_un_confirmation_sept] join group2; 
	publicvariable "quel_objet_prendre_choisit_un_confirmation_sept";
	_le_bot = quel_objet_prendre_choisit_un_confirmation_sept;
};
if ((1 - combien_de_bot) != 0) then 
{
	combien_de_bot = combien_de_bot - 1;
	quel_objet_prendre_choisit_huit = _quel_bots_un call BIS_fnc_selectRandom;
	quel_objet_prendre_choisit_un_confirmation_huit = group2 createUnit [quel_objet_prendre_choisit_huit, _pos, [], 0, "CAN_COLLIDE"];
	[quel_objet_prendre_choisit_un_confirmation_huit] join group2; 
	publicvariable "quel_objet_prendre_choisit_un_confirmation_huit";
	_le_bot = quel_objet_prendre_choisit_un_confirmation_huit;
};
if ((1 - combien_de_bot) != 0) then 
{
	combien_de_bot = combien_de_bot - 1;
	quel_objet_prendre_choisit_neuf = _quel_bots_un call BIS_fnc_selectRandom;
	quel_objet_prendre_choisit_un_confirmation_neuf = group2 createUnit [quel_objet_prendre_choisit_neuf, _pos, [], 0, "CAN_COLLIDE"];
	[quel_objet_prendre_choisit_un_confirmation_neuf] join group2; 
	publicvariable "quel_objet_prendre_choisit_un_confirmation_neuf";
	_le_bot = quel_objet_prendre_choisit_un_confirmation_neuf;
};
if ((1 - combien_de_bot) != 0) then 
{
	combien_de_bot = combien_de_bot - 1;
	quel_objet_prendre_choisit_dix = _quel_bots_un call BIS_fnc_selectRandom;
	quel_objet_prendre_choisit_un_confirmation_dix = group2 createUnit [quel_objet_prendre_choisit_dix, _pos, [], 0, "CAN_COLLIDE"];
	[quel_objet_prendre_choisit_un_confirmation_dix] join group2; 
	publicvariable "quel_objet_prendre_choisit_un_confirmation_dix";
	_le_bot = quel_objet_prendre_choisit_un_confirmation_dix;
};
if ((1 - combien_de_bot) != 0) then 
{
	combien_de_bot = combien_de_bot - 1;
	quel_objet_prendre_choisit_onze = _quel_bots_un call BIS_fnc_selectRandom;
	quel_objet_prendre_choisit_un_confirmation_onze = group2 createUnit [quel_objet_prendre_choisit_onze, _pos, [], 0, "CAN_COLLIDE"];
	[quel_objet_prendre_choisit_un_confirmation_onze] join group2; 
	publicvariable "quel_objet_prendre_choisit_un_confirmation_onze";
	_le_bot = quel_objet_prendre_choisit_un_confirmation_onze;
};
if ((1 - combien_de_bot) != 0) then 
{
	combien_de_bot = combien_de_bot - 1;
	quel_objet_prendre_choisit_douze = _quel_bots_un call BIS_fnc_selectRandom;
	quel_objet_prendre_choisit_un_confirmation_douze = group2 createUnit [quel_objet_prendre_choisit_douze, _pos, [], 0, "CAN_COLLIDE"];
	[quel_objet_prendre_choisit_un_confirmation_douze] join group2; 
	publicvariable "quel_objet_prendre_choisit_un_confirmation_douze";
	_le_bot = quel_objet_prendre_choisit_un_confirmation_douze;
};
if ((1 - combien_de_bot) != 0) then 
{
	combien_de_bot = combien_de_bot - 1;
	quel_objet_prendre_choisit_treize = _quel_bots_un call BIS_fnc_selectRandom;
	quel_objet_prendre_choisit_un_confirmation_treize = group2 createUnit [quel_objet_prendre_choisit_treize, _pos, [], 0, "CAN_COLLIDE"];
	[quel_objet_prendre_choisit_un_confirmation_treize] join group2; 
	publicvariable "quel_objet_prendre_choisit_un_confirmation_treize";
	_le_bot = quel_objet_prendre_choisit_un_confirmation_treize;
};
if ((1 - combien_de_bot) != 0) then 
{
	combien_de_bot = combien_de_bot - 1;
	quel_objet_prendre_choisit_quatorze = _quel_bots_un call BIS_fnc_selectRandom;
	quel_objet_prendre_choisit_un_confirmation_quatorze = group2 createUnit [quel_objet_prendre_choisit_quatorze, _pos, [], 0, "CAN_COLLIDE"];
	[quel_objet_prendre_choisit_un_confirmation_quatorze] join group2; 
	publicvariable "quel_objet_prendre_choisit_un_confirmation_quatorze";
	_le_bot = quel_objet_prendre_choisit_un_confirmation_quatorze;
};
if ((1 - combien_de_bot) != 0) then 
{
	combien_de_bot = combien_de_bot - 1;
	quel_objet_prendre_choisit_quinze = _quel_bots_un call BIS_fnc_selectRandom;
	quel_objet_prendre_choisit_un_confirmation_quinze = group2 createUnit [quel_objet_prendre_choisit_quinze, _pos, [], 0, "CAN_COLLIDE"];
	[quel_objet_prendre_choisit_un_confirmation_quinze] join group2; 
	publicvariable "quel_objet_prendre_choisit_un_confirmation_quinze";
	_le_bot = quel_objet_prendre_choisit_un_confirmation_quinze;
};

_random_un = [10000,-10000] call bis_fnc_selectrandom;
_random_deux = [10000,-10000] call bis_fnc_selectrandom;
_pos = [((getPosATL _nomdusecteur_valide select 0) + (random _random_un)),((getPosATL _nomdusecteur_valide select 1) + (random _random_deux)),0];

_waypoint0 = group2 addwaypoint [_pos, 0];
_waypoint0 setwaypointtype "Move"; 
_waypoint0 setWaypointSpeed "LIMITED";
_waypoint0 setWaypointFormation "WEDGE";
_waypoint0 setWaypointCombatMode "RED";

sleep 2;

argent_recompense_un = (1000 + (random 1000));
publicvariable "argent_recompense_un";
argent_recompense_deux = (1000 + (random 1000));
publicvariable "argent_recompense_deux";
argent_recompense_trois = (1000 + (random 1000));
publicvariable "argent_recompense_trois";
argent_recompense_quatre = (1000 + (random 1000));
publicvariable "argent_recompense_quatre";
argent_recompense_cinq = (1000 + (random 1000));
publicvariable "argent_recompense_cinq";
argent_recompense_six = (1000 + (random 1000));
publicvariable "argent_recompense_six";
argent_recompense_sept = (1000 + (random 1000));
publicvariable "argent_recompense_sept";
argent_recompense_huit = (1000 + (random 1000));
publicvariable "argent_recompense_huit";
argent_recompense_neuf = (1000 + (random 1000));
publicvariable "argent_recompense_neuf";
argent_recompense_dix = (1000 + (random 1000));
publicvariable "argent_recompense_dix";
argent_recompense_onze = (1000 + (random 1000));
publicvariable "argent_recompense_onze";
argent_recompense_douze = (1000 + (random 1000));
publicvariable "argent_recompense_douze";
argent_recompense_treize = (1000 + (random 1000));
publicvariable "argent_recompense_treize";
argent_recompense_quatorze = (1000 + (random 1000));
publicvariable "argent_recompense_quatorze";
argent_recompense_quinze = (1000 + (random 1000));
publicvariable "argent_recompense_quinze";

sleep 1;
lancement_de_la_chasse_au_bot = 1;
publicvariable "lancement_de_la_chasse_au_bot";

[] spawn 
{
	private "_resultat_position";
	createMarker ["spawn_des_terros", getPosATL quel_objet_prendre_choisit_un_confirmation];
	"spawn_des_terros" setMarkerShape "ICON";
	"spawn_des_terros" setMarkerColor "ColorWhite";
	"spawn_des_terros" setMarkerSize [0.7,0.7];
	"spawn_des_terros" setMarkerType "b_mech_inf";
	"spawn_des_terros" setMarkerText " Dernier Signalement Terros !";

	while {lancement_de_la_chasse_au_bot > 0} do
	{
		_temps = round (20 * 60);
		while {_temps > 0 && lancement_de_la_chasse_au_bot > 0} do
		{
			_temps = round (_temps - 1);
			sleep 1;
		};
		
		if (!isnil "quel_objet_prendre_choisit_un_confirmation") then {_resultat_position = getpos quel_objet_prendre_choisit_un_confirmation;};
		if (!isnil "quel_objet_prendre_choisit_un_confirmation_deux") then {_resultat_position = getpos quel_objet_prendre_choisit_un_confirmation_deux;};
		if (!isnil "quel_objet_prendre_choisit_un_confirmation_trois") then {_resultat_position = getpos quel_objet_prendre_choisit_un_confirmation_trois;};
		if (!isnil "quel_objet_prendre_choisit_un_confirmation_quatre") then {_resultat_position = getpos quel_objet_prendre_choisit_un_confirmation_quatre;};
		if (!isnil "quel_objet_prendre_choisit_un_confirmation_cinq") then {_resultat_position = getpos quel_objet_prendre_choisit_un_confirmation_cinq;};
		if (!isnil "quel_objet_prendre_choisit_un_confirmation_six") then {_resultat_position = getpos quel_objet_prendre_choisit_un_confirmation_six;};
		if (!isnil "quel_objet_prendre_choisit_un_confirmation_sept") then {_resultat_position = getpos quel_objet_prendre_choisit_un_confirmation_sept;};
		if (!isnil "quel_objet_prendre_choisit_un_confirmation_huit") then {_resultat_position = getpos quel_objet_prendre_choisit_un_confirmation_huit;};
		if (!isnil "quel_objet_prendre_choisit_un_confirmation_neuf") then {_resultat_position = getpos quel_objet_prendre_choisit_un_confirmation_neuf;};
		if (!isnil "quel_objet_prendre_choisit_un_confirmation_dix") then {_resultat_position = getpos quel_objet_prendre_choisit_un_confirmation_dix;};
		if (!isnil "quel_objet_prendre_choisit_un_confirmation_onze") then {_resultat_position = getpos quel_objet_prendre_choisit_un_confirmation_onze;};
		if (!isnil "quel_objet_prendre_choisit_un_confirmation_douze") then {_resultat_position = getpos quel_objet_prendre_choisit_un_confirmation_douze;};
		if (!isnil "quel_objet_prendre_choisit_un_confirmation_treize") then {_resultat_position = getpos quel_objet_prendre_choisit_un_confirmation_treize;};
		if (!isnil "quel_objet_prendre_choisit_un_confirmation_quatorze") then {_resultat_position = getpos quel_objet_prendre_choisit_un_confirmation_quatorze;};
		if (!isnil "quel_objet_prendre_choisit_un_confirmation_quinze") then {_resultat_position = getpos quel_objet_prendre_choisit_un_confirmation_quinze;};
		"spawn_des_terros" setMarkerpos _resultat_position;	
	};
};


if (!isnil "quel_objet_prendre_choisit_un_confirmation") then {waituntil {sleep 1;!alive quel_objet_prendre_choisit_un_confirmation};sleep 3;quel_objet_prendre_choisit_un_confirmation = nil;publicvariable "quel_objet_prendre_choisit_un_confirmation";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_deux") then {waituntil {sleep 1;!alive quel_objet_prendre_choisit_un_confirmation_deux};sleep 3;quel_objet_prendre_choisit_un_confirmation_deux = nil;publicvariable "quel_objet_prendre_choisit_un_confirmation_deux";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_trois") then {waituntil {sleep 1;!alive quel_objet_prendre_choisit_un_confirmation_trois};sleep 3;quel_objet_prendre_choisit_un_confirmation_trois = nil;publicvariable "quel_objet_prendre_choisit_un_confirmation_trois";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_quatre") then {waituntil {sleep 1;!alive quel_objet_prendre_choisit_un_confirmation_quatre};sleep 3;quel_objet_prendre_choisit_un_confirmation_quatre = nil;publicvariable "quel_objet_prendre_choisit_un_confirmation_quatre";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_cinq") then {waituntil {sleep 1;!alive quel_objet_prendre_choisit_un_confirmation_cinq};sleep 3;quel_objet_prendre_choisit_un_confirmation_cinq = nil;publicvariable "quel_objet_prendre_choisit_un_confirmation_cinq";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_six") then {waituntil {sleep 1;!alive quel_objet_prendre_choisit_un_confirmation_six};sleep 3;quel_objet_prendre_choisit_un_confirmation_six = nil;publicvariable "quel_objet_prendre_choisit_un_confirmation_six";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_sept") then {waituntil {sleep 1;!alive quel_objet_prendre_choisit_un_confirmation_sept};sleep 3;quel_objet_prendre_choisit_un_confirmation_sept = nil;publicvariable "quel_objet_prendre_choisit_un_confirmation_sept";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_huit") then {waituntil {sleep 1;!alive quel_objet_prendre_choisit_un_confirmation_huit};sleep 3;quel_objet_prendre_choisit_un_confirmation_huit = nil;publicvariable "quel_objet_prendre_choisit_un_confirmation_huit";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_neuf") then {waituntil {sleep 1;!alive quel_objet_prendre_choisit_un_confirmation_neuf};sleep 3;quel_objet_prendre_choisit_un_confirmation_neuf = nil;publicvariable "quel_objet_prendre_choisit_un_confirmation_neuf";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_dix") then {waituntil {sleep 1;!alive quel_objet_prendre_choisit_un_confirmation_dix};sleep 3;quel_objet_prendre_choisit_un_confirmation_dix = nil;publicvariable "quel_objet_prendre_choisit_un_confirmation_dix";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_onze") then {waituntil {sleep 1;!alive quel_objet_prendre_choisit_un_confirmation_onze};sleep 3;quel_objet_prendre_choisit_un_confirmation_onze = nil;publicvariable "quel_objet_prendre_choisit_un_confirmation_onze";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_douze") then {waituntil {sleep 1;!alive quel_objet_prendre_choisit_un_confirmation_douze};sleep 3;quel_objet_prendre_choisit_un_confirmation_douze = nil;publicvariable "quel_objet_prendre_choisit_un_confirmation_douze";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_treize") then {waituntil {sleep 1;!alive quel_objet_prendre_choisit_un_confirmation_treize};sleep 3;quel_objet_prendre_choisit_un_confirmation_treize = nil;publicvariable "quel_objet_prendre_choisit_un_confirmation_treize";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_quatorze") then {waituntil {sleep 1;!alive quel_objet_prendre_choisit_un_confirmation_quatorze};sleep 3;quel_objet_prendre_choisit_un_confirmation_quatorze = nil;publicvariable "quel_objet_prendre_choisit_un_confirmation_quatorze";};
if (!isnil "quel_objet_prendre_choisit_un_confirmation_quinze") then {waituntil {sleep 1;!alive quel_objet_prendre_choisit_un_confirmation_quinze};sleep 3;quel_objet_prendre_choisit_un_confirmation_quinze = nil;publicvariable "quel_objet_prendre_choisit_un_confirmation_quinze";};

sleep 1;

deletemarker "spawn_des_terros";

lancement_de_la_chasse_au_bot = 0;
publicvariable "lancement_de_la_chasse_au_bot";

argent_recompense_un = nil;
publicvariable "argent_recompense_un";
argent_recompense_deux = nil;
publicvariable "argent_recompense_deux";
argent_recompense_trois = nil;
publicvariable "argent_recompense_trois";
argent_recompense_quatre = nil;
publicvariable "argent_recompense_quatre";
argent_recompense_cinq = nil;
publicvariable "argent_recompense_cinq";
argent_recompense_six = nil;
publicvariable "argent_recompense_six";
argent_recompense_sept = nil;
publicvariable "argent_recompense_sept";
argent_recompense_huit = nil;
publicvariable "argent_recompense_huit";
argent_recompense_neuf = nil;
publicvariable "argent_recompense_neuf";
argent_recompense_dix = nil;
publicvariable "argent_recompense_dix";
argent_recompense_onze = nil;
publicvariable "argent_recompense_onze";
argent_recompense_douze = nil;
publicvariable "argent_recompense_douze";
argent_recompense_treize = nil;
publicvariable "argent_recompense_treize";
argent_recompense_quatorze = nil;
publicvariable "argent_recompense_quatorze";
argent_recompense_quinze = nil;
publicvariable "argent_recompense_quinze";

sleep 60;

execvm "partie_serveur\divers_propre\chasse_au_bots\serveur\initialisation_chasse_aux_bots_serveur.sqf";

// =================================================================================================================================================================
															// ENREGISTRER INIDB HISTORIQUE //
// =================================================================================================================================================================
_heure_du_log = format ["%1/%2/%3 à %4H%5Min:",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
["Historique Chasse Aux Bots", "Historique Chasse Aux Bots", _heure_du_log, "Fin de la chasse aux bots."] call saveToDB;
"DIAG SFP : Chasse aux bots : Script terminé." spawn historique_creation_log_sfp;
// =================================================================================================================================================================
