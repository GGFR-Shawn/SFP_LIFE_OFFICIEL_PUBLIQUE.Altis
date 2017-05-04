// =======================================================================================================================================================================================
											// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
											  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

le_joueur_arrete_gendarmerie = nil;
if (isplayer cursortarget && side cursortarget == civilian && player distance cursortarget < 4 && isNull attachedTo cursortarget) then
{
	le_joueur_arrete_gendarmerie = cursortarget;
}else
{
	_condition = true;
	{
		if (_condition && isplayer _x && side _x == civilian && player distance _x < 4 && isNull attachedTo _x) then
		{
				le_joueur_arrete_gendarmerie = _x;
				_condition = false;
		};
	} foreach (player nearEntities [['man'], 2]);
};

if (isnil "le_joueur_arrete_gendarmerie") exitwith {hint "Erreur, pas de joueur trouvé ...";};
if (!isnil {le_joueur_arrete_gendarmerie getvariable "besoin_d_un_revive_news"}) exitwith {hint "Désolé, tu ne peux pas faire cette action puisque le joueur attend d'etre revive !";};
if (isnil {le_joueur_arrete_gendarmerie getvariable "joueur_menotte"}) then {le_joueur_arrete_gendarmerie SetVariable ["joueur_menotte", true, true];};

[[[le_joueur_arrete_gendarmerie, player],"divers\gendarmerie\menotter\menotter_le_civil_synchronisation.sqf"],"BIS_fnc_execVM",le_joueur_arrete_gendarmerie,false] spawn BIS_fnc_MP;

