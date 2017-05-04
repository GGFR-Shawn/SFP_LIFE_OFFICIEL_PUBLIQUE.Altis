// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_valeur_tape = floor parseNumber (ctrlText 1400);

if (isnil "la_personne_pour_les_points") exitwith {hint "Erreur sur la personne, recommence !";};
if (isnil "_valeur_tape") exitwith {Hint "Erreur, recommence ...";}; 
if (_valeur_tape <= 0) exitwith {Hint "Désolé, 0 n'est pas possible ...";}; 
if (_valeur_tape > 12) exitwith {Hint "Impossible, le permis à un maximum de 12 points.";}; 
if (la_personne_pour_les_points getvariable "combien_de_point_by_sfp_maxou" <= 0) exitwith {Hint "Impossible, le joueur n'a plus de permis.";}; 

_calcul_point = round (((la_personne_pour_les_points getvariable "combien_de_point_by_sfp_maxou") + (_valeur_tape)));
if (_calcul_point > 12) exitwith {hint format ["Impossible, vous ne pouvez remettre qu'au maximum %1 points !", round (12 - (la_personne_pour_les_points getvariable "combien_de_point_by_sfp_maxou"))]};

la_personne_pour_les_points setvariable ["combien_de_point_by_sfp_maxou", (la_personne_pour_les_points getvariable "combien_de_point_by_sfp_maxou") + _valeur_tape,true];
Titletext [format["%1 à bien reprit %2 points sur son permis. \n\n Il lui en reste maintenant %3.", name la_personne_pour_les_points, _valeur_tape, round (la_personne_pour_les_points getvariable "combien_de_point_by_sfp_maxou")], "PLAIN DOWN",1];

[[[name player, la_personne_pour_les_points,_valeur_tape],"divers\nos_entreprises\sarl_autoecole\remettre_des_points\avertir_joueur_point_en_plus.sqf"],"BIS_fnc_execVM", la_personne_pour_les_points, false] spawn BIS_fnc_MP;

closedialog 0;