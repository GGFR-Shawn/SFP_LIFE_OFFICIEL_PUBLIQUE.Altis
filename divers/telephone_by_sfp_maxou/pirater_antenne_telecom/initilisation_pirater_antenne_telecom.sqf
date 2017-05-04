// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_l_antenne_telecom_choisit";
_antenne_telecom = 	nearestObjects [position player, ["Land_Communication_F"], 30];
if (count _antenne_telecom < 1) exitwith {hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé aucune antenne n'a été trouvée. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (!isnil {(_antenne_telecom select 0) getvariable "antenne_sfp_telecom_desactive"}) exitwith {hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé cette antenne est actuellement HS (détruite par un joueur). \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (isnil {player getvariable "marteau_sfp"}) exitWith {hint "! SFP TELECOM ! \n ---------------------------- \n\n Désolé il vous faut un marteau pour faire cette opération. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (isnil {(_antenne_telecom select 0) getvariable "temps_total_avant_fin_action"}) then {(_antenne_telecom select 0) setvariable ["temps_total_avant_fin_action", 300, false];};
if (isnil "autorisation_pirater_relais_telecom") then {autorisation_pirater_relais_telecom = 0;};
if (autorisation_pirater_relais_telecom >= 1) exitWith {hint "! SFP TELECOM !\n ------------------------------------- \n Désolé, \n\n Vous avez déja fait l'action !\n --------------------------------------------- \n By Maxou \n www.sfpteam.fr";};

_l_antenne_telecom_choisit = _antenne_telecom select 0;
autorisation_pirater_relais_telecom = 1;

if (isnil {_l_antenne_telecom_choisit getvariable "antenne_telecom_pirater"}) then
{
	_temps_de_destruction = _l_antenne_telecom_choisit getvariable "temps_total_avant_fin_action";
	_temps_de_destruction spawn {[_this] call bar_de_progression_by_maxou;};
	
	[[[getPosATL player, player],"divers\telephone_by_sfp_maxou\pirater_antenne_telecom\systeme_de_reseau_pirater_une_antenne_avertir_gendarmes.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

	while {alive player && (player distance _l_antenne_telecom_choisit) < 18 && _l_antenne_telecom_choisit getvariable "temps_total_avant_fin_action" > 0} do 
	{
		player playActionNow "medicstartup";
		(format["L'antenne relais sera piratée dans %1 secondes.", _l_antenne_telecom_choisit getvariable "temps_total_avant_fin_action"]) call message_en_bas_de_couleur_sfp;
		_l_antenne_telecom_choisit setvariable ["temps_total_avant_fin_action",(_l_antenne_telecom_choisit getvariable "temps_total_avant_fin_action") - 1,false];
		sleep 1;
	};

	if (_l_antenne_telecom_choisit getvariable "temps_total_avant_fin_action" <= 0) then 
	{
		_l_antenne_telecom_choisit setvariable ["temps_total_avant_fin_action",nil,false];
		_l_antenne_telecom_choisit setvariable ["antenne_telecom_pirater",true,true];
		"... Vous pouvez maintenant envoyer un message anonyme à toute l'ile ..." call message_en_bas_de_couleur_sfp;
		
	} else 
	{
		"Action sur l'antenne interrompu." call message_en_bas_de_couleur_sfp;
		if (player distance _l_antenne_telecom_choisit >= 18) then {"Action sur l'antenne interrompu puisque tu t'es éloigné." call message_en_bas_de_couleur_sfp;};
	};
	
	player playActionNow "medicstop";	
	player switchmove "";
	bar_de_progression_by_maxou_reinitialisation = true;	
}else
{
	if (blackout_reseau_telecom > 0) exitwith {Hint format ["! SFP TELECOM ! \n ---------------------------- \n\n Désolé, un black-out réseau est en cours ! \n\n Réparation estimé : %1 Minutes. \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr",round (blackout_reseau_telecom)];};
	
	"... Vous pouvez envoyer un message anonyme à toute l'ile ..." call message_en_bas_de_couleur_sfp;

	cutText["","BLACK FADED"];
	0 cutFadeOut 9999999;

	createdialog "Tchat_Pirate_By_Maxou";
	((uiNamespace getVariable "Tchat_Pirate_By_Maxou") displayCtrl 1009) ctrlSetTextColor [0,0.91,0.07,1];
	((uiNamespace getVariable "Tchat_Pirate_By_Maxou") displayCtrl 1009) ctrlSetText "Inconnu sur antenne piraté";

	_listes_des_joueurs = 0;
	{
		lbSetColor [11173, _listes_des_joueurs, _couleur_choisit_affichage_joueur];		
		_listes_des_joueurs = round (_listes_des_joueurs + 1);
		lbAdd [11173, format ["Joueur sur antenne piraté n° %1", _listes_des_joueurs]];
	} forEach playableUnits;

	if (_listes_des_joueurs < 1) then
	{
		lbAdd [11173, "Personne n'est connecté ..."];		
		lbSetColor [11173, 0, [0.98,0.05,0,1]];
	};

	waituntil {!dialog;};
	cutText["","BLACK IN"];
};

autorisation_pirater_relais_telecom = nil;
