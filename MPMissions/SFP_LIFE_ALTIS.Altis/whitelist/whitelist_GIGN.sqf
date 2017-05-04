// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {!isNull player};
waitUntil {player == player};


if (!isnil "swat_0") then {if (player == swat_0) then {je_passe_la_whitelist_GIGN = true;};};
if (!isnil "swat_1") then {if (player == swat_1) then {je_passe_la_whitelist_GIGN = true;};};
if (!isnil "swat_2") then {if (player == swat_2) then {je_passe_la_whitelist_GIGN = true;};};
if (!isnil "swat_3") then {if (player == swat_3) then {je_passe_la_whitelist_GIGN = true;};};
if (!isnil "swat_4") then {if (player == swat_4) then {je_passe_la_whitelist_GIGN = true;};};
if (!isnil "swat_5") then {if (player == swat_5) then {je_passe_la_whitelist_GIGN = true;};};
if (!isnil "swat_6") then {if (player == swat_6) then {je_passe_la_whitelist_GIGN = true;};};
if (!isnil "swat_7") then {if (player == swat_7) then {je_passe_la_whitelist_GIGN = true;};};
if (!isnil "swat_8") then {if (player == swat_8) then {je_passe_la_whitelist_GIGN = true;};};
if (!isnil "swat_9") then {if (player == swat_9) then {je_passe_la_whitelist_GIGN = true;};};
if (!isnil "swat_10") then {if (player == swat_10) then {je_passe_la_whitelist_GIGN = true;};};
if (!isnil "swat_11") then {if (player == swat_11) then {je_passe_la_whitelist_GIGN = true;};};
if (!isnil "swat_12") then {if (player == swat_12) then {je_passe_la_whitelist_GIGN = true;};};
if (!isnil "swat_13") then {if (player == swat_13) then {je_passe_la_whitelist_GIGN = true;};};
if (!isnil "operateurdrone") then {if (player == operateurdrone) then {je_passe_la_whitelist_GIGN = true;};};


if (!isnil "je_passe_la_whitelist_GIGN") then 
{
	[] spawn
	{
		waituntil {!isnil "fin_verification_apres_chargement"};
		
		[uid_whitelist_GIGN, uid_whitelist_GIGN, uid_unique_pour_la_sauvegarde, "test_valeur_existe"] call LoadToServer;
		sleep 7;
		if (isnil "je_suis_whiteliste_GIGN") then 
		{
			cutText["\n\n\n\n\n\n\n Ce slot est reservé ! Venez sur www.sfpteam.fr !!","BLACK FADED",3]; 
			fin_ecriture_flic = 1;
			sleep 2;
			["Slot_Reserve",false,true] call BIS_fnc_endMission;
		};
	};
};

fin_ecriture_GIGN = 1;
je_passe_la_whitelist_GIGN = nil;

if (!isnil "je_suis_whiteliste_GIGN") then
{	
	waituntil {!isnil "fin_verification_apres_chargement"};
	sleep 7;
	if (player getvariable "ma_paye_by_sfp_maxou" < 7420) then {player setVariable["ma_paye_by_sfp_maxou", 7420,false];};
	player setVariable["mes_aides_caf", 0,false];
};
