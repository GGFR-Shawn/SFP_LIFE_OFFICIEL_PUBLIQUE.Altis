// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!hasInterface) exitwith {};

sleep 20;

[] spawn
{
	for "_i" from 0 to 5 do
	{
		titletext ["Attention, le serveur redémarre dans moins de 20 minutes ! N'oubliez pas de sauvegarder vos véhicules avec la touche Y !","PLAIN"];
		sleep 20;
	};
};

while {true} do
{
	player say "attention_le_serveur_redemarre";
	sleep (60 + (random 300));
}
