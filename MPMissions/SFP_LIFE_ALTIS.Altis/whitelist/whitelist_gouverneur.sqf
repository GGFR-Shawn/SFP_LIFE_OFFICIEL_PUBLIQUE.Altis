// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!isnil "mairedelaville") then {if (player == mairedelaville) then {je_passe_la_whitelist_gouverneur = true;};};
	
if (!isnil "je_passe_la_whitelist_gouverneur") then 
{
	[] spawn
	{
		waituntil {!isnil "fin_verification_apres_chargement"};
		
		[uid_whitelist_maire_de_la_ville, uid_whitelist_maire_de_la_ville, uid_unique_pour_la_sauvegarde, "test_valeur_existe"] call LoadToServer;
		sleep 7;
		if (isnil "je_suis_whiteliste_mairie_de_la_ville") then 
		{
			cutText["\n\n\n\n\n\n\n Ce slot est reservé ! Venez sur www.sfpteam.fr !!","BLACK FADED",3]; 
			fin_ecriture_flic = 1;
			sleep 2;
			["Slot_Reserve",false,true] call BIS_fnc_endMission;
		}else
		{
			execVM "divers\metiers\maire\maire.sqf"; 		
		};
	};
};

fin_ecriture_gouverneur = 1;
je_passe_la_whitelist_gouverneur = nil;