// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// =======================================================================================================================================================================================
																  // Message si CarShop connecté //
// =======================================================================================================================================================================================
private "_employe_car_shop_connecte"; 
_employe_car_shop_connecte = false; 
{if (_x getvariable "je_suis_au_taff_a_la_sarl_car_shop") then {_employe_car_shop_connecte = true;};} foreach allunits; 
if (_employe_car_shop_connecte) then {hint "! ACHAT DE VEHICULE ! \n -------------------------------------------- \n\n Bienvenu dans la boutique véhicule ... \n\n Il y à actuellement des vendeurs au CarShop si tu souhaites avoir tes véhicules moins cher ! \n\n N'hésite pas. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

// =======================================================================================================================================================================================
																  // Lancement du script //
// =======================================================================================================================================================================================
private ["_argent_du_menu","_prix_de_depart"];

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_voitures";

createDialog _nom_du_menu;
disableSerialization;

_argent_du_menu = "mon_argent_banque_by_sfp_maxou";
_titre_add_id = 1005;
_numero_add = 1500;
_numero_tableau = -1;
_couleur_verte = [0,0.91,0.07,1];
_couleur_rouge = [0.99,0.04,0.01,1];
liste_recherche_informations_vehicules = [];
prix_de_depart = [];

if (player getvariable _argent_du_menu <= 0) then {couleur_valeur = _couleur_rouge;}else{couleur_valeur = _couleur_verte;};
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetTextColor couleur_valeur;
((uiNamespace getVariable _nom_du_menu) displayCtrl _titre_add_id) ctrlSetText format ["%1", (player getVariable _argent_du_menu) call retour_formatage_chiffre_sfp];


if (revive_mon_side == civilian) then
{
	lbAdd[_numero_add," OverBoard : 150 €"]; prix_de_depart pushBack 150; liste_recherche_informations_vehicules pushBack ["sga_hover_board","sga_hover_board_dialogue"];
	lbAdd[_numero_add," Quad : 600 €"]; prix_de_depart pushBack 600; liste_recherche_informations_vehicules pushBack ["C_Quadbike_01_F","quad_sfp"];
	lbAdd[_numero_add," Super 5 : 800 €"]; prix_de_depart pushBack 800; liste_recherche_informations_vehicules pushBack ["sfp_renault_cinq","sfp_renault_cinq_Dialogue"];
	lbAdd[_numero_add," Offroad : 3000 €"]; prix_de_depart pushBack 3000; liste_recherche_informations_vehicules pushBack ["C_Offroad_01_F","OffRoad_sfp"];
	lbAdd[_numero_add," Jeep : 3 000 €"]; prix_de_depart pushBack 3000; liste_recherche_informations_vehicules pushBack ["UAZ_Unarmed","UAZ_SFP"];
	lbAdd[_numero_add," Véhicule Chevrolet : 4 000 €"]; prix_de_depart pushBack 4000; liste_recherche_informations_vehicules pushBack ["DAR_ImpalaCivA","impala_sfp"];
	lbAdd[_numero_add," Jonzie 30CSL : 4 000 €"]; prix_de_depart pushBack 4000; liste_recherche_informations_vehicules pushBack ["Jonzie_30CSL","Jonzie_30CSL_Dialogue"];
	lbAdd[_numero_add," Suv : 4 100 €"]; prix_de_depart pushBack 4100; liste_recherche_informations_vehicules pushBack ["C_SUV_01_F","SUV_SFP"];
	lbAdd[_numero_add," Lincoln : 5 200 €"]; prix_de_depart pushBack 5200; liste_recherche_informations_vehicules pushBack ["SFP_lincoln","SFP_lincoln_Dialogue"];
	lbAdd[_numero_add," Jonzie_XB : 5 300 €"]; prix_de_depart pushBack 5300; liste_recherche_informations_vehicules pushBack ["Jonzie_XB","Jonzie_XB_Dialogue"];
	lbAdd[_numero_add," Jonzie Kia ceed : 5 500 €€"]; prix_de_depart pushBack 5500; liste_recherche_informations_vehicules pushBack ["Jonzie_Ceed","Jonzie_Ceed_Dialogue"];
	lbAdd[_numero_add," Jonzie Toyota Sprinter : 5 600 €"]; prix_de_depart pushBack 5600; liste_recherche_informations_vehicules pushBack ["Jonzie_Corolla","Jonzie_Corolla_Dialogue"];
	lbAdd[_numero_add," Jonzie Datsun Bluebird : 5 700 €"]; prix_de_depart pushBack 5700; liste_recherche_informations_vehicules pushBack ["Jonzie_Datsun_510","Jonzie_Datsun_510_Dialogue"];
	lbAdd[_numero_add," Jonzie Datsun Fairlady Z432 : 5 800 €"]; prix_de_depart pushBack 5800; liste_recherche_informations_vehicules pushBack ["Jonzie_Datsun_Z432","Jonzie_Datsun_Z432_Dialogue"];
	lbAdd[_numero_add," Jonzie Cadillac Escalade ESV : 5 900 €"]; prix_de_depart pushBack 5900; liste_recherche_informations_vehicules pushBack ["Jonzie_Escalade","Jonzie_Escalade_Dialogue"];
	lbAdd[_numero_add," Jonzie Gallant : 6 000 €"]; prix_de_depart pushBack 6000; liste_recherche_informations_vehicules pushBack ["Jonzie_Galant","Jonzie_Galant_Dialogue"];
	lbAdd[_numero_add," Jonzie Mini Cooper : 6 100 €"]; prix_de_depart pushBack 6100; liste_recherche_informations_vehicules pushBack ["Jonzie_Mini_Cooper","Jonzie_Mini_Cooper_Dialogue"];
	lbAdd[_numero_add," Jonzie Maserati Quattroporte : 6 200 €"]; prix_de_depart pushBack 6200; liste_recherche_informations_vehicules pushBack ["Jonzie_Quattroporte","Jonzie_Quattroporte_Dialogue"];
	lbAdd[_numero_add," Jonzie Ford F150 Raptor : 6 250 €"]; prix_de_depart pushBack 6250; liste_recherche_informations_vehicules pushBack ["Jonzie_Raptor","Jonzie_Raptor_Dialogue"];
	lbAdd[_numero_add," Jonzie Subaru WRX STI : 6 500 €"]; prix_de_depart pushBack 6500; liste_recherche_informations_vehicules pushBack ["Jonzie_STI","Jonzie_STI_Dialogue"];
	lbAdd[_numero_add," Smart : 7 000 €"]; prix_de_depart pushBack 7000; liste_recherche_informations_vehicules pushBack ["SFP_a3_smart","SFP_a3_smart_Dialogue"];
	lbAdd[_numero_add," Twingo 2015 : 7 500 €"]; prix_de_depart pushBack 7500; liste_recherche_informations_vehicules pushBack ["SFP_twingo_2015","SFP_twingo_2015_Dialogue"];
	lbAdd[_numero_add," Vandura : 8 000 €"]; prix_de_depart pushBack 8000; liste_recherche_informations_vehicules pushBack ["SFP_Vandura","SFP_Vandura_Dialogue"];
	lbAdd[_numero_add," Peugeot 508 : 11 000 €"]; prix_de_depart pushBack 11000; liste_recherche_informations_vehicules pushBack ["SFP_peugeot_508","SFP_peugeot_508_Dialogue"];
	lbAdd[_numero_add," Citroen C4 : 9 000 €"]; prix_de_depart pushBack 9000; liste_recherche_informations_vehicules pushBack ["SFP_c4_citroen","SFP_c4_citroen_Dialogue"];
	lbAdd[_numero_add," Moto Ducati : 10 000 €"]; prix_de_depart pushBack 10000; liste_recherche_informations_vehicules pushBack ["SFP_ducati","SFP_ducati_Dialogue"];
	lbAdd[_numero_add," Bus (Vieux) : 10 000 €"]; prix_de_depart pushBack 10000; liste_recherche_informations_vehicules pushBack ["Ikarus_Bus_SFP","Vieux_Bus_SFP"];
	lbAdd[_numero_add," Moto Yamaha R6 : 10 500 €"]; prix_de_depart pushBack 10500; liste_recherche_informations_vehicules pushBack ["sfp_yamaha_moto","sfp_yamaha_moto_Dialogue"];
	lbAdd[_numero_add," Peugeot 207 RC : 16 000 €"]; prix_de_depart pushBack 16000; liste_recherche_informations_vehicules pushBack ["sfp_207_RC","207_RC_SFP_Dialogue"];
	lbAdd[_numero_add," Citroen DS 3 : 18 000 €"]; prix_de_depart pushBack 18000; liste_recherche_informations_vehicules pushBack ["SFP_a3_citroen_ds_trois","SFP_a3_citroen_ds_trois_Dialogue"];
	lbAdd[_numero_add," Chevrolet Jonzie : 20 000 €"]; prix_de_depart pushBack 20000; liste_recherche_informations_vehicules pushBack ["Jonzie_96_Impala","Jonzie_96_SFP"];
	lbAdd[_numero_add," Chevrolet Dodge Viper : 20 500 €"]; prix_de_depart pushBack 20500; liste_recherche_informations_vehicules pushBack ["Jonzie_Viper","Jonzie_Viper_Dialogue"];
	lbAdd[_numero_add," Chevrolet Camaro : 21 000 €"]; prix_de_depart pushBack 21000; liste_recherche_informations_vehicules pushBack ["SAL_IROCCiv_SFP","Chevrolet_Camaro_SFP"];
	lbAdd[_numero_add," Pontiac Firebird : 21 500 €"]; prix_de_depart pushBack 21500; liste_recherche_informations_vehicules pushBack ["SAL_77TRANSAMCiv_SFP","Pontiac_Firebird_SFP"];
	lbAdd[_numero_add," Camion Benne : 22 000 €"]; prix_de_depart pushBack 22000; liste_recherche_informations_vehicules pushBack ["C_Van_01_transport_F","Van_Box_BENNE_SFP"];
	lbAdd[_numero_add," Camion Boxer : 24 000 €"]; prix_de_depart pushBack 24000; liste_recherche_informations_vehicules pushBack ["C_Van_01_box_F","Van_Box_SFP"];
	lbAdd[_numero_add," Corbillard : 25 000 €"]; prix_de_depart pushBack 25000; liste_recherche_informations_vehicules pushBack ["SFP_corbillard","SFP_corbillard_Dialogue"];
	lbAdd[_numero_add," Citroen DS 4 : 27 000 €"]; prix_de_depart pushBack 27000; liste_recherche_informations_vehicules pushBack ["sfp_citroen_ds4","sfp_citroen_ds4_Dialogue"];
	lbAdd[_numero_add," Suv Sport : 30 000 €"]; prix_de_depart pushBack 30000; liste_recherche_informations_vehicules pushBack ["C_SUV_01_Sport_Maxou","SUV_SFP"];
	lbAdd[_numero_add," Golf 6 : 35 000 €"]; prix_de_depart pushBack 35000; liste_recherche_informations_vehicules pushBack ["SFP_golfvi","SFP_golfvi_Dialogue"];
	lbAdd[_numero_add," 308 RCZ : 35 800 €"]; prix_de_depart pushBack 35800; liste_recherche_informations_vehicules pushBack ["sfp_308_rcz","sfp_308_rcz_Dialogue"];
	lbAdd[_numero_add," Chevrolet Tahoe : 39 000 €"]; prix_de_depart pushBack 39000; liste_recherche_informations_vehicules pushBack ["DAR_TahoeCivBlack","Tahoe_SFP"];
	lbAdd[_numero_add," Chevrolet Cobalt : 41 000 €"]; prix_de_depart pushBack 41000; liste_recherche_informations_vehicules pushBack ["SFP_Cobalt_Granite","Chevrolet_Colbat_SFP"];
	lbAdd[_numero_add," Jonzie Ford Transit : 42 000 €"]; prix_de_depart pushBack 42000; liste_recherche_informations_vehicules pushBack ["Jonzie_Transit","Jonzie_Transit_Dialogue"];
	lbAdd[_numero_add," Megane RS 3 : 44 000 €"]; prix_de_depart pushBack 44000; liste_recherche_informations_vehicules pushBack ["SFP_megane_rs_2015","SFP_megane_rs_2015_Dialogue"];
	lbAdd[_numero_add," Dodge Sport : 46 000 €"]; prix_de_depart pushBack 46000; liste_recherche_informations_vehicules pushBack ["DAR_ChallengerCivBlack","Dar_Challenger_SFP"];
	lbAdd[_numero_add," Audi RS 5 : 50 000 €"]; prix_de_depart pushBack 50000; liste_recherche_informations_vehicules pushBack ["SFP_audi_RS_Cinq","SFP_audi_RS_Cinq_Dialogue"];
	lbAdd[_numero_add," Bowler : 52 500 €"]; prix_de_depart pushBack 52500; liste_recherche_informations_vehicules pushBack ["SFP_Bowler","SFP_Bowler_Dialogue"];
	lbAdd[_numero_add," Jeep Cherokee : 55 000 €"]; prix_de_depart pushBack 55000; liste_recherche_informations_vehicules pushBack ["SFP_cherokee","SFP_cherokee_Dialogue"];
	lbAdd[_numero_add," BMW M3 : 57 000 €"]; prix_de_depart pushBack 57000; liste_recherche_informations_vehicules pushBack ["BMW_M3_Noir_SFP","BMW_M3_SFP"];
	lbAdd[_numero_add," Dodge Charger 2015 : 60 000 €"]; prix_de_depart pushBack 60000; liste_recherche_informations_vehicules pushBack ["SFP_Dodge_Charger_2015","SFP_Dodge_Charger_2015_Dialogue"];
	lbAdd[_numero_add," BMW M1 : 60 000 €"]; prix_de_depart pushBack 60000; liste_recherche_informations_vehicules pushBack ["SFP_bmw_m1_civ","SFP_bmw_m1_civ_Dialogue"];
	lbAdd[_numero_add," Audi A4 : 62 000 €"]; prix_de_depart pushBack 62000; liste_recherche_informations_vehicules pushBack ["SAL_AudiCivBlack","Audi_A4_SFP"];
	lbAdd[_numero_add," Alfa Romeo Brera : 64 000 €"]; prix_de_depart pushBack 64000; liste_recherche_informations_vehicules pushBack ["SFP_Alfa_Romeo","SFP_Alfa_Romeo_Dialogue"];
	lbAdd[_numero_add," Volkswagen Touareg : 66 000 €"]; prix_de_depart pushBack 66000; liste_recherche_informations_vehicules pushBack ["SFP_Volkswagen_Touareg","SFP_Volkswagen_Touareg_Dialogue"];
	lbAdd[_numero_add," Mitsubishi : 70 000 €"]; prix_de_depart pushBack 70000; liste_recherche_informations_vehicules pushBack ["SFP_EvoX_Mitsubishi","Mitsubishi_Lancer_SFP"];
	lbAdd[_numero_add," BMW M6 : 72 000 €"]; prix_de_depart pushBack 72000; liste_recherche_informations_vehicules pushBack ["SFP_bmwm6","SFP_bmwm6_Dialogue"];
	lbAdd[_numero_add," Zamak Couvert : 75 000 €"]; prix_de_depart pushBack 75000; liste_recherche_informations_vehicules pushBack ["I_Truck_02_covered_F","Zamak_SFP"];
	lbAdd[_numero_add," Nissan GTR 2012 : 75 000 €"]; prix_de_depart pushBack 75000; liste_recherche_informations_vehicules pushBack ["SFP_a3_nissan_gtr","SFP_a3_nissan_gtr_Dialogue"];
	lbAdd[_numero_add," Audi RS 4 : 78 000 €"]; prix_de_depart pushBack 78000; liste_recherche_informations_vehicules pushBack ["SFP_Audi_RS4","SFP_Audi_RS4_Dialogue"];
	lbAdd[_numero_add," Viper : 85 000 €€"]; prix_de_depart pushBack 85000; liste_recherche_informations_vehicules pushBack ["Jonzie_Viper_SFP","Viper_SFP"];
	lbAdd[_numero_add," Mercedes AMG C63 : 88 000 €"]; prix_de_depart pushBack 88000; liste_recherche_informations_vehicules pushBack ["SFP_c63_2015","SFP_c63_2015_Dialogue"];
	lbAdd[_numero_add," Porsche 911 92 : 95 000 €"]; prix_de_depart pushBack 95000; liste_recherche_informations_vehicules pushBack ["SFP_Porsche_911_92","SFP_Porsche_911_92_Dialogue"];
	lbAdd[_numero_add," Porsche GT3 : 105 000 €"]; prix_de_depart pushBack 105000; liste_recherche_informations_vehicules pushBack ["SFP_Porsche_RS","Porsche_RS_SFP"];
	lbAdd[_numero_add," Zamak Non Couvert : 150 000 €"]; prix_de_depart pushBack 150000; liste_recherche_informations_vehicules pushBack ["I_Truck_02_transport_F","Zamak_SFP"];
	lbAdd[_numero_add," Lamborghini Huracan : 150 000 €"]; prix_de_depart pushBack 150000; liste_recherche_informations_vehicules pushBack ["SFP_huracan","SFP_huracan_Dialogue"];
	lbAdd[_numero_add," Porsche Cayenne : 204 000 €"]; prix_de_depart pushBack 204000; liste_recherche_informations_vehicules pushBack ["SFP_cayenne","SFP_cayenne_Dialogue"];
	lbAdd[_numero_add," Koenigsegg Agera : 250 000 €"]; prix_de_depart pushBack 250000; liste_recherche_informations_vehicules pushBack ["SFP_agera","SFP_agera_Dialogue"];
	lbAdd[_numero_add," Jonzie Mack Superliner 273 : 280 000 €"]; prix_de_depart pushBack 280000; liste_recherche_informations_vehicules pushBack ["Jonzie_Superliner","Jonzie_Superliner_Dialogue"];
	lbAdd[_numero_add," Jonzie Remorque Mack Superliner 273 : 280 000 €"]; prix_de_depart pushBack 280000; liste_recherche_informations_vehicules pushBack ["Jonzie_Curtain","Jonzie_Curtain_Dialogue"];
	lbAdd[_numero_add," McLaren : 300 000 €"]; prix_de_depart pushBack 300000; liste_recherche_informations_vehicules pushBack ["SFP_McLarenP1","McLaren_SFP"];
	lbAdd[_numero_add," Audi Limousine : 400 000 €"]; prix_de_depart pushBack 400000; liste_recherche_informations_vehicules pushBack ["SFP_Limousine_Audi","SFP_Limousine_Audi_Dialogue"];
	lbAdd[_numero_add," Camion Daf XF Euros 6 : 420 000 €"]; prix_de_depart pushBack 420000; liste_recherche_informations_vehicules pushBack ["SFP_dafxf_euro6","SFP_dafxf_euro6_Dialogue"];
	lbAdd[_numero_add," Camion MAN TGX : 440 000 €"]; prix_de_depart pushBack 440000; liste_recherche_informations_vehicules pushBack ["SFP_Man_TGX_petite_cabine","SFP_Man_TGX_petite_cabine_Dialogue"];
	lbAdd[_numero_add," Camion Renault Magnum : 450 000 €"]; prix_de_depart pushBack 450000; liste_recherche_informations_vehicules pushBack ["SFP_Renault_Magnum","SFP_Renault_Magnum_Dialogue"];
	lbAdd[_numero_add," Lamborghini Veneno : 800 000 €"]; prix_de_depart pushBack 800000; liste_recherche_informations_vehicules pushBack ["SFP_veneno","SFP_veneno_Dialogue"];
	lbAdd[_numero_add," HEMTT Box : 600 000 €"]; prix_de_depart pushBack 600000; liste_recherche_informations_vehicules pushBack ["B_Truck_01_covered_F","HEMTT_Box_SFP"];
	lbAdd[_numero_add," (DLC) JEEP : 6 000 €"]; prix_de_depart pushBack 6000; liste_recherche_informations_vehicules pushBack ["C_Offroad_02_unarmed_F","C_Offroad_02_unarmed_F_Dialogue"];
};

if(revive_mon_side == west) then
{
	lbAdd[_numero_add," Quad : 600 €"]; prix_de_depart pushBack 600; liste_recherche_informations_vehicules pushBack ["C_Quadbike_Gendarmerie_SFP","quad_sfp"];
	lbAdd[_numero_add," Véhicule Chevrolet : 800 €"]; prix_de_depart pushBack 800; liste_recherche_informations_vehicules pushBack ["DAR_ImpalaCivA","impala_sfp"];
	lbAdd[_numero_add," OffRoad Banalisé : 900 €"]; prix_de_depart pushBack 900; liste_recherche_informations_vehicules pushBack ["C_Offroad_01_F","OffRoad_sfp"];
	lbAdd[_numero_add," OffRoad Gendarmerie : 940 €"]; prix_de_depart pushBack 940; liste_recherche_informations_vehicules pushBack ["C_Offroad_Gendarmerie_SFP","OffRoad_sfp"];
	lbAdd[_numero_add," Chevrolet Jonzie : 960 €"]; prix_de_depart pushBack 960; liste_recherche_informations_vehicules pushBack ["Jonzie_96_Impala","Jonzie_96_SFP"];
	lbAdd[_numero_add," SUV Gendarmerie : 1 000 €"]; prix_de_depart pushBack 1000; liste_recherche_informations_vehicules pushBack ["C_SUV_01_Gendarmerie_SFP","SUV_SFP"];
	lbAdd[_numero_add," Jonzie Holden Commodore Gendarmerie : 1 100 €"]; prix_de_depart pushBack 1100; liste_recherche_informations_vehicules pushBack ["Jonzie_Highway","Jonzie_Highway_Dialogue"];
	lbAdd[_numero_add," Ford Interceptor Gendarmerie (BAC): 1 200 €"]; prix_de_depart pushBack 1200; liste_recherche_informations_vehicules pushBack ["DAR_ExplorerPoliceStealth","Police_Interceptor"];
	lbAdd[_numero_add," Ford Interceptor Gendarmerie : 1 260 €"]; prix_de_depart pushBack 1260; liste_recherche_informations_vehicules pushBack ["DAR_ExplorerPolice","Police_Interceptor"];
	lbAdd[_numero_add," Jeep Gendarmerie : 1 400 €"]; prix_de_depart pushBack 1400; liste_recherche_informations_vehicules pushBack ["C_Offroad_02_unarmed_F","C_Offroad_02_unarmed_F_Dialogue"];
	lbAdd[_numero_add," 308 Gendarmerie : 1 500 €"]; prix_de_depart pushBack 1500; liste_recherche_informations_vehicules pushBack ["sfp_308_gendarmerie","sfp_308_gendarmerie_Dialogue"];
	lbAdd[_numero_add," 508 Gendarmerie : 1 600 €"]; prix_de_depart pushBack 1600; liste_recherche_informations_vehicules pushBack ["SFP_Peugeot_508_Gendarmerie","SFP_Peugeot_508_Gendarmerie_Dialogue"];
	lbAdd[_numero_add," Taurus Gendarmerie : 1 700 €"]; prix_de_depart pushBack 1700; liste_recherche_informations_vehicules pushBack ["DAR_TaurusPolice","AUCUN"];
	lbAdd[_numero_add," Hunter Gendarmerie : 3 000 €"]; prix_de_depart pushBack 3000; liste_recherche_informations_vehicules pushBack ["B_MRAP_GENDARMERIE_SFP","MRAR_SFP"];
	lbAdd[_numero_add," Moto Yamaha R6 : 1 200 €"]; prix_de_depart pushBack 1200; liste_recherche_informations_vehicules pushBack ["sfp_yamaha_moto","sfp_yamaha_moto_Dialogue"];
	lbAdd[_numero_add," Mitsubishi Gendarmerie : 1 600 €"]; prix_de_depart pushBack 1600; liste_recherche_informations_vehicules pushBack ["SFP_EvoX_Gendarmerie","SFP_EvoX_Mitsubishi_Gendarmerie_dialogue"];
	lbAdd[_numero_add," Audi RS 4 Gendarmerie : 1 700 €"]; prix_de_depart pushBack 1700; liste_recherche_informations_vehicules pushBack ["SFP_rs4_gendarmerie","SFP_rs4_gendarmerie_Dialogue"];
	lbAdd[_numero_add," BMW M1 Gendarmerie : 1 780 €"]; prix_de_depart pushBack 1780; liste_recherche_informations_vehicules pushBack ["SFP_bmw_gendarmerie","SFP_bmw_gendarmerie_Dialogue"];
	lbAdd[_numero_add," Mercedes Sprinter Gendarmerie : 2 000 €"]; prix_de_depart pushBack 2000; liste_recherche_informations_vehicules pushBack ["SFP_Sprinter_Gendarmeries","SFP_Sprinter_Gendarmeries_Dialogue"];
	lbAdd[_numero_add," Mégane RS Gendarmerie : 1 700 €"]; prix_de_depart pushBack 1700; liste_recherche_informations_vehicules pushBack ["SFP_megane_rs_gendarmerie","SFP_megane_rs_gendarmerie_Dialogue"];
	lbAdd[_numero_add," Dodge Sport : 1 800 €"]; prix_de_depart pushBack 1800; liste_recherche_informations_vehicules pushBack ["DAR_ChallengerCivBlack","Dar_Challenger_SFP"];
	lbAdd[_numero_add," Renault Mégane RS Gendarmerie 2015 : 1 850 €"]; prix_de_depart pushBack 1850; liste_recherche_informations_vehicules pushBack ["SFP_rs_2015_Gendarmerie","SFP_rs_2015_Gendarmerie_Dialogue"];
	lbAdd[_numero_add," Agera Gendarmerie : 2 000 €"]; prix_de_depart pushBack 2000; liste_recherche_informations_vehicules pushBack ["SFP_agera_gendarmerie","SFP_agera_gendarmerie_Dialogue"];
	lbAdd[_numero_add," Camion Boxer : 2 100 €"]; prix_de_depart pushBack 2100; liste_recherche_informations_vehicules pushBack ["C_Van_01_box_F","Van_Box_SFP"];
	lbAdd[_numero_add," Camion Boxer GIGN : 2 200 €"]; prix_de_depart pushBack 2200; liste_recherche_informations_vehicules pushBack ["C_Van_GIGN_01_box_F","Van_Box_SFP"];
	lbAdd[_numero_add," Hunter HMG : 15 000 €"]; prix_de_depart pushBack 15000; liste_recherche_informations_vehicules pushBack ["B_MRAP_01_hmg_F","MRAP_Arme_SFP"];
	lbAdd[_numero_add," Suburban GIGN : 16 000 €"]; prix_de_depart pushBack 16000; liste_recherche_informations_vehicules pushBack ["SFP_Suburban_GIGN","SFP_Suburban_GIGN_Dialogue"];
	lbAdd[_numero_add," (DLC) Pickup : 900 €"]; prix_de_depart pushBack 900; liste_recherche_informations_vehicules pushBack ["B_GEN_Offroad_01_gen_F","OffRoad_sfp"];
	lbAdd[_numero_add," (DLC) Prowler (désarmé) Noir : 7 000 €"]; prix_de_depart pushBack 7000; liste_recherche_informations_vehicules pushBack ["B_T_LSV_01_unarmed_F","B_T_LSV_01_unarmed_F_Dialogue"];
	lbAdd[_numero_add," (DLC) Prowler (Armé) Noir : 15 000 €"]; prix_de_depart pushBack 15000; liste_recherche_informations_vehicules pushBack ["B_T_LSV_01_armed_F","B_T_LSV_01_armed_F_Dialogue"];
};

for "_i" from 0 to (count liste_recherche_informations_vehicules - 1) do 
{ 
	_prix_de_depart = prix_de_depart select _i;
	
	_vitesse = getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i select 0 >> "maxSpeed"); if (_vitesse < 1) then {_vitesse = "??";};
	_place = (1 + getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i select 0 >> "transportSoldier")); if (_place < 2) then {_place = "??";};
	_latence_boite = (getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i select 0 >> "latency") * 10) / 2; if (_latence_boite < 1) then {_latence_boite = "??";};
	_resistance_feu = getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i select 0 >> "armor"); if (_resistance_feu < 1) then {_resistance_feu = "??";};
	_niveau_frein = round (getnumber (configFile >> "CfgVehicles" >> liste_recherche_informations_vehicules select _i select 0 >> "Wheels" >> "LF" >> "maxBrakeTorque") / 100); if (_niveau_frein < 1) then {_niveau_frein = "??";};
		
	((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add) lbSetTooltip [_i, format['Vitesse : %1 Km/h; Place : %2; Latence Boite : %3; Resistence Feu : %4 %6; Frein : %5 %6.', _vitesse, _place, _latence_boite, _resistance_feu, _niveau_frein, "%"]];
	
	if (player getvariable _argent_du_menu < _prix_de_depart) then {couleur_valeur = _couleur_rouge;} else{couleur_valeur = _couleur_verte;};  
	lbSetColor [_numero_add, _i, couleur_valeur];

	lbSetPicture [_numero_add, _i, "\A3\Soft_F\OffRoad_01\Data\UI\offroad_01_base_ca.paa"];	
};

hint format ['! ACHAT VEHICULE ! \n -------------------- \n\n  Nous disposons actuellement de %1 véhicules dans ce menu ! \n\n ----------------------------------- \n www.sfpteam.fr \n By SFP Maxou', count liste_recherche_informations_vehicules];

waituntil {!dialog;};
cutText["","BLACK IN"];