// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (player distance cursortarget > 22) exitWith {hint "! SFP TELECOM !\n ------------------------------------- \n Désolé, \n\n Vous êtes trop loin de l'antenne !\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};
if (isnil {cursortarget getvariable "temps_total_avant_fin_action"}) then {cursortarget setvariable ["temps_total_avant_fin_action", 300, false];};
if (typeof cursortarget != "Land_Communication_F") then {hint "! SFP TELECOM !\n ------------------------------------- \n Désolé, \n\n Aucune antenne detecté !\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};
if (isnil "autorisation_detruire_antenne") then {autorisation_detruire_antenne = 0;};
if (autorisation_detruire_antenne >= 1) exitWith {hint "! SFP TELECOM !\n ------------------------------------- \n Désolé, \n\n Vous avez déja fait l'action !\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};
autorisation_detruire_antenne = 1;

private ["_l_antenne_relais_sfp","_etat_de_l_antenne_relais_sfp","_message_a_affiche_un","_message_a_affiche_deux","_action_sur_l_antenne_terminee"];
_l_antenne_relais_sfp = cursortarget;
_etat_de_l_antenne_relais_sfp = _l_antenne_relais_sfp getvariable "antenne_sfp_telecom_desactive";
_action_sur_l_antenne_terminee = false;
_temps_de_destruction = _l_antenne_relais_sfp getvariable "temps_total_avant_fin_action";
_temps_de_destruction spawn {[_this] call bar_de_progression_by_maxou;};

if (isnil {_l_antenne_relais_sfp getvariable "antenne_sfp_telecom_desactive"} && isnil {_l_antenne_relais_sfp getvariable "antenne_telecom_pirater"}) then 
{
	_message_a_affiche_un = "sera mise hors circuit";
	_message_a_affiche_deux = "La mise hors circuit de";
	[[[getPosATL player, player],"divers\telephone_by_sfp_maxou\sfp_telecom\systeme_de_reseau_detruire_ou_reparer_une_antenne_avertir_gendarmes.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
}else
{
	_message_a_affiche_un = "sera remise en route";
	_message_a_affiche_deux = "La remise en route de";
};

player playActionNow "medicstartup";

while {alive player && (player distance _l_antenne_relais_sfp) < 22 && _l_antenne_relais_sfp getvariable "temps_total_avant_fin_action" > 0 && !_action_sur_l_antenne_terminee} do 
{
	(format["L'antenne relais %1 dans %2 secondes.", _message_a_affiche_un, _l_antenne_relais_sfp getvariable "temps_total_avant_fin_action"]) call message_en_bas_de_couleur_sfp;
	_l_antenne_relais_sfp setvariable ["temps_total_avant_fin_action",(_l_antenne_relais_sfp getvariable "temps_total_avant_fin_action") - 1,false];
	sleep 1;
	player playActionNow "medicstartup";
};

if (_l_antenne_relais_sfp getvariable "temps_total_avant_fin_action" <= 0) then 
{
	_action_sur_l_antenne_terminee = true;
};

if (_action_sur_l_antenne_terminee) then 
{
	(format["%1 l'antenne à été exécutée. <br/> Patiente quelques secondes avant appliquation.", _message_a_affiche_deux]) call message_en_bas_de_couleur_sfp;
	_l_antenne_relais_sfp setvariable ["temps_total_avant_fin_action",nil,false];
	
	if (isnil "_etat_de_l_antenne_relais_sfp") then 
	{
		_l_antenne_relais_sfp setvariable ["antenne_sfp_telecom_desactive",true,true];
	}else
	{
		_l_antenne_relais_sfp setvariable ["antenne_sfp_telecom_desactive",nil,true];
		_l_antenne_relais_sfp setvariable ["antenne_telecom_pirater",nil,true];
	};
} else 
{
	"Action sur l'antenne interrompu." call message_en_bas_de_couleur_sfp;
	if (player distance _l_antenne_relais_sfp >= 22) then {"Action sur l'antenne interrompu puisque tu t'es éloigné." call message_en_bas_de_couleur_sfp;};
};

player playActionNow "medicstop";	
player switchmove "";
bar_de_progression_by_maxou_reinitialisation = true;
autorisation_detruire_antenne = nil;
