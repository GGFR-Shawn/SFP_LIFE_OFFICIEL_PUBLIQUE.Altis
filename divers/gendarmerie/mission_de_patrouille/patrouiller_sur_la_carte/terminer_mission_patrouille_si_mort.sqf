// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {not alive player};
pasmortmission = 0;

deleteMarkerLocal "patrolmarker";
patrolmission = 0;

sleep 13;

hint "Désolé mon petit gars, tu es mort lors de ta patrouille et tu ne gagneras donc pas d'argent !";
