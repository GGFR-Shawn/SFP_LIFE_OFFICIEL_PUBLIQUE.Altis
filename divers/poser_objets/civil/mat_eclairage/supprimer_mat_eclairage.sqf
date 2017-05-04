//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_verification_mat_eclairage = nearestObjects [getPosATL player, ["Land_PortableLight_double_F"], distance_max_de_detection_mat_eclairage_object];
_verification_mat_eclairage_deux = _verification_mat_eclairage select 0;		

if (isnil "_verification_mat_eclairage_deux") exitwith {hint "Tu n'as pas pointé ta souris sur un mat !";};

_maxdemateclairage = 2;

if ((jepeuxreprendreunmatdeclairageobject > 0) && (jepeuxreprendreunmatdeclairageobject <= _maxdemateclairage)) then
{
	deletevehicle _verification_mat_eclairage_deux;
	jepeuxreprendreunmatdeclairageobject = jepeuxreprendreunmatdeclairageobject - 1;

	hint format ["Mât restant à poser : %1.", _maxdemateclairage - jepeuxreprendreunmatdeclairageobject];
}else
{
	hint "Ton inventaire contient déja 2 mat d'éclairage !";
};