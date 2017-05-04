//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénal possible ! Voir http://amar.arma3.fr/ !


_le_vehicule = _this select 0;
if (isnil "_le_vehicule") exitwith {hint "Erreur, contact maxou !";};

if (player in _le_vehicule) then
{
	if (isnil "menu_prise_de_gang") then
	{
		disableUserInput true;
		player action ["eject", vehicle player];
		player action ["getOut", vehicle player];
		sleep 0.2;
		hint "! CAPTURE DE GANG ! \n --------------------------------------- \n\n Désolé, vous n'etes pas autorisé à prendre cette armement puisque vous n'avez pas capturé la zone ! \n ------------------------------------------ \n www.sfpteam.fr, by Maxou.";
		disableUserInput false;
	};
};