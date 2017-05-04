// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


execvm "divers\compilation_fonction_mp\execution_script_apres_mort\execution_script_apres_mort.sqf"; 
execvm "divers\compilation_fonction_mp\creation\creation_mp.sqf";
execvm "divers\compilation_fonction_mp\addEventHandler\divers_local.sqf"; 
execvm "divers\compilation_fonction_mp\addPublicVariableEventHandler\divers_addPublicVariableEventHandler.sqf"; 

[] call compile PreprocessFileLineNumbers "config\compilation_farming.sqf"; 
[] call compile PreprocessFileLineNumbers "divers\compilation_fonction_mp\compilation_variable\compilation_variable.sqf"; 
[player,"0"] execvm "divers\compilation_fonction_mp\addEventHandler\divers_mp.sqf"; 
