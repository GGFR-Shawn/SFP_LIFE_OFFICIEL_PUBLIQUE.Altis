//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

le_prix_de_larticle = 20000;
le_nom_de_larticle = "une sacoche C4";

if (isnil "addaction_sacoche_de_c4") exitwith {hint "Erreur d'initialisation, si soucis contact Maxou.";};
if (isnil {player getvariable "licence_gang_v2"}) exitwith {hint "Vous devez faire partie d'un gang pour acheter cette sacoche C4 !";};
if (player getVariable "mon_argent_poche_by_sfp_maxou" < le_prix_de_larticle) exitwith {hint "Vous n'avez pas d'argent en poche ! Revenez avec 20000 euros.";};

player setVariable ['sacoche_de_c4', round ((player getVariable "sacoche_de_c4") + 1),true];
player setVariable ["usedspace", round ((player getVariable "usedspace") + 1),true];

player setVariable ['mon_argent_poche_by_sfp_maxou', (player getVariable "mon_argent_poche_by_sfp_maxou") - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

hint format['Vous avez acheté %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n Pour utiliser la sacoche C4, utilise le menu déroulant !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_poche_by_sfp_maxou') call retour_formatage_chiffre_sfp];

[] call addaction_sacoche_de_c4;
