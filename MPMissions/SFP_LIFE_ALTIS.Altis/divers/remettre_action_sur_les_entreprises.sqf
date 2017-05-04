// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {alive player};
waituntil {!isnil "fin_verification_apres_chargement"};
waituntil {isnil {player getvariable "besoin_d_un_revive_news"}};
sleep 3;


// Mission gagner argent sur les vehicules
[] spawn 
{
	while {true} do
	{
		// Sarl Depannage
		if (!isnil {player getvariable "sarl_depannage"}) then 
		{
			_listes_vehicule_depanneur_argent = ["C_Van_01_transport_Depannage_F","Offroad_01_depanneur_sfp","B_Truck_01_mover_F_Depanneur_SFP","SFP_Depanneur_mantgs","Jonzie_Tow_Truck_SFP"];
			if (typeof (vehicle player) in _listes_vehicule_depanneur_argent) then 
			{
				[(vehicle player)] execvm "divers\metiers\depanneur\remorquage_gagner_argent.sqf";
			};
		};
		
		waitUntil {sleep 10; alive player};
	};		
};

// Addaction Générale
[] spawn
{
	while {true} do
	{
		// Gendarmes
		if (revive_mon_side == west) then 
		{
			jallume_gyro_gendarme = 0;
			player addAction ['Sirène ON/OFF (Raccourci H)','divers\allumer_sirene_vehicule.sqf',[],7,true,true,'','!((vehicle player) iskindof "air") && vehicle player != player && !isnil "jallume_gyro_gendarme" && ((assignedVehicleRole player) select 0) == "Driver"'];
			player addAction ['Allumer Gyrophare (Raccourci K)',{(vehicle player) setvariable ["gyrophare_vehicule_allume",true, true]; [[[vehicle player,"bleu"],"divers\allumer_gyrophare_vehicule.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP; jallume_gyro_gendarme = 1;},[],7,true,true,'','!((vehicle player) iskindof "air") && jallume_gyro_gendarme < 1 && vehicle player != player && ((assignedVehicleRole player) select 0) == "Driver"'];
			player addAction ['Eteindre Gyrophare (Raccourci K)',{(vehicle player) setvariable ["gyrophare_vehicule_allume",nil, true]; jallume_gyro_gendarme = 0;},[],7,true,true,'','!((vehicle player) iskindof "air") && jallume_gyro_gendarme >= 1 && vehicle player != player && ((assignedVehicleRole player) select 0) == "Driver"'];
		};

		// Civil
		if (revive_mon_side == civilian) then 
		{
			// Sarl Taxi G7
			if (!isnil {player getvariable "sarl_taxis_gsept"}) then
			{
				player addAction ["<t color=""#ff0000"">" + "Mission Taxi Bots","divers\nos_entreprises\sarl_taxis_gsept\mission_chercher_client_taxi_g_sept.sqf",[],1,true,true,"","!isnil 'jesuis_au_taff_a_la_sarl_taxis_gsept' && vehicle player != player && (typeOf (vehicle player) == 'SFP_BUS' or typeOf (vehicle player) == 'C_SUV_01_Taxi_G7_SFP') && ((assignedVehicleRole player) select 0) == 'Driver'"];
			};
			// Sarl Depannage
			if (!isnil {player getvariable "sarl_depannage"}) then
			{
				player addAction ['Allumer Gyrophare (Raccourci K)',{(vehicle player) setvariable ["gyrophare_vehicule_allume",true, true]; [[[vehicle player,"orange"],"divers\allumer_gyrophare_vehicule.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP; jallume_gyro_depanneuse = 1;},[],7,true,true,'','jallume_gyro_depanneuse < 1 && (typeOf (vehicle player) == "SFP_MASTER" or typeOf (vehicle player) == "Offroad_01_depanneur_sfp" or typeOf (vehicle player) == "C_Van_01_transport_Depannage_F" or typeOf (vehicle player) == "B_Truck_01_mover_F_Depanneur_SFP" or typeOf (vehicle player) == "SFP_Depanneur_mantgs" or typeOf (vehicle player) == "Jonzie_Tow_Truck_SFP") && vehicle player != player && je_suis_en_service_a_la_sarl_depannage >= 1 && ((assignedVehicleRole player) select 0) == "Driver"'];
				player addAction ['Eteindre Gyrophare (Raccourci K)',{(vehicle player) setvariable ["gyrophare_vehicule_allume",nil, true]; jallume_gyro_depanneuse = 0;},[],7,true,true,'','jallume_gyro_depanneuse >= 1 && (typeOf (vehicle player) == "SFP_MASTER" or typeOf (vehicle player) == "Offroad_01_depanneur_sfp" or typeOf (vehicle player) == "SFP_Depanneur_mantgs" or typeOf (vehicle player) == "Jonzie_Tow_Truck_SFP" or typeOf (vehicle player) == "C_Van_01_transport_Depannage_F" or typeOf (vehicle player) == "B_Truck_01_mover_F_Depanneur_SFP") && vehicle player != player && je_suis_en_service_a_la_sarl_depannage >= 1 && ((assignedVehicleRole player) select 0) == "Driver"'];
				
				player addAction ["<t color=""#4FD5D6"">" + "Attacher Véhicule Leger Sur La Dépanneuse","divers\metiers\depanneur\legere\attacher_legere.sqf",[],1,true,true,'','vehicle player == player && player distance cursortarget < 12 && typeOf cursortarget == "Offroad_01_depanneur_sfp" && isnil {cursortarget getvariable "vehicule_depanneur_attache_au_vehicule"} && je_suis_en_service_a_la_sarl_depannage >= 1'];
				player addAction ["<t color=""#4FD5D6"">" + "Détacher Véhicule Leger Sur La Dépanneuse","divers\metiers\depanneur\legere\detacher_legere.sqf",[],1,true,true,'','vehicle player == player && player distance cursortarget < 12 && typeOf cursortarget == "Offroad_01_depanneur_sfp" && !isnil {cursortarget getvariable "vehicule_depanneur_attache_au_vehicule"} && je_suis_en_service_a_la_sarl_depannage >= 1'];

				player addAction ["<t color=""#4FD5D6"">" + "Attacher Véhicule Lourd Derrière La Dépanneuse","divers\metiers\depanneur\lourde\attacher.sqf",[],1,true,true,'','vehicle player == player && player distance cursortarget < 12 && (typeOf cursortarget == "B_Truck_01_mover_F_Depanneur_SFP" or typeOf cursortarget == "SFP_Depanneur_mantgs" or typeOf cursortarget == "Jonzie_Tow_Truck_SFP") && isnil {cursortarget getvariable "vehicule_depanneur_attache_au_vehicule"} && je_suis_en_service_a_la_sarl_depannage >= 1'];
				player addAction ["<t color=""#4FD5D6"">" + "Détacher Véhicule Lourd Derrière La Dépanneuse","divers\metiers\depanneur\lourde\detacher.sqf",[],1,true,true,'','vehicle player == player && player distance cursortarget < 12 && (typeOf cursortarget == "B_Truck_01_mover_F_Depanneur_SFP" or typeOf cursortarget == "SFP_Depanneur_mantgs" or typeOf cursortarget == "Jonzie_Tow_Truck_SFP") && !isnil {cursortarget getvariable "vehicule_depanneur_attache_au_vehicule"} && je_suis_en_service_a_la_sarl_depannage >= 1'];
				
				player addAction ["<t color=""#4FD5D6"">" + "Attacher Chalutier","divers\metiers\depanneur\chalutier\attacher_chalutier.sqf",[],1,true,true,'','vehicle player == player && player distance cursortarget < 30 && (typeOf cursortarget == "chalutier_SFP") && isnil {cursortarget getvariable "vehicule_depanneur_attache_au_vehicule"} && je_suis_en_service_a_la_sarl_depannage >= 1'];
				player addAction ["<t color=""#4FD5D6"">" + "Détacher Chalutier","divers\metiers\depanneur\chalutier\detacher_chalutier.sqf",[],1,true,true,'','vehicle player == player && player distance cursortarget < 30 && (typeOf cursortarget == "chalutier_SFP") && !isnil {cursortarget getvariable "vehicule_depanneur_attache_au_vehicule"} && je_suis_en_service_a_la_sarl_depannage >= 1'];
				
				player addAction ["<t color=""#4FD5D6"">" + "Mettre Véhicule Sur Plateau","divers\metiers\depanneur\modeliser_plateau\attacher_sur_plateau.sqf",[],1,true,true,'','vehicle player == player && player distance cursortarget < 12 && typeOf cursortarget == "SFP_Depanneur_mantgs" && isnil {cursortarget getvariable "vehicule_depanneur_attache_au_plateau"} && je_suis_en_service_a_la_sarl_depannage >= 1'];
				player addAction ["<t color=""#4FD5D6"">" + "Enlever Véhicule Sur Plateau","divers\metiers\depanneur\modeliser_plateau\detacher_sur_plateau.sqf",[],1,true,true,'','vehicle player == player && player distance cursortarget < 12 && typeOf cursortarget == "SFP_Depanneur_mantgs" && !isnil {cursortarget getvariable "vehicule_depanneur_attache_au_plateau"} && je_suis_en_service_a_la_sarl_depannage >= 1'];
				
				player addAction ["<t color=""#4FD5D6"">" + "Treuiller Véhicule A Dépanneuse","divers\metiers\depanneur\lourde\attacher_pour_helitreuillage.sqf",[],1,true,true,'','vehicle player == player && player distance cursortarget < 10 && (typeOf cursortarget == "B_Truck_01_mover_F_Depanneur_SFP" or typeOf cursortarget == "SFP_Depanneur_mantgs" or typeOf cursortarget == "Jonzie_Tow_Truck_SFP") && je_suis_en_service_a_la_sarl_depannage >= 1'];
	
				player addAction ["<t color='#ff0000'>Réparer Le Radar</t>", "divers\radar\radar_detruire_reparer.sqf", [1],11, false, false, "", "count (nearestObjects [getPosATL player, ['SpeedRadar1'], 3]) >= 1 && !isnil {((nearestObjects [getPosATL player, ['SpeedRadar1'], 3]) select 0) getvariable 'radar_sfp_desactive'} && je_suis_en_service_a_la_sarl_depannage >= 1"];
			};
			
			// Sarl Pompier
			if (!isnil {player getvariable "sarl_pompier"}) then
			{
				jallume_gyro_pompier = 0;
				
				player addAction ['<t color=''#ff0000''>' + 'Deployer Eau Hélicoptère','divers\nos_entreprises\sarl_pompier\sarl_pompier_client\helicoptere_eau\deployer_eau_helicoptere.sqf',[],10,true,true,'','typeof (vehicle player) == "O_Heli_Light_Pompier_SFP" && vehicle player != player && jesuis_au_taff_a_la_sarl_pompier >= 1 && ((assignedVehicleRole player) select 0) == "Driver"'];
				player addAction ['<t color=''#ff0000''>' + 'Recharger Hélicoptère En Eau','divers\nos_entreprises\sarl_pompier\sarl_pompier_client\helicoptere_eau\recharger_eau_helicoptere.sqf',[],10,true,true,'','isnil "je_recharge_en_eau_pour_helicoptere" && (vehicle player) getvariable "reservoir_d_eau_pour_pompier" < 800 && typeof (vehicle player) == "O_Heli_Light_Pompier_SFP" && vehicle player != player && jesuis_au_taff_a_la_sarl_pompier >= 1 && ((assignedVehicleRole player) select 0) == "Driver"'];
				
				player addAction ['<t color=''#ff0000''>' + 'Connaitre Capacité D Eau Restante',{hint format ["Le camion à actuellement %1 litres d'eau.",round ((vehicle player) getvariable 'reservoir_d_eau_pour_pompier')]},[],10,true,true,'','!isnil {(vehicle player) getvariable "reservoir_d_eau_pour_pompier"} && vehicle player != player && ((assignedVehicleRole player) select 0) == "Driver"'];
				player addAction ['<t color=''#ff0000''>' + 'Recharger Vehicule En Eau','divers\nos_entreprises\sarl_pompier\sarl_pompier_client\camion_eau\recharger_eau_camion.sqf',[],10,true,true,'','(vehicle player) getvariable "reservoir_d_eau_pour_pompier" < 300 && isnil "je_recharge_en_eau_pour_camion" && typeOf (vehicle player) in sfp_config_listes_des_vehicules_avec_reserve_eau && vehicle player != player && jesuis_au_taff_a_la_sarl_pompier >= 1 && ((assignedVehicleRole player) select 0) == "Driver"'];
				player addAction ['<t color=''#ff0000''>' + 'Recharger Extincteur','divers\nos_entreprises\sarl_pompier\sarl_pompier_client\camion_eau\recharger_extincteur.sqf',[],20,true,true,'','cursortarget getvariable "reservoir_d_eau_pour_pompier" > 0 && isnil "je_recharge_en_eau_pour_extincteur"'];

				player addAction ['Sirène ON/OFF (Raccourci H)','divers\allumer_sirene_vehicule.sqf',[],7,true,true,'','!((vehicle player) iskindof "air") && vehicle player != player && jesuis_au_taff_a_la_sarl_pompier >= 1 && typeOf (vehicle player) in sfp_config_listes_des_vehicules_pompiers && ((assignedVehicleRole player) select 0) == "Driver"'];
				
				player addAction ['Allumer Gyrophare (Raccourci K)',{(vehicle player) setvariable ["gyrophare_vehicule_allume",true, true]; [[[vehicle player,"bleu"],"divers\allumer_gyrophare_vehicule.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP; jallume_gyro_pompier = 1;},[],7,true,true,'','!((vehicle player) iskindof "air") && jallume_gyro_pompier < 1 && typeOf (vehicle player) in sfp_config_listes_des_vehicules_pompiers && vehicle player != player && jesuis_au_taff_a_la_sarl_pompier >= 1 && ((assignedVehicleRole player) select 0) == "Driver"'];
				player addAction ['Eteindre Gyrophare (Raccourci K)',{(vehicle player) setvariable ["gyrophare_vehicule_allume",nil, true]; jallume_gyro_pompier = 0;},[],7,true,true,'','!((vehicle player) iskindof "air") && jallume_gyro_pompier >= 1 && typeOf (vehicle player) in sfp_config_listes_des_vehicules_pompiers && vehicle player != player && jesuis_au_taff_a_la_sarl_pompier >= 1 && ((assignedVehicleRole player) select 0) == "Driver"'];
			};
		};

		// Divers
		player addAction ['Deverouiller / Verrouiller (Raccourci touche Inférieur/Supérieur)','divers\vehiclelock\unlocklock_de_dedans.sqf',[],7,true,true,"","vehicle player != player"];
		player addAction ['<t color=''#ff0000''>' + 'Dormir Dans La Voiture','menu\hotel.sqf',[],1,true,true,"","vehicle player != player && alive player && player getvariable 'fautdormir' < 60"];
		player addAction ['<t color=''#ff0000''>' + 'Relever La Moto',{[cursorTarget, 20, 0] call BIS_fnc_setPitchBank; sleep 0.01; cursorTarget setVelocity [(velocity (cursorTarget) select 0)+(sin direction (cursorTarget) * 0),(velocity (cursorTarget) select 1)+(cos direction (cursorTarget) * 0), 3];},[],1,true,true,"","(typeOf cursorTarget == 'sfp_yamaha_moto' or typeOf cursorTarget == 'SFP_ducati') && cursorTarget getvariable 'vehicule_info_parvariable' select 0 == name player"];
		player addAction ['<t color=''#ff0000''>' + 'Pousser Avion (DEBUG)',{(vehicle player) setVelocity [(velocity (vehicle player) select 0)+(sin direction (vehicle player) * 10),(velocity (vehicle player) select 1)+(cos direction (vehicle player) * 10),(velocity (vehicle player) select 2)];},[],15,true,true,"","speed (vehicle player) < 2 && (typeOf (vehicle player) == 'ivory_yak42d_1' or typeOf (vehicle player) == 'sab_FAAllegro' or typeOf (vehicle player) == 'sab_RobinDR400_2') && vehicle player != player"];
		player addAction ['<t color=''#ff0000''>' + 'Pousser Bateau (DEBUG)',{[[[cursorTarget,player],"divers\divers\syncronisation_pousser_bateau.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;},[],7,true,true,"","speed (vehicle player) < 2 && (typeOf cursorTarget == 'C_Rubberboat' or typeOf cursorTarget == 'C_Boat_Civil_01_rescue_F' or typeOf cursorTarget == 'C_Boat_Transport_02_F' or typeOf cursorTarget == 'C_Scooter_Transport_01_F') && cursorTarget getvariable 'vehicule_info_parvariable' select 0 == name player"];
		player addAction ['Mettre/Enlever ancre bateau','divers\divers\ancre_sfp\initialisation_de_l_ancre.sqf',[],1,true,true,"","(vehicle player) iskindof 'SHIP'"];

		waitUntil {sleep 2; !alive player};
		waitUntil {sleep 2; alive player};
		waitUntil {sleep 5; isnil {player getvariable "besoin_d_un_revive_news"}};
		sleep 5;
	};
};
