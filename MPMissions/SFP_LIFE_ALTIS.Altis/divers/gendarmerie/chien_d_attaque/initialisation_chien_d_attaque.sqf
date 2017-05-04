//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


// ============================================================ SECURITE ===================================================================
detection_proximite_max_chien_attaque = 5; // Mètres
detection_attaque_max_chien_attaque = 15; // Mètres
detection_arreter_attaque_max_chien_attaque = 300; // Mètres

// ======================================================= INITIALISATION VARIABLE ===============================================================
spawn_un_chien_d_attaque_by_sfp_maxou = ["Alsatian_Random_F","Alsatian_Sandblack_F","Alsatian_Black_F","Alsatian_Sand_F","Fin_random_F","Fin_tricolour_F","Fin_ocherwhite_F","Fin_blackwhite_F","Fin_sand_F"];
je_lance_l_attaque_de_mon_chien = 0;

condition_addaction_je_peux_attaquer_chien_d_attaque =
{
	_cond_deux = false;
	_condition_un = nearestObjects [player, spawn_un_chien_d_attaque_by_sfp_maxou, 4];
	{
		if (_x getVariable "appartenance_du_chien_by_sfp_maxou" == name player && _x getvariable 'je_peux_attaquer_chien_attaque_by_sfp_maxou' < 1) then 
		{
			_cond_deux = true;
		};
	} foreach _condition_un;
	_cond_deux
};

condition_addaction_le_chien_d_attaque =
{
	_cond_deux = false;
	_condition_un = nearestObjects [player, spawn_un_chien_d_attaque_by_sfp_maxou, 2];
	{
		if (_x getVariable "appartenance_du_chien_by_sfp_maxou" == name player) then 
		{
			_cond_deux = true;
		};
	} foreach _condition_un;
	_cond_deux
};

detecter_le_chien_d_attaque_sfp =
{
	private "_le_chien";
	_condition_un = nearestObjects [player, spawn_un_chien_d_attaque_by_sfp_maxou, detection_proximite_max_chien_attaque];
	{
		if (_x getVariable "appartenance_du_chien_by_sfp_maxou" == name player) then 
		{
			_le_chien = _x;
		};
	} foreach _condition_un;
	if (isnil "_le_chien") exitwith {hint "Pas de chien vous appartenant detecté ...";};
	_le_chien
};

condition_monter_voiture_chien_d_attaque_un =
{
	_cond_deux = false;
	_condition_un = nearestObjects [player, spawn_un_chien_d_attaque_by_sfp_maxou, detection_proximite_max_chien_attaque];
	{
		if (_x getVariable "appartenance_du_chien_by_sfp_maxou" == name player && _x getvariable "je_peux_attaquer_chien_attaque_by_sfp_maxou" < 1 && _x getvariable "chien_d_attaque_attache_voiture_by_sfp_maxou" < 1) then 
		{
			_cond_deux = true;
		};
	} foreach _condition_un;
	_cond_deux
};

condition_descendre_voiture_chien_d_attaque =
{
	_cond_un = false;
	_array = nearestObjects [player, spawn_un_chien_d_attaque_by_sfp_maxou, detection_proximite_max_chien_attaque];
	if (count _array >= 1) then
	{
		{
			if (_x getVariable "appartenance_du_chien_by_sfp_maxou" == name player && _x getvariable "je_peux_attaquer_chien_attaque_by_sfp_maxou" < 1 && _x getvariable "chien_d_attaque_attache_voiture_by_sfp_maxou" >= 1) then 
			{
				_cond_un = true;
			};
		} foreach _array;
	};
	_cond_un
};

chien_d_attaque_monter_voiture = 
{
	vehicule_autoriser_charger_chien = ["C_Offroad_Gendarmerie_SFP","C_Offroad_01_F"]; // Si différent règler SetPos
	_check_autour = nearestObjects [player, ["Car","Ship","Air"], detection_proximite_max_chien_attaque];
	_le_chien = [] call detecter_le_chien_d_attaque_sfp;

	if (_le_chien getvariable "appartenance_du_chien_by_sfp_maxou" != name player) exitwith {titletext [format ["\n\n\n\n\n Votre chien d'attaque %1 ne vous appartient pas !",name _le_chien],"PLAIN",1];};
	if (count _check_autour < 1) exitwith {titletext ["\n\n\n\n\n Action impossible puisqu'aucun véhicule vous appartenant n'à été détecté près de votre position !","PLAIN",1];};
	if (((_check_autour select 0) getvariable "vehicule_info_parvariable" select 0) != name player) exitwith {titletext ["\n\n\n\n\n Action impossible puisqu'aucun véhicule vous appartenant n'à été détecté près de votre position !","PLAIN",1];};
	if (locked (_check_autour select 0) == 2) exitwith {titletext ["\n\n\n\n\n Désolé, le véhicule est vérrouillé !","PLAIN",1];};
	if !(typeof (_check_autour select 0) in vehicule_autoriser_charger_chien) exitwith {titletext ["\n\n\n\n\n Action impossible puisque le véhicule n'est pas un pickup !","PLAIN",1];};
	
	titletext [format ["\n\n\n\n\n Votre chien d'attaque %1 est bien monté à l'arrière de votre véhicule !",name _le_chien],"PLAIN",1];
	_le_chien setvariable ["chien_d_attaque_attache_voiture_by_sfp_maxou",1,true];
	_le_chien attachTo [(_check_autour select 0),[0,-1.4,-0.5]];
	_le_chien stop false;
	// [_le_chien] joinSilent grpNull;
};

chien_d_attaque_descendre_voiture = 
{
	_array_deux = nearestObjects [player, spawn_un_chien_d_attaque_by_sfp_maxou, detection_proximite_max_chien_attaque];
	{
		if (_x getvariable "appartenance_du_chien_by_sfp_maxou" == name player && _x getvariable "chien_d_attaque_attache_voiture_by_sfp_maxou" >= 1) then
		{
			detach _x;
			_dir = getDir player;
			_x setPosATL [(getPosATL player select 0)+2*sin(_dir),(getPosATL player select 1)-2*cos(_dir),getPosATL player select 2];
			_x setvariable ["chien_d_attaque_attache_voiture_by_sfp_maxou",0,true];
			titletext [format ["\n\n\n\n\n Votre chien d'attaque %1 est bien descendu de votre véhicule !",name _x],"PLAIN",1];
		};
	} foreach _array_deux;
};

chien_d_attaque_rester_ici = 
{
	_le_chien = [] call detecter_le_chien_d_attaque_sfp;
	if (isnil "_le_chien") exitwith {titletext ["\n\n\n\n\n Votre chien d'attaque ne vous appartient pas !","PLAIN",1];};
	
	// [_le_chien] joinSilent grpNull;
	_le_chien stop true; 
	_le_chien setUnitPos "DOWN";
	_le_chien setvariable ["chien_d_attaque_pas_bouger_by_sfp_maxou",true,false];
	titletext [format ["\n\n\n\n\n Votre chien d'attaque %1 va rester ici sur place !",name _le_chien],"PLAIN",1];
	
	_position_de_base = getpos _le_chien;
	while {alive _le_chien && _le_chien getvariable "chien_d_attaque_pas_bouger_by_sfp_maxou"} do
	{
		if (getpos _le_chien distance _position_de_base > 1) then
		{
			_le_chien setpos _position_de_base;
		};
		
		sleep 0.3;
	};
};

chien_d_attaque_me_suivre = 
{
	_le_chien = [] call detecter_le_chien_d_attaque_sfp;
	if (isnil "_le_chien") exitwith {titletext ["\n\n\n\n\n Votre chien d'attaque ne vous appartient pas !","PLAIN",1];};
	
	_le_chien doMove (getPosATL player);
	_le_chien lookAt player;
	// [_le_chien] joinSilent player;
	_le_chien stop false; 
	_le_chien setUnitPos "AUTO";

	_le_chien setvariable ["chien_d_attaque_pas_bouger_by_sfp_maxou",false,false];
	titletext [format ["\n\n\n\n\n Votre chien d'attaque %1 va maintenant vous suivre !",name _le_chien],"PLAIN",1];

	while {alive _le_chien && !(_le_chien getvariable "chien_d_attaque_pas_bouger_by_sfp_maxou") && vehicle player == player} do
	{
		if (getpos _le_chien distance player > 3) then
		{
			waituntil {sleep 0.1; !alive _le_chien or speed (vehicle player) < 1};
			_le_chien attachTo [player,[0,-1,0]];
			detach _le_chien;
		};
		
		sleep 0.3;
	};
	if (vehicle player != player) exitwith {hint "Pour transporter votre chien, utilisez le menu pour.";};
};

condition_attaquer_chien_attaque =
{
	_cond_un = false;
	_array = nearestObjects [player, spawn_un_chien_d_attaque_by_sfp_maxou, detection_attaque_max_chien_attaque];
	if (count _array != 0) then
	{
		{
			if (_x getVariable "appartenance_du_chien_by_sfp_maxou" == name player && _x getvariable "je_peux_attaquer_chien_attaque_by_sfp_maxou" < 1) then 
			{
				_cond_un = true;
			};
		} foreach _array;
	};
	_cond_un
};

faire_attaquer_chien_attaque = 
{
	if !(cursorTarget iskindof "man") exitwith {titletext ["\n\n\n\n\n Votre chien d'attaque ne peut attaquer que les humains !","PLAIN",1];};

	_la_personne_a_attaquer = cursorTarget;
	_nom_du_gendarme = player;
	
	_detection_mon_chien = nearestObjects [player, spawn_un_chien_d_attaque_by_sfp_maxou, detection_attaque_max_chien_attaque];
	if (count _detection_mon_chien > 0) then
	{
		{
			if (_x getVariable "appartenance_du_chien_by_sfp_maxou" == name player) then 
			{
				chien_attaque_detecte = _x;
			};
		} foreach _detection_mon_chien
	};
	
	_mon_chien = chien_attaque_detecte;
	
	je_lance_l_attaque_de_mon_chien = 1;
	[_la_personne_a_attaquer,_mon_chien,_nom_du_gendarme] execvm "divers\gendarmerie\chien_d_attaque\faire_attaquer_chien_d_attaque.sqf";
	titletext [format ["\n\n\n\n\n Votre chien %1 va attaquer %2 !",name _la_personne_a_attaquer, name cursorTarget],"PLAIN",1];
};

arreter_attaquer_chien_attaque = 
{
	_detection_mon_chien_deux = nearestObjects [player, spawn_un_chien_d_attaque_by_sfp_maxou, detection_arreter_attaque_max_chien_attaque];
	if (count _detection_mon_chien_deux > 0) then
	{
		{
			if (_x getVariable "appartenance_du_chien_by_sfp_maxou" == name player) then 
			{
				je_lance_l_attaque_de_mon_chien = 0;
				
				sleep 1;
				
				_x switchmove "";
				// [_x] joinSilent player;
				_x stop false; 
				_x setUnitPos "AUTO";
				
				_x doMove (getPosATL player);
				_x lookAt player;
			};
		} foreach _detection_mon_chien_deux
	}else
	{
		titletext [format ["\n\n\n\n\n Votre chien n'a pas été détecté, est t'il à moins de %1 mètres de votre position ?",detection_arreter_attaque_max_chien_attaque],"PLAIN",1];
	};
};

// ======================================================= INITIALISATION ADDACTION ===============================================================
if (revive_mon_side == west) then
{
	menu_addaction_chien_attaque =
	{
		player addAction ["<t color=""#ED2744"">" + "Le Faire Rester Ici", chien_d_attaque_rester_ici, [], 11, false, false, "", "[] call condition_addaction_le_chien_d_attaque"];
		player addAction ["<t color=""#ED2744"">" + "Le Faire Me Suivre", chien_d_attaque_me_suivre, [], 11, false, false, "", "[] call condition_addaction_je_peux_attaquer_chien_d_attaque && [] call condition_addaction_le_chien_d_attaque"];
		player addAction ["<t color=""#ED2744"">" + "Monter Mon Chien Dans Ma Voiture", chien_d_attaque_monter_voiture, [], 11, false, false, "", "[] call condition_addaction_le_chien_d_attaque && vehicle player == player && [] call condition_monter_voiture_chien_d_attaque_un"];
		player addAction ["<t color=""#ED2744"">" + "Descendre Mon Chien De Ma Voiture", chien_d_attaque_descendre_voiture, [], 11, false, false, "", "vehicle player == player && [] call condition_descendre_voiture_chien_d_attaque"];
		player addAction ["<t color=""#ED2744"">" + "Attaquer Avec Mon Chien", faire_attaquer_chien_attaque, [], 11, false, false, "", "je_lance_l_attaque_de_mon_chien < 1 && cursorTarget iskindof 'man' && [] call condition_attaquer_chien_attaque"];
		player addAction ["<t color=""#ED2744"">" + "Arreter D'Attaquer Avec Mon Chien", arreter_attaquer_chien_attaque, [], 11, false, false, "", "je_lance_l_attaque_de_mon_chien >= 1"];
		
		player removeaction afficher_menu_chien_attaque;
	};
	
	afficher_menu_chien_attaque = player addAction ["<t color=""#ED2744"">" + "Menu Chien D'Attaque", menu_addaction_chien_attaque, [], 11, false, false, "", "[] call condition_addaction_le_chien_d_attaque"];
};

