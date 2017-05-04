// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {!isNull player};
waitUntil {player == player};
waituntil {!isnil "fin_verification_apres_chargement" && !isnil "uid_whitelist_gendarme_stagiaire" && !isnil "LoadToServer"};
	
[uid_whitelist_gendarme_stagiaire, uid_whitelist_gendarme_stagiaire, uid_unique_pour_la_sauvegarde, "test_valeur_existe"] call LoadToServer;
sleep 5;
if (!isnil "je_suis_whiteliste_gendarme_stagiaire") then 
{
	cutText["\n\n\n\n\n\n\n Bienvenu en gendarmerie stagiaire !","BLACK IN",6]; 
};