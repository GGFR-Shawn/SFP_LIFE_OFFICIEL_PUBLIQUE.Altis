// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


_la_balle_by_sfp_maxou = _this select 0;
_comment_detection = 2.6;
if (isnull _la_balle_by_sfp_maxou) exitwith {hintsilent "Erreur Information de la balle du Flash-Ball ...";};


waituntil {_la_balle_by_sfp_maxou distance player > _comment_detection};
waituntil {speed _la_balle_by_sfp_maxou < 1 or !alive _la_balle_by_sfp_maxou or (count (nearestObjects [getPosATL _la_balle_by_sfp_maxou, ["man"], _comment_detection]) > 0) or getPosATL _la_balle_by_sfp_maxou select 2 < 0.2};

if (!alive _la_balle_by_sfp_maxou) exitwith {titleText["\n\n\n\n\n\n\n\n Balle perdue !", "PLAIN",0];};

_verifier_joueur = nearestObjects [getPosATL _la_balle_by_sfp_maxou, ["man"], _comment_detection];
_verifier_joueur_deux = _verifier_joueur select 0;

if (getPosATL _la_balle_by_sfp_maxou select 2 < 0.2 && (count (nearestObjects [getPosATL _la_balle_by_sfp_maxou, ["man"], _comment_detection]) < 1)) exitwith
{
	titleText["\n\n\n\n\n\n\n\n Tir raté ! La balle est retombée !", "PLAIN",0];
	if (alive _la_balle_by_sfp_maxou) then {deletevehicle _la_balle_by_sfp_maxou;};
};

if (!isnil "_verifier_joueur_deux") then 
{
	if (alive _la_balle_by_sfp_maxou) then {deletevehicle _la_balle_by_sfp_maxou;};

	if (_verifier_joueur_deux != player) then
	{
		titleText [format["%1 à prit votre balle de flash-ball !",name _verifier_joueur_deux],"PLAIN"];	
		[[[_verifier_joueur_deux],"divers\gendarmerie\taser\effet_flash_ball_si_joueur_detecte.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	};
};



