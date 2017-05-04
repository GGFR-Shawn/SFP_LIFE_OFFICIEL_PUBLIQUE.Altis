// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

noesckey = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 47) then {true}"];
while {!isnil {player getvariable "joueur_menotte"}} do
{
	sleep 0.02;
	player playMove "AmovPercMstpSnonWnonDnon_Ease";
	if (driver vehicle player == player) then {player action ["Eject", vehicle player];};
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || isnil {player getvariable "joueur_menotte"}};
};

