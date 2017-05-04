// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


sleep (600 + (random 600));

_condition_pelouse = false;
while {!_condition_pelouse} do 
{
	_position_une_random = [-10000, 10000] call BIS_fnc_selectRandom; _position_deux_random = [-10000, 10000] call BIS_fnc_selectRandom;
	position_tondre_herbe = [(getPosATL reperepourmarchenoir select 0) + (random _position_une_random),(getPosATL reperepourmarchenoir select 1) + (random _position_deux_random),0];
	_verificationsurface = ["#GdtGrassShort","#GdtGrassTall","#GdtGrassDry","#GdtGrassGreen"];
	if ((surfaceType position_tondre_herbe) in _verificationsurface && !isOnRoad position_tondre_herbe && !surfaceIsWater position_tondre_herbe) then {_condition_pelouse = true;}; sleep 0.2;
};


["Clock", ["TON PATRON","Ton patron à une mission à te confier !"] ] call bis_fnc_showNotification;
_temps = 10 + (random 20);
_temps = floor _temps;
hint format ["! TRAVAIL ! \n -------------------------------------------- \n \n Ton patron à une mission pour toi. \n\n Consultes ta carte et rends toi y ! \n\n Attention tu as %1 minutes pour la terminer ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",_temps];


createMarkerLocal ["missiontondrelapelouse", (position_tondre_herbe)];
"missiontondrelapelouse" setMarkerShapeLocal "ICON";
"missiontondrelapelouse" setMarkerColorLocal "ColorYellow";
"missiontondrelapelouse" setMarkerSizeLocal [2,2];
"missiontondrelapelouse" setMarkerTypeLocal "hd_dot";
"missiontondrelapelouse" setMarkerTextLocal "Mission de ton patron !";

execvm "divers\offres_d_emplois\metiers_pour_missions\tondre_pelouse\mission_une_tondre_pelouse\commencer_quand_sur_place_tondre_pelouse.sqf";

player setVariable["jesuisalleralamissiondemonpatron",0,false];
sleep 20;

while {_temps > 0 && player getVariable "jesuisalleralamissiondemonpatron" <= 0} do
{
	hint format ["! TRAVAIL ! \n -------------------------------------------- \n \n Attention, il te reste encore %1 minutes pour faire la mission de ton patron ou tu seras viré ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",_temps];	
	sleep 60;
	_temps = _temps - 1;
};
if ((_temps <= 0) && ((player getVariable "jesuisalleralamissiondemonpatron") <= 0)) then {execvm "divers\offres_d_emplois\metiers_pour_missions\tondre_pelouse\mission_une_tondre_pelouse\supprimer_mission_tondre_la_pelouse_si_pas_etaient.sqf";};
