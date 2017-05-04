// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom;
_position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;

_pos = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
_surface = surfaceType _pos;
_verificationsurface = ["#GdtGrassShort","#GdtGrassGreen"];
sleep 0.045;
if (!(_surface in _verificationsurface && !surfaceIsWater _pos)) exitwith  {execvm "partie_serveur\divers_propre\spawn_marche_noir\creation_du_marche_noir_aleatoire.sqf";};

group2 = Creategroup CIVILIAN; 
marche_noir_creation = group2 createUnit ["C_man_1_1_F", _pos, [], 0, "CAN_COLLIDE"];
publicvariable "marche_noir_creation";

_box_marche_noir = createVehicle ["Land_Slum_House03_F", getPosATL marche_noir_creation, [], 0, 'CAN_COLLIDE'];
_box_marche_noir setvariable ["proprietaire_de_la_maison",["Appartenance au serveur sfp"],false];
_box_marche_noir allowDamage false; 

marche_noir_creation setUnitPos "Middle";
marche_noir_creation allowDamage false; 
marche_noir_creation setdir 135;
marche_noir_creation addweapon "srifle_EBR_F"; 
[marche_noir_creation] join grpNull;
marche_noir_creation stop true;