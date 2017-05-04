// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_la_valise = _this select 0;
if (isnil "_la_valise") exitwith {systemchat "Erreur valise ...";};

waitUntil {sleep 1; !isnil {player getvariable "joueur_menotte"} or !alive player or supprimer_sac_d_argent >= 1}; 

if (!isnil "_la_valise") then {deletevehicle _la_valise;};

