// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

condition_turbo_deux = false;

while {true} do
{
	waituntil {sleep 2; vehicle player != player};

	// Camera de recul
	[] spawn
	{
		if (!isnil {(vehicle player) getvariable "voiture_possede_un_radar_de_recul"}) then
		{
			if (count ((vehicle player) getvariable "voiture_possede_un_radar_de_recul") > 0) then
			{
				while {vehicle player != player} do
				{
					_etat_du_radar_de_recul = (vehicle player) getvariable "voiture_possede_un_radar_de_recul" select 1;
					
					if (!isnil "_etat_du_radar_de_recul") then
					{
						if (_etat_du_radar_de_recul >= 1 && speed (vehicle player) == 0  && !isnil {(vehicle player) getvariable "vehicule_info_parvariable"}) then
						{
							camera_active_pip_voiture_maxou = true;

							_camModule_voiture = ["rendertarget0", [[ (vehicle player), (getPosATL (vehicle player))]], (vehicle player),true] call BIS_fnc_PIP;
							_camModule_voiture attachto [(vehicle player),[- 0.21, -5.1,-1]];
							_camModule_voiture camPrepareFOV 0.7;
							_camModule_voiture camCommit 0;
							_camModule_voiture SetDir ((getdir (vehicle player) - (getdir _camModule_voiture)) - 180);
							_camModule_voiture camCommit 0;
							_camModule_voiture setvectordirandup [[0,-0.9,-0.3],[0,0,0.1]];

							disableserialization;
							_le_pip_by_maxou = (uiNamespace getVariable "BIS_fnc_PIP_RscPIP");
							(_le_pip_by_maxou displayCtrl 2300) ctrlCommit 0;
							(_le_pip_by_maxou displayCtrl 2300) ctrlsettextcolor [1,1,1,1];	

							waitUntil {sleep 0.1; !alive (vehicle player) or !alive player or speed (vehicle player) > 10 or (vehicle player) == player};

							while {!isnil "camera_active_pip_voiture_maxou"} do {camera_active_pip_voiture_maxou = nil;};
							if (!isnil "menu_go_pro") then {player removeaction menu_go_pro};
							[] call BIS_fnc_PiP;
						};
					};
				};
			};
		};
	};
	
	// Klaxon 
	[] spawn
	{
		if (!isnil {(vehicle player) getvariable "voiture_possede_un_klaxon"}) then
		{
			if (count ((vehicle player) getvariable "voiture_possede_un_klaxon") > 0) then
			{
				if (isnil "utilisation_klaxon_sfp_autorise") then
				{
					utilisation_klaxon_sfp_autorise = true;
					
					touche_activer_klaxon_sfp = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 29) then {[] call activer_son_klaxon_sfp;}; false"];
					
					player globalchat format ["Profite en %1, ce véhicule à un klaxon personnalisé ! Utilise le avec la touche controle gauche.", name player];
					
					waituntil {sleep 0.2; vehicle player == player};
					
					(findDisplay 46) displayRemoveEventHandler ["KeyDown", touche_activer_klaxon_sfp];
					
					utilisation_klaxon_sfp_autorise = nil;
				};
			};
			
		};		
	};
	
	// Puce Moteur
	[] spawn
	{
		puce_moteur = 0;
	
		if (!isnil {(vehicle player) getvariable "voiture_possede_une_puce"}) then
		{
			if (count ((vehicle player) getvariable "voiture_possede_une_puce") > 0) then
			{
				if (isnil "utilisation_puce_sfp_autorise") then
				{
					utilisation_puce_sfp_autorise = true;
					
					while {vehicle player != player} do
					{
						_etat_de_la_puce = (vehicle player) getvariable "voiture_possede_une_puce" select 1;
						_vitesse_max_du_vehicule = ((getnumber (configFile >> "CfgVehicles" >> typeof (vehicle player) >> "maxSpeed")) + 35);
						
						if (!isnil "_etat_de_la_puce") then
						{
							if (_etat_de_la_puce >= 1 && speed (vehicle player) < _vitesse_max_du_vehicule) then
							{
								sleep 0.01;
								
								if (condition_turbo_deux && speed (vehicle player) > 50 && (getPosATL (vehicle player) select 2 < 1)) then
								{
									_niveau_puissance_puce_moteur = (vehicle player) getvariable "voiture_possede_une_puce" select 0;
									
									if (_niveau_puissance_puce_moteur == 1) then {puce_moteur = 0.135;};
									if (_niveau_puissance_puce_moteur == 2) then {puce_moteur = 0.156;};
									if (_niveau_puissance_puce_moteur == 3) then {puce_moteur = 0.170;};
									if (_niveau_puissance_puce_moteur == 4) then {puce_moteur = 0.190;};
									if (_niveau_puissance_puce_moteur == 5) then {puce_moteur = 0.226;};
									if (_niveau_puissance_puce_moteur == 6) then {puce_moteur = 0.262;};
									if (_niveau_puissance_puce_moteur == 7) then {puce_moteur = 0.51;};
									
									(vehicle player) setVelocity [((velocity (vehicle player)) select 0)+(sin (direction (vehicle player))* puce_moteur),((velocity (vehicle player)) select 1)+(cos (direction (vehicle player))* puce_moteur),((velocity (vehicle player)) select 2)];
								
									[] spawn
									{
										if (isnil "nuage_fumee_turbo_voiture" && driver assignedVehicle player == player) then
										{
											nuage_fumee_turbo_voiture = 1;
											[[[(vehicle player)],"divers\repeindre_voiture\tuning\fumee_acceleration.sqf"],"BIS_fnc_execVM", true, false] spawn BIS_fnc_MP;
											sleep (10 + (random 20));
											// waituntil {speed (vehicle player) < 50};
											nuage_fumee_turbo_voiture = nil;
										};
									};
									condition_turbo_deux = false;
								};
							};
						};
					};
					utilisation_puce_sfp_autorise = nil;
				};
			};
		};
	};
	
	// Detecteur de radar
	[] spawn
	{
		_vehicule = vehicle player;

		while {vehicle player != player} do
		{
			if (!isnil {_vehicule getvariable "voiture_possede_un_detecteur_de_radar"}) then
			{
				if (count (_vehicule getvariable "voiture_possede_un_detecteur_de_radar") > 0) then
				{
					if (_vehicule getvariable "voiture_possede_un_detecteur_de_radar" select 1 >= 1) then
					{
						_verification_radar_by_maxou = 40; // Km heure
						_distance_des_radars = 1000; // Distance des radars
						_verification_radar = nearestObjects [getPosATL vehicle player, ["SpeedRadar1"], _distance_des_radars];

						if (count _verification_radar > 0) then
						{
							_le_radar = _verification_radar select 0;
							
							if (!isnil {_le_radar getvariable "radar_fixe_vitesse_sfp"} && isnil {_le_radar getvariable "radar_sfp_desactive"}) then
							{
								_verification_du_sens_by_sfp_maxou = player distance _le_radar;
								sleep 0.01;
								
								while {speed vehicle player >= _verification_radar_by_maxou && ((player distance _le_radar) - _verification_du_sens_by_sfp_maxou) < 0} do
								{
									_calcul_by_maxou = round (player distance _le_radar);
									_verification_du_sens_by_sfp_maxou = player distance _le_radar;
									_temps_attente_maj_by_maxou = 1;
									
									if (_calcul_by_maxou < 600) then {_temps_attente_maj_by_maxou = 0.9;};
									if (_calcul_by_maxou < 400) then {_temps_attente_maj_by_maxou = 0.75;};
									if (_calcul_by_maxou < 300) then {_temps_attente_maj_by_maxou = 0.50;};
									if (_calcul_by_maxou < 250) then {_temps_attente_maj_by_maxou = 0.35;};
									if (_calcul_by_maxou < 200) then {_temps_attente_maj_by_maxou = 0.25;};
									if (_calcul_by_maxou < 150) then {_temps_attente_maj_by_maxou = 0.20;};
									if (_calcul_by_maxou < 100) then {_temps_attente_maj_by_maxou = 0.15;};
									if (_calcul_by_maxou < 080) then {_temps_attente_maj_by_maxou = 0.12;};
									if (_calcul_by_maxou < 070) then {_temps_attente_maj_by_maxou = 0.07;};
									if (_calcul_by_maxou < 060) then {_temps_attente_maj_by_maxou = 0.04;};
									if (_calcul_by_maxou < 050) then {_temps_attente_maj_by_maxou = 0.03;};
									if (_calcul_by_maxou < 040) then {_temps_attente_maj_by_maxou = 0.02;};
									if (_calcul_by_maxou < 030) then {_temps_attente_maj_by_maxou = 0.01;};
									if (_calcul_by_maxou < 020) then {_temps_attente_maj_by_maxou = 0.005;};
									if (_calcul_by_maxou < 010) then {_temps_attente_maj_by_maxou = 0.00;};

									_choix_avertir = round (random 5);
									if (_choix_avertir == 1) then
									{
										systemchat format ["Distance du radar : %1 Mètres.", round (player distance _le_radar)];
									};
									
									playSound  "Detecteur_radar";
									
									_temps_attente_maj_by_maxou = _calcul_by_maxou / 1000;
									sleep _temps_attente_maj_by_maxou;
								};
							};
						};
						sleep 0.2;
					}else
					{
						sleep 3;
					};
				};
			};
		};
	};	
	
	// Poid du véhicule modifié
	[] spawn
	{
		if (!isnil {(vehicle player) getvariable "voiture_possede_un_nouveau_poids"}) then
		{
			if (count ((vehicle player) getvariable "voiture_possede_un_nouveau_poids") >= 2) then
			{
				systemchat format ["Ce véhicule à un chassis allégé (Origine : %1 KiloSFP ; Modifié : %2 KiloSFP).", (vehicle player) getvariable "voiture_possede_un_nouveau_poids" select 0, (vehicle player) getvariable "voiture_possede_un_nouveau_poids" select 1];
			};
		};	
	};	
	
	waituntil {sleep 0.5; vehicle player == player};
};
