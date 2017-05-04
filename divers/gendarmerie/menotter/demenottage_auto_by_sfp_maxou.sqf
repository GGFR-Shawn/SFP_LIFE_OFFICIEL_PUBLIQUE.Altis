// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_time = 300;
hint format ["Dans %1 secondes tu seras démenotté automatiquement si tu l'es encore ... \n ------------------------------\n By SFP Maxou \n www.sfpteam.fr",_time];

while {(!isnil {player getvariable "joueur_menotte"}) && (_time > 1)} do
{
	_pos1 = (getPosATL (vehicle player));
	sleep 2;
	_pos2 = (getPosATL (vehicle player));
	_tpcheck = _pos1 distance _pos2;
	
	if  (_tpcheck > 2) then {_time = 300; hint format ["Un gendarme ta bougé et ton compteur à été remit à %1 secondes ! \n ------------------------------\n By SFP Maxou \n www.sfpteam.fr",_time];};
	_time = _time - 2;
	if (_time > 0) then {titleText [format ["Encore %1 secondes pour être demenotté automatiquement ... \n ------------------------------\n By SFP Maxou \n www.sfpteam.fr",_time],"PLAIN",1];};
	if (_time <= 0) then {hint "Tu es maintenant demenotté !\n\n Appuis maintenant sur V ! \n ------------------------------\n By SFP Maxou \n www.sfpteam.fr";};
	if (!(alive player)) exitwith {};
};
				
if (!isnil {player getvariable "joueur_menotte"}) exitWith
{
	player setVariable["joueur_menotte",nil,true];
	sleep 1;
	titleText ["Vous avez été démenotté automatiquement pour l'avoir été trop longtemps ! \n\n Appuis maintenant sur V !","PLAIN"];
	if (!isnil "noesckey") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown", noesckey];};
};
