//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_verification_panneau_halte_gendarmerie = nearestObjects [getPosATL player, ["SFP_Panneau_Pied_Rond"], distance_max_de_detection_des_cones];
_verification_panneau_halte_gendarmerie_deux = _verification_panneau_halte_gendarmerie select 0;		

if (isnil "_verification_panneau_halte_gendarmerie_deux") exitwith {hint "Tu n'as pas pointé ta souris sur un panneau halte de gendarmerie !";};

_maxdepanneauhaltegendarmerie = 2;

if ((jepeuxreprendreunpanneauhaltegendarmerie > 0) && (jepeuxreprendreunpanneauhaltegendarmerie <= _maxdepanneauhaltegendarmerie)) then
{
	deletevehicle _verification_panneau_halte_gendarmerie_deux;
	jepeuxreprendreunpanneauhaltegendarmerie = jepeuxreprendreunpanneauhaltegendarmerie - 1;

	hint format ["Panneau restant à poser : %1.", _maxdepanneauhaltegendarmerie - jepeuxreprendreunpanneauhaltegendarmerie];
}else
{
	hint "Ton inventaire contient déja 2 panneau halte de gendarmerie !";
};