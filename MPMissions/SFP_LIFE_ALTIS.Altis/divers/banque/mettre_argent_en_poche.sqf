// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "temps_attente_avant_virement") then {temps_attente_avant_virement = 0;};
if (temps_attente_avant_virement == 1) exitwith {hint "Tu viens déjà de faire un virement, patiente quelques secondes !";};

if(floor parseNumber (ctrlText 1400) > 0) then 
{
	if((player getVariable 'mon_argent_banque_by_sfp_maxou') >= floor parseNumber (ctrlText 1400)) then 
	{
		temps_attente_avant_virement = 1;
		player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') - floor parseNumber (ctrlText 1400),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		player setVariable['mon_argent_poche_by_sfp_maxou',(player getVariable 'mon_argent_poche_by_sfp_maxou') + floor parseNumber (ctrlText 1400),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		hint format ["%1 euros ont bien étés mit en poche !",floor parseNumber (ctrlText 1400)];
		
		_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
		_detail_du_log = format ["%1 à mit en poche %2 Euros.",name player, floor parseNumber (ctrlText 1400)];
		["Historique Argent En Poche Joueurs", "Historique Argent En Poche Joueurs", _heure_du_log, _detail_du_log] call fn_SaveToServer;		
		
		closeDialog 0;
		execVM 'divers\banque\menu_banque.sqf';
		sleep 10;
		temps_attente_avant_virement = 0;
	};
};