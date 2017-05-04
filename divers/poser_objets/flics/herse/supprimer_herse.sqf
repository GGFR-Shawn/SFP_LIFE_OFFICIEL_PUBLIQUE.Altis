//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_verification_herse = nearestObjects [getPosATL player, ["Pole_F"], distance_max_de_detection_des_herses];
if (count _verification_herse < 1) exitwith {hint "Aucune herse detecté !";};
_la_herse = _verification_herse select 0;

_maxherse = 1;

if ((jepeuxreprendreuneherse > 0) && (jepeuxreprendreuneherse <= _maxherse)) then
{
	deletevehicle _la_herse;
	jepeuxreprendreuneherse = 0;
	herse = nil;

	hint format ["Herse restante à poser : %1.", _maxherse - jepeuxreprendreuneherse];
}else
{
	hint "Ton inventaire contient déja 1 herse !";
};