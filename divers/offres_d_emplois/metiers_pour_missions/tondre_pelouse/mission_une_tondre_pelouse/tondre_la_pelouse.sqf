// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


hint "! TRAVAIL ! \n -------------------------------------------- \n \n Place toi maintenant sur de l'herbe pour commencer la coupe ;) ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";

// ----------------------------------------------------------------- Demarrage de la mission ------------------------------------------------------- //

_distance_a_tondre = floor (100 + (random 250));
_distance_a_tondre_pour_message = _distance_a_tondre;

hint format ["! TRAVAIL ! \n -------------------------------------------- \n \n Ton patron exige que tu tonds %1 mètres d'herbe aujourd'hui ;) \n\n Met toi maintenant dans l'herbe pour commencer à tondre. \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",_distance_a_tondre];	
player removeAction menumissiontondrelapelouse;
sleep 4;

waituntil {surfaceType getPosATL player == "#GdtGrassGreen"};
_object = createVehicle ["Land_Wall_Tin_Pole", getPosATL player, [], 0, "CAN_COLLIDE"];
_object attachto [player,[-0.67,1.1,-0.25],"righthand"];
_object setVectorDirAndUp [[2,0.5,-2],[-0.5,0.5,0]];


while {_distance_a_tondre > 0 && alive player} do
{
	_pos1 = (getPosATL (vehicle player));
	sleep 0.7;
	_pos2 = (getPosATL (vehicle player));
	_verifier_distance = _pos1 distance _pos2; 
	_surface = surfaceType getPosATL player;
	_verificationsurface = ["#GdtGrassShort","#GdtGrassTall","#GdtGrassDry","#GdtGrassGreen"];
	_speed = speed player;
	if ((_verifier_distance > 0.2) && (_surface in _verificationsurface) && (_speed < 8)) then
	{
		_distance_a_tondre = _distance_a_tondre - 1;
		hint format ["! TRAVAIL ! \n -------------------------------------------- \n \n Encore %1 mètres à tondre pour terminer la mission ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",_distance_a_tondre];	
		tondeuse_une = "Land_ClutterCutter_medium_F" createVehicle [383994,43307,0];
		tondeuse_une setPosATL [(getPosATL player select 0),(getPosATL player select 1),(getPosATL player select 2)];		
	};
	if !(_surface in _verificationsurface) then {hint "Tu ne tond actuellement pas d'herbe ...";};
	if (_speed > 8 && _speed < 16) then {hint "Tu marche trop vite ! \n\n Appuis sur Z et en le maintenant appuis sur S pour passer en marche lente !";};
	if (_speed > 17) then {hint "Tu cours ! Il faut marcher lentement pour tondre ... \n\n Ne soit pas si pressé :D";};
};
if (!alive player) exitwith {};

// -------------------------------------------- Fin quand tout tondu ------------------------------------------------------ //

sleep 1;
jepeuxchoisiruntravail = 0;
_prime = (20 + (random 50));
hint format ["! TRAVAIL ! \n -------------------------------------------- \n \n Les %1 mètres de terrain ont bien étés tondus ! \n\n Une prime de %1 Euros ta été donné pour le bon boulot accompli ;) \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",_distance_a_tondre_pour_message];	

deleteMarkerLocal "missiontondrelapelouse";
deletevehicle _object;

player setVariable ["mon_argent_banque_by_sfp_maxou", (player getVariable "mon_argent_banque_by_sfp_maxou") + _prime,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
player setVariable["jesuisalleralamissiondemonpatron",1,false];

execvm "divers\offres_d_emplois\metiers_pour_missions\tondre_pelouse\demarrer_mission_tondre_pelouse.sqf";
