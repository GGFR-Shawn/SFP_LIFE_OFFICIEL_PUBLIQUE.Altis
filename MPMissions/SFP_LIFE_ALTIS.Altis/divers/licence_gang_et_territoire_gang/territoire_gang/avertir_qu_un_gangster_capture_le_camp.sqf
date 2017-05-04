// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_gang_prenant_le_camp";
_gang_prenant_le_camp = _this select 0;
_personne_connecte_ayant_le_camp = _this select 1;
if (isnil "_gang_prenant_le_camp" or isnil "_personne_connecte_ayant_le_camp") exitwith {hint "Erreur, reconnaissance gang ...";};

if (player in _personne_connecte_ayant_le_camp) then
{
	if (_gang_prenant_le_camp == "licence_gang_v2") then {_gang_prenant_le_camp = "d'un gang non officiel";};
	if (_gang_prenant_le_camp == sfp_config_famille_une_nom_pour_variable) then {_gang_prenant_le_camp = format ["de la %1", sfp_config_famille_une_nom];};
	if (_gang_prenant_le_camp == sfp_config_famille_deux_nom_pour_variable) then {_gang_prenant_le_camp = format ["de la %1", sfp_config_famille_deux_nom];};

	systemchat format ["Attention, un membre %1 capture votre camp !", _gang_prenant_le_camp];
	titletext [format ["Attention, un membre %1 capture votre camp !", _gang_prenant_le_camp],"PLAIN"];
};