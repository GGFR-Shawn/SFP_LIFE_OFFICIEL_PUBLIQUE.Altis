// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!getRemoteSensorsDisabled) then 
{
	disableRemoteSensors true;
};

[] spawn 
{
	waitUntil {sleep 0.02; !isNil "autorisation_bis_fnc_mp"};
	
	"BIS_fnc_MP_packet" addPublicVariableEventHandler compileFinal preprocessFileLineNumbers "divers\anti_hack_bis_fnc_mp.sqf"; systemChat "Anti-Hack : Initialisation DISTANT terminée !";
};