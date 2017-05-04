// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_tranche_de_calcul","_temps_auto_fps"];
waituntil {sleep 2; !isnil "fin_verification_apres_chargement" && !isnil "uid_sauvegarde_lire_local_joueur_sfp"};

_valeur = ['auto_fps_valeur_activation'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {auto_fps_valeur_activation = _valeur;};
_valeur = ['auto_fps_valeur_fps_souhaite'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "_valeur") then {if (_valeur > 0) then {auto_fps_valeur_fps_souhaite = _valeur;};};
_valeur = ['auto_fps_valeur_distance_mini'] call uid_sauvegarde_lire_local_joueur_sfp; if (!isnil "auto_fps_valeur_distance_mini") then {if (_valeur > 0) then {auto_fps_valeur_distance_mini = _valeur;};};

if (isnil "auto_fps_valeur_activation") then {auto_fps_valeur_activation = false;};
if (isnil "auto_fps_valeur_fps_souhaite") then {auto_fps_valeur_fps_souhaite = 30;};
if (isnil "auto_fps_valeur_distance_mini") then {auto_fps_valeur_distance_mini = 2000;};


[] spawn
{
	while {true} do
	{
		while {auto_fps_valeur_activation} do
		{
			while {viewDistance < auto_fps_valeur_distance_mini} do
			{
				rescan_auto_script_maxou = true;
				
				_calcul = round (viewDistance + 30);
				setViewDistance _calcul;
				sleep ((diag_fps / 1000));
			};
			
			if (!isnil "rescan_auto_script_maxou") then {rescan_auto_script_maxou = nil;};
			if !(auto_fps_valeur_activation) then {rescan_auto_script_maxou = true; sleep 10;};
			sleep 2;
		};
		sleep 5;
	};
};

while {true} do
{
	while {auto_fps_valeur_activation} do
	{
		distance_de_vue_pied = viewDistance;
		_tranche_de_calcul = 20;
		if (round (auto_fps_valeur_fps_souhaite - diag_fps) < -17) then {_tranche_de_calcul = 150;}; 
		if (round (auto_fps_valeur_fps_souhaite - diag_fps) < -14) then {_tranche_de_calcul = 100;}; 

		while {diag_fps < auto_fps_valeur_fps_souhaite && isnil "rescan_auto_script_maxou"} do
		{
			_calcul = round (viewDistance - _tranche_de_calcul);
			setViewDistance _calcul;
			
			sleep ((diag_fps / 1000));
		};
		while {diag_fps > auto_fps_valeur_fps_souhaite && viewDistance < 12000 && isnil "rescan_auto_script_maxou"} do
		{
			_calcul = round (viewDistance + _tranche_de_calcul);
			setViewDistance _calcul;
			
			sleep ((diag_fps / 1000));
		};
				
		sleep ((diag_fps / 1000));
	};	
		
	sleep 5;
};