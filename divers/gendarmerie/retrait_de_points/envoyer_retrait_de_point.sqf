// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_valeur_tape = floor parseNumber (ctrlText 1400);

if (isnil "la_personne_pour_retrait") exitwith {hint "Erreur sur la personne, recommence !";};
if (isnil "_valeur_tape") exitwith {Hint "Erreur, recommence ...";}; 
if (_valeur_tape == 0) exitwith {Hint "Désolé, 0 n'est pas possible ...";}; 
if (_valeur_tape > 12) exitwith {Hint "Impossible, le permis à un maximum de 12 points.";}; 
if (la_personne_pour_retrait getvariable "combien_de_point_by_sfp_maxou" <= 0) exitwith {Hint "Impossible, le joueur n'a plus de permis.";}; 

_calcul_point = round (((la_personne_pour_retrait getvariable "combien_de_point_by_sfp_maxou") -  (_valeur_tape)));
if (_calcul_point < 0) exitwith {hint format ["Impossible, vous ne pouvez retirer qu'au maximum %1 points !", round (_calcul_point + 12)]};

la_personne_pour_retrait setvariable ["combien_de_point_by_sfp_maxou", (la_personne_pour_retrait getvariable "combien_de_point_by_sfp_maxou") - _valeur_tape,true];
Titletext [format["%1 à bien été verbalisé de %2 points sur son permis. \n\n Il lui en reste maintenant %3.", name la_personne_pour_retrait, _valeur_tape, round (la_personne_pour_retrait getvariable "combien_de_point_by_sfp_maxou")], "PLAIN DOWN",1];

[[[name player, la_personne_pour_retrait],"divers\gendarmerie\retrait_de_points\avertir_joueur_point_en_moins.sqf"],"BIS_fnc_execVM", la_personne_pour_retrait, false] spawn BIS_fnc_MP;

closedialog 0;

if (la_personne_pour_retrait getvariable "combien_de_point_by_sfp_maxou" < 1) then
{
	la_personne_pour_retrait setVariable ["license_permis_de_conduire_by_sfp_maxou",0,true];
	la_personne_pour_retrait setVariable ["license_permis_de_conduire_poids_lourd_by_sfp_maxou",0,true];
	sleep 5;
	systemchat format ["%1 à eu son permis suspendu suite aux retrait de points.", name la_personne_pour_retrait];
};


