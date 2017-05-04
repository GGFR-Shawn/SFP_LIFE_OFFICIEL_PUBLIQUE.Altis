// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

/*
	Ne modifier seulement la classe du véhicule dans la catégorie choisis ainsi que la capacité max d'un véhicule
	Si un véhicule n'est pas dans un des tableaux ci dessous il ne possedera pas de farming
*/

_le_vehicule = _this select 0;
valeur_de_l_inventaire_vehicule_a_appliquer = 0;
if (isnil "_le_vehicule") exitwith {hint "Erreur sur le choix du véhicule ...";};

switch (true) do
{
	case (typeof _le_vehicule in ["SFP_ducati","sfp_yamaha_moto","sga_hover_board"]) :
	{
		valeur_de_l_inventaire_vehicule_a_appliquer = 6;
	};

	case (typeof _le_vehicule in ["C_Quadbike_01_F_Location","C_Quadbike_01_F"]) :
	{
		valeur_de_l_inventaire_vehicule_a_appliquer = 12;
	};

	case (typeof _le_vehicule in 
			[
				"C_SUV_01_Location_Maxou","C_Offroad_01_F","C_SUV_01_Sport_Maxou","C_SUV_01_F","C_Hatchback_01_F",
				"C_Hatchback_01_sport_F","DAR_ImpalaCivA","Jonzie_96_Impala","SAL_IROCCiv_SFP",
				"O_MRAP_02_F","UAZ_Unarmed","DAR_ChallengerCivBlack","DAR_TahoeCivBlack","SAL_AudiCivBlack","BMW_M3_Noir_SFP",
				"SAL_77TRANSAMCiv_SFP","SFP_308","Jonzie_Viper_SFP",
				"SFP_McLarenP1","SFP_EvoX_Mitsubishi",
				"SFP_Cobalt_Granite","SFP_Porsche_RS",
				"sfp_207_RC","sfp_308_rcz","SFP_Dodge_Charger_2015","SFP_a3_citroen_ds_trois","SFP_a3_nissan_gtr","SFP_a3_smart",
				"SFP_agera","SFP_Alfa_Romeo","SFP_bmw_m1_civ","SFP_bmwm6","SFP_Bowler","SFP_c4_citroen","SFP_c63_2015","SFP_cayenne",
				"SFP_cherokee","SFP_corbillard","SFP_golfvi","SFP_lincoln","SFP_megane_rs_2015",
				"sfp_renault_cinq","SFP_Audi_RS4","SFP_twingo_2015","SFP_Vandura","SFP_Volkswagen_Touareg",
				"SFP_Limousine_Audi","SFP_audi_RS_Cinq","SFP_Clio_Trois_RS","sfp_citroen_ds4","SFP_huracan","SFP_peugeot_508",
				"SFP_Porsche_911_92",sfp_config_famille_une_classe_du_vehicule_perso_un,"C_Offroad_02_unarmed_F","Jonzie_30CSL","Jonzie_Ceed","Jonzie_Corolla",
				"Jonzie_Datsun_510","Jonzie_Datsun_Z432","Jonzie_Escalade","Jonzie_Galant","Jonzie_Mini_Cooper","Jonzie_Quattroporte",
				"Jonzie_Raptor","Jonzie_STI","Jonzie_Viper","Jonzie_XB"
			]) :
	{
		valeur_de_l_inventaire_vehicule_a_appliquer = 55;
	};

	case (typeof _le_vehicule in ["C_Van_01_transport_F","C_Van_01_box_F","Jonzie_Transit"]) :
	{
		valeur_de_l_inventaire_vehicule_a_appliquer = 120;
	};

	case (typeof _le_vehicule in ["I_Truck_02_covered_F"]) :
	{
		valeur_de_l_inventaire_vehicule_a_appliquer = 220;
	};

	case (typeof _le_vehicule in ["I_Truck_02_transport_F","Jonzie_Curtain"]) :
	{
		valeur_de_l_inventaire_vehicule_a_appliquer = 320;
	};

	case (typeof _le_vehicule in ["B_Truck_01_covered_F","O_Truck_03_device_F","SFP_Man_TGX_petite_cabine","SFP_dafxf_euro6","SFP_Renault_Magnum"]) :
	{
		valeur_de_l_inventaire_vehicule_a_appliquer = 500;
	};
	
	case (typeof _le_vehicule in ["chalutier_SFP"]) :
	{
		valeur_de_l_inventaire_vehicule_a_appliquer = 700;
	};
};