//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

_verification_barriere_de_securite = nearestObjects [getPosATL player, ["SFP_Barriere_Chantier"], distance_max_de_detection_des_barriere_de_chantier_dde];
_verification_barriere_de_securite_deux = _verification_barriere_de_securite select 0;		
if (isnil "_verification_barriere_de_securite") exitwith {hint "Tu n'es pas près d'une barrière de chantier !";};

_maxdebarrieredechantierdde = 7;

if ((jepeuxreprendreunebarrieredechantier > 0) && (jepeuxreprendreunebarrieredechantier <= _maxdebarrieredechantierdde)) then
{
	deletevehicle _verification_barriere_de_securite_deux;
	jepeuxreprendreunebarrieredechantier = jepeuxreprendreunebarrieredechantier - 1;
	
	hint format ["Barrière restante à poser : %1.", _maxdebarrieredechantierdde - jepeuxreprendreunebarrieredechantier];
}else
{
	hint "Ton inventaire contient déja 11 barrières !";
};