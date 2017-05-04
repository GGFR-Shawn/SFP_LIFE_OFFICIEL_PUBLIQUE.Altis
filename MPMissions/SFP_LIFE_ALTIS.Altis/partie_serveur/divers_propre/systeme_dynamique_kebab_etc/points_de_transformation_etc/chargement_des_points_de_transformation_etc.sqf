// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Divers", "Historique Divers", _heure_du_log, "Debut de creation des markers de transfo etc."] call saveToDB;
"DIAG SFP : Points de transformation : Début des créations." spawn historique_creation_log_sfp;

private ["_position_endroit_spawner","_listes_des_markers","_creation_marker_point_de_spawn_sfp","_condition_marker","_position_trouve"];
_position_endroit_spawner = [];
_listes_des_markers = [];
{_listes_des_markers pushback (markerPos _x)} foreach allMapMarkers;

_creation_marker_point_de_spawn_sfp =
{
	_position = _this select 0;
	_couleur_marker = _this select 1;
	_shape_marker = _this select 2;
	_type_marker = _this select 3;
	_size_marker = _this select 4;
	_texte_marker = _this select 5;
	if (isnil "_couleur_marker" or isnil "_shape_marker" or isnil "_type_marker" or isnil "_size_marker" or isnil "_texte_marker" or isnil "_position") exitwith {hint "Erreur sur la création d'un point de collecte !";};
	
	_nom_du_marker_transformation = format ["point_de_transfo_%1", _position select 0];
	_repere_du_marker_trigger_collecte = createMarker [_nom_du_marker_transformation, _position];
	_repere_du_marker_trigger_collecte setMarkerColor _couleur_marker;
	_repere_du_marker_trigger_collecte setMarkerShape _shape_marker;
	_repere_du_marker_trigger_collecte setMarkerType _type_marker;
	_repere_du_marker_trigger_collecte setMarkerSize _size_marker;
	_nom_du_marker_transformation setMarkerText _texte_marker;
};

_lancement_initilisation_points_de_collecte = [] execvm "config\config_positions_points_de_farms.sqf";
waitUntil {scriptDone _lancement_initilisation_points_de_collecte;};

// ===================================================  Transformation Serpent ==================================================================
"DIAG SFP : Points de transformation : Création Serpent." spawn historique_creation_log_sfp;

_condition_marker = false;
while {!_condition_marker && count sfp_config_position_transformation_serpent < 1} do 
{
	_position_une_random = [-20000, 20000] call BIS_fnc_selectRandom; _position_deux_random = [-20000, 20000] call BIS_fnc_selectRandom;
	_position_trouve = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	_verificationsurface = ["#GdtRedDirt","#GdtForest","#GdtBeach","#GdtStratisForestPine","#GdtForestPine","#GdtGrassGreen"];

	// if ((surfaceType _position_trouve) in _verificationsurface && (markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	if ((markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	{
		_condition_maison_spawn = false;
		{
			if (_position_trouve distance _x < 300) then
			{			
				_condition_maison_spawn = true;
			};
		} foreach _position_endroit_spawner;
	
		if !(_condition_maison_spawn) then
		{		
			_listes_des_maison = nearestObjects [_position_trouve, ["House"], 500];			
			for "_i" from 0 to (count _listes_des_maison - 1) do
			{
				{
					if ((_listes_des_maison select _i) iskindof "house" && (_listes_des_maison select _i) distance _x > 10 && isnil {(_listes_des_maison select _i) getvariable "proprietaire_de_la_maison"}) then
					{
						_position_trouve = getpos (_listes_des_maison select _i);
						_condition_marker = true;
					};
				} foreach _listes_des_markers;
			};
		};
	}; 
	sleep 0.02;
};

if (count sfp_config_position_transformation_serpent < 1) then
{
	[_position_trouve, "ColorRed", "ICON", "mil_warning", [0.5,0.5], " Transf Serpent"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback _position_trouve;
}else
{
	{
		[getmarkerpos _x, "ColorRed", "ICON", "mil_warning", [0.5,0.5], " Transf Serpent"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_transformation_serpent;
};

// ===================================================  Transformation Cannabis ==================================================================
"DIAG SFP : Points de transformation : Création Cannabis." spawn historique_creation_log_sfp;

_condition_marker = false;
while {!_condition_marker && count sfp_config_position_transformation_cannabis < 1} do 
{
	_position_une_random = [-20000, 20000] call BIS_fnc_selectRandom; _position_deux_random = [-20000, 20000] call BIS_fnc_selectRandom;
	_position_trouve = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	_verificationsurface = ["#GdtRedDirt","#GdtForest","#GdtBeach","#GdtStratisForestPine","#GdtForestPine","#GdtGrassGreen"];
	
	// if ((surfaceType _position_trouve) in _verificationsurface && (markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	if ((markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	{
		_condition_maison_spawn = false;
		{
			if (_position_trouve distance _x < 400) then
			{			
				_condition_maison_spawn = true;
			};
		} foreach _position_endroit_spawner;
	
		if !(_condition_maison_spawn) then
		{		
			_listes_des_maison = nearestObjects [_position_trouve, ["House"], 500];			
			for "_i" from 0 to (count _listes_des_maison - 1) do
			{
				{
					if ((_listes_des_maison select _i) iskindof "house" && (_listes_des_maison select _i) distance _x > 10 && isnil {(_listes_des_maison select _i) getvariable "proprietaire_de_la_maison"}) then
					{
						_position_trouve = getpos (_listes_des_maison select _i);
						_condition_marker = true;
					};
				} foreach _listes_des_markers;
			};
		};
	}; 
	sleep 0.02;
};

if (count sfp_config_position_transformation_cannabis < 1) then
{
	[_position_trouve, "ColorRed", "ICON", "mil_warning", [0.5,0.5], " Transf Cannabis"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback _position_trouve;
}else
{
	{
		[getmarkerpos _x, "ColorRed", "ICON", "mil_warning", [0.5,0.5], " Transf Cannabis"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_transformation_cannabis;
};

// ===================================================  Pépinière ==================================================================
"DIAG SFP : Points de transformation : Création Pépinière." spawn historique_creation_log_sfp;

_condition_marker = false;
while {!_condition_marker && count sfp_config_position_pepiniere < 1} do 
{
	_position_une_random = [-20000, 20000] call BIS_fnc_selectRandom; _position_deux_random = [-20000, 20000] call BIS_fnc_selectRandom;
	_position_trouve = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	_verificationsurface = ["#GdtRedDirt","#GdtForest","#GdtBeach","#GdtStratisForestPine","#GdtForestPine","#GdtGrassGreen"];
	
	// if ((surfaceType _position_trouve) in _verificationsurface && (markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	if ((markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	{
		_condition_maison_spawn = false;
		{
			if (_position_trouve distance _x < 400) then
			{			
				_condition_maison_spawn = true;
			};
		} foreach _position_endroit_spawner;
	
		if !(_condition_maison_spawn) then
		{		
			_listes_des_maison = nearestObjects [_position_trouve, ["House"], 500];			
			for "_i" from 0 to (count _listes_des_maison - 1) do
			{
				{
					if ((_listes_des_maison select _i) iskindof "house" && (_listes_des_maison select _i) distance _x > 10 && isnil {(_listes_des_maison select _i) getvariable "proprietaire_de_la_maison"}) then
					{
						_position_trouve = getpos (_listes_des_maison select _i);
						_condition_marker = true;
					};
				} foreach _listes_des_markers;
			};
		};
	}; 
	sleep 0.02;
};

if (count sfp_config_position_pepiniere < 1) then
{
	[_position_trouve, "ColorRed", "ICON", "mil_warning", [0.5,0.5], " Pepiniere"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback _position_trouve;
}else
{
	{
		[getmarkerpos _x, "ColorRed", "ICON", "mil_warning", [0.5,0.5], " Pepiniere"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_pepiniere;
};

// ===================================================  Transformation Héroine ==================================================================
"DIAG SFP : Points de transformation : Création Héroine." spawn historique_creation_log_sfp;

_condition_marker = false;
while {!_condition_marker && count sfp_config_position_heroine < 1} do 
{
	_position_une_random = [-20000, 20000] call BIS_fnc_selectRandom; _position_deux_random = [-20000, 20000] call BIS_fnc_selectRandom;
	_position_trouve = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	_verificationsurface = ["#GdtRedDirt","#GdtForest","#GdtBeach","#GdtStratisForestPine","#GdtForestPine","#GdtGrassGreen"];
	
	// if ((surfaceType _position_trouve) in _verificationsurface && (markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	if ((markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	{
		_condition_maison_spawn = false;
		{
			if (_position_trouve distance _x < 400) then
			{			
				_condition_maison_spawn = true;
			};
		} foreach _position_endroit_spawner;
	
		if !(_condition_maison_spawn) then
		{		
			_listes_des_maison = nearestObjects [_position_trouve, ["House"], 500];			
			for "_i" from 0 to (count _listes_des_maison - 1) do
			{
				{
					if ((_listes_des_maison select _i) iskindof "house" && (_listes_des_maison select _i) distance _x > 10 && isnil {(_listes_des_maison select _i) getvariable "proprietaire_de_la_maison"}) then
					{
						_position_trouve = getpos (_listes_des_maison select _i);
						_condition_marker = true;
					};
				} foreach _listes_des_markers;
			};
		};
	}; 
	sleep 0.02;
};

if (count sfp_config_position_heroine < 1) then
{
	[_position_trouve, "ColorRed", "ICON", "mil_warning", [0.5,0.5], " Transf Heroine"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback _position_trouve;
}else
{
	{
		[getmarkerpos _x, "ColorRed", "ICON", "mil_warning", [0.5,0.5], " Transf Heroine"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_heroine;
};

// ===================================================  Amphétamines ==================================================================
"DIAG SFP : Points de transformation : Création Amphetamines." spawn historique_creation_log_sfp;

_condition_marker = false;
while {!_condition_marker && count sfp_config_position_amphetamine < 1} do 
{
	_position_une_random = [-20000, 20000] call BIS_fnc_selectRandom; _position_deux_random = [-20000, 20000] call BIS_fnc_selectRandom;
	_position_trouve = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	_verificationsurface = ["#GdtRedDirt","#GdtForest","#GdtBeach","#GdtStratisForestPine","#GdtForestPine","#GdtGrassGreen"];
	
	// if ((surfaceType _position_trouve) in _verificationsurface && (markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	if ((markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	{
		_condition_maison_spawn = false;
		{
			if (_position_trouve distance _x < 400) then
			{			
				_condition_maison_spawn = true;
			};
		} foreach _position_endroit_spawner;
	
		if !(_condition_maison_spawn) then
		{		
			_listes_des_maison = nearestObjects [_position_trouve, ["House"], 500];			
			for "_i" from 0 to (count _listes_des_maison - 1) do
			{
				{
					if ((_listes_des_maison select _i) iskindof "house" && (_listes_des_maison select _i) distance _x > 10 && isnil {(_listes_des_maison select _i) getvariable "proprietaire_de_la_maison"}) then
					{
						_position_trouve = getpos (_listes_des_maison select _i);
						_condition_marker = true;
					};
				} foreach _listes_des_markers;
			};
		};
	}; 
	sleep 0.02;
};

if (count sfp_config_position_amphetamine < 1) then
{
	[_position_trouve, "ColorRed", "ICON", "mil_warning", [0.5,0.5], " Amphetamines"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback _position_trouve;
}else
{
	{
		[getmarkerpos _x, "ColorRed", "ICON", "mil_warning", [0.5,0.5], " Amphetamines"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_amphetamine;
};

// ===================================================  Transformation Cuivre ==================================================================
"DIAG SFP : Points de transformation : Création Cuivre." spawn historique_creation_log_sfp;

_condition_marker = false;
while {!_condition_marker && count sfp_config_position_transformation_cuivre < 1} do 
{
	_position_une_random = [-20000, 20000] call BIS_fnc_selectRandom; _position_deux_random = [-20000, 20000] call BIS_fnc_selectRandom;
	_position_trouve = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	_verificationsurface = ["#GdtRedDirt","#GdtForest","#GdtBeach","#GdtStratisForestPine","#GdtForestPine","#GdtGrassGreen"];
	
	// if ((surfaceType _position_trouve) in _verificationsurface && (markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	if ((markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	{
		_condition_maison_spawn = false;
		{
			if (_position_trouve distance _x < 400) then
			{			
				_condition_maison_spawn = true;
			};
		} foreach _position_endroit_spawner;
	
		if !(_condition_maison_spawn) then
		{		
			_listes_des_maison = nearestObjects [_position_trouve, ["House"], 500];			
			for "_i" from 0 to (count _listes_des_maison - 1) do
			{
				{
					if ((_listes_des_maison select _i) iskindof "house" && (_listes_des_maison select _i) distance _x > 10 && isnil {(_listes_des_maison select _i) getvariable "proprietaire_de_la_maison"}) then
					{
						_position_trouve = getpos (_listes_des_maison select _i);
						_condition_marker = true;
					};
				} foreach _listes_des_markers;
			};
		};
	}; 
	sleep 0.02;
};

if (count sfp_config_position_transformation_cuivre < 1) then
{
	[_position_trouve, "ColorGreen", "ICON", "mil_warning", [0.5,0.5], " Transformation Cuivre"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback _position_trouve;
}else
{
	{
		[getmarkerpos _x, "ColorGreen", "ICON", "mil_warning", [0.5,0.5], " Transformation Cuivre"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_transformation_cuivre;
};

// ===================================================  Transformation Or ==================================================================
"DIAG SFP : Points de transformation : Création Transformation Or." spawn historique_creation_log_sfp;

_condition_marker = false;
while {!_condition_marker && count sfp_config_position_transformation_or < 1} do 
{
	_position_une_random = [-20000, 20000] call BIS_fnc_selectRandom; _position_deux_random = [-20000, 20000] call BIS_fnc_selectRandom;
	_position_trouve = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	_verificationsurface = ["#GdtRedDirt","#GdtForest","#GdtBeach","#GdtStratisForestPine","#GdtForestPine","#GdtGrassGreen"];
	
	// if ((surfaceType _position_trouve) in _verificationsurface && (markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	if ((markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	{
		_condition_maison_spawn = false;
		{
			if (_position_trouve distance _x < 400) then
			{			
				_condition_maison_spawn = true;
			};
		} foreach _position_endroit_spawner;
	
		if !(_condition_maison_spawn) then
		{		
			_listes_des_maison = nearestObjects [_position_trouve, ["House"], 500];			
			for "_i" from 0 to (count _listes_des_maison - 1) do
			{
				{
					if ((_listes_des_maison select _i) iskindof "house" && (_listes_des_maison select _i) distance _x > 10 && isnil {(_listes_des_maison select _i) getvariable "proprietaire_de_la_maison"}) then
					{
						_position_trouve = getpos (_listes_des_maison select _i);
						_condition_marker = true;
					};
				} foreach _listes_des_markers;
			};
		};
	}; 
	sleep 0.02;
};

if (count sfp_config_position_transformation_or < 1) then
{
	[_position_trouve, "ColorGreen", "ICON", "mil_warning", [0.5,0.5], " Transformation Or"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback _position_trouve;
}else
{
	{
		[getmarkerpos _x, "ColorGreen", "ICON", "mil_warning", [0.5,0.5], " Transformation Or"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_transformation_or;
};

// ===================================================  Hack Informatique ==================================================================
"DIAG SFP : Points de transformation : Création Hack Informatique." spawn historique_creation_log_sfp;

_condition_marker = false;
while {!_condition_marker && count sfp_config_position_hack_informatique < 1} do 
{
	_position_une_random = [-20000, 20000] call BIS_fnc_selectRandom; _position_deux_random = [-20000, 20000] call BIS_fnc_selectRandom;
	_position_trouve = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	_verificationsurface = ["#GdtRedDirt","#GdtForest","#GdtBeach","#GdtStratisForestPine","#GdtForestPine","#GdtGrassGreen"];
	
	// if ((surfaceType _position_trouve) in _verificationsurface && (markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	if ((markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	{
		_condition_maison_spawn = false;
		{
			if (_position_trouve distance _x < 400) then
			{			
				_condition_maison_spawn = true;
			};
		} foreach _position_endroit_spawner;
	
		if !(_condition_maison_spawn) then
		{		
			_listes_des_maison = nearestObjects [_position_trouve, ["House"], 500];			
			for "_i" from 0 to (count _listes_des_maison - 1) do
			{
				{
					if ((_listes_des_maison select _i) iskindof "house" && (_listes_des_maison select _i) distance _x > 10 && isnil {(_listes_des_maison select _i) getvariable "proprietaire_de_la_maison"}) then
					{
						_position_trouve = getpos (_listes_des_maison select _i);
						_condition_marker = true;
					};
				} foreach _listes_des_markers;
			};
		};
	}; 
	sleep 0.02;
};

if (count sfp_config_position_hack_informatique < 1) then
{
	[_position_trouve, "ColorRed", "ICON", "mil_warning", [0.5,0.5], " Hack Informatique"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback _position_trouve;
}else
{
	{
		[getmarkerpos _x, "ColorRed", "ICON", "mil_warning", [0.5,0.5], " Hack Informatique"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_hack_informatique;
};

// ===================================================  Formation Laboratoire ==================================================================
"DIAG SFP : Points de transformation : Création Formation Laboratoire." spawn historique_creation_log_sfp;

_condition_marker = false;
while {!_condition_marker && count sfp_config_position_formation_laboratoire < 1} do 
{
	_position_une_random = [-15000, 15000] call BIS_fnc_selectRandom; _position_deux_random = [-15000, 15000] call BIS_fnc_selectRandom;
	_position_trouve = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	_verificationsurface = ["#GdtRedDirt","#GdtForest","#GdtBeach","#GdtStratisForestPine","#GdtForestPine","#GdtGrassGreen"];
	
	// if ((surfaceType _position_trouve) in _verificationsurface && (markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	if ((markerpos "marche_legal_un") distance _position_trouve > 600 && (markerpos "marche_legal_deux") distance _position_trouve > 600 && (markerpos "marche_legal_trois") distance _position_trouve > 600 && !isOnRoad _position_trouve && !surfaceIsWater _position_trouve) then 
	{
		_condition_maison_spawn = false;
		{
			if (_position_trouve distance _x < 400) then
			{			
				_condition_maison_spawn = true;
			};
		} foreach _position_endroit_spawner;
	
		if !(_condition_maison_spawn) then
		{
			_listes_des_maison = nearestObjects [_position_trouve, ["House"], 500];			
			for "_i" from 0 to (count _listes_des_maison - 1) do
			{
				{
					if ((_listes_des_maison select _i) iskindof "house" && (_listes_des_maison select _i) distance _x > 10 && isnil {(_listes_des_maison select _i) getvariable "proprietaire_de_la_maison"}) then
					{
						_position_trouve = getpos (_listes_des_maison select _i);
						_condition_marker = true;
					};
				} foreach _listes_des_markers;
			};
		};
	}; 
	sleep 0.02;
};

if (count sfp_config_position_formation_laboratoire < 1) then
{
	[_position_trouve, "ColorRed", "ICON", "mil_warning", [0.5,0.5], " Formation Laboratoire"] call _creation_marker_point_de_spawn_sfp;
	_position_endroit_spawner pushback _position_trouve;
}else
{
	{
		[getmarkerpos _x, "ColorRed", "ICON", "mil_warning", [0.5,0.5], " Formation Laboratoire"] call _creation_marker_point_de_spawn_sfp;
		_position_endroit_spawner pushback (getmarkerpos _x);
	} foreach sfp_config_position_formation_laboratoire;
};

// ======================================================================= FIN ==================================================================
fin_marker_des_transformations = true;
publicvariable "fin_marker_des_transformations";

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Divers", "Historique Divers", _heure_du_log, "Fin de creation des markers de transfo etc."] call saveToDB;
"DIAG SFP : Points de transformation : Fin des créations." spawn historique_creation_log_sfp;

