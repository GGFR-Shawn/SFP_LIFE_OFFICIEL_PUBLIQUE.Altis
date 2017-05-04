// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_joueur_sfp = _this select 0;
_distance_max_pour_entendre_le_son = 30;
if (isnil "_le_joueur_sfp") exitwith {};

if (player distance _le_joueur_sfp < _distance_max_pour_entendre_le_son) then
{
	playSound "extincteur_allumage";
	sleep 0.40;
};

while {!isnil {_le_joueur_sfp getvariable "synchro_bruit_extincteur_sfp"}} do
{
	if (player distance _le_joueur_sfp < _distance_max_pour_entendre_le_son) then
	{
		playSound "extincteur_continu";
	};
	
	sleep 2.3;
};