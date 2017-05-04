// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (revive_mon_side != civilian) exitwith {hint "Réservé au civil";};
if (player getvariable "ma_date_de_naissance" < 600) exitwith {hint "Désolé, tu n'as pas assez d'heure sur le serveur pour te servir de cette fonction ! \n\n Il te faut au minimum 10 heures !";};
if ((player getVariable "poignard_item") >= 1) exitwith {hint format ["Désolé, tu ne peux acheter qu'un seul %1 !", "poignard"];};
if (isnil {player getvariable "totalspace"}) then {player setvariable ["totalspace",40,true]; systemchat "Debug automatique sur votre espace virtuel total.";};
if (((player getVariable "usedspace") + 2) > player getVariable "totalspace") exitwith {hint "Désolé, tu n'as plus assez de place dans ton inventaire !";};

le_nom_de_larticle = _this select 0;
le_prix_de_larticle = _this select 1;
	
player setVariable ['poignard_item', (player getVariable "poignard_item") + 1,true];
player setVariable["usedspace",(player getVariable "usedspace") + 2,true];
player setVariable ['mon_argent_banque_by_sfp_maxou', (player getvariable "mon_argent_banque_by_sfp_maxou") - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

hint format['Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n',le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou')];
