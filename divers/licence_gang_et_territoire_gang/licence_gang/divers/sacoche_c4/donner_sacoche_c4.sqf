// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "addaction_sacoche_de_c4") exitwith {hint "Erreur d'initialisation, si soucis contact Maxou.";};
if (isNull cursortarget) exitWith {hint "Personne n'est pointé !"};
if !(cursortarget iskindof "Man") exitWith {hint "Ce n'est pas un joueur, recommence !"};
if ((player getVariable "sacoche_de_c4") < 1) exitwith {hint "Tu n'as plus de sacoche C4 !";};

lejoueuradonner = cursortarget;

player setVariable ["sacoche_de_c4", (player getVariable "sacoche_de_c4") - 1,true];
player setVariable ["usedspace", (player getVariable "usedspace") - 1,true];

lejoueuradonner setVariable ["sacoche_de_c4", (lejoueuradonner getVariable "sacoche_de_c4") + 1,true];
lejoueuradonner setVariable ["usedspace", (player getVariable "usedspace") + 1,true];

[] call addaction_sacoche_de_c4;

hint format ["! SACOCHE C4 ! \n --------------------------------------  \n\n Tu viens de donner 1 sacoche C4 à %1. \n ---------------------- \n www.sfpteam.fr \n By SFP Maxou",name lejoueuradonner];

player action ["TakeMine", player];