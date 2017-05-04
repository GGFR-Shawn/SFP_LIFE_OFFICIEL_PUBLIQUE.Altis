// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// Menu du tableau, ou est pris l'argent, numéro du titre du tableau, numero des ADD 
// Nom de l'arme, nom dialogue prévisualisation, classe de l'arme, son prix, ses munitions, prix des munitions,

// =======================================================================================================================================================================================
																// VEHICULES PRISE DE GANG
// =======================================================================================================================================================================================
parametrage_vehicules_prises_de_gang = 
[
	"Menu_voitures_prise_de_gang", "mon_argent_poche_by_sfp_maxou", 1005, 1500
];

liste_vehicules_prises_de_gang =        
[
	[" CH-49 Mohawk", "CH_49_Mohawk_SFP", "I_Heli_Transport_02_F", 300000],
	[" Hélicoptère ADDAC (EC 635)", "SFP_EC635_ADAC_Civil_SFP", "SFP_EC635_ADAC_Civil", 600000],
	[" Tempest Material", "Tempest_Materiel_SFP", "O_Truck_03_device_F", 450000],
	[" UAZ Armé", "UAZ_sfp_Arme", "UAZ_MG", 30000],
	[" OffRoad Armé", "OffRoad_sfp", "B_G_Offroad_01_armed_F", 30000]
];

// =======================================================================================================================================================================================
																// PISTOLETS PRISE DE GANG
// =======================================================================================================================================================================================
parametrage_armes_pistolets_prises_de_gang = 
[
	"Menu_Armes_Pistolets_Prise_De_Gang", "mon_argent_poche_by_sfp_maxou", 1005, 1500
];

armes_pistolets_prises_de_gang =
[
	[" HK 416 (5.56 x 45 MM)", "hk416M_HG_SFP", ["R3F_HK416M_HG_DES"], round (3000 + (random 1000)), ["R3F_30Rnd_556x45_HK416"], round (20 + (random 30))],
	[" MX (6.5 x 39 MM)", "MX_SFP", ["arifle_MX_F"], round (3000 + (random 1000)), ["30Rnd_65x39_caseless_mag"], round (20 + (random 30))],
	[" MX SW (6.5 x 39 MM)", "MX_SFP", ["arifle_MX_SW_F"], round (3000 + (random 1000)), ["30Rnd_65x39_caseless_mag"], round (20 + (random 30))],
	[" MXM (6.5 x 39 MM)", "MXC_SFP", ["arifle_MXM_F"], round (3000 + (random 1000)), ["30Rnd_65x39_caseless_mag"], round (20 + (random 30))],
	[" MXC (6.5 x 39 MM)", "MXC_SFP", ["arifle_MXC_F"], round (3000 + (random 1000)), ["30Rnd_65x39_caseless_mag"], round (20 + (random 30))],
	[" Mk200 (6.5 mm)", "MK_200_SFP", ["LMG_Mk200_F"], round (5000 + (random 2000)), ["200Rnd_65x39_cased_Box"], 800],
	[" EBR (7.62 X 51 MM)", "EBR_SFP", ["srifle_EBR_F"], round (5000 + (random 3000)), ["20Rnd_762x51_Mag"], 400],
	[" Rahim (7.62 X 51 MM)", "", ["srifle_DMR_01_F"], round (5000 + (random 3000)), ["10Rnd_762x54_Mag"], 400],
	[" Benneli M4 (XX MM)", "FAMAS_M4S90_SFP", ["R3F_M4S90"], round (5000 + (random 3000)), ["R3F_7Rnd_M4S90"], 400],
	[" RPG 32 (127 MM)", "RPG_32_SFP", ["launch_RPG32_F"], round (10000 + (random 5000)), ["RPG32_F"], 25000],
	[" Titan (127 MM)", "Titan_Model_SFP", ["launch_Titan_F"], round (10000 + (random 5000)), ["Titan_AA"], 26000]
];

// =======================================================================================================================================================================================
																// EQUIPEMENTS ARMES PRISE DE GANG
// =======================================================================================================================================================================================
parametrage_equipement_des_armes_prises_de_gang = 
[
	"Menu_Attachement_Armes_Prise_De_Gang", "mon_argent_poche_by_sfp_maxou", 1005, 1500
];

waituntil {!isnil "equipements_des_armes_SFP_GANG";};
equipements_des_armes_prises_de_gang = equipements_des_armes_SFP_GANG;

fin_compilation_listes_prise_de_gang = true;
