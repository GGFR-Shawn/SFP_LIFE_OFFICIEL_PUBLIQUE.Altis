//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_verification_barriere_gendarmerie = nearestObjects [getPosATL player, ["RoadBarrier_F"], distance_max_de_detection_barriere_gendarmerie];
_verification_barriere_gendarmerie_deux = _verification_barriere_gendarmerie select 0;		
if (isnil "_verification_barriere_gendarmerie_deux") exitwith {hint "Tu n'as pas pointé ta souris sur une barrière, recommence !";};

_maxdebarriere = 8;

if ((jepeuxreprendreunebarriere > 0) && (jepeuxreprendreunebarriere <= _maxdebarriere)) then
{
	deletevehicle _verification_barriere_gendarmerie_deux;
	jepeuxreprendreunebarriere = jepeuxreprendreunebarriere - 1;
	
	hint format ["Barrière restante à poser : %1.", _maxdebarriere - jepeuxreprendreunebarriere];
}else
{
	hint "Ton inventaire contient déja 8 barrières !";
};