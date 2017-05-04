// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if !(revive_mon_side == civilian) exitwith {};
if (count (nearestObjects [player, ["Rabbit_F"], 5]) < 1) exitwith {hint "Pas de lapin en vue près de toi !";};
if (isnil {player getvariable "totalspace"}) then {player setvariable ["totalspace",40,true]; systemchat "Debug automatique sur votre espace virtuel total.";};
if ((player getVariable "usedspace") >= (player getVariable "totalspace")) exitwith {hint "Inventaire plein ! Tu ne peux pas chasser de lapins !";};

_le_lapin = (nearestObjects [player, ["Rabbit_F"], 5]) select 0;
if (alive _le_lapin) exitwith {hint "Ce lapin est toujours vivant ! Il faut le tuer !";};

player setVariable["item_lapins_sfp",(player getVariable "item_lapins_sfp") + (listes_des_farming_avec_parametre select 14 select 3),true];
player setVariable["usedspace",(player getVariable "usedspace") + (listes_des_farming_avec_parametre select 14 select 2),true];

deleteVehicle _le_lapin;

hint format["Vous avez 1% viande de lapin en plus dans votre inventaire.",1];