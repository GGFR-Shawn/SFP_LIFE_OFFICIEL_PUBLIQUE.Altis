// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 2; isnil {player getvariable "besoin_d_un_revive_news"}};

// ----------------------------------------------- Coffre Fort ----------------------------------------------------------------------- //
sleep 0.02;
deplacer_le_coffre_fort = 
{
	if (cursortarget getvariable 'proprietaire_du_coffre' != name player) exitwith {hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Désolé, ce n'est pas ton coffre fort ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
	_le_coffre = cursortarget; 
	_le_coffre attachTo [player, [0, 1.1, 0.092]];
	detacher_coffre = 1; 
	waituntil {sleep 0.045; detacher_coffre == 0 or !alive player}; 
	detach _le_coffre; 
	sleep 1; 
	if (!alive player) exitwith {deletevehicle _le_coffre;};
	re_scanner_le_coffre_fort = _le_coffre;
	publicvariable "re_scanner_le_coffre_fort";

};

detacher_le_coffre = 
{
	_verif_maison = nearestObjects [getPosATL player, ["house"], 6];
	la_maison = _verif_maison select 0;		
	if (isnil "la_maison") exitwith {hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Désolé, tu dois être dans ta maison pour poser le coffre fort ! \n\n Attention, n'essai pas de tricher en te donnant la mort pour déposer le coffre hors de ta maison ou celui ci sera supprimé ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
	if (isnil {la_maison getvariable "proprietaire_de_la_maison"}) exitwith {hint "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Désolé, tu dois être dans ta maison pour poser le coffre fort ! \n\n Attention, n'essai pas de tricher en te donnant la mort pour déposer le coffre hors de ta maison ou celui ci sera supprimé ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
	if (la_maison getvariable "proprietaire_de_la_maison" select 0 != name player) exitwith {hint format[ "! ACHAT DE MAISON ! \n -------------------------------------------- \n \n Désolé, tu n'es pas dans ta maison mais celle de %1 ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",la_maison getvariable "proprietaire_de_la_maison" select 0];};
	detacher_coffre = 0;
};

redefinir_mot_de_passe = 
{
	_le_coffre = cursorTarget;
	createdialog "CoffreFortDefinirMotDePasse";
	noesckeydeux = (findDisplay 4844) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"];
	ctrlSetText[11115,format["Propriétaire : %1",(cursortarget getVariable "proprietaire_du_coffre")]];
	waituntil {sleep 0.045; !dialog};
	re_scanner_le_coffre_fort = _le_coffre;
	publicvariable "re_scanner_le_coffre_fort";
};

menu_deroulant_coffre_fort =
{
	player removeAction addaction_menu_coffre_fort;
	
	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Changer le mot de passe", redefinir_mot_de_passe, [], 8, false, true, "", 
	"(cursortarget getvariable 'proprietaire_du_coffre') == name player && alive cursorTarget && cursorTarget distance player < 8"
	];
	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Déplacer coffre fort", deplacer_le_coffre_fort, [], 8, false, true, "", 
	'detacher_coffre < 1 && !isnil {cursortarget getvariable "proprietaire_du_coffre"} && alive cursorTarget && cursorTarget distance player < 8'
	];
	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Détacher le coffre", detacher_le_coffre, [], 8, false, true, "", 
	'detacher_coffre >= 1'
	];
	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Inventaire Coffre Fort", "divers\inventaire_des_vehicules\nouveau_inventaire_farming\menu_nouveau_farming.sqf", [], 8, false, true, "", 
	'!isnil {cursortarget getvariable "proprietaire_du_coffre"} && cursorTarget distance player < 8'
	];
};

addaction_menu_coffre_fort = player addaction ["<t color=""#ff0000"">" + "Ouvrir Menu Coffre Fort", menu_deroulant_coffre_fort, [], 8, false, true, "", 
'!isnil {cursortarget getvariable "proprietaire_du_coffre"} && cursorTarget distance player < 8'
];

detacher_coffre = 0;


// ----------------------------------------------- Valise ----------------------------------------------------------------------- //
if (revive_mon_side == west) then
{
	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Inventaire Valise", "divers\inventaire_des_vehicules\nouveau_inventaire_farming\menu_nouveau_farming.sqf", [], 8, false, true, "", 
	"cursortarget iskindof 'Land_Suitcase_F' && cursortarget getvariable 'valise_de_farming' >= 1 && cursortarget getvariable 'valise_prise' < 1 && cursorTarget distance player < 2"
	];

	supprimer_la_valise = {deletevehicle cursortarget;};
	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Supprimer La Valise", supprimer_la_valise, [], 8, false, true, "", 
	"cursortarget iskindof 'Land_Suitcase_F' && cursortarget getvariable 'valise_de_farming' >= 1 && cursortarget getvariable 'valise_prise' < 1 && cursorTarget distance player < 2"
	];
};

if (revive_mon_side == civilian) then
{
	jai_prit_la_valise = 0;
	
	menu_deroulant_valise_farming =
	{
		player removeAction addaction_menu_valise_de_farming;
		
		sleep 0.02;
		player addaction ["<t color=""#ff0000"">" + "Prendre la valise de farming", "divers\achat_divers_supermarche\utiliser_et_donner_les_achats\valise\prendre_la_valise.sqf", [], 8, false, true, "", 
		"jai_prit_la_valise < 1 && cursortarget getvariable 'valise_de_farming' >= 1 && cursortarget getvariable 'valise_prise' < 1 && cursorTarget distance player < 2"
		];
		
		sleep 0.02;
		player addaction ["<t color=""#ff0000"">" + "Inventaire Valise", "divers\inventaire_des_vehicules\nouveau_inventaire_farming\menu_nouveau_farming.sqf", [], 8, false, true, "", 
		"jai_prit_la_valise < 1 && cursortarget getvariable 'valise_de_farming' >= 1 && cursortarget getvariable 'valise_prise' < 1 && cursorTarget distance player < 2"
		];
		
		sleep 0.02;
		player addaction ["<t color=""#ff0000"">" + "Déposer la valise", "divers\achat_divers_supermarche\utiliser_et_donner_les_achats\valise\deposer_la_valise.sqf", [], 8, false, true, "", 
		"jai_prit_la_valise >= 1"
		];
		
		sleep 0.02;
		player addaction ["<t color=""#ff0000"">" + "Déposer la valise apres achat", {hint "Utilise le menu Y et poser objets."}, [], 8, false, true, "", 
		"player getvariable 'valise_pour_le_farming' >= 1"
		];
	};
	sleep 0.02;
	addaction_menu_valise_de_farming = player addaction ["<t color=""#ff0000"">" + "Afficher Menu Valise De Farming", menu_deroulant_valise_farming, [], 8, false, true, "", 
	"(player getvariable 'valise_pour_le_farming' >= 1) or (!isnil {cursortarget getvariable 'valise_de_farming'})"
	];
};

// ----------------------------------------------- poignard_item ------------------------------------------------------------- //
sleep 0.02;
player addaction ["<t color=""#ff0000"">" + "Donner Un Coup De Poignard", "divers\donner_un_coup_de_poignard\coup_de_poignard.sqf", [], 1, false, true, "", 
'player getVariable "poignard_item" >= 1 && player distance cursorTarget < 5 && (isPlayer cursorTarget)'
];
sleep 0.02;


// ----------------------------------------------- cocktail_molotov ------------------------------------------------------------- //
action_jeter_cocktail_molotov = 
{
	titletext ["\n\n Patiente, il va bientot être jeté ;)","PLAIN DOWN",1];
	player setVariable ['cocktail_molotov', (player getVariable "cocktail_molotov") - 1,true];
	player setVariable["usedspace",(player getVariable "usedspace") - 2,true];
	_object = createVehicle ["Land_BottlePlastic_V2_F", getPosATL player, [], 0, "CAN_COLLIDE"];
	_object attachto [player,[0,-0.1,0.1],"righthand"];
	_object setVectorDirAndUp [[1,0.5,-2],[-0.5,-0.7,0]];
	[[[_object, player],"divers\achat_divers_supermarche\utiliser_et_donner_les_achats\cocktail_molotov\effet_feu_cocktail_molotov.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	sleep 2;
	[[[player,"AwopPercMstpSgthWrflDnon_End2"],"divers\taper_un_joueur\tapersynchronisation.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	detach _object;
	_jeter_un = round (8);
	_jeter_deux = round (8);
	_jeter_trois = round (7);
	_object setVelocity [(sin getdir player * _jeter_un),(cos getdir player * _jeter_deux),_jeter_trois];
};

sleep 0.02;
player addaction ["<t color=""#ff0000"">" + "Jeter Un Cocktail Molotov", action_jeter_cocktail_molotov, [], 1, false, true, "", 
'player getVariable "cocktail_molotov" >= 1'
];
sleep 0.02;

// ----------------------------------------------- Bombe porte de prison ------------------------------------------------------------- //
detection_porte_prison =
{
	_cond = false;
	_les_portes_de_prison_detection = nearestObjects [getPosATL player, ["Prison_Australian_SFP"], 6];
	if (count _les_portes_de_prison_detection > 0) then
	{
		if (!isnil {player getvariable "bombe_porte_prison"}) then 
		{
			_cond = true;
		};
	};
	_cond
};

sleep 0.02;
player addaction ["<t color=""#ff0000"">" + "Faire Sauter La Porte", "divers\gendarmerie\prison\porte_prison\explosion_porte_prison.sqf", [], 12, true, true, "", 
'[] call detection_porte_prison'
];
sleep 0.02;

// ----------------------------------------------- Corde Et Sac ------------------------------------------------------------- //
j_ai_attacher_a_moi_avec_la_corde = 0;

attacher_le_joueur_a_moi_corde = 
{
	_le_joueur_a_attacher = cursorTarget;
	
	_le_joueur_a_attacher attachTo [player,[0.25,1.5,0]];
	j_ai_attacher_a_moi_avec_la_corde = 1;
	waituntil {j_ai_attacher_a_moi_avec_la_corde < 1 or !alive player};
	detach _le_joueur_a_attacher;
	j_ai_attacher_a_moi_avec_la_corde = 0;
};
detacher_le_joueur_a_moi_corde = 
{
	j_ai_attacher_a_moi_avec_la_corde = 0;
};
charger_joueur_vehicule_corde =
{
	_le_joueur_corde_a_charger = cursorTarget;
	if (!(_le_joueur_corde_a_charger isKindOf "man") or isnil "_le_joueur_corde_a_charger") exitwith {hint "Erreur, recommence !";};
	
	hint "Pour charger ce joueur, il te suffit de pointer ta souris vers ton véhicule.";
	waituntil {sleep 0.2; ((name player) in (cursorTarget getvariable "vehicule_info_parvariable")) or !alive player};
	
	_type_vehicule = typeof cursorTarget;
	_le_vehicule = cursorTarget;
	
	if (_type_vehicule == "B_MRAP_01_F") then {_le_vehicule animateDoor ["Door_LB", 1]; sleep 1;};
	if (_type_vehicule == "O_MRAP_02_F") then {_le_vehicule animateDoor ["Door_LM", 1]; sleep 1;};

	_le_joueur_corde_a_charger action ["getInCargo", vehicle _le_vehicule];
	
	if (_type_vehicule == "B_MRAP_01_F") then {sleep 2; _le_vehicule animateDoor ["Door_LB", 0];};
	if (_type_vehicule == "O_MRAP_02_F") then {sleep 2; _le_vehicule animateDoor ["Door_LM", 0];};
};
detection_decharger_joueur_vehicule_corde =
{
	_cond = false;
	_le_joueur_sac_sur_la_tete = nearestObjects [player, ["Air","LandVehicle"], 5];
	if (count _le_joueur_sac_sur_la_tete != 0) then
	{
		{
			if (!isnil {_x getvariable "jai_un_sac_sur_la_tete"}) then {_cond = true;};
		} foreach (crew (_le_joueur_sac_sur_la_tete select 0));
	};
	_cond
};
decharger_joueur_vehicule_corde =
{
	{
		if (!isnil {_x getvariable "jai_un_sac_sur_la_tete"}) then
		{
			[[[_x,"3"],"divers\vehiclelock\ejecter_civil_synchro.sqf"],"BIS_fnc_execVM",_x,false] spawn BIS_fnc_MP;
		};
	} foreach (crew cursorTarget);
};

menu_sac_et_corde_sur_la_tete =
{
	player removeAction menu_deroulant_sac_et_corde;
	
	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Enlever La Corde Et Sac Au Joueur", "divers\achat_divers_supermarche\utiliser_et_donner_les_achats\corde_et_sac_supermarche\utiliser_la_corde_et_le_sac\action_enlever_la_corde_et_le_sac.sqf", [], 12, false, true, "", 
	'(isPlayer cursorTarget) && player distance cursorTarget < 5 && !isnil {cursorTarget getvariable "jai_un_sac_sur_la_tete"}'
	];
	sleep 0.02;

	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Attacher Le Joueur", attacher_le_joueur_a_moi_corde, [], 12, false, true, "", 
	'j_ai_attacher_a_moi_avec_la_corde < 1 && (isPlayer cursorTarget) && player distance cursorTarget < 5 && !isnil {cursorTarget getvariable "jai_un_sac_sur_la_tete"}'
	];
	sleep 0.02;

	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Detacher Le Joueur", detacher_le_joueur_a_moi_corde, [], 12, false, true, "", 
	'j_ai_attacher_a_moi_avec_la_corde >= 1'
	];
	sleep 0.02;

	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Charger Le Joueur Dans Un Véhicule", charger_joueur_vehicule_corde, [], 12, false, true, "", 
	'!isnil {cursorTarget getvariable "jai_un_sac_sur_la_tete"} && alive cursorTarget && player distance cursorTarget < 6'
	];
	sleep 0.02;

	sleep 0.02;
	player addaction ["<t color=""#ff0000"">" + "Décharger Le Joueur Avec Un Sac Sur La Tete", decharger_joueur_vehicule_corde, [], 12, false, true, "", 
	'[] call detection_decharger_joueur_vehicule_corde'
	];
	sleep 0.02;
};

sleep 0.02;
menu_deroulant_sac_et_corde = player addaction ["<t color=""#ff0000"">" + "Menu Sac Et Corde", menu_sac_et_corde_sur_la_tete, [], 12, false, true, "", 
'(player getvariable "corde_et_sac" >= 1 or !isnil {cursorTarget getvariable "jai_un_sac_sur_la_tete"}) && (isPlayer cursorTarget) && player distance cursorTarget < 5'
];
sleep 0.02;

