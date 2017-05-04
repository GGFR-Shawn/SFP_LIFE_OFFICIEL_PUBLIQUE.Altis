// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {!isnil "fin_verification_apres_chargement"};
if (revive_mon_side != west) exitwith {};

private "_condition";

while {true} do
{
	sleep (3600 + (random 3600));
	
	_condition = false;

	// ------------------------------------------------------- choix de l'endroit accident -------------------------------------------- //
	_pos = [(getPosATL reperepourmarchenoir select 0) + (100 + (random 20000)),(getPosATL reperepourmarchenoir select 1) + (100 + (random 20000)),0];
	_verificationsurface = ["#GdtAsphalt","#GdtDirt"];
	while {!((surfaceType _pos) in _verificationsurface)} do
	{
		_pos = [(getPosATL reperepourmarchenoir select 0) + (100 + (random 20000)),(getPosATL reperepourmarchenoir select 1) + (100 + (random 20000)),0];
		sleep 0.1;
	};

	// ------------------------------------------------------- verifier si pas de joueur dedans -------------------------------------------------------- //
	_verifierjoueurautour = _pos nearEntities [["man"], 150];
	if (count _verifierjoueurautour < 1) then {_condition = true;};

	// ------------------------------------------------------- choix du véhicules by maxou ---------------------------------------------------------- //
	_quelsvehicles = [
						"C_SUV_01_F","B_MRAP_01_hmg_F","O_MRAP_02_hmg_F","I_MRAP_03_hmg_F","I_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F","O_G_Offroad_01_armed_F",
						"O_MRAP_02_F","O_MRAP_02_gmg_F","I_MRAP_03_F","I_MRAP_03_gmg_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Van_01_transport_F",
						"I_G_Van_01_transport_F","C_Van_01_box_F","C_Van_01_fuel_F","I_G_Van_01_fuel_F","B_G_Van_01_transport_F","O_G_Van_01_transport_F",
						"B_G_Van_01_fuel_F","O_G_Van_01_fuel_F","B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_mover_F",
						"B_Truck_01_box_F","B_Truck_01_Repair_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_medical_F","O_Truck_02_covered_F","O_Truck_02_transport_F",
						"I_Truck_02_covered_F","I_Truck_02_transport_F","O_Truck_02_box_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F","I_Truck_02_ammo_F",
						"I_Truck_02_box_F","I_Truck_02_medical_F","I_Truck_02_fuel_F","C_Offroad_01_F","I_G_Offroad_01_F","I_G_Offroad_01_armed_F","B_G_Offroad_01_F",
						"O_G_Offroad_01_F","B_G_Offroad_01_armed_F","O_G_Offroad_01_armed_F","B_Quadbike_01_F","O_Quadbike_01_F","C_Quadbike_01_F",
						"I_Quadbike_01_F","I_G_Quadbike_01_F","B_G_Quadbike_01_F","O_G_Quadbike_01_F"
					 ];
	_okvehiculeschoisit_un = _quelsvehicles call BIS_fnc_selectRandom;
	_okvehiculeschoisit_deux = _quelsvehicles call BIS_fnc_selectRandom;
	if (_okvehiculeschoisit_un == _okvehiculeschoisit_deux) then {_condition = false;};

	// ------------------------------------------------------- choix du dommage ---------------------------------------------------------- //
	_queldommage = [0.2,0.3,0.4,0.5,0.6,0.7,0.8];
	_okdommagechoisit_un = _queldommage call BIS_fnc_selectRandom;
	_okdommagechoisit_deux = _queldommage call BIS_fnc_selectRandom;
	if (_okdommagechoisit_un == _okdommagechoisit_deux) then {_condition = false;};

	// ------------------------------------------------------- OK LANCEMENT INITIALISATION ------------------------------------------------------------- //
	sleep (10 + (random 10));

	if (_condition) then 
	{
		_objet_mission_intervention_une_fumigene = "G_40mm_Smoke" createVehicle _pos; 
		_objet_mission_intervention_une_explosion = "Bo_Mk82" createVehicle _pos; 
		sleep 2;
			
		_inclinaisonchoix = [48,95,140,190,235,275,320,365];
		_inclinaison = _inclinaisonchoix call BIS_fnc_selectRandom;
		_objet_mission_intervention_une = _okvehiculeschoisit_un createVehicle _pos; 
		_objet_mission_intervention_une setDir random 360;
		_objet_mission_intervention_une setdamage _okdommagechoisit_un;
		_objet_mission_intervention_une lock true;
		[_objet_mission_intervention_une, 40, _inclinaison] call BIS_fnc_setPitchBank;
		
		clearWeaponCargoglobal _objet_mission_intervention_une; 
		clearMagazineCargoglobal _objet_mission_intervention_une; 
		clearItemCargoglobal _objet_mission_intervention_une; 
		clearBackpackCargoglobal _objet_mission_intervention_une;


		_inclinaisonchoix = [48,95,140,190,235,275,320,365];
		_inclinaison = _inclinaisonchoix call BIS_fnc_selectRandom;
		_objet_mission_intervention_deux = _okvehiculeschoisit_deux createVehicle _pos; 
		_objet_mission_intervention_deux setDir random 360;
		_objet_mission_intervention_deux setdamage _okdommagechoisit_deux;
		_objet_mission_intervention_deux lock true;
		[_objet_mission_intervention_deux, 40, _inclinaison] call BIS_fnc_setPitchBank;
		
		clearWeaponCargoglobal _objet_mission_intervention_deux;
		clearMagazineCargoglobal _objet_mission_intervention_deux;
		clearItemCargoglobal _objet_mission_intervention_deux;
		clearBackpackCargoglobal _objet_mission_intervention_deux;
		
		_civil_un = "C_man_1_1_F" createVehicle (getPosATL _objet_mission_intervention_une); _civil_un setdamage 1;sleep 4;_civil_un enableSimulation false;
		_civil_deux = "C_man_1_1_F" createVehicle (getPosATL _objet_mission_intervention_deux); _civil_deux setdamage 1;sleep 4;_civil_deux enableSimulation false;
		
		if (alive _objet_mission_intervention_une && alive _objet_mission_intervention_deux) then 
		{
			["Warning",["Accident de voiture ! Consulter votre carte !", ""]] call bis_fnc_showNotification;

			_nom_du_marqueur = format ["_marqueur_accident_gendarme_num_%1", format ["%1 %2",round (random 9999), round (_pos select 0)]];
			_le_marqueur = createMarkerlocal [_nom_du_marqueur, _pos];
			_le_marqueur setMarkerShapelocal "ICON";
			_le_marqueur setMarkerColorlocal "Colorred";
			_le_marqueur setMarkerSizelocal [2,2];
			_le_marqueur setMarkerTypelocal "hd_dot";
			_le_marqueur setMarkerTextlocal "! Accident !";

			[_objet_mission_intervention_une, _objet_mission_intervention_deux, _civil_un, _civil_deux, _le_marqueur] execVM "divers\gendarmerie\missions_aleatoires\supprimer_le_message_si_personne_ny_va.sqf";
			
			waituntil {sleep 1; player distance _pos < 100};
			if (alive _objet_mission_intervention_une && alive _objet_mission_intervention_deux) then
			{
				_objet_mission_intervention_une_fumigene = "G_40mm_Smoke" createVehicle _pos; 
				hint "! ACCIDENT ! \n ----------------------------------------  \n Très bien ! \n\n Vous venez de gagner une prime de 1 500 Euros pour avoir été sur le lieu de l'accident ! \n\n Sécuriser maintenant le lieu, et mettez les véhicules en fourrière !\n ---------------------------------------- \n www.sfpteam.fr \n By Maxou";
				player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') + 1500,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			};

			waituntil {sleep 2; !alive _objet_mission_intervention_une && !alive _objet_mission_intervention_deux};
			
			hint "! ACCIDENT ! \n ----------------------------------------  \n Très bien ! \n\n Vous venez de sécuriser la zone !\n ---------------------------------------- \n www.sfpteam.fr \n By Maxou";
		};
	};
};
