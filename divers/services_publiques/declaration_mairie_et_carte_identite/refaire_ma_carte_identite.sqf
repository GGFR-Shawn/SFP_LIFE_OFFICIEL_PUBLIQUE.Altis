// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (player getvariable "ma_carte_identite" select 1 == "nom") exitwith {hint "Votre carte est déja en attente d'être refaite ! \n\n Rendez vous en mairie ;)";};

player setVariable ["ma_carte_identite",[0,"nom","prenom","masculin","altis","1m78"], true];

hint "La demande de recréation de votre carte à bien été accepté ! Rendez vous en mairie pour la refaire ... !";

closedialog 0;
