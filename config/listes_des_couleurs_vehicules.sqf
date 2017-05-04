// =======================================================================================================================================================================================
								// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_type_du_vehicule_resultat";
_type_du_vehicule = typeof (_this select 0);
_type_du_vehicule_resultat = 0;
if (isnil "_type_du_vehicule") exitwith {hint "Erreur, recommence ..."; fin_lecture_carrosserie = true;};

// =======================================================================================================================================================================================
												// VEHICULE D'ARMA //
// =======================================================================================================================================================================================
_listes_offroad = ["C_Offroad_01_F"];
_listes_suv = ["C_SUV_01_F","C_SUV_01_Sport_Maxou"];
_listes_hatchback = ["C_Hatchback_01_F","C_Hatchback_01_sport_F"];
_listes_quads = ["C_Quadbike_01_F_Location","C_Quadbike_01_F"];
_listes_C_Van_01_transport_F = ["C_Van_01_transport_F","C_Van_01_box_F"];
_listes_Ifrit = ["O_MRAP_02_F"];
_listes_C_Heli_Light_01 = ["Heli_Light_Civil_SFP"];
_pack_Jonzie_SFP = ["Jonzie_30CSL","Jonzie_Datsun_510","Jonzie_Datsun_Z432","Jonzie_Escalade","Jonzie_Galant","Jonzie_30CSL","Jonzie_Ceed","Jonzie_Corolla","Jonzie_Mini_Cooper","Jonzie_Quattroporte","Jonzie_Raptor","Jonzie_STI","Jonzie_Superliner","Jonzie_Transit","Jonzie_Viper","Jonzie_XB"];

if (_type_du_vehicule in _listes_offroad) then {_type_du_vehicule_resultat = 1};
if (_type_du_vehicule in _listes_suv) then {_type_du_vehicule_resultat = 2};
if (_type_du_vehicule in _listes_hatchback) then {_type_du_vehicule_resultat = 3};
if (_type_du_vehicule in _listes_quads) then {_type_du_vehicule_resultat = 4};
if (_type_du_vehicule in _listes_C_Van_01_transport_F) then {_type_du_vehicule_resultat = 5};
if (_type_du_vehicule in _listes_C_Heli_Light_01) then {_type_du_vehicule_resultat = 6};
if (_type_du_vehicule in _pack_Jonzie_SFP) then {_type_du_vehicule_resultat = 7};

if (_type_du_vehicule_resultat != 0) then
{
	switch _type_du_vehicule_resultat do
	{
		case 1 :
		{	
			_tarif_de_la_peinture = round (2000 + random 3000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Offroad Tribal","\sfp_coloris_carrossier\C_Offroad\offroad_tribal.jpg", 0, _tarif_de_la_peinture],
				["Offroad Manga","\sfp_coloris_carrossier\C_Offroad\offroad_manga.jpg", 0, _tarif_de_la_peinture],
				["Offroad Cyan","\sfp_coloris_carrossier\C_Offroad\offroad_cyan.jpg", 0, _tarif_de_la_peinture],
				["Offroad Noir Bande Blanche","\sfp_coloris_carrossier\C_Offroad\offroad_blck_editionco.jpg", 0, _tarif_de_la_peinture],
				["Offroad Rouge","\A3\soft_F\Offroad_01\data\Offroad_01_ext_co.paa", 0, _tarif_de_la_peinture],
				["Offroad Jaune Clair","\A3\soft_F\Offroad_01\data\Offroad_01_ext_BASE01_CO.paa", 0, _tarif_de_la_peinture],
				["Offroad Blanc","\A3\soft_F\Offroad_01\data\Offroad_01_ext_BASE02_CO.paa", 0, _tarif_de_la_peinture],
				["Offroad Bleu","\A3\soft_F\Offroad_01\data\Offroad_01_ext_BASE03_CO.paa", 0, _tarif_de_la_peinture],
				["Offroad Bordeau","\A3\soft_F\Offroad_01\data\Offroad_01_ext_BASE04_CO.paa", 0, _tarif_de_la_peinture],
				["Offroad Bleu/Blanc","\A3\soft_F\Offroad_01\data\Offroad_01_ext_BASE05_CO.paa", 0, _tarif_de_la_peinture],
				["Offroad Camo Vert (CHRIS)","\sfp_coloris_carrossier\C_Offroad\chrisoffroad1.jpg", 0, _tarif_de_la_peinture],
				["Offroad Camo Fonce (CHRIS)","\sfp_coloris_carrossier\C_Offroad\chrisoffroad2.jpg", 0, _tarif_de_la_peinture],
				["Offroad Blanc/Noir (CHRIS)","\sfp_coloris_carrossier\C_Offroad\chrisoffroad3.jpg", 0, _tarif_de_la_peinture],
				["Offroad Camo Clair V1 (CHRIS)","\sfp_coloris_carrossier\C_Offroad\chrisoffroad4.jpg", 0, _tarif_de_la_peinture],
				["Offroad Camo Clair V2 (CHRIS)","\sfp_coloris_carrossier\C_Offroad\chrisoffroad5.jpg", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Offroad personnalisé !";
		};

		case 2 :
		{	
			_tarif_de_la_peinture = round (2000 + random 3000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["SUV Orange Déco Sport","\sfp_coloris_carrossier\C_Suv\suv_sport_orange_deco.jpg", 0, _tarif_de_la_peinture],
				["SUV Violet Bandes Blanches","\sfp_coloris_carrossier\C_Suv\suv_violet.jpg", 0, _tarif_de_la_peinture],
				["SUV Hello Kitty","\sfp_coloris_carrossier\C_Suv\suv_kitty.jpg", 0, _tarif_de_la_peinture],
				["SUV Fast && Furious","\sfp_coloris_carrossier\C_Suv\suv_fast.jpg", 0, _tarif_de_la_peinture],
				["SUV Camo Marron","\sfp_coloris_carrossier\C_Suv\suv_camo_deux.jpg", 0, _tarif_de_la_peinture],
				["SUV Camo Noir","\sfp_coloris_carrossier\C_Suv\suv_camo.jpg", 0, _tarif_de_la_peinture],
				["SUV RS Bleu","\sfp_coloris_carrossier\C_Suv\RS.jpg", 0, _tarif_de_la_peinture],
				["SUV Bordeau","\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_CO.paa", 0, _tarif_de_la_peinture],
				["SUV Noir","\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_02_CO.paa", 0, _tarif_de_la_peinture],
				["SUV Blanc","\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_03_CO.paa", 0, _tarif_de_la_peinture],
				["SUV Orange","\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_04_CO.paa", 0, _tarif_de_la_peinture],
				["SUV Monster","\sfp_coloris_carrossier\C_Suv\suv_chris_1.jpg", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule SUV personnalisé !";
		};

		case 3 :
		{	
			_tarif_de_la_peinture = round (2000 + random 3000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["HatchBack Hello Kitty","\sfp_coloris_carrossier\C_HatchBack\hatchback_hellokitty.jpg", 0, _tarif_de_la_peinture],
				["HatchBack Normal Beige","\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE01_CO.paa", 0, _tarif_de_la_peinture],
				["HatchBack Normal Verte","\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE02_CO.paa", 0, _tarif_de_la_peinture],
				["HatchBack Normal Bleu Clair","\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE03_CO.paa", 0, _tarif_de_la_peinture],
				["HatchBack Normal Bleu Fonce","\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE04_CO.paa", 0, _tarif_de_la_peinture],
				["HatchBack Normal Or","\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE05_CO.paa", 0, _tarif_de_la_peinture],
				["HatchBack Normal Jaune Clair","\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE06_CO.paa", 0, _tarif_de_la_peinture],
				["HatchBack Normal Grise","\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE07_CO.paa", 0, _tarif_de_la_peinture],
				["HatchBack Normal Gris Fonce","\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE08_CO.paa", 0, _tarif_de_la_peinture],
				["HatchBack Normal Noir","\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE09_CO.paa", 0, _tarif_de_la_peinture],
				["HatchBack Tag Rouge","\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT01_CO.paa", 0, _tarif_de_la_peinture],
				["HatchBack Tag Bleu","\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT02_CO.paa", 0, _tarif_de_la_peinture],
				["HatchBack Tag Jaune","\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT03_CO.paa", 0, _tarif_de_la_peinture],
				["HatchBack Tag Blanc","\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT04_CO.paa", 0, _tarif_de_la_peinture],
				["HatchBack Blanc Clair","\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT05_CO.paa", 0, _tarif_de_la_peinture],
				["HatchBack Verte","\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT06_CO.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule HatchBack personnalisé !";
		};

		case 4 :
		{	
			_tarif_de_la_peinture = round (2000 + random 3000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Quad Noir","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_BLACK_CO.paa", 0, _tarif_de_la_peinture],
				["Quad Bleu","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_BLUE_CO.paa", 0, _tarif_de_la_peinture],
				["Quad Rouge","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_RED_CO.paa", 0, _tarif_de_la_peinture],
				["Quad Blanc","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_WHITE_CO.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Quad personnalisé !";
		};

		case 5 :
		{	
			_tarif_de_la_peinture = round (2000 + random 3000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Camion Benne Blanc","\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa", 0, _tarif_de_la_peinture],
				["Camion Benne Rouge","\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Camion Benne personnalisé !";
		};
		
		case 6 :
		{	
			_tarif_de_la_peinture = round (4000 + random 10000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Hélico Civil Cookie","\sfp_coloris_carrossier\C_Heli_Light_01\C_Heli_Light_01_civil_F~cookie.jpg", 0, _tarif_de_la_peinture],
				["Hélico Civil Hawai","\sfp_coloris_carrossier\C_Heli_Light_01\C_Heli_Light_01_civil_F~Hawai.jpg", 0, _tarif_de_la_peinture],
				["Hélico Civil Bomb","\sfp_coloris_carrossier\C_Heli_Light_01\C_Heli_Light_01_civil_F~stickerbomb.jpg", 0, _tarif_de_la_peinture],
				["Hélico Civil Swirl","\sfp_coloris_carrossier\C_Heli_Light_01\C_Heli_Light_01_civil_F~swirl.jpg", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Hélico Civil personnalisé !";
		};

		case 7 :
		{	
			_tarif_de_la_peinture = round (1500 + random 600);
			_couleur_perso_sfp = format ["#(argb,8,8,3)color(%1,%2,%3,%4,CO)",(random 1),(random 1),(random 1),(random 1)];
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Jonzie Pack Aleatoire Perso SFP",_couleur_perso_sfp, 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Jonzie personnalisé !";
		};
	};
}else 
// =======================================================================================================================================================================================
													// VEHICULE MODE //
// =======================================================================================================================================================================================
{
	_type_du_vehicule_resultat = _type_du_vehicule;
	switch _type_du_vehicule_resultat do
	{
		case "DAR_ImpalaCivA" :
		{	
			_tarif_de_la_peinture = round (2000 + random 3000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Chevrolet Noir","Impala\Data\BodyBlack_co.paa", 0, _tarif_de_la_peinture],
				["Chevrolet Rouge","Impala\Data\BodyRed_co.paa", 0, _tarif_de_la_peinture],
				["Chevrolet Bleu","Impala\Data\BodyBlue_co.paa", 0, _tarif_de_la_peinture],
				["Chevrolet Argent","Impala\Data\BodySilver_co.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Chevrolet personnalisé !";
		};
		
		case "SAL_IROCCiv_SFP" :
		{	
			_tarif_de_la_peinture = round (2000 + random 3000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Chevrolet Camara Rouge","SAL_IROC\Data\Body_coRed.paa", 0, _tarif_de_la_peinture],
				["Chevrolet Camara Argent","SAL_IROC\Data\Body_coSilver.paa", 0, _tarif_de_la_peinture],
				["Chevrolet Camara Noir","SAL_IROC\Data\Body_coBlack.paa", 0, _tarif_de_la_peinture],
				["Chevrolet Camara Bleu","SAL_IROC\Data\Body_coBlue.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Chevrolet personnalisé !";
		};
		
		case "DAR_TahoeCivBlack" :
		{	
			_tarif_de_la_peinture = round (2000 + random 3000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Chevrolet Tahoe Noir","DAR_Tahoe\Data\BodyBlack_co.paa", 0, _tarif_de_la_peinture],
				["Chevrolet Tahoe Rouge","DAR_Tahoe\Data\BodyRed_co.paa", 0, _tarif_de_la_peinture],
				["Chevrolet Tahoe Bleu","DAR_Tahoe\Data\BodyBlue_co.paa", 0, _tarif_de_la_peinture],
				["Chevrolet Tahoe Argent","DAR_Tahoe\Data\BodySilver_co.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Chevrolet personnalisé !";
		};
		
		case "DAR_ChallengerCivBlack" :
		{	
			_tarif_de_la_peinture = round (2000 + random 3000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Dodge Challenger Rouge","DAR_Challenger\Data\Body_coRed.paa", 0, _tarif_de_la_peinture],
				["Dodge Challenger Noire","DAR_Challenger\Data\Body_coBlack.paa", 0, _tarif_de_la_peinture],
				["Dodge Challenger Jaune","DAR_Challenger\Data\Body_coOrange.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Dodge Charger personnalisé !";
		};
		
		case "SAL_AudiCivBlack" :
		{	
			_tarif_de_la_peinture = round (2000 + random 3000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Audi A4 Rouge","SAL_A4\Data\Body_coRed.paa", 0, _tarif_de_la_peinture],
				["Audi A4 Argent","SAL_A4\Data\Body_coSilver.paa", 0, _tarif_de_la_peinture],
				["Audi A4 Noire","SAL_A4\Data\Body_coBlack.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Audi A4 personnalisé !";
		};
		
		case "SFP_Cobalt_Granite" :
		{	
			_tarif_de_la_peinture = round (2000 + random 3000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Chevrolet Cobalt Rouge","\D_Cobalt\maps\ext\d_red.paa", 0, _tarif_de_la_peinture],
				["Chevrolet Cobalt Blanche","\D_Cobalt\maps\ext\d_white.paa", 0, _tarif_de_la_peinture],
				["Chevrolet Cobalt Granite","\D_Cobalt\maps\ext\d_granite.paa", 0, _tarif_de_la_peinture],
				["Chevrolet Cobalt Bleu","\D_Cobalt\maps\ext\d_Blue.paa", 0, _tarif_de_la_peinture],
				["Chevrolet Cobalt Rouge/Noire","\D_Cobalt\maps\ext\d_darkred.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Chevrolet Cobalt personnalisé !";
		};
		
		case "SFP_Porsche_RS" :
		{	
			_tarif_de_la_peinture = round (2000 + random 3000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Porsche GT 3 Noire","\S_PorscheRS\Data\Textures\2012_porsche_gt3_ext_black.paa", 0, _tarif_de_la_peinture],
				["Porsche GT 3 Blanche","\S_PorscheRS\Data\Textures\2012_porsche_gt3_ext_carrara_white.paa", 0, _tarif_de_la_peinture],
				["Porsche GT 3 Jaune","\S_PorscheRS\Data\Textures\2012_porsche_gt3_ext_yellow.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Porsche GT 3 personnalisé !";
		};
		
		case "SFP_McLarenP1" :
		{	
			_tarif_de_la_peinture = round (2000 + random 3000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["McLaren Noire","\S_McLarenP1\Textures\Livery\2014_mclaren_p1_ext_black.paa", 0, _tarif_de_la_peinture],
				["McLaren Bleu","\S_McLarenP1\Textures\Livery\2014_mclaren_p1_ext_blue.paa", 0, _tarif_de_la_peinture],
				["McLaren Orange","\S_McLarenP1\Textures\Livery\2014_mclaren_p1_ext_orange.paa", 0, _tarif_de_la_peinture],
				["McLaren Silver","\S_McLarenP1\Textures\Livery\2014_mclaren_p1_ext_silver.paa", 0, _tarif_de_la_peinture],
				["McLaren Blanche","\S_McLarenP1\Textures\Livery\2014_mclaren_p1_ext_white.paa", 0, _tarif_de_la_peinture],
				["McLaren Jaune","\S_McLarenP1\Textures\Livery\2014_mclaren_p1_ext_yellow.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule McLaren personnalisé !";
		};
		
		case "Jonzie_96_Impala" :
		{	
			_tarif_de_la_peinture = round (100 + random 500);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Impala Jaune","#(rgb,8,8,3)color(0,0,0,1)", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Impala personnalisé !";
		};
		
		case "sfp_207_RC" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Peugeot 207 RC Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Peugeot 207 RC Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Peugeot 207 RC Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Peugeot 207 RC Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Peugeot 207 RC Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Peugeot 207 RC Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Peugeot 207 RC Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Peugeot 207 RC Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Peugeot 207 RC personnalisé !";
		};
		
		case "sfp_308_rcz" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Peugeot 308 RCZ Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Peugeot 308 RCZ Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Peugeot 308 RCZ Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Peugeot 308 RCZ Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Peugeot 308 RCZ Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Peugeot 308 RCZ Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Peugeot 308 RCZ Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Peugeot 308 RCZ Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Peugeot 308 RCZ personnalisé !";
		};
		
		case "SFP_Dodge_Charger_2015" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Dodge Charger 2015 Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Dodge Charger 2015 Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Dodge Charger 2015 Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Dodge Charger 2015 Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Dodge Charger 2015 Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Dodge Charger 2015 Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Dodge Charger 2015 Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Dodge Charger 2015 Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Dodge Charger 2015 personnalisé !";
		};
		
		case "SFP_a3_citroen_ds_trois" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Citroen DS 3 Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Citroen DS 3 Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Citroen DS 3 Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Citroen DS 3 Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Citroen DS 3 Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Citroen DS 3 Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Citroen DS 3 Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Citroen DS 3 Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Citroen DS 3 personnalisé !";
		};
		
		case "SFP_a3_nissan_gtr" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Nissan GTR Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Nissan GTR Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Nissan GTR Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Nissan GTR Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Nissan GTR Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Nissan GTR Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Nissan GTR Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Nissan GTR Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Nissan GTR personnalisé !";
		};
		
		case "SFP_a3_smart" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Smart Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Smart Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Smart Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Smart Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Smart Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Smart Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Smart Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Smart Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Smart personnalisé !";
		};
		
		case "SFP_agera" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Agera Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Agera Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Agera Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Agera Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Agera Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Agera Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Agera Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Agera Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Agera personnalisé !";
		};
		
		case "SFP_Alfa_Romeo" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Alfa Roméo Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Alfa Roméo Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Alfa Roméo Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Alfa Roméo Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Alfa Roméo Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Alfa Roméo Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Alfa Roméo Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Alfa Roméo Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Alfa Roméo personnalisé !";
		};
		
		case "SFP_bmw_m1_civ" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["BMW M1 Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["BMW M1 Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["BMW M1 Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["BMW M1 Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["BMW M1 Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["BMW M1 Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["BMW M1 Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["BMW M1 Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule BMW M1 personnalisé !";
		};
		
		case "SFP_bmwm6" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["BMW M6 Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["BMW M6 Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["BMW M6 Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["BMW M6 Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["BMW M6 Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["BMW M6 Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["BMW M6 Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["BMW M6 Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule BMW M6 personnalisé !";
		};
		
		case "SFP_c4_citroen" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Citroen C4 Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Citroen C4 Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Citroen C4 Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Citroen C4 Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Citroen C4 Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Citroen C4 Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Citroen C4 Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Citroen C4 Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Citroen C4 personnalisé !";
		};
		
		case "SFP_c63_2015" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Mercedes C63 AMG Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Mercedes C63 AMG Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Mercedes C63 AMG Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Mercedes C63 AMG Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Mercedes C63 AMG Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Mercedes C63 AMG Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Mercedes C63 AMG Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Mercedes C63 AMG Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Mercedes C63 AMG personnalisé !";
		};
		
		case "SFP_cayenne" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Porsche Cayenne Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Porsche Cayenne Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Porsche Cayenne Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Porsche Cayenne Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Porsche Cayenne Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Porsche Cayenne Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Porsche Cayenne Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Porsche Cayenne Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Porsche Cayenne personnalisé !";
		};
		
		case "SFP_cherokee" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Jeep Cherokee Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Jeep Cherokee Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Jeep Cherokee Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Jeep Cherokee Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Jeep Cherokee Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Jeep Cherokee Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Jeep Cherokee Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Jeep Cherokee Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Jeep Cherokee personnalisé !";
		};
		
		case "SFP_corbillard" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Corbillard Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Corbillard Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Corbillard Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Corbillard Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Corbillard Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Corbillard Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Corbillard Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Corbillard Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Corbillard personnalisé !";
		};
		
		case "SFP_ducati" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Ducati Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Ducati Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Ducati Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Ducati Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Ducati Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Ducati Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Ducati Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Ducati Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Ducati personnalisé !";
		};
		
		case "SFP_golfvi" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Golf 6 Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Golf 6 Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Golf 6 Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Golf 6 Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Golf 6 Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Golf 6 Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Golf 6 Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Golf 6 Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Golf 6 personnalisé !";
		};
		
		case "SFP_lincoln" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Lincoln Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Lincoln Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Lincoln Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Lincoln Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Lincoln Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Lincoln Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Lincoln Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Lincoln Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Lincoln personnalisé !";
		};
		
		case "SFP_megane_rs_2015" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Mégane RS Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Mégane RS Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Mégane RS Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Mégane RS Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Mégane RS Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Mégane RS Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Mégane RS Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Mégane RS Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Mégane RS personnalisé !";
		};
		
		case "sfp_renault_cinq" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Super 5 Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Super 5 Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Super 5 Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Super 5 Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Super 5 Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Super 5 Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Super 5 Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Super 5 Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Super 5 personnalisé !";
		};
		
		case "SFP_Audi_RS4" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Audi RS 4 Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Audi RS 4 Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Audi RS 4 Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Audi RS 4 Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Audi RS 4 Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Audi RS 4 Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Audi RS 4 Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Audi RS 4 Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Audi RS 4 personnalisé !";
		};
		
		case "SFP_twingo_2015" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Twingo 2015 Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Twingo 2015 Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Twingo 2015 Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Twingo 2015 Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Twingo 2015 Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Twingo 2015 Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Twingo 2015 Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Twingo 2015 Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Twingo 2015 personnalisé !";
		};
		
		case "SFP_Vandura" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Vendura Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Vendura Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Vendura Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Vendura Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Vendura Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Vendura Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Vendura Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Vendura Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Vendura personnalisé !";
		};
		
		case "SFP_veneno" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Lamborghini Veveno Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Lamborghini Veveno Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Lamborghini Veveno Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Lamborghini Veveno Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Lamborghini Veveno Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Lamborghini Veveno Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Lamborghini Veveno Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Lamborghini Veveno Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Lamborghini Veveno personnalisé !";
		};
		
		case "SFP_Volkswagen_Touareg" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Volkswagen Touareg Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Volkswagen Touareg Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Volkswagen Touareg Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Volkswagen Touareg Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Volkswagen Touareg Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Volkswagen Touareg Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Volkswagen Touareg Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Volkswagen Touareg Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Volkswagen Touareg personnalisé !";
		};
		
		case "sfp_yamaha_moto" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Yamaha R6 Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Yamaha R6 Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Yamaha R6 Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Yamaha R6 Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Yamaha R6 Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Yamaha R6 Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Yamaha R6 Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Yamaha R6 Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Yamaha R6 personnalisé !";
		};
		
		case "SFP_Man_TGX_petite_cabine" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Man TGX Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Man TGX Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Man TGX Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Man TGX Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Man TGX Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Man TGX Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Man TGX Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Man TGX Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Man TGX personnalisé !";
		};
		
		case "SFP_Limousine_Audi" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Audi Limousine Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Audi Limousine Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Audi Limousine Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Audi Limousine Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Audi Limousine Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Audi Limousine Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Audi Limousine Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Audi Limousine Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Audi Limousine personnalisé !";
		};
		
		case "SFP_audi_RS_Cinq" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Audi RS 5 Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Audi RS 5 Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Audi RS 5 Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Audi RS 5 Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Audi RS 5 Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Audi RS 5 Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Audi RS 5 Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Audi RS 5 Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Audi RS 5 personnalisé !";
		};
		
		case "SFP_Clio_Trois_RS" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Clio 3 RS Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Clio 3 RS Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Clio 3 RS Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Clio 3 RS Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Clio 3 RS Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Clio 3 RS Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Clio 3 RS Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Clio 3 RS Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Clio 3 RS personnalisé !";
		};
		
		case "SFP_dafxf_euro6" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Daf XF Euros 6 Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Daf XF Euros 6 Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Daf XF Euros 6 Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Daf XF Euros 6 Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Daf XF Euros 6 Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Daf XF Euros 6 Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Daf XF Euros 6 Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Daf XF Euros 6 Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Daf XF Euros 6 personnalisé !";
		};
		
		case "sfp_citroen_ds4" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Citroen DS 4 Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Citroen DS 4 Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Citroen DS 4 Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Citroen DS 4 Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Citroen DS 4 Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Citroen DS 4 Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Citroen DS 4 Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Citroen DS 4 Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Citroen DS 4 personnalisé !";
		};
		
		case "SFP_huracan" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Huracan Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Huracan Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Huracan Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Huracan Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Huracan Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Huracan Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Huracan Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Huracan Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Huracan personnalisé !";
		};
		
		case "SFP_peugeot_508" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Peugeot 508 Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Peugeot 508 Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Peugeot 508 Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Peugeot 508 Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Peugeot 508 Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Peugeot 508 Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Peugeot 508 Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Peugeot 508 Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Peugeot 508 personnalisé !";
		};
		
		case "SFP_Porsche_911_92" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Porsche 911 Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Porsche 911 Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Porsche 911 Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Porsche 911 Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Porsche 911 Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Porsche 911 Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Porsche 911 Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Porsche 911 Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Porsche 911 personnalisé !";
		};
		
		case "SFP_Renault_Magnum" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Renault Magnum Orange","shounka_a3_base\couleurs\orange.paa", 0, _tarif_de_la_peinture],
				["Renault Magnum Violet","shounka_a3_base\couleurs\violet.paa", 0, _tarif_de_la_peinture],
				["Renault Magnum Grise","shounka_a3_base\couleurs\gris.paa", 0, _tarif_de_la_peinture],
				["Renault Magnum Rose","shounka_a3_base\couleurs\rose.paa", 0, _tarif_de_la_peinture],
				["Renault Magnum Jaune","shounka_a3_base\couleurs\jaune.paa", 0, _tarif_de_la_peinture],
				["Renault Magnum Rouge","shounka_a3_base\couleurs\rouge.paa", 0, _tarif_de_la_peinture],
				["Renault Magnum Bleu Fonce","shounka_a3_base\couleurs\bleufonce.paa", 0, _tarif_de_la_peinture],
				["Renault Magnum Noir","shounka_a3_base\couleurs\noir.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Renault Magnum personnalisé !";
		};
		
		case "sab_RobinDR400_2" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Robin DR-400 Texture 1","sab_RobinDR400\data\texture2.paa", 0, _tarif_de_la_peinture],
				["Robin DR-400 Texture 2","sab_RobinDR400\data\texture3.paa", 0, _tarif_de_la_peinture],
				["Robin DR-400 Texture 3","sab_RobinDR400\data\texture4.paa", 0, _tarif_de_la_peinture],
				["Robin DR-400 Texture 4","sab_RobinDR400\data\texture5.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Robin DR 400 personnalisé !";
		};
		
		case "sab_FAAllegro" :
		{	
			_tarif_de_la_peinture = round (100 + random 1000);
			listes_des_couleurs_des_vehicules_sfp = 
			[
				["Sab Faallegro Texture 1","sab_FAAllegro\data\texture.paa", 0, _tarif_de_la_peinture],
				["Sab Faallegro Texture 2","sab_FAAllegro\data\texture2.paa", 0, _tarif_de_la_peinture],
				["Sab Faallegro Texture 3","sab_FAAllegro\data\texture3.paa", 0, _tarif_de_la_peinture],
				["Sab Faallegro Texture 4","sab_FAAllegro\data\texture4.paa", 0, _tarif_de_la_peinture],
				["Sab Faallegro Texture 5","sab_FAAllegro\data\texture5.paa", 0, _tarif_de_la_peinture]
			];
			
			systemchat "Véhicule Sab Faallegro personnalisé !";
		};
		
	};
};

fin_lecture_carrosserie = true;
