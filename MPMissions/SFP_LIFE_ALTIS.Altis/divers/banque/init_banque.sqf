// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


waitUntil {!isNil "fin_verification_apres_chargement"};

execVM "divers\banque\virement_de_la_paye.sqf";
execVM "divers\banque\impot.sqf";
execVM "divers\banque\mes_aides_de_letat.sqf";
execVM "divers\banque\mes_cotisations_mutuelles.sqf";
