//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_verification_cone = nearestObjects [getPosATL player, ["RoadCone_L_F"], distance_max_de_detection_des_cones];
_verification_cone_deux = _verification_cone select 0;		
if (isnil "_verification_cone_deux") exitwith {hint "Tu n'as pas pointé ta souris sur un cone !";};

_maxcone = 20;

if ((jepeuxreprendreuncone > 0) && (jepeuxreprendreuncone <= _maxcone)) then
{
	deletevehicle _verification_cone_deux;
	jepeuxreprendreuncone = jepeuxreprendreuncone - 1;

	hint format ["Cône restant à poser : %1.", _maxcone - jepeuxreprendreuncone];
}else
{
	hint "Ton inventaire contient déja 20 cones !";
};