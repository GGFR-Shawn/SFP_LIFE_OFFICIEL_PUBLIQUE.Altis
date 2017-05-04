// ===================================================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// ===================================================================================================================================================================================================================

// ===================================================================================================================================================================================================================
														// CREER SERVEUR ET ENVOYER SUR LES JOUEURS L'EFFET ETOILE FILANTE //
// ===================================================================================================================================================================================================================
waituntil {sleep 1; !isnil "sfp_config_activer_etoiles_filantes"};

if ((round random 5) != 1) exitwith {};
if (!sfp_config_activer_etoiles_filantes) exitwith {};

"DIAG SFP : Etoile filante : Demarrage script en attente." spawn historique_creation_log_sfp;

sleep (700 + (random 700)); // Attente aléatoire

// =================================================================================================================================================================
															// ENREGISTRER INIDB HISTORIQUE //
// =================================================================================================================================================================
_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Etoile Filante", "Historique Etoile Filante", _heure_du_log, "Demarrage script etoile filante."] call saveToDB;
"DIAG SFP : Etoile filante : Demarrage script validé." spawn historique_creation_log_sfp;
// =================================================================================================================================================================

_nombre_d_etoile = round (random 20);
for "_i" from 0 to _nombre_d_etoile do
{
	_position_etoile = false;
	while {!(_position_etoile)} do
	{
		_pos_un = [10000,-10000] call bis_fnc_selectrandom;
		_pos_deux = [10000,-10000] call bis_fnc_selectrandom;
		
		position_etoile_filante = [(getPosATL reperepourmarchenoir select 0) + (random _pos_un),(getPosATL reperepourmarchenoir select 1) + (random _pos_deux),0];

		_verificationsurface = ["#GdtBeach","#GdtGrassShort"];
		if ((surfaceType position_etoile_filante) in _verificationsurface && !surfaceIsWater position_etoile_filante) then 
		{
			_position_etoile = true;
		}; 		

		sleep 0.01;
	};

	_x0 = (position_etoile_filante select 0) -100 * 10;
	_y0 = (position_etoile_filante select 1) - 100 * 10;
	_r = random 1500;
	_theta = random 360;
	_z = 400 + (random 500);
	_pos1 = [_x0 + _r * (Cos _theta), _y0 + _r * (Sin _theta), _z];
	_l_etoile_filante_creation = "Land_Bucket_F" createVehicle _pos1;
	_l_etoile_filante_creation setpos _pos1;
	_z0 = (200 + (random 500));
	_vz= -(_z0/10 + random 10);

	_letoile_filante = [[[_l_etoile_filante_creation],"divers\divers\etoile_filante_effet_client.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

	_direction = [80,-80] call bis_fnc_selectrandom;
	_l_etoile_filante_creation setvelocity [(200 + (random _direction)), (200 + (random _direction)), _vz];
	
	_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
	["Historique Etoile Filante", "Historique Etoile Filante", _heure_du_log, "Etoile filante créé."] call saveToDB;
	"DIAG SFP : Etoile filante : Etoile créé." spawn historique_creation_log_sfp;

	waituntil {sleep 0.01; ((getPosATL _l_etoile_filante_creation) select 2) < 150};

	deletevehicle _l_etoile_filante_creation;
	
	_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
	["Historique Etoile Filante", "Historique Etoile Filante", _heure_du_log, "Etoile filante supprimée."] call saveToDB;
	"DIAG SFP : Etoile filante : Etoile supprimée." spawn historique_creation_log_sfp;
	
	sleep (random 30);
};

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Etoile Filante", "Historique Etoile Filante", _heure_du_log, "Fin script etoile filante."] call saveToDB;
"DIAG SFP : Etoile filante : Fin du script." spawn historique_creation_log_sfp;
