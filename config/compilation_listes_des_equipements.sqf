
// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// Menu du tableau, ou est pris l'argent, numéro du titre du tableau, numero des ADD 
// Nom de l'arme, nom dialogue prévisualisation, classe de l'arme, son prix, ses munitions, prix des munitions,

// =======================================================================================================================================================================================
																// EQUIPEMENTS DES ARMES
// =======================================================================================================================================================================================
parametrage_equipement_des_armes_Gangs = 
[
	"Menu_Attachement_Armes", "mon_argent_poche_by_sfp_maxou", 1005, 1500
];

parametrage_equipement_des_armes_Civils_Et_Gendarmes = 
[
	"Menu_Attachement_Armes", "mon_argent_banque_by_sfp_maxou", 1005, 1500
];

equipements_des_armes_SFP_GANG =
[
	[" Silencieux HK 416 Camo", ["R3F_SILENCIEUX_HK416_DES"], round (200 + (random 100))],
	[" Silencieux HK 417 Camo", ["R3F_SILENCIEUX_HK417_DES"], round (200 + (random 100))],
	[" Lampe Camo", ["R3F_LAMPE_SURB_DES"], round (50 + (random 20))],
	[" Lunette Aimpoint Camo", ["R3F_AIMPOINT_DES"], round (500 + (random 200))],
	[" Bipied 416/417 Camo", ["R3F_BIPIED_HK417_DES"], round (50 + (random 20))],
	[" Lunette Zeiss Camo", ["R3F_ZEISS_DES"], round (1000 + (random 300))],
	[" Silencieux FRF2 Camo", ["R3F_SILENCIEUX_FRF2_DES"], round (500 + (random 200))],
	[" Lunette J4 Camo", ["R3F_J4_DES"], round (600 + (random 150))],
	[" Lunette J8 Mildot Camo", ["R3F_J8_MILDOT_DES"], round (700 + (random 200))],
	[" Lumière Arme", ["acc_flashlight"], round (40 + (random 10))],
	[" Laser Nocturne", ["acc_pointer_IR"], round (15 + (random 10))],	
	[" Silencieux 5.56 MM", ["muzzle_snds_M"], round (200 + (random 100))],
	[" Silencieux 6.56 MM", ["muzzle_snds_H"], round (250 + (random 120))],
	[" Silencieux 7.62 MM", ["muzzle_snds_B"], round (300 + (random 100))],
	[" ACO Rouge", ["optic_Aco"], round (50 + (random 20))],
	[" ACO Vert", ["optic_ACO_grn"], round (50 + (random 20))],
	[" Viseur J10 (Lunette)", ["R3F_J10"], round (800 + (random 200))],
	[" Viseur ARCO", ["optic_Arco"], round (500 + (random 100))],
	[" Viseur MRCO", ["optic_MRCO"], round (500 + (random 100))],
	[" Viseur Holosight", ["optic_holosight"], round (500 + (random 100))],
	[" Viseur RCO", ["optic_Hamr"], round (500 + (random 100))],
	[" Viseur SOS", ["optic_SOS"], round (1000 + (random 300))],
	[" (DLC) NVS", ["optic_NVS"], round (1000 + (random 300))],
	[" (DLC) AMS Khaki", ["optic_AMS_khk"], round (800 + (random 150))],
	[" (DLC) AMS Noir", ["optic_AMS"], round (800 + (random 150))],
	[" (DLC) AMS Sable", ["optic_AMS_snd"], round (800 + (random 150))],
	[" (DLC) ARCO Hex Verte", ["optic_Arco_ghex_F"], round (500 + (random 100))],
	[" (DLC) DMS Hex Verte", ["optic_DMS_ghex_F"], round (600 + (random 120))],
	[" (DLC) DMS", ["optic_DMS"], round (600 + (random 120))],
	[" (DLC) ERCO", ["optic_ERCO_blk_F"], round (500 + (random 100))],
	[" (DLC) ERCO Khaki", ["optic_ERCO_khk_F"], round (500 + (random 100))],
	[" (DLC) ERCO Sable", ["optic_ERCO_snd_F"], round (500 + (random 100))],
	[" (DLC) Holosight Kaki", ["optic_Holosight_khk_F"], round (500 + (random 100))],
	[" (DLC) Holosight Noire", ["optic_Holosight_blk_F"], round (500 + (random 100))],
	[" (DLC) Khalia (OLD) ", ["optic_KHS_old"], round (500 + (random 100))],
	[" (DLC) LRPS", ["optic_LRPS"], round (1000 + (random 300))],
	[" (DLC) LRPS Hex Verte", ["optic_LRPS_ghex_F"], round (1000 + (random 300))],
	[" (DLC) LRPS Tropic", ["optic_LRPS_tna_F"], round (1000 + (random 300))],
	[" (DLC) Silencieux 7.62 Khaki", ["muzzle_snds_B_khk_F"], round (300 + (random 50))],
	[" (DLC) Silencieux 7.62 Sable", ["muzzle_snds_B_snd_F"], round (300 + (random 50))],
	[" (DLC) Silencieux 5.8 mm Hex verte", ["muzzle_snds_58_wdm_F"], round (200 + (random 22))],
	[" (DLC) Silencieux 6.5 mm Khaki", ["muzzle_snds_H_khk_F"], round (250 + (random 70))],
	[" (DLC) Silencieux 6.5 mm Sable", ["muzzle_snds_H_snd_F"], round (250 + (random 70))],
	[" (DLC) Silencieux 5.56 mm Khaki", ["muzzle_snds_m_khk_F"], round (250 + (random 70))],
	[" (DLC) Silencieux 5.56 mm Sable", ["muzzle_snds_m_snd_F"], round (250 + (random 70))],
	[" (DLC) Silencieux Type 115 Hex verte", ["muzzle_snds_65_TI_ghex_F"], round (500 + (random 111))]
];

equipements_des_armes_SFP_Civils =
[
	[" Silencieux 9 MM", ["muzzle_snds_L"], round (20 + (random 22))],
	[" ACO Rouge", ["optic_Aco"], round (50 + (random 22))],
	[" ACO Vert", ["optic_ACO_grn"], round (50 + (random 22))],
	[" Lumière Arme", ["acc_flashlight"], round (12 + (random 11))],
	[" Laser Nocturne", ["acc_pointer_IR"], round (22 + (random 20))]
];

equipements_des_armes_SFP_Civils_Illegales =
[
	[" ACP 45 Silencieux", ["muzzle_snds_acp"], round (20 + (random 22))],
	[" Silencieux 5.56 MM", ["muzzle_snds_M"], round (20 + (random 22))],
	[" Viseur Holosight", ["optic_holosight"], round (50 + (random 22))],
	[" ACO Rouge", ["optic_Aco"], round (50 + (random 22))],
	[" ACO Vert", ["optic_ACO_grn"], round (50 + (random 22))],
	[" Lumière Arme", ["acc_flashlight"], round (10 + (random 10))],
	[" Laser Nocturne", ["acc_pointer_IR"], round (20 + (random 20))]
];

equipements_des_armes_SFP_Gendarmes =
[
	[" Lumière Surb", ["R3F_LAMPE_SURB"], round (5)],
	[" Lumière Arme", ["acc_flashlight"], round (3)],
	[" Laser Nocturne", ["acc_pointer_IR"], round (5)],	
	[" Viseur Aimpoint", ["R3F_AIMPOINT"], round (20)],
	[" Viseur Eotech", ["R3F_EOTECH"], round (20)],
	[" Viseur J4 (Lunette)", ["R3F_J4"], round (20)],
	[" Viseur NF (Lunette)", ["R3F_NF"], round (25)],
	[" Viseur Zeiss (Lunette)", ["R3F_ZEISS"], round (25)],
	[" Viseur OB50 (Lunette)", ["R3F_OB50"], round (25)],
	[" Silencieux 9 MM", ["muzzle_snds_L"], round (10)],
	[" Silencieux 5.56 MM", ["muzzle_snds_M"], round (11)],
	[" Silencieux 6.56 MM", ["muzzle_snds_H"], round (12)],
	[" Silencieux Famas", ["R3F_SILENCIEUX_FAMAS"], round (14)],
	[" Silencieux HK 416", ["R3F_SILENCIEUX_HK416"], round (15)],
	[" Silencieux HK 417", ["R3F_SILENCIEUX_HK417"], round (18)],
	[" ACP 45 Silencieux", ["muzzle_snds_acp"], round (20)],
	[" ACO Rouge", ["optic_Aco"], round (10)],
	[" ACO Vert", ["optic_ACO_grn"], round (10)],
	[" Viseur ARCO", ["optic_Arco"], round (15)],
	[" Viseur MRCO", ["optic_MRCO"], round (20)],
	[" Viseur RCO", ["optic_Hamr"], round (17)],
	[" Viseur Holosight", ["optic_holosight"], round (18)],
	[" NVS", ["optic_NVS"], round (350 + (random 100))]
];

equipements_des_armes_SFP_GIGN =
[
	[" Bipied HK 416/417", ["R3F_BIPIED_HK417"], round (5)],
	[" Lumière Surb", ["R3F_LAMPE_SURB"], round (5)],
	[" Lumière Arme", ["acc_flashlight"], round (3)],
	[" Laser Nocturne", ["acc_pointer_IR"], round (5)],
	[" Silencieux Famas", ["R3F_SILENCIEUX_FAMAS"], round (14)],
	[" Silencieux HK 416", ["R3F_SILENCIEUX_HK416"], round (15)],
	[" Silencieux FRF2", ["R3F_SILENCIEUX_FRF2"], round (500)],
	[" Silencieux HK 417", ["R3F_SILENCIEUX_HK417"], round (17)],
	[" Silencieux 9 MM", ["muzzle_snds_L"], round (10)],
	[" Silencieux 7.62 MM", ["muzzle_snds_B"], round (12)],
	[" Silencieux 6.56 MM", ["muzzle_snds_H"], round (11)],
	[" Silencieux 5.56 MM", ["muzzle_snds_M"], round (12)],
	[" ACP 45 Silencieux", ["muzzle_snds_acp"], round (20)],
	[" ACO Rouge", ["optic_Aco"], round (10)],
	[" ACO Vert", ["optic_ACO_grn"], round (10)],
	[" Viseur ARCO", ["optic_Arco"], round (15)],
	[" Viseur MRCO", ["optic_MRCO"], round (20)],
	[" Viseur RCO", ["optic_Hamr"], round (17)],
	[" Viseur Holosight", ["optic_holosight"], round (20)],
	[" Viseur Aimpoint", ["R3F_AIMPOINT"], round (20)],
	[" Viseur Eotech", ["R3F_EOTECH"], round (20)],
	[" Viseur J4 (Lunette)", ["R3F_J4"], round (20)],
	[" Viseur J8 (Lunette)", ["R3F_J8"], round (25)],
	[" Viseur J10 (Lunette)", ["R3F_J10"], round (30)],
	[" Viseur NF (Lunette)", ["R3F_NF"], round (25)],
	[" Viseur Zeiss (Lunette)", ["R3F_ZEISS"], round (25)],
	[" Viseur OB50 (Lunette)", ["R3F_OB50"], round (25)],
	[" Viseur SOS", ["optic_SOS"], round (75)],
	[" Viseur Felin (Lunette)", ["R3F_FELIN"], round (1300 + (random 600))],
	[" Night Stalker GIGN", ["optic_Nightstalker"], round (1200 + (random 400))],
	[" NVS", ["optic_NVS"], round (2900 + (random 400))],
	[" (DLC) AMS Noir", ["optic_AMS"], round (17 + (random 10))],
	[" (DLC) Arco Noir", ["optic_Arco_blk_F"], round (20 + (random 10))],
	[" (DLC) ERCO Noire", ["optic_ERCO_blk_F"], round (20 + (random 10))],
	[" (DLC) DMS", ["optic_DMS"], round (20 + (random 10))],
	[" (DLC) Holosight Noire", ["optic_Holosight_blk_F"], round (22 + (random 10))],
	[" (DLC) Khalia Noire", ["optic_KHS_blk"], round (24 + (random 10))],
	[" (DLC) LRPS", ["optic_LRPS"], round (25 + (random 10))],
	[" (DLC) Silencieux Type 115", ["muzzle_snds_65_TI_blk_F"], round (10 + (random 5))],
	[" (DLC) Silencieux 5.8 mm noir", ["muzzle_snds_58_blk_F"], round (10 + (random 5))]
];

