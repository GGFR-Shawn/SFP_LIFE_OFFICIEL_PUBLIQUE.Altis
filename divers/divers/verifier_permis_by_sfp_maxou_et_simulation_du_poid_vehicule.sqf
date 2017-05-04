// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

script_anti_explosion = false;
script_poid_du_vehicule = false;
script_amende_d_un_vehicule = false;

while {true} do
{
	waituntil {sleep 2; vehicle player != player;};
	
	_veh = vehicle player;
	
	// Script amende d'un véhicule
	_veh spawn
	{
		if (!script_amende_d_un_vehicule) then
		{
			_veh = _this;
			script_amende_d_un_vehicule = true;

			if (!isnil {_veh getvariable "amende_vehicule"} && _veh getvariable "vehicule_info_parvariable" select 0 == name player) then
			{
				hint format ["! AMENDE VEHICULE ! \n ------------------------------------- \n\n Bonjour %1, \n\n Une amende d'un montant de %2 Euros à été avisé sur votre véhicule par le gendarme %3. \n\n Décider si vous la payez ou non. \n\n Sachez qu'en cas de refus, l'amende non payée sera indiquée sur votre casier. \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",name player, (_veh getvariable "amende_vehicule" select 0) call retour_formatage_chiffre_sfp, _veh getvariable "amende_vehicule" select 1];
				
				execvm "divers\gendarmerie\amendes _sur_un_vehicule\creer_menu_pour_accepter_amende_sur_un_vehicule.sqf";
			};
			
			waituntil {!(player in _veh)};

			script_amende_d_un_vehicule = false;
		};
	};
	
	// Script poids véhicule
	_veh spawn
	{
		if (!script_poid_du_vehicule) then
		{
			_veh = _this;
			_modification_du_poid_maxou = 700;
			script_poid_du_vehicule = true;

			_veh setMass ((getMass _veh) + (_modification_du_poid_maxou));  
			waituntil {!(player in _veh)};
			_veh setMass ((getMass _veh) - (_modification_du_poid_maxou));  
			
			script_poid_du_vehicule = false;
		};
	};
	
	// Script pompier désincarcération
	if (damage _veh >= 0.75 && _veh getVariable "vehicule_info_parvariable" select 0 == name player && ((assignedVehicleRole player) select 0) == "Driver") then 
	{
		if (fuel _veh > 0) then
		{
			[[[_veh,2],"divers\vehiclelock\synchro_verrouillage.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
			_veh setfuel 0;
		};
	};

	// Sécurité karting
	if (_veh iskindof "C_Kart_01_F" && ((vehicle player) distance (getMarkerPos "karting") > 140)) then
	{
		hint "Désolé, vous ne pouvez pas sortir de la piste !";
		jai_le_droit_de_me_tp = 1; 
		(vehicle player) setpos (getmarkerpos "spawn_karting");
	};

	// Verification permis de conduire
	_vehicule_exclu_de_la_conduite_sans_permis = ["C_Boat_Civil_01_rescue_F","O_Truck_02_transport_F","Offroad_01_auto_ecole_sfp","C_SUV_01_Location_Maxou","C_Quadbike_01_F_Location"];
	
	if (player getVariable "license_permis_de_conduire_by_sfp_maxou" < 1 && isnil {player getvariable "recherche_pour_conduite_sans_permis"}) then
	{
		if (count (assignedVehicleRole player) > 0) then
		{
			if (((assignedVehicleRole player) select 0) == "Driver") then
			{
				if (speed _veh > 40) then
				{
					if (player getvariable "ma_date_de_naissance" > 6) then
					{
						if (!(typeof _veh in _vehicule_exclu_de_la_conduite_sans_permis)) then 
						{
							if (isnil {player getvariable "recherche_pour_conduite_sans_permis"}) then {player setVariable["recherche_pour_conduite_sans_permis",true,true];};
							
							hint "Attention, tu es recherché pour conduite sans permis !";
						};
					};
				};
			};
		};
	};
	
	// Verif Hack
	if (isnil {_veh getvariable "vehicule_info_parvariable"} && name player != "[SFP] Maxou") then
	{
		_whitelist = [helico_taxi];
		_whitelist_type = ["Steerable_Parachute_F","B_UAV_01_F","Black_Hornet_Nano_UAV_Bag"];
		
		if !(_veh in _whitelist) then
		{
			if !(typeOf _veh in _whitelist_type) then
			{
				sleep 1;
				
				if (isnil {_veh getvariable "vehicule_info_parvariable"}) then
				{
					type_nom_vehicule_hackeur = getText ( configFile >> "CfgVehicles" >> (typeof _veh) >> "displayName");
					publicvariable "type_nom_vehicule_hackeur";
				
					son_nom_hackeur = name player;
					publicvariable "son_nom_hackeur";
					sa_date_hackeur = player getvariable "ma_date_de_naissance";
					publicvariable "sa_date_hackeur";
					
					mettre_a_jour_liste_ban_auto = (getplayeruid player); 
					sleep 1; 
					publicvariable "mettre_a_jour_liste_ban_auto";
					_null = [{["Hackeur",false,true] call BIS_fnc_endMission;},"BIS_fnc_spawn",_veh,false] spawn BIS_fnc_MP;
					
					_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
					_detail_du_log = format ["Nom : %1. Date Naissance : %2 Type Voiture : %3.", son_nom_hackeur, sa_date_hackeur, type_nom_vehicule_hackeur];
					["Historique Hack Vehicules", "Historique Hack Vehicules", _heure_du_log, _detail_du_log] call saveToDB;
					
					_null = [{hint format ["! PROTECTION HACK ! \n ------------------------------ \n\n Attention, un joueur : \n\n Nom : %1 \n Temps de jeu : %2 Minutes \n Type Véhicule : %3  \n\n roule avec un véhicule non déclaré sur le serveur, son véhicule à donc été détruit automatiquement ! \n\n ------------------------------ \n www.sfpteam.fr \n By SFP Maxou",son_nom_hackeur,sa_date_hackeur,type_nom_vehicule_hackeur];},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;
				
					deletevehicle _veh;
				};
			};
		};
	};	
};