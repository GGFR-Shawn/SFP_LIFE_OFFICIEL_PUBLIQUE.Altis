// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "sfp_config_liste_des_plantes_illegale") exitwith {hint "Désolé, la liste des plantes illégales est inconnue ...";};
if !(typeOf cursorTarget in sfp_config_liste_des_plantes_illegale) exitwith {hint "Tu n'as pas pointé ta souris sur une plante !";};
if (player getvariable "seau_plante_illegal" < 1) exitwith {hint "Désolé, tu n'as pas de seau ! \n\n Tu peux en acheter un en quincaillerie !";};
if (isnil "niveau_de_mon_reservoir_eau_plante_illegales") exitwith {hint "Désolé, tu n'as pas d'eau dans ton seau ! \n\n Va le remplir au pres de l'eau !";};

_la_plante = cursortarget;

_seaudeau = createVehicle ["Land_Bucket_clean_F", getPosATL player, [], 0, "CAN_COLLIDE"];
_seaudeau attachto [player,[-0.044,-0.03,-0.1],"righthand"];
_seaudeau setdir 88;

player playActionNow "medicstartup";

jarrose_ma_plante = 1;
_random_de_la_plante = round (108 + (random 22));

while {!isnil {_la_plante getvariable "niveau_eau"} && jarrose_ma_plante >= 1 && niveau_de_mon_reservoir_eau_plante_illegales > 0} do
{
	niveau_de_mon_reservoir_eau_plante_illegales = round (niveau_de_mon_reservoir_eau_plante_illegales - 2);
	if (niveau_de_mon_reservoir_eau_plante_illegales < 0) then {niveau_de_mon_reservoir_eau_plante_illegales = 0;};
	_la_plante setvariable ["niveau_eau",(_la_plante getvariable "niveau_eau") + 3,true];
	0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Pourcentage du niveau d'eau du seau : %1. \n Pourcentage du niveau d'eau de la plante : %2",niveau_de_mon_reservoir_eau_plante_illegales, round (_la_plante getvariable "niveau_eau")],"PLAIN"];
	
	if (_la_plante getvariable "niveau_eau" > 100) then
	{
		0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n  ATTENTION ! La plante est entrain de se nettoyer elle risque de mourrir ... \n\n\n Pourcentage du niveau d'eau du seau : %1. \n Pourcentage du niveau d'eau de la plante : %2",niveau_de_mon_reservoir_eau_plante_illegales, round (_la_plante getvariable "niveau_eau")],"PLAIN"];	
		if (_la_plante getvariable "niveau_eau" >= _random_de_la_plante) then
		{
			0 cuttext ["\n\n\n\n\n\n\n\n\n\n La plante est morte, les racines ont pourries !","PLAIN"];	
			sleep 5;
			deletevehicle _la_plante;
		};
	};
	sleep 1;
};

deletevehicle _seaudeau;
jarrose_ma_plante = 0;

waitUntil {((animationState player) != "medicstartup")};player switchmove "";

if (niveau_de_mon_reservoir_eau_plante_illegales < 0) then 
{
	0 cuttext ["\n\n\n\n\n\n\n\n\n\n\n\n\n Arrosage terminé, votre seau n'a plus d'eau !","PLAIN"];
	niveau_de_mon_reservoir_eau_plante_illegales = nil;
}else
{
	0 cuttext [format ["\n\n\n\n\n\n\n\n\n\n\n\n\n Arrosage terminé, il vous reste %1 pourcent d'eau dans votre seau !",round (niveau_de_mon_reservoir_eau_plante_illegales)],"PLAIN"];	
};

