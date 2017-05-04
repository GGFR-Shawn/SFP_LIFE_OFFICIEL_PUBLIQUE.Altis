// ===============================================================================================================================================================================================================================
										// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
										  // Poursuite pénal possible ! Voir amar.arma3.fr //
// ===============================================================================================================================================================================================================================

private ["_debug_maxou_sfp","_detection_personne_pour_optimisation_sfp","_taille_de_la_carte_sfp","_resultat_sfp_maxou"];
_debug_maxou_sfp = [_this, 0, false] call BIS_fnc_param; 
_detection_personne_pour_optimisation_sfp = 3;
_taille_de_la_carte_sfp = 25000;
_type_interdit_d_optimisation = [];
liste_optimisation_des_vehicules_sfp = []; 
if (_debug_maxou_sfp) then {decache_optimisation_serveur_sfp = 0; cache_optimisation_serveur_sfp = 0;};
sleep 30;

while {sfp_config_activer_optimisation_client} do
{
	_fps_actuellement = diag_fps;
	{
		_time = time + 3;
		waituntil {time > _time or _fps_actuellement >= diag_fps};
		
		if (simulationEnabled _x) then 
		{
			if (alive _x && count crew _x < 1 && {isPlayer _x} count ((position _x) nearEntities [["man"], _detection_personne_pour_optimisation_sfp]) < 1) then 
			{
				if ((_x iskindof "Air" or _x iskindof "Ship" or _x iskindof "LandVehicle" or !isnil {_x getvariable "proprietaire_du_vehicule"}) && !(typeof _x in _type_interdit_d_optimisation)) then
				{			
					_x enablesimulation false;
					// _x hideobject true;

					liste_optimisation_des_vehicules_sfp = liste_optimisation_des_vehicules_sfp + [_x];
					if (_debug_maxou_sfp) then {cache_optimisation_serveur_sfp = round (cache_optimisation_serveur_sfp + 1);};			
					if (_debug_maxou_sfp) then {systemchat format ["Le véhicule SFP Caché : %1.", _x]; diag_log format ["Diag SFP : Le véhicule SFP Caché : %1.", _x];};					
				};
			};
		};
	} forEach (([12874.2,14931.8,0]) nearEntities [["Air","Ship","Car","LandVehicle"], _taille_de_la_carte_sfp]);

	if (_debug_maxou_sfp) then {systemchat format ["Véhicules total SFP Décaché : %1.", decache_optimisation_serveur_sfp]; diag_log format ["Diag SFP : Véhicules total SFP Décaché : %1.", decache_optimisation_serveur_sfp];};
	if (_debug_maxou_sfp) then {systemchat format ["Véhicules total SFP Caché : %1.", cache_optimisation_serveur_sfp]; diag_log format ["Diag SFP : Véhicules total SFP Caché : %1.", cache_optimisation_serveur_sfp];};
	
	_fps_actuellement = diag_fps;
	liste_optimisation_des_vehicules_sfp_a_supprimer = [];
	for "_i" from 0 to (count liste_optimisation_des_vehicules_sfp - 1) do
	{
		_time = time + 3;
		waituntil {time > _time or _fps_actuellement >= diag_fps};

		_le_vehicule_sfp = liste_optimisation_des_vehicules_sfp select _i;
		if (_le_vehicule_sfp in (lineIntersectsWith [eyePos player, ATLtoASL screenToWorld [0.5,0.5],objNull,objNull,true]) or !alive _le_vehicule_sfp or isnil "_le_vehicule_sfp" or isnull _le_vehicule_sfp or count crew _le_vehicule_sfp > 0 or {isPlayer _x} count ((position _le_vehicule_sfp) nearEntities [["man"], _detection_personne_pour_optimisation_sfp]) > 0) then 
		{
			_le_vehicule_sfp enablesimulation true;
			// _le_vehicule_sfp hideobject false;
			
			liste_optimisation_des_vehicules_sfp_a_supprimer = liste_optimisation_des_vehicules_sfp_a_supprimer + [_le_vehicule_sfp];
			
			if (_debug_maxou_sfp) then {decache_optimisation_serveur_sfp = round (decache_optimisation_serveur_sfp + 1);};			
			if (_debug_maxou_sfp) then {systemchat format ["Le véhicule SFP Décaché : %1.", _le_vehicule_sfp]; diag_log format ["Diag SFP : Le véhicule SFP Décaché : %1.", _le_vehicule_sfp];};					
		};		
		sleep 0.001;
	};

	liste_optimisation_des_vehicules_sfp = liste_optimisation_des_vehicules_sfp - liste_optimisation_des_vehicules_sfp_a_supprimer;
	
	sleep 2;
};
