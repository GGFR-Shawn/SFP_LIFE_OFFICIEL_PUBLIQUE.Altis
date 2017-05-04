// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!isnil {cursortarget getvariable "vehicule_depannage_en_cours_d_utilisation"}) exitwith {hint "Vehicule en cours d'utilisation par un dépanneur !";};

_vehiculeleger 			= [
							   "B_Quadbike_01_F","C_Quadbike_01_F","C_Quadbike_Gendarmerie_SFP","SFP_ducati","sfp_yamaha_moto"
						  ];
						  
_vehiculeunpeupluslourd = [
							   "DAR_ImpalaCivA","C_Offroad_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_MRAP_01_hmg_F","C_Hatchback_01_F","C_SUV_01_Sport_Maxou","UAZ_Unarmed",
							   "C_Hatchback_01_GENDARMERIE_SFP","C_Hatchback_01_sport_GENDARMERIE_SFP","B_MRAP_GENDARMERIE_SFP","C_SUV_01_Gendarmerie_SFP",
							   "C_Offroad_Gendarmerie_SFP","Offroad_01_car_shop_sfp","DAR_TahoeEMS","DAR_ChallengerCivBlack",
							   "DAR_TahoeCivBlack","SAL_AudiCivBlack","Jonzie_96_Impala","DAR_ExplorerPoliceStealth","DAR_TaurusPolice","BMW_M3_Noir_SFP",
							   "Offroad_01_Sons_Of_Anarchy_sfp","DAR_ExplorerPolice","SAL_IROCCiv_SFP","SAL_77TRANSAMCiv_SFP",
							   "Jonzie_Viper_SFP","SFP_EvoX_Mitsubishi","SFP_Peugeot_508_Gendarmerie",
							   "SFP_McLarenP1","SFP_Cobalt_Granite",
							   "SFP_Porsche_RS",
							   "Offroad_01_sarl_pompier_sfp","SFP_EvoX_Gendarmerie","B_G_Offroad_01_F",
							   "SFP_Ambulance","sfp_207_RC","sfp_308_rcz","SFP_Dodge_Charger_2015","SFP_a3_citroen_ds_trois","SFP_a3_nissan_gtr","SFP_a3_smart",
							   "SFP_agera","SFP_Alfa_Romeo","SFP_bmw_m1_civ","SFP_bmwm6","SFP_Bowler","SFP_c4_citroen","SFP_c63_2015","SFP_cayenne","SFP_cherokee","SFP_corbillard","SFP_golfvi",
							   "SFP_lincoln","SFP_megane_rs_2015","sfp_renault_cinq","SFP_Audi_RS4","SFP_twingo_2015","SFP_Vandura",
							   "SFP_veneno","SFP_Volkswagen_Touareg","SFP_Limousine_Audi","SFP_audi_RS_Cinq","SFP_Clio_Trois_RS",
							   "sfp_citroen_ds4","SFP_huracan","SFP_peugeot_508","SFP_Porsche_911_92","sfp_308_gendarmerie","SFP_Sprinter_Gendarmeries",
							   "SFP_megane_rs_gendarmerie","SFP_agera_gendarmerie","SFP_bmw_gendarmerie","SFP_rs_2015_Gendarmerie","SFP_rs4_gendarmerie","SFP_jeep_blinde",
							   "SFP_Suburban_GIGN",sfp_config_famille_une_classe_du_vehicule_perso_un,"O_T_LSV_02_unarmed_F","O_T_LSV_02_armed_F","I_C_Offroad_02_unarmed_F","C_Offroad_02_unarmed_F","sga_hover_board",
							   "Jonzie_30CSL","Jonzie_Ceed","Jonzie_Corolla","Jonzie_Datsun_510","Jonzie_Datsun_Z432","Jonzie_Escalade",
							   "Jonzie_Galant","Jonzie_Highway","Jonzie_Mini_Cooper","Jonzie_Quattroporte","Jonzie_Raptor","Jonzie_STI",
							   "Jonzie_Transit","Jonzie_Viper","Jonzie_XB"
						   ];


private ["_mon_vehicule_de_depanneur"];
_mon_vehicule_de_depanneur = cursortarget;

_mon_vehicule_de_depanneur setVariable ["vehicule_depanneur_attache_au_vehicule",true,true]; // Mon véhicule de dépannage
_mon_vehicule_de_depanneur setVariable ["vehicule_depannage_en_cours_d_utilisation",true,true];

hint "! ATTACHER VEHICULE ! \n\n Le fonctionnement est simple : \n\n Pour attacher un véhicule à ta dépanneuse, il te suffit de : \n\n 1) Pointer ta souris vers le vehicule que tu souhaites dépanner.\n 2) Ensuite de (re)pointer ta souris vers ta dépanneuse. \n\n Et te voila maintenant entrain de remorquer ;) \n\n\n Attention, tu ne peux remorquer que des quads et à moins de 4 mètres de ta dépanneuse ! \n ----------------------------------\n By SFP Maxou \n www.sfpteam.fr";

waitUntil {((typeOf cursortarget in _vehiculeleger) or (typeOf cursortarget in _vehiculeunpeupluslourd)) && isnil {cursortarget getvariable "vehicule_depanneur_attache_au_vehicule"} && (player distance cursortarget) < 8}; 

// ---------------------------------------
_levehiculearemorquer = cursortarget;

_levehiculearemorquer setvariable ["jesuisattacher",1,true];

hint format['Ok, véhicule de type %1 à bien été selectionné ! \n\n Repointes maintenant ta souris sur ton véhicule !',typeOf _levehiculearemorquer];

waitUntil {(cursortarget isKindOf "Offroad_01_depanneur_sfp") && !isnil {cursortarget getvariable "vehicule_depanneur_attache_au_vehicule"} && (player distance cursortarget) < 8}; 

// ---------------------------------------
_madepanneuse = cursortarget;

if (typeOf _levehiculearemorquer in _vehiculeunpeupluslourd) then 
{
	hint "Patiente, j'attache ton véhicule.";

	player playMove "AinvPknlMstpSlayWrflDnon_healed";

	_levehiculearemorquer attachTo [_madepanneuse,[0,-7,-0]];

	sleep 1;
	_object1 = createVehicle ["Target_Rail_End_F", getPosATL player, [], 0, "NONE"];
	_object1 attachto [_madepanneuse,[0,-4,-1]];
	sleep 1;
	_object2 = createVehicle ["Target_Rail_End_F", getPosATL player, [], 0, "NONE"];
	_object2 attachto [_madepanneuse,[0,-3,-1]];

	hint format['Le véhicule de type %1 à bien été attacher à ta dépanneuse !', typeOf _levehiculearemorquer];
};
if (typeOf _levehiculearemorquer in _vehiculeleger) then 
{
	hint "Patiente, le quad va être monter sur ton véhicule.";
	player playMove "AinvPknlMstpSlayWrflDnon_healed";
	sleep 7;
	_levehiculearemorquer attachTo [_madepanneuse,[0,-1.7,1]];
	hint format['Le véhicule de type %1 à bien été monter sur ta dépanneuse !', typeOf _levehiculearemorquer];
};

sleep 3;
_mon_vehicule_de_depanneur setVariable ["vehicule_depannage_en_cours_d_utilisation", nil,true];
