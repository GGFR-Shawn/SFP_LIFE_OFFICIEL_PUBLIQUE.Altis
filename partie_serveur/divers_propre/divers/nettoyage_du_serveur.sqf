// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

WaitUntil {sleep 4; !(isNil "BIS_fnc_init")};

"DIAG SFP : Nettoyage serveur : Démarrage du script." spawn historique_creation_log_sfp;

while {true} do
{
	sleep (1 * 60);

	"DIAG SFP : Nettoyage serveur : Lancement d'un scan." spawn historique_creation_log_sfp;
	
	{deletevehicle _x; sleep 0.1;} forEach allMines;
	{deletevehicle _x; sleep 0.1;} forEach allDead;
	{deleteVehicle _x; sleep 0.1;} foreach (allMissionObjects "Ruins");
	{deleteVehicle _x; sleep 0.1;} foreach (allMissionObjects "CraterLong");
	
	{
		_veh_sfp = _x;
		_classe_du_veh = getText(configFile >> "CfgVehicles" >> (typeOf _veh_sfp) >> "vehicleClass");

		if (_classe_du_veh in ["Car","Air","Ship","Armored","Submarine"]) then 
		{
			_unites = {(_x distance _veh_sfp < 0.01)} count playableUnits;
			if (count crew _x == 0 or !alive _x) then 
			{
				if (((_x getHitPointDamage "HitEngine") > 0.99 && _unites == 0) or !alive _x) then
				{
					deleteVehicle _x;
				};
			};
		};
		sleep 0.01;
	} foreach vehicles;

	{
		if ((count (units _x)) isEqualTo 0) then 
		{
			if (isNil {_x getVariable "groupInitialising"}) then 
			{
				deleteGroup _x;
			};
		};
	} count allGroups;
	
	{
		deletevehicle _x;
		sleep 0.01;
	} foreach (nearestObjects [[0,0,0], [], 200]); 
	
	"DIAG SFP : Nettoyage serveur : Fin du nettoyage." spawn historique_creation_log_sfp;
};