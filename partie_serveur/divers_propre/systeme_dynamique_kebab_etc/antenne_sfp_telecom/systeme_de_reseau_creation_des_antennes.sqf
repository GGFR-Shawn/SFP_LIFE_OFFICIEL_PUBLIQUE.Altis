// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_position_une_random","_position_deux_random","_position_de_l_antenne","_calcul","_stop_pose_antenne"];
_nombre_d_antenne_a_creer = _this select 0;
_position_ou_placer_antenne = _this select 1;
distance_interdite_entre_les_antennes_SFP_TELECOM = 1400; publicvariable "distance_interdite_entre_les_antennes_SFP_TELECOM";
antenne_sfp_telecom_en_cours_de_creation = 1; publicvariable "antenne_sfp_telecom_en_cours_de_creation";
if (_nombre_d_antenne_a_creer > 2 && hasinterface) exitwith {};

// Suppression antenne origine + creation d'antenne fixe
if (isnil "suppression_antenne_sfp_telecom_origine_arma") then
{
	"DIAG SFP : SFP Télécom : Suppression des antennes d'arma." spawn historique_creation_log_sfp;

	suppression_antenne_sfp_telecom_origine_arma = true;
	_liste_des_antennes_disponible_d_origine_arma = [[28090.7,25511.4,0],[14451.5,16338,0],[15346.7,15894,0],[16085.1,16998,0],[16040.2,18625.8,0],[14710.8,19755.5,0],[10942.2,13847.9,0],[9037.66,16335.8,0],[19654.8,18213.5,0],[9222.87,19249.1,0],[18121.6,10975,2],[20944.9,19280.9,0],[20642.7,20107.7,0],[7474.39,13463.3,0],[6840.97,16163.4,0],[11780.2,9170.16,1],[21842.4,14227,0],[19319.8,9717.04,0],[22845.9,16821.6,0],[10316.6,8703.94,0],[8268.76,10051.6,0],[4263.82,20664.1,0],[4665.27,11155.7,0],[2557.97,22105.8,0],[26274.2,23754.1,0]];
	for "_i" from 0 to (count _liste_des_antennes_disponible_d_origine_arma - 1) do
	{	
		{
			_x setdamage 1;
			sleep 0.4;
		} foreach (nearestObjects [_liste_des_antennes_disponible_d_origine_arma select _i, ["Land_Communication_F"], 40]);
	};
	
	// Creation des fixes
	/* Neo */ [0, [12200.5,14300.6,0.00141716]] execVM "partie_serveur\divers_propre\systeme_dynamique_kebab_etc\antenne_sfp_telecom\systeme_de_reseau_creation_des_antennes.sqf";
	/* Airfield */ [0, [14556.9,16702.9,0.00143814]] execVM "partie_serveur\divers_propre\systeme_dynamique_kebab_etc\antenne_sfp_telecom\systeme_de_reseau_creation_des_antennes.sqf";
};

for "_i" from 0 to _nombre_d_antenne_a_creer do
{
	_condition_antenne = false;
	_stop_pose_antenne = false;
	_position_de_base = 0;
	_temps_max_pose_antenne = 60; // Secondes
		
	_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
	["Historique SFP Telecom", "Historique SFP Telecom", _heure_du_log, "Demarrage creation des antennes."] call saveToDB;
	"DIAG SFP : SFP Télécom : Démarrage création d'antenne." spawn historique_creation_log_sfp;
	
	while {!_condition_antenne && !_stop_pose_antenne} do 
	{
		if (count _position_ou_placer_antenne <= 2) then
		{
			_position_une_random = [_position_ou_placer_antenne select 0, _position_ou_placer_antenne select 1] call BIS_fnc_selectRandom; 
			_position_deux_random = [_position_ou_placer_antenne select 0, _position_ou_placer_antenne select 1] call BIS_fnc_selectRandom;
			_position_de_l_antenne = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
		}else
		{
			// Position par le joueur
			_position_de_base = round (_position_de_base + 1);
			_position_une_du_joueur = _position_ou_placer_antenne select 0;
			_position_deux_du_joueur = _position_ou_placer_antenne select 1;
			_position_trois_random = [_position_de_base,-_position_de_base] call BIS_fnc_selectRandom;
			_position_quatre_random = [_position_de_base,-_position_de_base] call BIS_fnc_selectRandom;
			_position_de_l_antenne = [(_position_une_du_joueur + random _position_trois_random),(_position_deux_du_joueur + random _position_quatre_random),0];
		};
		
		_verificationsurface = ["#GdtGrassShort","#GdtGrassTall","#GdtBeach","#GdtDesert","#GdtSoil","#GdtDirt","#GdtGrassGreen","#GdtGrassDry","#GdtForestPine","#GdtDead"];
		if ((surfaceType _position_de_l_antenne) in _verificationsurface && !isOnRoad _position_de_l_antenne && !surfaceIsWater _position_de_l_antenne) then 
		{
			_calcul = false; 
			{
				if (_x distance _position_de_l_antenne < distance_interdite_entre_les_antennes_SFP_TELECOM && alive _x) then
				{
					_calcul = true;
				};
			sleep 0.01;
			} foreach allmissionobjects "Land_Communication_F";
			
			if !(_calcul) then 
			{
				if (count (nearestObjects [_position_de_l_antenne, ["House"], 20]) < 1) then 
				{
					_condition_antenne = true;
				};
			};
		}; 
		
		_temps_max_pose_antenne = _temps_max_pose_antenne - 0.02;
		if (_temps_max_pose_antenne < 0) then {_stop_pose_antenne = true;};
		sleep 0.02;
	};
			
	if (!_stop_pose_antenne) then
	{
		_antenne_relais = createVehicle ["Land_Communication_F", _position_de_l_antenne, [], 0, "NONE"];
		[_antenne_relais, 0, 0] call BIS_fnc_setPitchBank;

		if (vectorDir _antenne_relais select 2 < 0.07) then
		{		
			_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
			["Historique SFP Telecom", "Historique SFP Telecom", _heure_du_log, "Antenne creer."] call saveToDB;
			"DIAG SFP : SFP Télécom : Antenne validée et créé." spawn historique_creation_log_sfp;

			_nom_du_marker_telephonique = format ["antenne_telephone_numero_%1_%2", round (random 9999), round (_position_de_l_antenne select 0)];
			_creation_marqueur = createMarker [_nom_du_marker_telephonique, _position_de_l_antenne];
			_creation_marqueur setMarkerColor "ColorWhite";
			_creation_marqueur setMarkerShape "ICON";
			_creation_marqueur setMarkerType "loc_Transmitter";
			_creation_marqueur setMarkerSize [0.70, 0.70];
		}else
		{
			deletevehicle _antenne_relais;
			[0, _position_ou_placer_antenne] execVM "partie_serveur\divers_propre\systeme_dynamique_kebab_etc\antenne_sfp_telecom\systeme_de_reseau_creation_des_antennes.sqf";
		};
	}else
	{
		_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
		["Historique SFP Telecom", "Historique SFP Telecom", _heure_du_log, "Creation antennes arreter car trop long."] call saveToDB;
		"DIAG SFP : SFP Télécom : création d'antennes arretée car trop long." spawn historique_creation_log_sfp;
	};
};

antenne_sfp_telecom_en_cours_de_creation = 0; publicvariable "antenne_sfp_telecom_en_cours_de_creation";

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
_detail_du_log = format ["Fin de creation de %1 antennes.", _nombre_d_antenne_a_creer];
["Historique SFP Telecom", "Historique SFP Telecom", _heure_du_log, "Fin script création antennes."] call saveToDB;
"DIAG SFP : SFP Télécom : Fin du script." spawn historique_creation_log_sfp;
