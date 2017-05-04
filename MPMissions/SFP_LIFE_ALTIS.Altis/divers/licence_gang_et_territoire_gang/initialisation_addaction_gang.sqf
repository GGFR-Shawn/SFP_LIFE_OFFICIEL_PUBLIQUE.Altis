// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 2; isnil {player getvariable "besoin_d_un_revive_news"}};
// ----------------------------------------------- Ceinture c4 gang ------------------------------------------------------------- //

sleep 0.02;
player addaction ["<t color=""#ff0000"">" + "Faire peter le c4 !!!!", "divers\licence_gang_et_territoire_gang\licence_gang\divers\faire_peter_le_c4.sqf", [], 5, false, true, "", 
"vest player == 'SFP_Vest_Suicide'"
];
sleep 0.02;

// ----------------------------------------------- Sacoche C4 ------------------------------------------------------------- //
addaction_sacoche_de_c4 =
{
	emplacement_des_sacoches_c4 = [];
	sacoche_de_c4_trouve = nil;
	{
		if (!isnil {_x getvariable "proprietaire_sacoche_c4"}) then
		{
			if (_x getvariable "proprietaire_sacoche_c4" == name player) then
			{
				sacoche_de_c4_trouve = true;
				emplacement_des_sacoches_c4 pushback [_x];
			};
		};
		sleep 0.01;
	} forEach allMissionObjects "Land_Suitcase_F";
};
[] call addaction_sacoche_de_c4;

detection_valise_de_c4 =
{
	_cond = false;
	{
		if (!isnil {_x getvariable "proprietaire_sacoche_c4"} && alive player && isnil "sacoche_c4_en_cours_d_accroche") then 
		{
			_cond = true;
		};
	} foreach (nearestObjects [getPosATL player, ["Land_Suitcase_F"], 2]);
	_cond
};


menu_addaction_sacoche_c4 =
{
	player removeaction menu_addaction_deroule_sacoche_c4;
	
	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Poser Sacoche C4", "divers\licence_gang_et_territoire_gang\licence_gang\divers\sacoche_c4\poser_sacoche_c4.sqf", [], 1, false, true, "", 
	'isnil "sacoche_c4_en_cours_d_accroche" && player getVariable "sacoche_de_c4" >= 1 && alive player'
	];
	sleep 0.02;

	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Donner Sacoche C4", "divers\licence_gang_et_territoire_gang\licence_gang\divers\sacoche_c4\donner_sacoche_c4.sqf", [], 1, false, true, "", 
	'isnil "sacoche_c4_en_cours_d_accroche" && player getVariable "sacoche_de_c4" >= 1 && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 8'
	];
	sleep 0.02;

	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Faire Peter La Sacoche C4", "divers\licence_gang_et_territoire_gang\licence_gang\divers\sacoche_c4\faire_peter_la_sacoche_c4.sqf", [0], 1, false, true, "", 
	'isnil "sacoche_c4_en_cours_d_accroche" && !isnil "sacoche_de_c4_trouve" && alive player'
	];
	sleep 0.02;

	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Déplacer Sacoche C4", "divers\licence_gang_et_territoire_gang\licence_gang\divers\sacoche_c4\deplacer_la_sacoche_c4.sqf", [0], 1, false, true, "", 
	'[] call detection_valise_de_c4'
	];
	sleep 0.02;

	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Récupérer La Sacoche C4", "divers\licence_gang_et_territoire_gang\licence_gang\divers\sacoche_c4\recuperer_la_sacoche_c4.sqf", [0], 1, false, true, "", 
	'[] call detection_valise_de_c4'
	];
	sleep 0.02;

	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Détruire Sacoche C4", "divers\licence_gang_et_territoire_gang\licence_gang\divers\sacoche_c4\detruire_la_sacoche_c4.sqf", [0], 1, false, true, "", 
	'[] call detection_valise_de_c4'
	];
	sleep 0.02;
};

menu_addaction_deroule_sacoche_c4 =	player addaction ["<t color=""#ff0000"">" + "MENU CEINTURE C4", menu_addaction_sacoche_c4, [0], 1, false, true, "", '[] call detection_valise_de_c4 or player getVariable "sacoche_de_c4" >= 1'];


