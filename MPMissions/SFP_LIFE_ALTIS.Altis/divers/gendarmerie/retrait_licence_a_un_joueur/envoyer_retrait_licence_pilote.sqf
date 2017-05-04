// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_joueur = cursortarget;
if (isnil "_le_joueur") exitwith {hint "Erreur sur la personne, recommence !";};
if !(_le_joueur iskindof "man") exitwith {hint "Erreur sur la personne, ce n'est pas un joueur !";};
if (isnil {_le_joueur getvariable 'license_pilote_news'}) exitwith {Hint "Impossible, le joueur n'a pas de licence.";}; 

_le_joueur setvariable ["license_pilote_news", nil,true];
Titletext [format["Vous avez bien fait sauté la licence pilote de %1.", name _le_joueur], "PLAIN DOWN",1];

[[[name player, _le_joueur],"divers\gendarmerie\retrait_licence_a_un_joueur\avertir_joueur_licence_en_moins.sqf"],"BIS_fnc_execVM", _le_joueur, false] spawn BIS_fnc_MP;
