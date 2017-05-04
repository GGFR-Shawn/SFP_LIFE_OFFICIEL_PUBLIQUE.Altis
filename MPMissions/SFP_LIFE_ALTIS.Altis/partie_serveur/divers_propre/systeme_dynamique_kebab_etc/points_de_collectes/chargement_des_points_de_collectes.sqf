// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Divers", "Historique Divers", _heure_du_log, "Debut de creation des points de collecte."] call saveToDB;
"DIAG SFP : Points de collecte : Début des créations." spawn historique_creation_log_sfp;

private ["_creation_marker_point_de_spawn_sfp","_position_endroit_spawner","_condition_collecte"];

_creation_marker_point_de_spawn_sfp =
{
	_position = _this select 0;
	_couleur_marker = _this select 1;
	_shape_marker = _this select 2;
	_type_marker = _this select 3;
	_size_marker = _this select 4;
	_texte_marker = _this select 5;
	if (isnil "_couleur_marker" or isnil "_shape_marker" or isnil "_type_marker" or isnil "_size_marker" or isnil "_texte_marker" or isnil "_position") exitwith {hint "Erreur sur la création d'un point de collecte !";};
	
	_nom_du_marker_trigger_collecte = format ["point_de_collecte_%1", _position select 0];
	_repere_du_marker_trigger_collecte = createMarker [_nom_du_marker_trigger_collecte, _position];
	_repere_du_marker_trigger_collecte setMarkerColor _couleur_marker;
	_repere_du_marker_trigger_collecte setMarkerShape _shape_marker;
	_repere_du_marker_trigger_collecte setMarkerType _type_marker;
	_repere_du_marker_trigger_collecte setMarkerSize _size_marker;
	_nom_du_marker_trigger_collecte setMarkerText _texte_marker;
};

_position_endroit_spawner = [];

_lancement_initilisation_points_de_collecte = [] execvm "config\config_positions_points_de_farms.sqf";
waitUntil {scriptDone _lancement_initilisation_points_de_collecte;};

// ======================================================================= COLLECTE OR ==================================================================
_condition_collecte = false;
"DIAG SFP : Points de collecte : Point de collecte 1." spawn historique_creation_log_sfp;
while {!_condition_collecte && count sfp_config_position_collecte_or < 1} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; _position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	pos_collecte_or = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	_verificationsurface = ["#GdtGrassDry"]; // Sable et desert
	if ((surfaceType pos_collecte_or) in _verificationsurface && (markerpos "marche_legal_un") distance pos_collecte_or > 800 && (markerpos "marche_legal_deux") distance pos_collecte_or > 800 && (markerpos "marche_legal_trois") distance pos_collecte_or > 800 && !isOnRoad pos_collecte_or && !surfaceIsWater pos_collecte_or) then 
	{
		_condition_collecte = true;
		{
			if (pos_collecte_or distance _x < 1000) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_or < 1) then
{
	[pos_collecte_or, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Or"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_or;
}else
{
	{
		[getmarkerpos _x, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Or"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_or;
};

// ======================================================================= COLLECTE TRUFFE ==================================================================
_condition_collecte = false;
"DIAG SFP : Points de collecte : Point de collecte 2." spawn historique_creation_log_sfp;
while {!_condition_collecte && count sfp_config_position_collecte_truffes < 1} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; _position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	pos_collecte_truffe = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	if ((markerpos "marche_legal_un") distance pos_collecte_truffe > 800 && (markerpos "marche_legal_deux") distance pos_collecte_truffe > 800 && (markerpos "marche_legal_trois") distance pos_collecte_truffe > 800 && !isOnRoad pos_collecte_truffe && !surfaceIsWater pos_collecte_truffe) then 
	{
		_condition_collecte = true;
		{
			if (pos_collecte_truffe distance _x < 1000) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_truffes < 1) then
{
	[pos_collecte_truffe, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Truffes"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_truffe;
}else
{
	{
		[getmarkerpos _x, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Truffes"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_truffes;
};

// ======================================================================= COLLECTE POISSON ==================================================================
_condition_collecte = false;
"DIAG SFP : Points de collecte : Point de collecte 3." spawn historique_creation_log_sfp;
_position_de_base_pour_spawn = [14590,12779,0];
while {!_condition_collecte && count sfp_config_position_collecte_poissons < 1} do 
{
	_position_une_random = [-8000, 8000] call BIS_fnc_selectRandom; _position_deux_random = [-8000, 8000] call BIS_fnc_selectRandom;
	pos_collecte_poisson = [(_position_de_base_pour_spawn select 0) + (random _position_une_random),(_position_de_base_pour_spawn select 1) + (random _position_deux_random),0];
	if ((markerpos "marche_legal_un") distance pos_collecte_poisson > 800 && (markerpos "marche_legal_deux") distance pos_collecte_poisson > 800 && (markerpos "marche_legal_trois") distance pos_collecte_poisson > 800 && !isOnRoad pos_collecte_poisson && surfaceIsWater pos_collecte_poisson) then 
	{
		_condition_collecte = true;
		{
			if (pos_collecte_poisson distance _x < 400) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_poissons < 1) then
{
	[pos_collecte_poisson, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Poissons"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_poisson;
}else
{
	{
		[getmarkerpos _x, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Poissons"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_poissons;
};

// ======================================================================= COLLECTE PETROLE ==================================================================
_condition_collecte = false;
"DIAG SFP : Points de collecte : Point de collecte 4." spawn historique_creation_log_sfp;
while {!_condition_collecte && count sfp_config_position_collecte_petrole < 1} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; _position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	pos_collecte_petrole = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	if ((markerpos "marche_legal_un") distance pos_collecte_petrole > 800 && (markerpos "marche_legal_deux") distance pos_collecte_petrole > 800 && (markerpos "marche_legal_trois") distance pos_collecte_petrole > 800 && !isOnRoad pos_collecte_petrole && !surfaceIsWater pos_collecte_petrole) then 
	{
		_condition_collecte = true;
		{
			if (pos_collecte_petrole distance _x < 1000) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_petrole < 1) then
{
	[pos_collecte_petrole, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Petrole"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_petrole;
}else
{
	{
		[getmarkerpos _x, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Petrole"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_petrole;
};

// ======================================================================= COLLECTE BOIS ==================================================================
_condition_collecte = false;
"DIAG SFP : Points de collecte : Point de collecte 5." spawn historique_creation_log_sfp;
while {!_condition_collecte && count sfp_config_position_collecte_bois < 1} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; _position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	pos_collecte_bois = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	_verificationsurface = ["#GdtStratisForestPine","#GdtForestPine","#GdtGrassGreen"]; // Bois
	if ((markerpos "marche_legal_un") distance pos_collecte_bois > 600 && (markerpos "marche_legal_deux") distance pos_collecte_bois > 600 && (markerpos "marche_legal_trois") distance pos_collecte_bois > 600 && (surfaceType pos_collecte_bois) in _verificationsurface && !isOnRoad pos_collecte_bois && !surfaceIsWater pos_collecte_bois) then 
	{
		_condition_collecte = true;
		{
			if (pos_collecte_bois distance _x < 500) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_bois < 1) then
{
	[pos_collecte_bois, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Bois"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_bois;
}else
{
	{
		[getmarkerpos _x, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Bois"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_bois;
};

// ======================================================================= COLLECTE BALEINE ==================================================================
waituntil {!isnil "marche_noir_creation"};
_condition_collecte = false;
"DIAG SFP : Points de collecte : Point de collecte 6." spawn historique_creation_log_sfp;
while {!_condition_collecte && count sfp_config_position_collecte_baleine < 1} do
{
	_position_une_random = [-5000, 5000] call BIS_fnc_selectRandom; _position_deux_random = [-5000, 5000] call BIS_fnc_selectRandom;
	pos_collecte_baleine = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	if (marche_noir_creation distance pos_collecte_baleine > 800 && !isOnRoad pos_collecte_baleine && surfaceIsWater pos_collecte_baleine) then 
	{
		_condition_collecte = true;
		{
			if (pos_collecte_baleine distance _x < 1000) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_baleine < 1) then
{
	[pos_collecte_baleine, "ColorRed", "ICON", "mil_circle", [0.5,0.5], " Baleine"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_baleine;
}else
{
	{
		[getmarkerpos _x, "ColorRed", "ICON", "mil_circle", [0.5,0.5], " Baleine"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_baleine;
};

// ======================================================================= COLLECTE HEROINE ==================================================================
_condition_collecte = false;
"DIAG SFP : Points de collecte : Point de collecte 7." spawn historique_creation_log_sfp;
while {!_condition_collecte && count sfp_config_position_collecte_heroine < 1} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; _position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	pos_collecte_heroine = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	if (marche_noir_creation distance pos_collecte_heroine > 800 && !isOnRoad pos_collecte_heroine && !surfaceIsWater pos_collecte_heroine) then 
	{
		_condition_collecte = true;
		{
			if (pos_collecte_heroine distance _x < 1000) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_heroine < 1) then
{
	[pos_collecte_heroine, "ColorRed", "ICON", "mil_circle", [0.5,0.5], " Heroine"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_heroine;
}else
{
	{
		[getmarkerpos _x, "ColorRed", "ICON", "mil_circle", [0.5,0.5], " Heroine"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_heroine;
};

// ======================================================================= COLLECTE CUIVRE ==================================================================
_condition_collecte = false;
"DIAG SFP : Points de collecte : Point de collecte 8." spawn historique_creation_log_sfp;
while {!_condition_collecte && count sfp_config_position_collecte_cuivre < 1} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; _position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	pos_collecte_cuivre = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	if ((markerpos "marche_legal_un") distance pos_collecte_cuivre > 800 && (markerpos "marche_legal_deux") distance pos_collecte_cuivre > 800 && (markerpos "marche_legal_trois") distance pos_collecte_cuivre > 800 && !isOnRoad pos_collecte_cuivre && !surfaceIsWater pos_collecte_cuivre) then 
	{
		_condition_collecte = true;
		{
			if (pos_collecte_cuivre distance _x < 1000) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_cuivre < 1) then
{
	[pos_collecte_cuivre, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Cuivre"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_cuivre;
}else
{
	{
		[getmarkerpos _x, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Cuivre"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_cuivre;
};

// ======================================================================= COLLECTE REQUIN ==================================================================
_condition_collecte = false;
"DIAG SFP : Points de collecte : Point de collecte 9." spawn historique_creation_log_sfp;
_position_de_base_pour_spawn = [14590,12779,0];
while {!_condition_collecte && count sfp_config_position_collecte_requin < 1} do 
{
	_position_une_random = [-4000, 4000] call BIS_fnc_selectRandom; _position_deux_random = [-4000, 4000] call BIS_fnc_selectRandom;
	pos_collecte_requin = [(_position_de_base_pour_spawn select 0) + (random _position_une_random),(_position_de_base_pour_spawn select 1) + (random _position_deux_random),0];
	if (!isOnRoad pos_collecte_requin && surfaceIsWater pos_collecte_requin) then 
	{
		_condition_collecte = true;
		{
			if (pos_collecte_requin distance _x < 1000) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_requin < 1) then
{
	[pos_collecte_requin, "ColorRed", "ICON", "mil_circle", [0.5,0.5], " Requin"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_requin;
}else
{
	{
		[getmarkerpos _x, "ColorRed", "ICON", "mil_circle", [0.5,0.5], " Requin"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_requin;
};

// ======================================================================= COLLECTE POMMES ==================================================================
_condition_collecte = false;
"DIAG SFP : Points de collecte : Point de collecte 10." spawn historique_creation_log_sfp;
while {!_condition_collecte && count sfp_config_position_collecte_pomme < 1} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; _position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	pos_collecte_pommes = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	if ((markerpos "marche_legal_un") distance pos_collecte_pommes > 800 && (markerpos "marche_legal_deux") distance pos_collecte_pommes > 800 && (markerpos "marche_legal_trois") distance pos_collecte_pommes > 800 && !isOnRoad pos_collecte_pommes && !surfaceIsWater pos_collecte_pommes) then 
	{
		_condition_collecte = true;
		{
			if (pos_collecte_pommes distance _x < 1000) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_pomme < 1) then
{
	[pos_collecte_pommes, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Pommes"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_pommes;
}else
{
	{
		[getmarkerpos _x, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Pommes"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_pomme;
};

// ======================================================================= COLLECTE SEL ==================================================================
_condition_collecte = false;
"DIAG SFP : Points de collecte : Point de collecte 11." spawn historique_creation_log_sfp;
while {!_condition_collecte && count sfp_config_position_collecte_sel < 1} do 
{
	_position_une_random = [-2000, 2000] call BIS_fnc_selectRandom; _position_deux_random = [-2000, 2000] call BIS_fnc_selectRandom;
	_position_pour_calcul = [23967,20158,0];
	pos_collecte_sel = [(_position_pour_calcul select 0) + (random _position_une_random),(_position_pour_calcul select 1) + (random _position_deux_random),0];
	_verificationsurface = ["#GdtDead"];
	if ((surfaceType pos_collecte_sel) in _verificationsurface && (markerpos "marche_legal_un") distance pos_collecte_sel > 800 && (markerpos "marche_legal_deux") distance pos_collecte_sel > 800 && (markerpos "marche_legal_trois") distance pos_collecte_sel > 800 && !isOnRoad pos_collecte_sel && !surfaceIsWater pos_collecte_sel) then 
	{
		_condition_collecte = true;
		{
			if (pos_collecte_sel distance _x < 1000) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_sel < 1) then
{
	[pos_collecte_sel, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Sel"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_sel;
}else
{
	{
		[getmarkerpos _x, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Sel"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_sel;
};

// ======================================================================= COLLECTE POMMES DE TERRE ==================================================================
_condition_collecte = false;
"DIAG SFP : Points de collecte : Point de collecte 12." spawn historique_creation_log_sfp;
while {!_condition_collecte && count sfp_config_position_collecte_pomme_de_terre < 1} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; _position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	pos_collecte_pommes_de_terre = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	if ((markerpos "marche_legal_un") distance pos_collecte_pommes_de_terre > 800 && (markerpos "marche_legal_deux") distance pos_collecte_pommes_de_terre > 800 && (markerpos "marche_legal_trois") distance pos_collecte_pommes_de_terre > 800 && !isOnRoad pos_collecte_pommes_de_terre && !surfaceIsWater pos_collecte_pommes_de_terre) then
	{
		_condition_collecte = true;
		{
			if (pos_collecte_pommes_de_terre distance _x < 1000) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_pomme_de_terre < 1) then
{
	[pos_collecte_pommes_de_terre, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Pommes De Terre"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_pommes_de_terre;
}else
{
	{
		[getmarkerpos _x, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Pommes De Terre"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_pomme_de_terre;
};

// ======================================================================= COLLECTE CANNABIS ==================================================================
_condition_collecte = false; 
"DIAG SFP : Points de collecte : Point de collecte 13." spawn historique_creation_log_sfp;
while {!_condition_collecte && count sfp_config_position_collecte_cannabis < 1} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; _position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	pos_collecte_cannabis = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	if (marche_noir_creation distance pos_collecte_cannabis > 800 && !isOnRoad pos_collecte_cannabis && !surfaceIsWater pos_collecte_cannabis) then 
	{
		_condition_collecte = true;
		{
			if (pos_collecte_cannabis distance _x < 1000) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_cannabis < 1) then
{
	[pos_collecte_cannabis, "ColorRed", "ICON", "mil_circle", [0.5,0.5], " Cannabis"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_cannabis;
}else
{
	{
		[getmarkerpos _x, "ColorRed", "ICON", "mil_circle", [0.5,0.5], " Cannabis"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_cannabis;
};

// ======================================================================= COLLECTE MEDICAMENTS ==================================================================
_condition_collecte = false;
"DIAG SFP : Points de collecte : Point de collecte 14." spawn historique_creation_log_sfp;
while {!_condition_collecte && count sfp_config_position_collecte_medicament < 1} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; _position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	pos_collecte_medicaments = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	if (marche_noir_creation distance pos_collecte_medicaments > 800 && !isOnRoad pos_collecte_medicaments && !surfaceIsWater pos_collecte_medicaments) then
	{
		_condition_collecte = true;
		
		if (count (nearestObjects [pos_collecte_medicaments, ["House"], 1000]) < 1) then
		{
			_condition_collecte = false;
		}else
		{
			pos_collecte_medicaments = (position ((nearestObjects [pos_collecte_medicaments, ["House"], 1000]) select 0));
		};
		
		{
			if (pos_collecte_medicaments distance _x < 1000) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_medicament < 1) then
{
	[pos_collecte_medicaments, "ColorRed", "ICON", "mil_circle", [0.5,0.5], " Medicaments"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_medicaments;
}else
{
	{
		[getmarkerpos _x, "ColorRed", "ICON", "mil_circle", [0.5,0.5], " Medicaments"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_medicament;
};

// ======================================================================= COLLECTE ORGANES ANIMAUX ==================================================================
_condition_collecte = false;
"DIAG SFP : Points de collecte : Point de collecte 15." spawn historique_creation_log_sfp;
while {!_condition_collecte && count sfp_config_position_collecte_organes_animaux < 1} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; _position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	pos_collecte_organes_animaux = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	if (marche_noir_creation distance pos_collecte_organes_animaux > 800 && !isOnRoad pos_collecte_organes_animaux && !surfaceIsWater pos_collecte_organes_animaux) then 
	{
		_condition_collecte = true;
		{
			if (pos_collecte_organes_animaux distance _x < 1000) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_organes_animaux < 1) then
{
	[pos_collecte_organes_animaux, "ColorRed", "ICON", "mil_circle", [0.5,0.5], " Organes Animaux"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_organes_animaux;
}else
{
	{
		[getmarkerpos _x, "ColorRed", "ICON", "mil_circle", [0.5,0.5], " Organes Animaux"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_organes_animaux;
};

// ======================================================================= COLLECTE FEUILLE DE COCAINE ==================================================================
_condition_collecte = false;
"DIAG SFP : Points de collecte : Point de collecte 16." spawn historique_creation_log_sfp;
while {!_condition_collecte && count sfp_config_position_collecte_cocaine < 1} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; _position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	pos_collecte_cocaine = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	if (marche_noir_creation distance pos_collecte_cocaine > 800 && !isOnRoad pos_collecte_cocaine && !surfaceIsWater pos_collecte_cocaine) then 
	{
		_condition_collecte = true;
		{
			if (pos_collecte_cocaine distance _x < 1000) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_cocaine < 1) then
{
	[pos_collecte_cocaine, "ColorRed", "ICON", "mil_circle", [0.5,0.5], " Cocaine"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_cocaine;
}else
{
	{
		[getmarkerpos _x, "ColorRed", "ICON", "mil_circle", [0.5,0.5], " Cocaine"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_cocaine;
};

// ======================================================================= COLLECTE POISSON CHALUTIER ==================================================================
_condition_collecte = false;
"DIAG SFP : Points de collecte : Point de collecte 17." spawn historique_creation_log_sfp;
_position_de_base_pour_spawn = [15479.2,14483.2,-2.19537];
while {!_condition_collecte && count sfp_config_position_collecte_poissons_chalutier < 1} do 
{
	_position_une_random = [-1000, 1000] call BIS_fnc_selectRandom; _position_deux_random = [-1000, 1000] call BIS_fnc_selectRandom;
	pos_collecte_poisson_chalutier = [(_position_de_base_pour_spawn select 0) + (random _position_une_random),(_position_de_base_pour_spawn select 1) + (random _position_deux_random),0];
	if (!isOnRoad pos_collecte_poisson_chalutier && surfaceIsWater pos_collecte_poisson_chalutier) then 
	{
		_condition_collecte = true;
		{
			if (pos_collecte_poisson_chalutier distance _x < 1000) then
			{			
				_condition_collecte = false;
			};
		} foreach _position_endroit_spawner;
	}; sleep 0.05;
};

if (count sfp_config_position_collecte_poissons_chalutier < 1) then
{
	[pos_collecte_poisson_chalutier, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Poissons Chalutier"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback pos_collecte_poisson_chalutier;
}else
{
	{
		[getmarkerpos _x, "ColorGreen", "ICON", "mil_circle", [0.5,0.5], " Poissons Chalutier"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_collecte_poissons_chalutier;
};

// ======================================================================= FIN ==================================================================
fin_trigger_des_collectes = true;
publicvariable "fin_trigger_des_collectes";

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Divers", "Historique Divers", _heure_du_log, "Fin de creation des points de collecte."] call saveToDB;
"DIAG SFP : Points de collecte : Fin des créations." spawn historique_creation_log_sfp;

