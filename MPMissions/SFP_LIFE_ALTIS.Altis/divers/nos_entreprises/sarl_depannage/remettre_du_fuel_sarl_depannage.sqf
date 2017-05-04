// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (isnil "autonomie_de_mon_jerrican") then {autonomie_de_mon_jerrican = 50;}; 
if (autonomie_de_mon_jerrican <= 0) exitwith {hint "Désolé, tu n'as pas de gasoil dans ton jerrican !";}; 
if ((fuel cursortarget) > 0.5) exitwith {hint "Désolé, le véhicule à déjà plus de la moitié de gasoil dans son réservoir !";}; 

_veh = cursortarget;
je_met_du_gasoil = 1;
ranger_jerrican = {je_met_du_gasoil = 0;};

hint "Tu vas maintenant remettre du gasoil dans le véhicule.";
sleep 2;

_jerican = createvehicle ["Land_CanisterFuel_F", getPosATL player, [], 0, "CAN_COLLIDE"];
_jerican attachto [player,[-0.044,-0.06,-0.1],"righthand"];
_jerican setVectorDirAndUp [[0.5,0,0],[0,0.5,0]];
sleep 2;

action_remettre_gasoil = player addAction ["<t color=""#ff0000"">" + "Ranger Jerrican",ranger_jerrican,[],10,true,true,'',''];

while {autonomie_de_mon_jerrican > 0 && je_met_du_gasoil >= 1} do
{
	autonomie_de_mon_jerrican = autonomie_de_mon_jerrican - 2;
	_fuel_dans_la_voiture = fuel cursortarget;
	_appliquer_fuel = (_fuel_dans_la_voiture) + 0.02;
	_fuel_dans_la_voiture_calcul = _fuel_dans_la_voiture * 100;
	
	while {player distance _veh > 4 && je_met_du_gasoil >= 1} do
	{
		0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Rapproches toi du véhicule ! ",autonomie_de_mon_jerrican,round (_fuel_dans_la_voiture_calcul)],"PLAIN"];	
		sleep 1;
	};
	
	0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Gasoil restant jerrican : %1 litres. \n Gasoil dans le vehicule : %2 Pour Cent. \n\n N'oublie pas de laisser pointer ta souris sur le véhicule !",autonomie_de_mon_jerrican,round (_fuel_dans_la_voiture_calcul)],"PLAIN"];	
	[[[_veh,_appliquer_fuel],"divers\achat_divers_supermarche\utiliser_et_donner_les_achats\bidon_d_essence\synchro_fuel.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	if (fuel cursortarget >= 1) then {je_met_du_gasoil = 0;};
	sleep 2;
};

deletevehicle _jerican;
player removeAction action_remettre_gasoil;

if (autonomie_de_mon_jerrican <= 0) then {player setVariable ['bidon_d_essence',(player getvariable "bidon_d_essence") - 1,true];hint "Votre jerrican est vide !";autonomie_de_mon_jerrican = nil;sleep 2;};
if (fuel _veh >= 1) exitwith {hint "Le véhicule a maintenant le reservoir plein !";};
if (fuel _veh < 1) exitwith {hint "Le véhicule n'a pas le reservoir plein !";};
