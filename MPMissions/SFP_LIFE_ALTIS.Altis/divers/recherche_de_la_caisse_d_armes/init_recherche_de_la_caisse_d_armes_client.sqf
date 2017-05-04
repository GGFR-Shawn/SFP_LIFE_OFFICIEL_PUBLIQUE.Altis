// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!hasInterface) exitwith {};
waitUntil {alive player};
if (isnil "caisse_d_armes_en_cours_de_recherche") exitwith {};
private ["_prendre_le_c4_du_coffre","_prendre_l_argent_du_coffre"];

condition_detection_coffre_remplit_arme =
{
	_condition = false;
	{		
		if (!isnil {_x getvariable "je_suis_le_coffre_d_arme"}) then
		{
			_condition = true;
		};
	} foreach (nearestObjects [player, ["Box_East_WpsSpecial_F"], 5]);
	_condition;
};

_prendre_l_argent_du_coffre =
{
	if (count (nearestObjects [player, ["Box_East_WpsSpecial_F"], 5]) < 1) exitwith {hint "Erreur detection, recommence ...";};
	_le_coffre = (nearestObjects [player, ["Box_East_WpsSpecial_F"], 5]) select 0;
	if (isnil {_le_coffre getvariable "argent_dans_le_coffre_d_arme"}) exitwith {hint "Désole, pas d'argent dans ce coffre actuellement ...";};
	
	hint format ["Vous avez récupéré %1 %2 dans ce coffre !", _le_coffre getvariable "argent_dans_le_coffre_d_arme", "€"];
	
	player setvariable ["mon_argent_poche_by_sfp_maxou", (player getvariable "mon_argent_poche_by_sfp_maxou") + (_le_coffre getvariable "argent_dans_le_coffre_d_arme"),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	_le_coffre setvariable ["argent_dans_le_coffre_d_arme",nil,true];
};

_prendre_le_c4_du_coffre =
{
	if (count (nearestObjects [player, ["Box_East_WpsSpecial_F"], 5]) < 1) exitwith {hint "Erreur detection, recommence ...";};
	_le_coffre = (nearestObjects [player, ["Box_East_WpsSpecial_F"], 5]) select 0;
	if (isnil {_le_coffre getvariable "sacoche_de_c4"}) exitwith {hint "Désole, pas de sacoche dans ce coffre actuellement ...";};
	
	hint format ["Vous avez récupéré %1 sacoches dans ce coffre !", _le_coffre getvariable "sacoche_de_c4"];

	player setvariable ["sacoche_de_c4", (player getvariable "sacoche_de_c4") + (_le_coffre getvariable "sacoche_de_c4"),true];
	_le_coffre setvariable ["sacoche_de_c4",nil,true];
};

if (desactiver_message_infos_ecran < 1) then
{
	["Clock",["COFFRE D'ARMES", "Un coffre remplit d'armes vient d'être largué ..."]] call bis_fnc_showNotification;
};

while {!isnil "le_coffre_a_remplir"} do
{
	sleep 2;
	
	// Creer addaction
	if (isnil "action_prendre_dans_la_caisse_d_arme") then 
	{
		action_prendre_dans_la_caisse_d_arme = player addaction ["<t color=""#ff0000"">" + "Prendre L'Argent Dans Le Coffre", _prendre_l_argent_du_coffre, [], 1, false, false, "", "[] call condition_detection_coffre_remplit_arme"];
		action_prendre_dans_la_caisse_d_arme_deux = player addaction ["<t color=""#ff0000"">" + "Prendre Le C4 Dans Le Coffre", _prendre_le_c4_du_coffre, [], 1, false, false, "", "[] call condition_detection_coffre_remplit_arme"];
	};
	
	// Remettre addaction après mort
	if (!alive player) then
	{
		waituntil {sleep 2; alive player};
		waituntil {sleep 2; isnil {player getvariable "besoin_d_un_revive_news"}};
		action_prendre_dans_la_caisse_d_arme = player addaction ["<t color=""#ff0000"">" + "Prendre L'Argent Dans Le Coffre", _prendre_l_argent_du_coffre, [], 1, false, false, "", "[] call condition_detection_coffre_remplit_arme"];
		action_prendre_dans_la_caisse_d_arme_deux = player addaction ["<t color=""#ff0000"">" + "Prendre Le C4 Dans Le Coffre", _prendre_le_c4_du_coffre, [], 1, false, false, "", "[] call condition_detection_coffre_remplit_arme"];
	};
};

if (!isnil "action_prendre_dans_la_caisse_d_arme") then {player removeaction action_prendre_dans_la_caisse_d_arme;};
if (!isnil "action_prendre_dans_la_caisse_d_arme_deux") then {player removeaction action_prendre_dans_la_caisse_d_arme_deux;};

action_prendre_dans_la_caisse_d_arme = nil;
action_prendre_dans_la_caisse_d_arme_deux = nil;
condition_detection_coffre_remplit_arme = nil;