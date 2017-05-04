// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_vehicule = _this select 0;
if (isnil "_le_vehicule") exitwith {};

for "_i" from 0 to 48 do
{
	if (!isNull (findDisplay 602) && player distance _le_vehicule < 5) then
	{
		closeDialog 0;
		
		systemchat "Fermeture de votre inventaire pour eviter le glitch du véhicule sauvegardé à proximité ...";
	};
	sleep 0.25;
};