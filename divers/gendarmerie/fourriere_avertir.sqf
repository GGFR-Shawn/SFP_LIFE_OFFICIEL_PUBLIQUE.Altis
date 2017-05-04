// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_nom_a_prevenir = _this select 0;
_type_du_vehicule = _this select 1;
_mon_nom = _this select 2;

if (isnil "_nom_a_prevenir") exitwith {};
if (isnil "_type_du_vehicule") exitwith {};
if (isnil "_mon_nom") exitwith {};

if (name player == _nom_a_prevenir) then 
{
	hint format ["! VEHICULE EN FOURRIERE ! \n ------------------------------ \n\n Attention, votre véhicule de type %1 à été mit en fourrière par %2 ... \n\n ------------------------------ \n www.sfpteam.fr \n By SFP Maxou",_type_du_vehicule, _mon_nom];
};

systemchat format ["Le véhicule de type %1 appartenant à %2 à été mit en fourrière par %3 ...",_type_du_vehicule, _nom_a_prevenir, _mon_nom];
