// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_le_vehicule_a_encrer_sfp","_message_ancre_sfp_maxou"];
_le_vehicule_a_encrer_sfp = (vehicle player);
_temps_deploiement_encre = 3;
if (isnil "_le_vehicule_a_encrer_sfp") exitwith {hint "Erreur script ancre sur le choix de véhicule ...";};
if (driver _le_vehicule_a_encrer_sfp != player) exitwith {hint "Vous n'etes pas le conducteur ... \n\n il n'est donc pas possible pour ne pas ajouter d'abus .... Système crée par Maxou";};
if (!isnil "action_ancre_sfp_en_cours") exitwith {hint "Action déja en cours ... \n\n Patientez ...";};
action_ancre_sfp_en_cours = true;

if (isnil {_le_vehicule_a_encrer_sfp getvariable "etat_de_l_ancre_sfp"}) then
{
	_message_ancre_sfp_maxou = ["Déploiement de l'ancre en cours ...","déployée","Déploiement de l'ancre annulée ..."];
}else
{
	_message_ancre_sfp_maxou = ["Lever d'ancre en cours ...","levée","Levée de l'ancre annulée ..."];
};

while {_temps_deploiement_encre > 0 && driver _le_vehicule_a_encrer_sfp == player && alive _le_vehicule_a_encrer_sfp} do
{
	titletext [format ["%1 \n\n Encore %2 secondes ...", _message_ancre_sfp_maxou select 0, _temps_deploiement_encre], "PLAIN"];
	_temps_deploiement_encre = round (_temps_deploiement_encre - 1);
	sleep 1;
};
if (_temps_deploiement_encre > 0) exitwith {titletext [format ["%1", _message_ancre_sfp_maxou select 2], "PLAIN"];};

if (isnil {_le_vehicule_a_encrer_sfp getvariable "etat_de_l_ancre_sfp"}) then
{
	_le_vehicule_a_encrer_sfp setvariable ["etat_de_l_ancre_sfp", true, true];
	[[[_le_vehicule_a_encrer_sfp],"divers\divers\ancre_sfp\synchronisation_mp_ancre.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;	
}else
{
	_le_vehicule_a_encrer_sfp setvariable ["etat_de_l_ancre_sfp", nil, true];
};

titletext [format ["Ancre %1 ...", _message_ancre_sfp_maxou select 1], "PLAIN"];

action_ancre_sfp_en_cours = nil;
