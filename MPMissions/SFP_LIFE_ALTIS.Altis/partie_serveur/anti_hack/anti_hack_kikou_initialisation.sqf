//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

"DIAG SFP : Anti Hack : Initialisation démarré." spawn historique_creation_log_sfp;

blacklist_variable_hackeur = 
									[
										"E_X_T_A_S_Y_Pro_RE","E_X_T_A_S_Y_List","E_X_T_A_S_Y_ANTI_ANTI_HAX","BIS_fnc_LOVEGOLDEN3Credits_n",
										"JxMxE_hide","JME_Keybinds","JME_has_yet_to_fuck_this_shit","JME_deleteC","JME_Tele","JME_ANAL_PLOW","JME_M_E_N_U_initMenu","JME_M_E_N_U_hax_toggled","W_O_O_K_I_E_FUD_Pro_RE","W_O_O_K_I_E_FUD_Car_RE","W_O_O_K_I_E_FUD_Car_RE",
										"JxMxE_Veh_M","JxMxE_LifeCash500k","W_O_O_K_I_E_FUD_FuckUp_GunStore","W_O_O_K_I_E_FUD_M_E_N_U_initMenu","W_O_O_K_I_E_FuckUp_GunStore_a","JME_KillCursor","JME_OPTIONS","JME_M_E_N_U_fill_TROLLmenu","ASSPLUNGE","FOXBYPASS","POLICE_IN_HELICOPTA",
										"JxMxE_EBRP","W_O_O_K_I_E_M_E_N_U_funcs_inited","Menu_Init_Lol","E_X_T_A_S_Y_Atm","W_O_O_K_I_E_Pro_RE","W_O_O_K_I_E_Debug_Mon","W_O_O_K_I_E_Debug_1337","Veh_S_P_A_W_N_Shitt","sfsefse","tw4etinitMenu","tw4etgetControl",
										"JxMxEsp","JxMxE_GOD","JxMxE_Heal","efr4243234","sdfwesrfwesf233","sdgff4535hfgvcxghn","adadawer24_1337","lkjhgfuyhgfd","E_X_T_A_S_Y_M_E_N_U_funcs_inited","dayz_serverObjectMonitor","fsfgdggdzgfd","fsdddInfectLOL","Wookie_List",
										"JxMxE_TP","Wookie_Pro_RE","Wookie_Car_RE","Wookie_Debug_Mon","faze_funcs_inited","advertising_banner_infiSTAR","atext_star_xa","Monky_hax_dbclick","qopfkqpofqk","debug_star_colorful","AntiAntiAntiAntiHax","antiantiantiantih4x",
										"JxMxE_Infect","hub","scrollinit","gfYJV","Lystic_LMAOOOOOOOOOOOOOOOOOOO","Lystic_Re","Lysto_Lyst","E_X_T_A_S_Y_Keybinds","Menulocations","Lystic_Init","scroll_m_init_star","exstr1","pathtoscrdir3","Monky_funcs_inited",
										"JxMxE_secret","Monky_initMenu","player_zombieCheck","E_X_T_A_S_Y_Recoil","godlol","playericons","abcdefGEH","wierdo","go_invisible_infiSTAR","serverObjectMonitor","enamearr","initarr3","locdb","sCode","infAmmoIndex",
										"nukeDONEstar","Wookie_List","Wookie_Pro_RE","FUCKTONIC","E_X_T_A_S_Y_FuckUp_GunStore_a","E_X_T_A_S_Y_Cash_1k_t","E_X_T_A_S_Y_Cash_a","E_X_T_A_S_Y_LicenseDrive","E_X_T_A_S_Y_Menu_LOOOOOOOOOL","Metallica_vehicleg0dv3_infiSTAR","JJJJ_MMMM___EEEEEEE_PLAYERLOL",
										"JJJJ_MMMM___EEEEEEE_LOL_FAGGOT",
										"JJJJ_MMMM___EEEEEEE_INIT_MENU","JJJJ_MMMM___EEEEEEE_GAPER","JJJJ_MMMM___EEEEEEE_SMOKExWEEDxEVERYDAY_BUM_RAPE","JJJJ_MMMM___EEEEEEE_OPTIONS","JJJJ_MMMM___EEEEEEE_M_E_N_U_fill_Target","E3p",
										"Jesus_MODE","ESP","MissileStrike","AL_Liscenses","NoIllegal","NoWeight","m0nkyaatp_sadksadxa","m0nkyaatp_RANDSTR","myvar23","player_adminlevel","TNK","I_like_turtles",
										"BIGM","Does_Tonic_Like_to_take_Turtle_penis_in_the_ass_LODESTARS","Does_Tonic_Like_to_take_Turtle_penis_in_the_ass_LODESTAR1","GMod","No_No_No_Tonic_likes_A_Big_Fat_Sheep_Cock_Right_in_the_bum_G0d_Mode",
										"Sload","T3le","life_no_injection","Tonic_has_a_gaping_vagina","my_anus_hurtz","aKFerm","aKMMenu","aKTitans","aKLikeaG0d","riasgremory_G0d_Mode","aKCarG0d","riasgremory_Car_Jesus","aKE5p","riasgremory_isseilol","aKPMark",
										"riasgremory_Noobs","riasgremory_Bitches","riasgremory_Map_Markers","aKUnMmo","jenesuispasuncheateur_unamo","aKVoit","Loljesaispasquoiecriremdr","isseigremory","gremorysama","aKTaCu","aKCardetroy","aKGetKey","aKKillcursor",
										"aKNoEscort","aKEscort","aKtroll","aKTPall","aKUnrestrain","aKNoEscortMe","aKNoTaze","aKJailplayer","aKLisense","riasgremory_titans_shit_reold","Tonic_merde","jaimepaslepoisin_HLEAL","TTTT_IIII___TTTTTTT_RAP_FR","TTTT_IIII___TTTTTTT_REPGA",
										"TTTT_IIII___TTTTTTT_REPGAs","jaimepaslepoisin_HLEAL","Root_Main4","Root_Pistol4","Root_Rifle4","Root_Machinegun4","Root_Sniper4","Root_Launcher4","Root_Attachement4",
										"OQrv8OYvXgQjIh2aFY5q_SecretAntihax","OQrv8OYvXgQjIh2aFY5q_Antifreeze","SOCK_fnc_dataQuery","life_coplevel","life_adminlevel","one_time_toggle"
									];
	
Menu_Valide_Hackeur =	    
									[
										"RscMainMenu","RscMoveHigh","#WATCH","#WATCH0","RscWatchDir","RscWatchMoveDir","#GETIN","#RscStatus","RscCallSupport","#ACTION",
										"RscCombatMode","RscFormations","RscTeam","RscSelectTeam","RscReply","#User:BIS_Menu_GroupCommunication","#CUSTOM_RADIO",
										"RscRadio","RscGroupRootMenu","RscMenuReply","RscMenuStatus","#User:BIS_fnc_addCommMenuItem_menu","RscMenuMove","RscMenuFormations",
										"RscMenuEngage","#GET_IN","RscMenuCombatMode","#WATCH","RscMenuSelectTeam","RscMenuTeam"
									];

boutton_de_dialogue_autorise = 
									[
										"Title","MissionTitle","PlayersName","ButtonCancel","ButtonSAVE","ButtonSkip","ButtonRespawn",
										"ButtonOptions","ButtonVideo","ButtonAudio","ButtonControls","ButtonGame",
										"ButtonTutorialHints","ButtonAbort","DebugConsole","Version","TraffLight",
										"Feedback","MessageBox","CBA_Credits_Cont_C","cba_help_credits"
									];

autorisation_bis_fnc_mp = 	
									[
										"BIS_fnc_execVM","BIS_fnc_spawn","SFP_creuver_pneu",
										"SFP_Endommager_Pneus_Nid_De_Poules","avertit_demande_secours_revive",
										"avertit_joueur_demandant_secours","NMD_fnc_hideBody","NMD_fnc_setEnvironment",
										"NMD_fnc_titleHint","NMD_fnc_enableSimulation","NMD_fnc_setPos",
										"bis_fnc_curatorrespawn","SUPER_fnc_CheckForEffect","bis_fnc_objectVar",
										"BIS_fnc_loadInventory"
									];
									
publicvariable "blacklist_variable_hackeur";
publicvariable "Menu_Valide_Hackeur";
publicvariable "boutton_de_dialogue_autorise";
publicvariable "autorisation_bis_fnc_mp";

"DIAG SFP : AntiHack : Initialisation Terminée." spawn historique_creation_log_sfp;
