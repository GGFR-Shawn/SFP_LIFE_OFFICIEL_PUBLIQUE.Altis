// =======================================================================================================================================================================================
															// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
															  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_le_radar_sfp","_etat_du_radar_sfp","_message_a_affiche_un","_message_a_affiche_deux","_action_sur_le_radar_termine"];
_le_radar_sfp = nearestObjects [position player, ["SpeedRadar1"], 3];
_choix_addaction = (_this select 3 select 0);
if (count _le_radar_sfp < 1) exitwith {hint "! DESTRUCTION RADAR !\n ------------------------------------- \n Désolé, \n\n Aucun radar detecté !\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};
if (count _le_radar_sfp >= 1) then {_le_radar_sfp = _le_radar_sfp select 0;};
if (isnil "_choix_addaction") exitwith {hint "! DESTRUCTION RADAR ! \n -------------------------------------- \n\n Valeur inconnu, contact Maxou. \n\n ----------------------------------- \n www.sfpteam.fr \n By SFP Maxou";};
if (isnil {_le_radar_sfp getvariable "temps_total_avant_fin_action"}) then {_le_radar_sfp setvariable ["temps_total_avant_fin_action", round (100 + (random 100)), false];};
if (typeof _le_radar_sfp != "speedradar1") then {hint "! DESTRUCTION RADAR !\n ------------------------------------- \n Désolé, \n\n Ce n'est pas un radar !\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};
if (isnil {player getvariable "marteau_sfp"} && _choix_addaction == 0) exitWith {hint "! DESTRUCTION RADAR !\n ------------------------------------- \n Désolé, \n\n Il vous faut un marteau pour détruire le radar ! \n\n Vous pouvez l'acheter en quincaillerie. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};
if (isnil "autorisation_detruire_radar") then {autorisation_detruire_radar = 0;};
if (autorisation_detruire_radar >= 1) exitWith {hint "! DESTRUCTION RADAR !\n ------------------------------------- \n Désolé, \n\n Vous avez déja fait l'action !\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};
_etat_du_radar_sfp = _le_radar_sfp getvariable "radar_sfp_desactive";
_action_sur_le_radar_termine = false;
_temps_de_destruction = _le_radar_sfp getvariable "temps_total_avant_fin_action";
_temps_de_destruction spawn {[_this] call bar_de_progression_by_maxou;};
autorisation_detruire_radar = 1;

switch _choix_addaction do
{
	// Destruction
	case 0 :
	{
		_message_a_affiche_un = "sera détruit";
		_message_a_affiche_deux = "La destruction du";
		[[[getPosATL player, player],"divers\radar\radar_destruction_avertir_gendarmes.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	};
	// Reparer
	case 1 :
	{
		_message_a_affiche_un = "sera réparé";
		_message_a_affiche_deux = "La réparation du";
	};
};

player playActionNow "medicstartup";

while {alive player && count (nearestObjects [getPosATL player, ['SpeedRadar1'], 3]) >= 1 && _le_radar_sfp getvariable "temps_total_avant_fin_action" > 0 && !_action_sur_le_radar_termine} do 
{
	_le_radar_sfp setvariable ["temps_total_avant_fin_action",(_le_radar_sfp getvariable "temps_total_avant_fin_action") - 1,false];
	(format["Le radar %1 dans %2 secondes.", _message_a_affiche_un, _le_radar_sfp getvariable "temps_total_avant_fin_action"]) call message_en_bas_de_couleur_sfp;
	sleep 1;
	player playActionNow "medicstartup";
};

if (_le_radar_sfp getvariable "temps_total_avant_fin_action" <= 0) then 
{
	_action_sur_le_radar_termine = true;
};

if (_action_sur_le_radar_termine) then 
{
	(format["%1 radar à été exécutée.", _message_a_affiche_deux]) call message_en_bas_de_couleur_sfp;
	_le_radar_sfp setvariable ["temps_total_avant_fin_action",nil,false];
	
	if (isnil "_etat_du_radar_sfp") then 
	{
		_le_radar_sfp setvariable ["radar_sfp_desactive",true,true];
		[[[_le_radar_sfp],"divers\radar\radar_detruire_reparer_fumee.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
	}else
	{
		_le_radar_sfp setvariable ["radar_sfp_desactive",nil,true];
		
		player setvariable ["mon_argent_banque_by_sfp_maxou", ((player getvariable "mon_argent_banque_by_sfp_maxou") + 20000), true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp"; 

		message_en_bas_de_couleur_sfp spawn {sleep 4; "Prime de 20 000 € reçu pour la réparation du radar." call _this;};
	};
} else 
{
	"Action sur le radar interrompu." call message_en_bas_de_couleur_sfp;
	if (count (nearestObjects [getPosATL player, ['SpeedRadar1'], 3]) < 1) then {"Action sur le radar interrompu puisque tu t'es éloigné." call message_en_bas_de_couleur_sfp;};
};

player playActionNow "medicstop";	
player switchmove "";
bar_de_progression_by_maxou_reinitialisation = true;
autorisation_detruire_radar = nil;
