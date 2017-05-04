// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if !(revive_mon_side == civilian) exitwith {};
if (count (nearestObjects [player, ["Snake_random_F"], 5]) < 1) exitwith {hint "Pas de serpent en vue près de toi !";};
if (isnil {player getvariable "totalspace"}) then {player setvariable ["totalspace",40,true]; systemchat "Debug automatique sur votre espace virtuel total.";};
if ((player getVariable "usedspace") >= (player getVariable "totalspace")) exitwith {hint "Inventaire plein ! Tu ne peux pas tuer de serpent !";};

_le_serpent = (nearestObjects [player, ["Snake_random_F"], 5]) select 0;
deleteVehicle _le_serpent;

(listes_des_farming_avec_parametre select 46 select 4) spawn {[_this] call bar_de_progression_by_maxou;};
player playActionNow "medicstartup";
sleep (listes_des_farming_avec_parametre select 46 select 4);

player setVariable["serpent_non_transforme",(player getVariable "serpent_non_transforme") + (listes_des_farming_avec_parametre select 46 select 3),true];
player setVariable["usedspace",(player getVariable "usedspace") + (listes_des_farming_avec_parametre select 46 select 2),true];

hint format["Vous avez 1% serpent non transformé en plus dans votre inventaire.", listes_des_farming_avec_parametre select 46 select 3];