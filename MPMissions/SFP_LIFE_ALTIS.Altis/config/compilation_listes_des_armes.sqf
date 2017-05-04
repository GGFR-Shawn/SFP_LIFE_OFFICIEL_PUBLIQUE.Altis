// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// Menu du tableau, ou est pris l'argent, numéro du titre du tableau, numero des ADD 
// Nom de l'arme, nom dialogue prévisualisation, classe de l'arme, son prix, ses munitions, prix des munitions,

// =======================================================================================================================================================================================
								// NE PAS TOUCHER CETTE PARTIE EN DESSOUS SEULEMENT !!!!
// =======================================================================================================================================================================================
[] spawn
{
	waituntil {sleep 1; !isnil "armes_des_gangs";};
	
	_les_armes_du_serveur_a_trier = armes_des_gangs + armes_pistolets_illegaux + armes_fusils_illegaux + armes_pistolets_legaux_civil + armes_pistolets_legaux_gendarmes + armes_fusils_legaux_civil + armes_fusils_legaux_gendarmes + armes_du_GIGN;
	les_armes_du_serveur_tries = [];
	for "_i" from 0 to (count _les_armes_du_serveur_a_trier - 1) do
	{
		for "_d" from 0 to (count (_les_armes_du_serveur_a_trier select _i select 2) - 1) do
		{
			_classe_trouve = _les_armes_du_serveur_a_trier select _i select 2 select _d;
			if (!(_classe_trouve in les_armes_du_serveur_tries)) then {les_armes_du_serveur_tries = les_armes_du_serveur_tries + [_classe_trouve];};	
		};
	};
};

// =======================================================================================================================================================================================
											// PISTOLETS LEGAUX GENDARMES
// =======================================================================================================================================================================================
parametrage_armes_pistolets_legaux_gendarmes = 
[
	"Menu_Armes_Pistolets_Legaux_SFP", "mon_argent_banque_by_sfp_maxou", 1005, 1500
];

armes_pistolets_legaux_gendarmes =
[
	[" Pistolet Radar Non Reseau", "Pistolet_Radar_Gendarmerie_SFP_Dialogue", ["Pistolet_Radar_Gendarmerie_SFP"], round (20 + (random 10)), [], 0],
	[" Pistolet Radar Reseau", "Pistolet_Radar_Gendarmerie_SFP_Dialogue", ["Pistolet_Radar_Gendarmerie_SFP_Reseau"], round (40 + (random 10)), [], 0],
	[" Pistolet Lacrymogène (XX MM)", "Pistolet_Lacrymo_Dialogue", ["Pistolet_Lacrymo_SFP"], round (200), ["Lacryo_SFP_3Rnd_X3"], round (5)],
	[" Taser (XX MM)", "ROOK_SFP", ["hgun_Rook40_F_Taser_Maxou"], round (300), ["16Rnd_9x21_Mag_Taser_Maxou"], round (5)],
	[" Rook (9 MM)", "ROOK_SFP", ["hgun_Rook40_F","hgun_Rook40_snds_F"], round (200 + (random 100)), ["16Rnd_9x21_Mag"], round (5 + (random 5))],
	[" P07 (9 MM)", "P07_SFP", ["hgun_P07_F","hgun_P07_snds_F"], round (350 + (random 100)), ["16Rnd_9x21_Mag"], round (5 + (random 10))]
];

// =======================================================================================================================================================================================
																// FUSILS LEGAUX GENDARMES
// =======================================================================================================================================================================================
parametrage_armes_fusils_legaux_gendarmes = 
[
	"Menu_Armes_Fusils_Legaux_SFP", "mon_argent_banque_by_sfp_maxou", 1005, 1500
];

armes_fusils_legaux_gendarmes =
[
	[" MX Noir (6.5 x 39 MM)", "MX_SFP", ["arifle_MX_Black_F"], round (2500 + (random 1000)), ["30Rnd_65x39_caseless_mag"], round (10 + (random 10))],
	[" MX SW Noir (6.5 x 39 MM)", "MX_SFP", ["arifle_MX_SW_Black_F"], round (2500 + (random 1000)), ["30Rnd_65x39_caseless_mag"], round (10 + (random 10))],
	[" MXM Noir (6.5 x 39 MM)", "MXC_SFP", ["arifle_MXM_Black_F"], round (2500 + (random 1000)), ["30Rnd_65x39_caseless_mag"], round (10 + (random 10))],
	[" MXC Noir (6.5 x 39 MM)", "MXC_SFP", ["arifle_MXC_Black_F"], round (2500 + (random 1000)), ["30Rnd_65x39_caseless_mag"], round (10 + (random 10))],
	[" FlashBall (XX MM)", "STING_SFP", ["F_Flash_Ball_SFP_Maxou"], round (200), ["16Rnd_9x21_Mag_Flash_Ball_Maxou"], round (5)],
	[" Sting (9 X 21 MM)", "STING_SFP", ["SMG_02_F"], round (300), ["30Rnd_9x21_Mag"], round (5 + (random 10))],
	[" PDW 2000 (9 X 21 MM)", "PDW_2000_SFP", ["hgun_PDW2000_F"], round (300), ["30Rnd_9x21_Mag"], round (5 + (random 10))],
	[" Vermin (0.45 MM)", "VERMIN_SFP", ["SMG_01_F"], round (300), ["30Rnd_45ACP_Mag_SMG_01"], round (5 + (random 10))],
	[" MK 20 (5.56 X 45 MM)", "MK_20_SFP", ["arifle_Mk20C_F"], round (500), ["30Rnd_556x45_Stanag"], round (5 + (random 10))],
	[" FAMAS F1 (XX MM)", "FAMAS_SFP", ["R3F_Famas_F1_HG"], round (800), ["R3F_25Rnd_556x45_FAMAS"], round (5 + (random 10))],
	[" FAMAS G2 (XX MM)", "FAMAS_G2_SFP", ["R3F_Famas_G2_HG"], round (800), ["R3F_30Rnd_556x45_FAMAS"], round (5 + (random 10))],
	[" FAMAS Surb (XX MM)", "FAMAS_SURB_SFP", ["R3F_Famas_surb"], round (800), ["R3F_30Rnd_556x45_FAMAS"], round (5 + (random 10))],
	[" HK 416 M (XX MM)", "FAMAS_HK_416_M_SFP", ["R3F_HK416M"], round (3500), ["R3F_30Rnd_556x45_HK416"], round (5 + (random 10))],
	[" (DLC) CAR-95 (5.8 X 42 MM)", "arifle_CTAR_ghex_F_SFP", ["arifle_CTAR_blk_F"], round (3500), ["30Rnd_580x42_Mag_F"], round (5 + (random 10))],
	[" (DLC) Mp5k (9 X 21 MM)", "SMG_05_F_SFP", ["SMG_05_F"], round (300), ["30Rnd_9x21_Mag_SMG_02"], round (5 + (random 10))],
	[" (DLC) SPAR-16 (5.56 X 45 MM)", "arifle_SPAR_01_snd_F_SFP", ["arifle_SPAR_01_blk_F"], round (3500), ["30Rnd_556x45_Stanag"], round (10 + (random 30))],
	[" (DLC) Type 115 (6.5 X 39 MM)", "arifle_ARX_blk_F_SFP", ["arifle_ARX_blk_F"], round (4000), ["30Rnd_65x39_caseless_green"], round (10 + (random 30))]
];

// =======================================================================================================================================================================================
																// ARMES GIGN
// =======================================================================================================================================================================================
parametrage_armes_GIGN = 
[
	"Menu_Armes_GIGN_SFP", "mon_argent_banque_by_sfp_maxou", 1005, 1500
];

armes_du_GIGN =
[
	[" Bouclier GIGN", "BOUCLIER_GIGN_SFP", ["gign_shield"], 12000, [""], 0],
	[" FAMAS Felin (XX MM)", "FAMAS_FELIN_SFP", ["R3F_Famas_felin"], 35000, ["R3F_30Rnd_556x45_FAMAS"], round (150 + (random 200))],
	[" MK 200 (6.5 X 39 MM)", "MK_200_SFP", ["LMG_Mk200_F"], 45000, ["200Rnd_65x39_cased_Box"], round (150 + (random 200))],
	[" M4S90 (XX MM)", "FAMAS_M4S90_SFP", ["R3F_M4S90"], 20000, ["R3F_7Rnd_M4S90"], round (100 + (random 200))],
	[" HK 417 S (7.62 X 51 MM)", "HK_417_S_SFP", ["R3F_HK417S_HG"], 30000, ["R3F_20Rnd_762x51_HK417"], round (150 + (random 200))],
	[" HK 417 M (7.62 X 51 MM)", "HK_417_M_SFP", ["R3F_HK417M_HG"], 30000, ["R3F_20Rnd_762x51_HK417"], round (150 + (random 200))],
	[" HK 417 L (XX MM)", "FAMAS_HK_417_L_SFP", ["R3F_HK417L"], 30000, ["R3F_20Rnd_762x51_HK417"], round (100 + (random 200))],
	[" EBR (7.62 X 51 MM)", "EBR_SFP", ["srifle_EBR_F"], 30000, ["20Rnd_762x51_Mag"], round (150 + (random 200))],
	[" GM6 Lynx (12.7 X 108 MM)", "GM6_SFP", ["srifle_GM6_SOS_F"], 50000, ["5Rnd_127x108_Mag"], round (60 + (random 150))],
	[" M320 (Calibre 408)", "LRR_SFP", ["srifle_LRR_SOS_F"], 50000, ["7Rnd_408_Mag"], round (60 + (random 150))],
	[" M107 (XX MM)", "FAMAS_M107_SFP", ["R3F_M107"], 50000, ["R3F_10Rnd_127x99_M107"], round (100 + (random 200))],
	[" PGM (XX MM)", "FAMAS_PGM_DEUX_SFP", ["R3F_PGM_Hecate_II"], 50000, ["R3F_7Rnd_127x99_PGM"], round (100 + (random 200))],
	[" RPG (XX MM)", "RPG_32_SFP", ["launch_RPG32_F"], 200000, ["RPG32_F"], round (30000 + (random 50000))],
	[" (DLC) CMR-76 (5.80 X 42 MM)", "srifle_DMR_07_ghex_F_SFP", ["srifle_DMR_07_ghex_F"], round (60000 + (random 20000)), ["20Rnd_650x39_Cased_Mag_F"], round (500 + (random 500))],
	[" (DLC) LIM-85 (5.56 X 45 MM)", "LMG_03_F_SFP", ["LMG_03_F"], round (60000 + (random 20000)), ["200Rnd_556x45_Box_F"], round (1000 + (random 500))],
	[" (DLC) Mk-1 EMR Boisé (7.62 X 51 MM)", "srifle_DMR_03_woodland_F_SFP", ["srifle_DMR_03_woodland_F"], round (85000 + (random 10000)), ["20Rnd_762x51_Mag"], round (1000 + (random 500))],
	[" (DLC) Mk14 Camo (7.62 X 51 MM)", "srifle_DMR_06_camo_F_SFP", ["srifle_DMR_06_camo_F"], round (75000 + (random 10000)), ["20Rnd_762x51_Mag"], round (1000 + (random 500))],
	[" (DLC) SPAR-17 Sable (7.62 X 51 MM)", "arifle_SPAR_03_snd_F_SFP", ["arifle_SPAR_03_snd_F"], round (80000 + (random 10000)), ["20Rnd_762x51_Mag"], round (1000 + (random 500))]
];

// =======================================================================================================================================================================================
																// PISTOLETS LEGAUX CIVILS
// =======================================================================================================================================================================================
parametrage_armes_pistolets_legaux_civil = 
[
	"Menu_Armes_Pistolets_Legaux_SFP", "mon_argent_banque_by_sfp_maxou", 1005, 1500
];

armes_pistolets_legaux_civil =
[
	[" Rook (9 MM)", "ROOK_SFP", ["hgun_Rook40_F","hgun_Rook40_snds_F"], round (400 + (random 100)), ["16Rnd_9x21_Mag"], round (15 + (random 10))],
	[" P07 (9 MM)", "P07_SFP", ["hgun_P07_F","hgun_P07_snds_F"], round (350 + (random 100)), ["16Rnd_9x21_Mag"], round (15 + (random 10))],
	[" Poignard", "", ["poignard_item"], round (150 + (random 100)), ["poignard_item"], 0],
	[" (DLC) PM Makarov (9 X 21 MM)", "hgun_Pistol_01_F_SFP", ["hgun_Pistol_01_F"], round (300 + (random 100)), ["10Rnd_9x21_Mag"], round (30 + (random 10))]
];

// =======================================================================================================================================================================================
																// FUSILS LEGAUX CIVILS
// =======================================================================================================================================================================================
parametrage_armes_fusils_legaux_civil = 
[
	"Menu_Armes_Fusils_Legaux_SFP", "mon_argent_banque_by_sfp_maxou", 1005, 1500
];

armes_fusils_legaux_civil =
[
	[" PDW-2000 (9 X 21 MM)", "PDW_2000_SFP", ["hgun_PDW2000_F","hgun_PDW2000_Holo_snds_F","hgun_PDW2000_Holo_F","hgun_PDW2000_snds_F"], round (500 + (random 100)), ["30Rnd_9x21_Mag"], round (35 + (random 11))],
	[" STING (9 X 21 MM)", "STING_SFP", ["SMG_02_F","SMG_02_ACO_F","SMG_02_ARCO_pointg_F"], round (615 + (random 111)), ["30Rnd_9x21_Mag"], round (35 + (random 11))],
	[" (DLC) Mp5k (9 X 21 MM)", "SMG_05_F_SFP", ["SMG_05_F"], round (2000 + (random 600)), ["30Rnd_9x21_Mag_SMG_02"], round (50 + (random 22))]
];

// =======================================================================================================================================================================================
																// PISTOLETS ILLEGAUX
// =======================================================================================================================================================================================
parametrage_armes_pistolets_illegaux = 
[
	"Menu_Armes_Pistolets_Illegaux_SFP", "mon_argent_poche_by_sfp_maxou", 1005, 1500
];

armes_pistolets_illegaux =
[
	[" ACP-C2 (0.45 MM)", "ACP_C2_SFP", ["hgun_ACPC2_F","hgun_ACPC2_snds_F"], round (1000 + (random 500)), ["9Rnd_45ACP_Mag"], round (60 + (random 22))],
	[" 4-Five (0.45 MM)", "QUATRE_FIVE_SFP", ["hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_01_snds_F","hgun_Pistol_heavy_01_MRD_F"], round (1000 + (random 500)), ["11Rnd_45ACP_Mag"], round (60 + (random 22))],
	[" Zubr (0.45 MM)", "Z_UBR_SFP", ["hgun_Pistol_heavy_02_F","hgun_Pistol_heavy_02_Yorris_F"], round (1500 + (random 500)), ["6Rnd_45ACP_Cylinder"], round (70 + (random 22))]
];

// =======================================================================================================================================================================================
																// FUSILS ILLEGAUX
// =======================================================================================================================================================================================
parametrage_armes_fusils_illegaux = 
[
	"Menu_Armes_Fusils_Illegaux_SFP", "mon_argent_poche_by_sfp_maxou", 1005, 1500
];

armes_fusils_illegaux =        
[
	[" TRG 20-21 (5.56 X 45 MM)", "TRG_20_21_SFP", ["arifle_TRG20_F","arifle_TRG20_ACO_F","arifle_TRG20_ACO_Flash_F","arifle_TRG20_ACO_pointer_F","arifle_TRG20_Holo_F","arifle_TRG21_ACO_pointer_F","arifle_TRG21_MRCO_F"], round (2700 + (random 500)), ["30Rnd_556x45_Stanag"], round (70 + (random 20))],
	[" SDAR (5.56 X 45 MM)", "SDAR_SFP", ["arifle_SDAR_F"], round (2700 + (random 500)), ["30Rnd_556x45_Stanag"], round (70 + (random 20))],
	[" MK 20 (5.56 X 45 MM)", "MK_20_SFP", ["arifle_Mk20_F","arifle_Mk20_GL_ACO_F","arifle_Mk20_plain_F","arifle_Mk20_MRCO_pointer_F","arifle_Mk20_MRCO_plain_F","arifle_Mk20_MRCO_F","arifle_Mk20_ACO_pointer_F","arifle_Mk20_ACO_F","arifle_Mk20_Holo_F","arifle_Mk20_pointer_F","arifle_Mk20C_ACO_pointer_F","arifle_Mk20C_ACO_F","arifle_Mk20C_plain_F","arifle_Mk20C_F"], round (2700 + (random 500)), ["30Rnd_556x45_Stanag"], round (70 + (random 20))],
	[" VERMIN (0.45 MM)", "VERMIN_SFP", ["SMG_01_F","SMG_01_Holo_F","SMG_01_Holo_pointer_snds_F","SMG_01_ACO_F"], round (2700 + (random 500)), ["30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_tracer_green"], round (70 + (random 20))]
];


// =======================================================================================================================================================================================
														// ARMES DES GANGS
// =======================================================================================================================================================================================
parametrage_armes_gang = 
[
	"Menu_Armes_Gangs_SFP", "mon_argent_poche_by_sfp_maxou", 1005, 1500
];

armes_des_gangs =        
[
	[" Minimi (5.56 X 45 MM)", "FAMAS_MINIMI_SFP", ["R3F_Minimi"], round (8000 + (random 2000)), ["R3F_200Rnd_556x45_MINIMI"], round (800 + (random 300))],
	[" Katiba (6.5 X 39 MM)", "Katiba_SFP", ["arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_ARCO_F","arifle_Katiba_ACO_pointer_F","arifle_Katiba_ACO_F","arifle_Katiba_C_ACO_F","arifle_Katiba_C_ACO_pointer_F","arifle_Katiba_ARCO_pointer_F"], round (4000 + (random 1000)), ["30Rnd_65x39_caseless_green"], round (100 + (random 100))],
	[" MX (6.5 X 39 MM)", "MX_SFP", ["arifle_MX_F","arifle_MXC_F","arifle_MX_SW_F","arifle_MX_ACO_F","arifle_MX_ACO_pointer_F","arifle_MX_Hamr_pointer_F","arifle_MX_Holo_pointer_F","arifle_MX_pointer_F","arifle_MXM_F"], round (4000 + (random 1000)), ["30Rnd_65x39_caseless_mag"], round (100 + (random 100))],
	[" MXC (6.5 X 39 MM)", "MXC_SFP", ["arifle_MXC_Holo_pointer_snds_F","arifle_MXC_Holo_F","arifle_MXC_Holo_pointer_F"], round (4000 + (random 1000)), ["30Rnd_65x39_caseless_mag"], round (100 + (random 100))],
	[" MK 200 (6.5 X 39 MM)", "MK_200_SFP", ["LMG_Mk200_F","LMG_Mk200_MRCO_F","LMG_Mk200_pointer_F"], round (6000 + (random 1111)), ["200Rnd_65x39_cased_Box"], round (800 + (random 222))],
	[" HK417M HG DES (7.62 X 51)", "R3F_HK417M_HG_DES_SFP", ["R3F_HK417M_HG_DES"], round (5500 + (random 1111)), ["R3F_20Rnd_762x51_HK417"], round (400 + (random 111))],
	[" HK417S HG DES (7.62 X 51)", "R3F_HK417S_HG_DES_SFP", ["R3F_HK417S_HG_DES"], round (5500 + (random 1111)), ["R3F_20Rnd_762x51_HK417"], round (400 + (random 111))],
	[" FRF2 DES (7.62 X 51 MM)", "R3F_FRF2_DES_SFP", ["R3F_FRF2_DES"], round (12000 + (random 5000)), ["R3F_10Rnd_762x51_FRF2"], round (1000 + (random 500))],
	[" AT4C (XX MM)", "R3F_AT4CS_SFP", ["R3F_AT4CS"], round (15000 + (random 5000)), ["R3F_AT4CS_Mag"], round (26000 + (random 10000))],
	[" (DLC) Akm (7.62 X 39 MM)", "arifle_AKM_F_SFP", ["arifle_AKM_F"], round (5000 + (random 1111)), ["30Rnd_762x39_Mag_F"], round (400 + (random 222))],
	[" (DLC) AKS-74u (5.45 X 39 MM)", "arifle_AKS_F_SFP", ["arifle_AKS_F"], round (5000 + (random 1111)), ["30Rnd_545x39_Mag_F"], round (400 + (random 222))],
	[" (DLC) CAR-95 (5.80 X 42 MM)", "arifle_CTAR_ghex_F_SFP", ["arifle_CTAR_ghex_F"], round (5500 + (random 1111)), ["30Rnd_580x42_Mag_F"], round (400 + (random 111))],
	[" (DLC) CMR-76 (5.80 X 42 MM)", "srifle_DMR_07_ghex_F_SFP", ["srifle_DMR_07_ghex_F"], round (5500 + (random 1111)), ["20Rnd_650x39_Cased_Mag_F"], round (400 + (random 111))],
	[" (DLC) LIM-85 (5.56 X 45 MM)", "LMG_03_F_SFP", ["LMG_03_F"], round (5500 + (random 1111)), ["200Rnd_556x45_Box_F"], round (400 + (random 111))],
	[" (DLC) Mk-1 EMR Boisé (7.62 X 51 MM)", "srifle_DMR_03_woodland_F_SFP", ["srifle_DMR_03_woodland_F"], round (5500 + (random 1111)), ["20Rnd_762x51_Mag"], round (400 + (random 111))],
	[" (DLC) Mk-1 EMR Camo (7.62 X 51 MM)", "srifle_DMR_03_woodland_F_SFP", ["srifle_DMR_03_multicam_F"], round (5500 + (random 1111)), ["20Rnd_762x51_Mag"], round (400 + (random 111))],
	[" (DLC) Mk-1 EMR Kaki (7.62 X 51 MM)", "srifle_DMR_03_woodland_F_SFP", ["srifle_DMR_03_khaki_F"], round (5500 + (random 1111)), ["20Rnd_762x51_Mag"], round (400 + (random 111))],
	[" (DLC) Mk-1 EMR Sable (7.62 X 51 MM)", "srifle_DMR_03_woodland_F_SFP", ["srifle_DMR_03_tan_F"], round (5500 + (random 1111)), ["20Rnd_762x51_Mag"], round (400 + (random 111))],
	[" (DLC) Mk14 Camo (7.62 X 51 MM)", "srifle_DMR_06_camo_F_SFP", ["srifle_DMR_06_camo_F"], round (5500 + (random 1111)), ["20Rnd_762x51_Mag"], round (400 + (random 111))],
	[" (DLC) SPAR-16 Sable (5.56 X 45 MM)", "arifle_SPAR_01_snd_F_SFP", ["arifle_SPAR_01_snd_F"], round (5500 + (random 1111)), ["30Rnd_556x45_Stanag"], round (400 + (random 111))],
	[" (DLC) SPAR-17 Sable (7.62 X 51 MM)", "arifle_SPAR_03_snd_F_SFP", ["arifle_SPAR_03_snd_F"], round (8000 + (random 1111)), ["20Rnd_762x51_Mag"], round (500 + (random 200))],
	[" (DLC) Type 115 (6.5 X 39 MM)", "arifle_ARX_blk_F_SFP", ["arifle_ARX_ghex_F"], round (8000 + (random 1111)), ["30Rnd_65x39_caseless_green"], round (500 + (random 200))],
	[" (DLC) RPG-7 (6.5 X 39 MM)", "launch_RPG7_F_SFP", ["launch_RPG7_F"], round (15000 + (random 22222)), ["RPG7_F"], round (26000 + (random 5000))]
];

