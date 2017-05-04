// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {!isNull player};
waitUntil {player == player};


if (!isnil "cop_1") then {if (player == cop_1) then {je_passe_la_whitelist_gendarme = true;};};
if (!isnil "cop_2") then {if (player == cop_2) then {je_passe_la_whitelist_gendarme = true;};};
if (!isnil "cop_3") then {if (player == cop_3) then {je_passe_la_whitelist_gendarme = true;};};
if (!isnil "cop_4") then {if (player == cop_4) then {je_passe_la_whitelist_gendarme = true;};};
if (!isnil "cop_5") then {if (player == cop_5) then {je_passe_la_whitelist_gendarme = true;};};
if (!isnil "cop_6") then {if (player == cop_6) then {je_passe_la_whitelist_gendarme = true;};};
if (!isnil "cop_7") then {if (player == cop_7) then {je_passe_la_whitelist_gendarme = true;};};
if (!isnil "cop_8") then {if (player == cop_8) then {je_passe_la_whitelist_gendarme = true;};};
if (!isnil "cop_9") then {if (player == cop_9) then {je_passe_la_whitelist_gendarme = true;};};
if (!isnil "cop_10") then {if (player == cop_10) then {je_passe_la_whitelist_gendarme = true;};};
if (!isnil "cop_11") then {if (player == cop_11) then {je_passe_la_whitelist_gendarme = true;};};
if (!isnil "cop_12") then {if (player == cop_12) then {je_passe_la_whitelist_gendarme = true;};};
if (!isnil "cop_13") then {if (player == cop_13) then {je_passe_la_whitelist_gendarme = true;};};
if (!isnil "cop_14") then {if (player == cop_14) then {je_passe_la_whitelist_gendarme = true;};};
if (!isnil "cop_15") then {if (player == cop_15) then {je_passe_la_whitelist_gendarme = true;};};

if (!isnil "cop_16") then {if (player == cop_16) then {je_passe_la_whitelist_psig = true;};};
if (!isnil "cop_17") then {if (player == cop_17) then {je_passe_la_whitelist_psig = true;};};
if (!isnil "cop_18") then {if (player == cop_18) then {je_passe_la_whitelist_psig = true;};};
if (!isnil "cop_19") then {if (player == cop_19) then {je_passe_la_whitelist_psig = true;};};
if (!isnil "cop_20") then {if (player == cop_20) then {je_passe_la_whitelist_psig = true;};};
if (!isnil "cop_21") then {if (player == cop_21) then {je_passe_la_whitelist_psig = true;};};
if (!isnil "cop_22") then {if (player == cop_22) then {je_passe_la_whitelist_psig = true;};};
if (!isnil "cop_23") then {if (player == cop_23) then {je_passe_la_whitelist_psig = true;};};
if (!isnil "cop_24") then {if (player == cop_24) then {je_passe_la_whitelist_psig = true;};};



if (!isnil "je_passe_la_whitelist_gendarme") then 
{
	[] spawn
	{
		waituntil {!isnil "fin_verification_apres_chargement"};
	
		[uid_whitelist_gendarme, uid_whitelist_gendarme, uid_unique_pour_la_sauvegarde, "test_valeur_existe"] call LoadToServer;
		sleep 5;
		if (isnil "je_suis_whiteliste_gendarme") then 
		{
			cutText["\n\n\n\n\n\n\n Ce slot est reservé ! Venez sur www.sfpteam.fr !!","BLACK FADED",10]; 
			fin_ecriture_flic = 1;
			sleep 2;
			["Slot_Reserve",false,true] call BIS_fnc_endMission;
		};
	};
};
		
if (!isnil "je_passe_la_whitelist_psig") then 
{
	[] spawn
	{
		waituntil {!isnil "fin_verification_apres_chargement"};
		
		[uid_whitelist_psig, uid_whitelist_psig, uid_unique_pour_la_sauvegarde, "test_valeur_existe"] call LoadToServer;
		sleep 7;
		if (isnil "je_suis_whiteliste_psig") then 
		{
			cutText["\n\n\n\n\n\n\n Ce slot est reservé ! Venez sur www.sfpteam.fr !!","BLACK FADED",3]; 
			fin_ecriture_flic = 1;
			sleep 2;
			["Slot_Reserve",false,true] call BIS_fnc_endMission;
		};
	};
};

fin_ecriture_flic = 1;
je_passe_la_whitelist_gendarme = nil;
je_passe_la_whitelist_psig = nil;