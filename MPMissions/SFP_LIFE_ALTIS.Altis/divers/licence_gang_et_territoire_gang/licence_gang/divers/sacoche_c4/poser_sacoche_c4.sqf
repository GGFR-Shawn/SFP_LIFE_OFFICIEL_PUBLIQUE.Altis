// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "addaction_sacoche_de_c4") exitwith {hint "Erreur d'initialisation, si soucis contact Maxou.";};
if ((player getVariable "sacoche_de_c4") < 1) exitwith {hint "Tu n'as plus de sacoche C4 !";};

player setVariable ["sacoche_de_c4", (player getVariable "sacoche_de_c4") - 1,true];
player setVariable ["usedspace", (player getVariable "usedspace") + 1,true];

player playMove "AinvPknlMstpSlayWrflDnon_healed";

sleep 5;

_coffrage = createVehicle ["Land_Suitcase_F", position player, [], 0, "CAN_COLLIDE"];
_coffrage setvariable ["proprietaire_sacoche_c4",name player,true];

hint "! SACOCHE C4 ! \n -------------------------------------- \n\n Tu viens de poser une sacoche de C4. \n\n Utilise le menu déroulant pour la faire peter. \n\n Sache que celle ci c'est automatique armée ... Pour l'arreter, il faudra lui couper les cables ! \n\n Un brouilleur d'onde est disponible en quincaillerie au cas ou ;) \n ---------------------- \n www.sfpteam.fr \n By SFP Maxou";

[] call addaction_sacoche_de_c4;

