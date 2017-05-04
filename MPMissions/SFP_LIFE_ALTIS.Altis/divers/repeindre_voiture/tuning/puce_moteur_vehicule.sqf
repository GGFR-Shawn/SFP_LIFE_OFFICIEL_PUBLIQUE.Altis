// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

condition_turbo_deux = false;

while {true} do
{
	waituntil {sleep 3; vehicle player != player};

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
					
					waituntil {vehicle player == player};
					
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
								
								if (condition_turbo_deux && speed (vehicle player) > 50 && (position (vehicle player) select 2 < 1)) then
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
};