// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_mon_gang_actuel";
_mon_gang_actuel = _this select 0;
if (isnil "_mon_gang_actuel") exitwith {hint "Erreur, reconnaissance gang ... Recommence ...";};
if (_mon_gang_actuel == "") exitwith {hint "Erreur, reconnaissance gang ... Recommence ...";};

hint format ["! CAPTURE DE GANG ! \n --------------------------------------- \n\n La capture du camp commence ... \n Vous faite partie actuellement du gang de : \n\n '%1' \n ------------------------------------------ \n www.sfpteam.fr, by Maxou.",_mon_gang_actuel];

if (possession_camp_gang select 1 != _mon_gang_actuel) then
{
	possession_camp_gang set [1, _mon_gang_actuel];
	publicvariable "possession_camp_gang";
};

while {alive player && player in list zone_capture_de_gang && possession_camp_gang select 1 == _mon_gang_actuel && possession_camp_gang select 0 != _mon_gang_actuel && temps_capture_camp_de_gang >= 1} do
{
	titletext [format ["! CAPTURE DE GANG ! \n ---------------------------------------------------------------- \n La capture de zone de gang sera accessible pour %1 dans %2 secondes ! \n --------------- \n By SFP Maxou", _mon_gang_actuel, temps_capture_camp_de_gang],"PLAIN DOWN"];
	temps_capture_camp_de_gang = round (temps_capture_camp_de_gang - 1);
	
	_condition_publique = false;
	{
		if (_x in list zone_capture_de_gang && _x != player) then
		{
			_condition_publique = true;
		};
	} foreach playableunits;
	
	if (_condition_publique) then {publicvariable "temps_capture_camp_de_gang";};
	
	sleep 1;
};

publicvariable "temps_capture_camp_de_gang";

if !(alive player) exitwith {};
if !(player in list zone_capture_de_gang) exitwith {hint "! CAPTURE DE GANG ! \n --------------------------------------- \n\n Capture annulé, vous êtes sortie de la zone de capture ! \n ------------------------------------------ \n www.sfpteam.fr, by Maxou.";};
if (possession_camp_gang select 1 != _mon_gang_actuel) exitwith {hint "! CAPTURE DE GANG ! \n --------------------------------------- \n\n Capture annulé, un autre gang est entrain de capturer le camp !!! \n Tuez les ! \n ------------------------------------------ \n www.sfpteam.fr, by Maxou.";};

if (possession_camp_gang select 0 == _mon_gang_actuel or temps_capture_camp_de_gang <= 0) then
{
	hint format ["! CAPTURE DE GANG ! \n --------------------------------------- \n\n La capture du camp est terminé ... \n\n La zone appartient donc à : \n\n '%1' jusqu'a la prochaine capture ! \n\n Tu peux maintenant acheter diverses choses ! \n ------------------------------------------ \n www.sfpteam.fr, by Maxou.",_mon_gang_actuel];
	
	possession_camp_gang set [0, _mon_gang_actuel];
	possession_camp_gang set [1, _mon_gang_actuel];
	publicvariable "possession_camp_gang";

	temps_capture_camp_de_gang = round (60 * 15);
	publicvariable "capture_de_gang_reprit";
	publicvariable "temps_capture_camp_de_gang";

	menu_prise_de_gang = true;
};
