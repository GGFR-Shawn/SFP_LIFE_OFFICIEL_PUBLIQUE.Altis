// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


_combiendonner = parseNumber (ctrlText 1400);
_largentdujoueur = round (joueur_a_qui_donner_argent getvariable "mon_argent_poche_by_sfp_maxou");
_argentquejaiactuellement = round (player getvariable "mon_argent_poche_by_sfp_maxou");
_argentquejavais = round (player getvariable "mon_argent_poche_by_sfp_maxou");

if (isnil "joueur_a_qui_donner_argent") exitwith {hint "Une erreur de type joueur inconnu c'est produite, recommence ...";};
if (isnil "_combiendonner") exitwith {hint "Une erreur de type argent que vous allez donner c'est produite, recommence ...";};
if (isnil "_argentquejaiactuellement") exitwith {hint "Une erreur de type argent sur votre compte c'est produite, recommence ...";};
if (isnil "_argentquejavais") exitwith {hint "Une erreur de type argent que vous avez c'est produite, recommence ...";};
if (isnil "_largentdujoueur") exitwith {hint "Une erreur de type l'argent du joueur c'est produite, recommence ...";};
if (typeName joueur_a_qui_donner_argent == "SCALAR") exitwith {hint "Une erreur de type SCALAR sur le joueur (calcul arma) c'est produite, recommence ...";};
if (typeName _combiendonner != typename 0) exitwith {hint "Une erreur de type SCALAR sur combien vous allez donner (calcul arma) c'est produite, recommence ...";};
if (typeName _argentquejaiactuellement != typename 0) exitwith {hint "Une erreur de type SCALAR sur l'argent que vous avez en compte (calcul arma) c'est produite, recommence ...";};
if (typeName _argentquejavais != typename 0) exitwith {hint "Une erreur de type SCALAR sur l'argent que vous avez en compte (calcul arma) c'est produite, recommence ...";};
if (typeName _largentdujoueur != typename 0) exitwith {hint "Une erreur de type SCALAR sur l'argent du joueur (calcul arma) c'est produite, recommence ...";};

if (player getVariable "mon_argent_poche_by_sfp_maxou" < _combiendonner) exitwith {hint "Désolé, tu n'as pas assez d'argent en poche !";}; 
if (_combiendonner <= 0) exitwith {hint "Désolé, mais 0 euros n'est pas valable !";}; 

player setVariable ["mon_argent_poche_by_sfp_maxou",round (_argentquejaiactuellement - _combiendonner),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

hint format ["%1 euros ont bien été donné à %2 ! \n\n Tu as maintenant %3 euros en poche sur les %4 euros que tu possédais ! \n ------------------------------ \n www.sfpteam.fr \n By SFP Maxou",(_combiendonner) call retour_formatage_chiffre_sfp, name joueur_a_qui_donner_argent, (player getVariable "mon_argent_poche_by_sfp_maxou") call retour_formatage_chiffre_sfp, (_argentquejavais) call retour_formatage_chiffre_sfp];

closeDialog 0;

[[[name player,_combiendonner],"divers\donner_argent_joueur\avertir_joueur_donner_argent.sqf"],"BIS_fnc_execVM",joueur_a_qui_donner_argent,false] spawn BIS_fnc_MP;

player action ["TakeMine", player];
