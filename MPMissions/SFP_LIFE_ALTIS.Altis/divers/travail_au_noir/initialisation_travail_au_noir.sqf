// =======================================================================================================================================================================================
								// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
								  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// ============================================================ SECURITE ===================================================================
if (!sfp_config_activer_travailleur_au_noir) exitwith {deletemarkerlocal "travailleur_illegal";};
detection_proximite_max_travailleur_illegal = 4; // Mètres


// ======================================================= INITIALISATION VARIABLE ===============================================================
condition_descendre_voiture =
{
	_cond_un = false;
	_array = nearestObjects [player, ["Air","LandVehicle"], detection_proximite_max_travailleur_illegal];
	if (count _array != 0) then
	{
		{
			if (_x getVariable "appartenance_du_bot" == name player) then 
			{
				_cond_un = true;
			};
		} foreach crew (_array select 0);
	};
	_cond_un
};

condition_monter_voiture =
{
	_cond_deux = false;
	_condition_un = nearestObjects [player, ["man"], detection_proximite_max_travailleur_illegal];
	{
		if (_x getVariable "appartenance_du_bot" == name player && _x getvariable "je_peux_travailler" < 1) then 
		{
			_cond_deux = true;
		};
	} foreach _condition_un;
	_cond_deux
};

pnj_rester_ici = 
{
	if (cursorTarget getvariable "appartenance_du_bot" != name player) exitwith {titletext [format ["\n\n\n\n\n Le travailleur %1 ne vous appartient pas !",name cursorTarget],"PLAIN",1];};
	
	[cursortarget] joinSilent grpNull;
	cursortarget stop true; 
	cursortarget setUnitPos "Middle";
	titletext [format ["\n\n\n\n\n Le travailleur %1 va rester ici sur place !",name cursorTarget],"PLAIN",1];
};

pnj_me_suivre = 
{
	if (cursorTarget getvariable "appartenance_du_bot" != name player) exitwith {titletext [format ["\n\n\n\n\n Le travailleur %1 ne vous appartient pas !",name cursorTarget],"PLAIN",1];};
	
	cursorTarget switchmove "";
	[cursortarget] joinSilent player;
	cursortarget stop false; 
	cursortarget setUnitPos "AUTO";
	titletext [format ["\n\n\n\n\n Le travailleur %1 va maintenant vous suivre !",name cursorTarget],"PLAIN",1];
};

pnj_monter_voiture = 
{
	if (cursorTarget getvariable "appartenance_du_bot" != name player) exitwith {titletext [format ["\n\n\n\n\n Le travailleur %1 ne vous appartient pas !",name cursorTarget],"PLAIN",1];};

	_check_autour = nearestObjects [player, ["Car","Ship","Air"], detection_proximite_max_travailleur_illegal];
	if (count _check_autour < 1) exitwith {titletext ["\n\n\n\n\n Action impossible puisqu'aucun véhicule vous appartenant n'à été détecté près de votre position !","PLAIN",1];};
	// if (((_check_autour select 0) getvariable "vehicule_info_parvariable" select 0) != name player) exitwith {titletext ["\n\n\n\n\n Action impossible puisqu'aucun véhicule vous appartenant n'à été détecté près de votre position !","PLAIN",1];};
	if (locked (_check_autour select 0) == 2) exitwith {titletext ["\n\n\n\n\n Désolé, le véhicule est vérrouillé !","PLAIN",1];};
	
	cursortarget action ["getInCargo", _check_autour select 0];
	titletext [format ["\n\n\n\n\n Le travailleur %1 est bien monté dans votre véhicule !",name cursorTarget],"PLAIN",1];
};

pnj_descendre_voiture = 
{
	{
		if (_x getvariable "appartenance_du_bot" == name player) then
		{
			_x action ["eject", vehicle _x]; 
			unassignVehicle _x;
			[_x] joinSilent player;
			_x stop false; 
		}else
		{
			titletext [format ["\n\n\n\n\n Le travailleur %1 ne vous appartient pas !",name cursorTarget],"PLAIN",1];
		};
	} foreach crew cursorTarget;
};

faire_travailleur_le_travailleur = 
{
	if (cursorTarget getvariable "appartenance_du_bot" != name player) exitwith {titletext [format ["\n\n\n\n\n Le travailleur %1 ne vous appartient pas !",name cursorTarget],"PLAIN",1];};
	if (isnil "j_autorise_le_travailleur_a_travailler") then {j_autorise_le_travailleur_a_travailler = 0;};
	if (j_autorise_le_travailleur_a_travailler >= 1) exitwith {titletext ["\n\n\n\n\n Patiente, tu viens déja de faire cette action !","PLAIN",1];};
	if (cursorTarget getvariable "je_peux_travailler" >= 1) exitwith {titletext ["\n\n\n\n\n Desolé, le travailleur travail déjà !","PLAIN",1];};
	if (player distance (getmarkerpos "travailleur_illegal") < 1500) exitwith {titletext ["\n\n\n\n\n Desolé, éloigne toi un minimum d'ici ...","PLAIN",1];};
	
	_protection_maison = ((nearestObjects [player, ["house"], detection_proximite_max_travailleur_illegal]) select 0);
	if (isnil "_protection_maison") exitwith {titletext ["\n\n\n\n\n Desolé, vous n'êtes pas dans une maison !","PLAIN",1];};

	_le_travailleur = cursorTarget;
	
	titletext [format ["\n\n\n\n\n Le travailleur %1 va commencer à travailler !",name _le_travailleur],"PLAIN",1];
	j_autorise_le_travailleur_a_travailler = 1;
	_le_travailleur setvariable ["je_peux_travailler",1,true];
	[_le_travailleur] execvm "divers\travail_au_noir\faire_travailler_le_travailleur.sqf";
	[_le_travailleur] execvm "divers\travail_au_noir\animation_travailleur.sqf";
	sleep 7;
	j_autorise_le_travailleur_a_travailler = nil;
};

arreter_faire_travailleur_le_travailleur = 
{
	if (cursorTarget getvariable "appartenance_du_bot" != name player) exitwith {titletext [format ["\n\n\n\n\n Le travailleur %1 ne vous appartient pas !",name cursorTarget],"PLAIN",1];};
	if (isnil "j_autorise_le_travailleur_a_travailler") then {j_autorise_le_travailleur_a_travailler = 0;};
	if (j_autorise_le_travailleur_a_travailler >= 1) exitwith {titletext ["\n\n\n\n\n Patiente, tu viens déja de faire cette action !","PLAIN",1];};
	if (cursorTarget getvariable "je_peux_travailler" < 1) exitwith {titletext ["\n\n\n\n\n Desolé, le travailleur ne travail pas !","PLAIN",1];};
	
	_le_travailleur = cursorTarget;
	
	titletext [format ["\n\n\n\n\n Le travailleur %1 va arreter de travailler !",name cursorTarget],"PLAIN",1];
	j_autorise_le_travailleur_a_travailler = 1;
	_le_travailleur setvariable ["je_peux_travailler",0,true];
	sleep 7;
	j_autorise_le_travailleur_a_travailler = nil;
};

rapprocher_le_travailleur =
{
	if (cursorTarget getvariable "appartenance_du_bot" != name player) exitwith {titletext [format ["\n\n\n\n\n Le travailleur %1 ne vous appartient pas !",name cursorTarget],"PLAIN",1];};

	_dir = getDir player;
	_target = cursorTarget;
	_target setPosATL [(getPosATL player select 0)+1*sin(_dir),(getPosATL player select 1)+1*cos(_dir),getPosATL player select 2];
	
	[_target] joinSilent grpNull;
	_target stop true; 
	_target setUnitPos "Middle";
};

chercher_nom_travailleur_au_noir_sfp_maxou =
{
	_recompense_argent_travailleur_trouve = (5000 + (random 30000));
	hint format ["! TRAVAIL AU NOIR ! \n -------------------------------------------- \n\n Félicitation %1, tu viens de trouver un travailleur au noir embauché par %2 ! \n\n Pour cette trouvaille, tu viens de remporté : \n\n %3 Euros ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr",name player, cursorTarget getvariable "appartenance_du_bot", _recompense_argent_travailleur_trouve];
	player globalchat format ["Travailleur au noir embauché par %1 ! Argent remporté %2 Euros !",cursortarget getvariable "appartenance_du_bot", _recompense_argent_travailleur_trouve];
	player setvariable ["mon_argent_poche_by_sfp_maxou",(player getvariable "mon_argent_poche_by_sfp_maxou") + _recompense_argent_travailleur_trouve,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	deletevehicle cursorTarget;
};

addaction_travail_au_noir_initialisation_sfp_maxou =
{
	if (revive_mon_side == civilian) then
	{
		menu_des_travailleurs_au_noir =
		{
			player removeaction menu_addaction_travail_au_noir;
			
			player addAction ["<t color=""#ED2744"">" + "Le Rapprocher De Moi", rapprocher_le_travailleur, [], 11, false, false, "", "cursorTarget getvariable 'je_peux_travailler' < 1 && cursortarget getvariable 'appartenance_du_bot' == name player && !(stopped cursorTarget) && player distance cursortarget > detection_proximite_max_travailleur_illegal && player distance cursorTarget < 20"];
			player addAction ["<t color=""#ED2744"">" + "Le Faire Travailler", faire_travailleur_le_travailleur, [], 11, false, false, "", "cursorTarget getvariable 'je_peux_travailler' < 1 && !isnil {cursortarget getvariable 'appartenance_du_bot'} && (stopped cursorTarget) && player distance cursortarget < detection_proximite_max_travailleur_illegal"];
			player addAction ["<t color=""#ED2744"">" + "Le Faire Arreter De Travailler", arreter_faire_travailleur_le_travailleur, [], 11, false, false, "", "cursorTarget getvariable 'je_peux_travailler' >= 1 && !isnil {cursortarget getvariable 'appartenance_du_bot'} && (stopped cursorTarget) && player distance cursortarget < detection_proximite_max_travailleur_illegal"];
			player addAction ["<t color=""#ED2744"">" + "Le Faire Rester Ici", pnj_rester_ici, [], 11, false, false, "", "!isnil {cursortarget getvariable 'appartenance_du_bot'} && !(stopped cursorTarget) && player distance cursortarget < detection_proximite_max_travailleur_illegal"];
			player addAction ["<t color=""#ED2744"">" + "Le Faire Me Suivre", pnj_me_suivre, [], 11, false, false, "", "cursorTarget getvariable 'je_peux_travailler' < 1 && !isnil {cursortarget getvariable 'appartenance_du_bot'} && stopped cursorTarget && player distance cursortarget < detection_proximite_max_travailleur_illegal"];
			player addAction ["<t color=""#ED2744"">" + "Le Faire Monter Dans Ma Voiture", pnj_monter_voiture, [], 11, false, false, "", "!isnil {cursortarget getvariable 'appartenance_du_bot'} && [] call condition_monter_voiture"];
			player addAction ["<t color=""#ED2744"">" + "Le Faire Descendre De Ma Voiture", pnj_descendre_voiture, [], 11, false, false, "", "vehicle player == player && [] call condition_descendre_voiture"];
		};
		
		menu_addaction_travail_au_noir = player addAction ["<t color=""#ED2744"">" + "Menu Des Travailleurs Au Noir", menu_des_travailleurs_au_noir, [], 11, false, false, "", "cursorTarget getvariable 'je_peux_travailler' < 1 && cursortarget getvariable 'appartenance_du_bot' == name player && player distance cursorTarget < 20"];
	};

	if (revive_mon_side == west) then
	{
		player addAction ["<t color=""#ED2744"">" + "Chercher Nom Travailleur Au Noir", chercher_nom_travailleur_au_noir_sfp_maxou, [], 11, false, false, "", "!isnil {cursortarget getvariable 'appartenance_du_bot'} && player distance cursortarget < detection_proximite_max_travailleur_illegal"];
	};
};

