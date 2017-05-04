//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_verification_panneau_danger_dde = nearestObjects [getPosATL player, ["SFP_Panneau_Pied_Triangle"], distance_max_de_detection_danger_dde];
_verification_panneau_danger_dde_deux = _verification_panneau_danger_dde select 0;		

if (isnil "_verification_panneau_danger_dde_deux") exitwith {hint "Tu n'as pas pointé ta souris sur un panneau !";};

_maxdepanneaudangerdde = 2;

if ((jepeuxreprendreunpanneaudangerdde > 0) && (jepeuxreprendreunpanneaudangerdde <= _maxdepanneaudangerdde)) then
{
	deletevehicle _verification_panneau_danger_dde_deux;
	jepeuxreprendreunpanneaudangerdde = jepeuxreprendreunpanneaudangerdde - 1;

	hint format ["Panneau danger restante à poser : %1.", _maxdepanneaudangerdde - jepeuxreprendreunpanneaudangerdde];
}else
{
	hint "Ton inventaire contient déja 2 panneau de danger !";
};