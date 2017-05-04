// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (revive_mon_side != civilian) exitwith {hint "Vous devez être un civil pour pouvoir braquer une banque.";};
if (le_serveur_va_redemarrer_dans_20_minutes >= 1) exitWith {hint "Opération impossible ! Le serveur va redémarrer dans moins de 20 minutes !";};
if (isnil "variable_banque_peut_etre_braque") exitwith {hint "Patiente, le serveur vient à peine de démarrer ;)";};
if (variable_banque_peut_etre_braque < 1) exitwith {hint "La banque ne peut pas être braqué maintenant ! Reviens plus tard petit chenapan !";};
if (isnull (unitBackpack player)) exitwith {hint "Désolé, il vous faut obligatoirement un sac à dos pour mettre l'argent !";};
if !(player hasWeapon primaryWeapon player or player hasWeapon secondaryWeapon player) exitwith {hint "Vous avez besoin d'une arme principale pour voler la banque !";}; 
if (!isnil "autorisation_lancement_braquage_banque") exitwith {};

_nombre_minimum_de_gendarme_de_co = 4;
{if (side _x == west) then{_nombre_minimum_de_gendarme_de_co = round (_nombre_minimum_de_gendarme_de_co - 1);};} foreach playableunits;
if (_nombre_minimum_de_gendarme_de_co > 0) exitwith {hint "Désolé, il n'y a pas assez de gendarmes sur le serveur pour braquer la banque !";}; 


hint "! BRAQUAGE DE BANQUE ! \n\n Braquage autorisé ! \n\n Reste appuyé sur la touche ESPACE pour essayer de forcer le coffre ... \n\n Attention, les gendarmes ont été prévenus ! \n ----------------------------------\n By SFP Maxou \n www.sfpteam.fr";
titletext ["Braquage autorisé ! \n\n Reste appuyé sur la touche ESPACE pour essayer de forcer le coffre ... \n\n Attention, les gendarmes ont été prévenus ! \n ----------------------------------\n By SFP Maxou \n www.sfpteam.fr","BLACK IN",10];

_temps_max_pour_essai_braquage_sfp = 360; // Secondes
autorisation_barre_pour_braquage = true;
autorisation_lancement_braquage_banque = true;
pourcentage_barre_braquage_de_banque = 1;
bar_de_progression_by_maxou_reinitialisation = nil;
variable_banque_peut_etre_braque = 0;
publicVariable "variable_banque_peut_etre_braque";

[[[],"divers\banque\action_braquage_banque\avertir_gendarme_braquage_banque.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

sleep 2;

[_temps_max_pour_essai_braquage_sfp] spawn bar_de_progression_banque_by_maxou;
while {alive player && _temps_max_pour_essai_braquage_sfp > 0 && pourcentage_barre_braquage_de_banque > 0 && pourcentage_barre_braquage_de_banque < 100} do
{
	_temps_max_pour_essai_braquage_sfp = round (_temps_max_pour_essai_braquage_sfp - 1);
	sleep 1;
};

autorisation_lancement_braquage_banque = nil;
autorisation_barre_pour_braquage = nil;
sleep 1; bar_de_progression_by_maxou_reinitialisation = true;

if (pourcentage_barre_braquage_de_banque < 100) exitwith 
{
	titletext ["! BRAQUAGE DE BANQUE ! \n\n Tu n'as malheureusement pas réussi à braquer le coffre fort ... Re test plus tard ! \n ----------------------------------\n By SFP Maxou \n www.sfpteam.fr","BLACK OUT",3];
	sleep 3;
	titletext ["! BRAQUAGE DE BANQUE ! \n\n Tu n'as malheureusement pas réussi à braquer le coffre fort ... Re test plus tard ! \n ----------------------------------\n By SFP Maxou \n www.sfpteam.fr","BLACK IN",10];
};

hint "! BRAQUAGE DE BANQUE ! \n\n Le braquage de banque à été accepté. Si tu souhaites la braquer à plusieurs, il te suffit de te grouper avec tes collègues à proximité du PNJ banque pour qu'ils possèdent egalement le menu ramasser l'argent ! \n\n Démarrage du script dans 10 secondes ... \n ----------------------------------\n By SFP Maxou \n www.sfpteam.fr";

for "_i" from 0 to 10 do
{
	systemchat format ["Démarrage dans %1 secondes ...", round (10 - _i)];
	sleep 1;
};

listes_des_personnes_a_proximite = [];
nombres_de_personnes_qui_braque_la_banque = 0;
{
	if (isplayer _x && side _x != west) then
	{
		listes_des_personnes_a_proximite = listes_des_personnes_a_proximite + [_x];
		nombres_de_personnes_qui_braque_la_banque = round (nombres_de_personnes_qui_braque_la_banque + 1);
	};
} foreach (nearestObjects [getPosATL bank_atm2, ["MAN"], 20]);

[[[player,nombres_de_personnes_qui_braque_la_banque],"divers\banque\action_braquage_banque\action_sur_les_joueurs_autours.sqf"],"BIS_fnc_execVM",listes_des_personnes_a_proximite,false] spawn BIS_fnc_MP;