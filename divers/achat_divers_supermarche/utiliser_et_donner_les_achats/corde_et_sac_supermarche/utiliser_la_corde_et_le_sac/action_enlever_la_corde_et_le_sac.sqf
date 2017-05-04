// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isNull cursortarget) exitWith {hint "Personne n'est pointé !"};
if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"};
if (isnil {cursortarget getvariable "jai_les_mains_sur_la_tete"}) exitWith {hint "Désolé, le joueur n'a pas les mains sur la tete !"};
if (isnil {player getvariable "totalspace"}) then {player setvariable ["totalspace",40,true]; systemchat "Debug automatique sur votre espace virtuel total.";};
if (((player getvariable "usedspace") + (10)) > (player getvariable "totalspace")) exitwith {hint "Désolé, tu n'as pas assez de place dans ton inventaire !";};

_le_joueur_a_mettre_les_mains_sur_la_tete = cursortarget;

player setVariable ['corde_et_sac', 1,true];
player setVariable["usedspace",(player getVariable "usedspace") + 10,true];

_le_joueur_a_mettre_les_mains_sur_la_tete setVariable ["jai_un_sac_sur_la_tete",nil,true];

hint format ["! SAC ET CORDE ! \n -------------------------------------------- \n \n Vous venez d'enlever le sac sur la tete de %1 ! \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",name _le_joueur_a_mettre_les_mains_sur_la_tete];
