// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if ((player getVariable "mon_argent_banque_by_sfp_maxou") < 600000) then
{
	["Jail",["Bribe FAILED", "Vous devez avoir 600000 Euros pour soudoyer le garde !"]] call bis_fnc_showNotification;
}else
{
	disableUserInput false;
	hint "Le garde refléchit à ta proposition ...";
	sleep 4;
	if (!isnil {player getvariable "bombe_porte_prison"}) then {player setVariable["bombe_porte_prison",nil,true];};
	if (!isnil {player getvariable "jai_un_sac_sur_la_tete"}) then {player setVariable["jai_un_sac_sur_la_tete",nil,true];};
	if (!isnil {player getvariable "jai_fait_un_cambriolage_news"}) then {player setVariable["jai_fait_un_cambriolage_news",nil,true];};
	if (!isnil {player getvariable "recherche_pour_armes_illegales"}) then {player setVariable["recherche_pour_armes_illegales",nil,true];};
	if (!isnil {player getvariable "joueur_arreter"}) then {player setVariable["joueur_arreter",nil,true];};
	player setVariable["evade_de_prison",0,false];
	joueur_en_prison = true;
	player setVariable["mon_argent_banque_by_sfp_maxou",(player getVariable "mon_argent_banque_by_sfp_maxou") - 600000,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	hintsilent "";	
	["Bail",["Bribe Accepted", "Le garde à accepter votre argent ! Vous êtes libre!"]] call bis_fnc_showNotification;
	jai_le_droit_de_me_tp = 1; 
	player setPos (getmarkerpos "respawn_civilian");
	soudoyerlegarde = 1;
};