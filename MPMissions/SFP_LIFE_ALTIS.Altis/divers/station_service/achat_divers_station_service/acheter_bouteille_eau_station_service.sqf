// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

le_nom_de_larticle = "bouteille d'eau";
le_prix_de_larticle = 1;
_totaldeuxdeux = ((player getVariable "usedspace") + 2);
argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
if (isnil {player getvariable "totalspace"}) then {player setvariable ["totalspace",40,true]; systemchat "Debug automatique sur votre espace virtuel total.";};
if (_totaldeuxdeux > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};
if (argent_actuellement < le_prix_de_larticle) exitwith {Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];};
if (((player getVariable "bouteilledeau") >= 1) && (isnull (unitBackpack player))) exitwith {hint format ["Désolé, pour acheter plus de %1, il te faut un sac à dos !",le_nom_de_larticle];};

player setVariable ['bouteilledeau', (player getVariable "bouteilledeau") + 1,true];
player setVariable["usedspace",(player getVariable "usedspace") + 2,true];

player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

hint format['Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros !',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];
sleep 5;
Hint "! BOUTEILLE D'EAU ! \n ----------------------------- \n\n La bouteille d'eau, sert une fois la soif descendu en dessous de 50, de l'augmenter de 20 pourcents.";
