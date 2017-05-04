// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_nom_joueur_transfert_argent", "_nom_joueur_recoit_argent","_montant_argent_transfere"];
if (isnil "temps_attente_avant_virement") then {temps_attente_avant_virement = 0;};
if (temps_attente_avant_virement >= 1) exitwith {hint "Tu viens déjà de faire un virement, patiente quelques secondes !";};

if ((lbCurSel 1500) == -1) exitwith {hint "Désolé, personne n'est sélectionné !";}; 

if (floor parseNumber (ctrlText 1400) > 0) then 
{
	if((player getVariable 'mon_argent_banque_by_sfp_maxou') >= floor parseNumber (ctrlText 1400)) then 
	{
		temps_attente_avant_virement = 1;
		
		_nom_joueur_transfert_argent = name player;
		_nom_joueur_recoit_argent = lbtext [1500, lbCurSel 1500];
		_montant_argent_transfere = (floor parseNumber (ctrlText 1400));
		fraisdevirement_un = (floor parseNumber (ctrlText 1400)) / 100;
		fraisdevirement_deux = fraisdevirement_un * 2;
		
		player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') - fraisdevirement_deux,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		player setVariable['mon_argent_banque_by_sfp_maxou',(player getVariable 'mon_argent_banque_by_sfp_maxou') - floor parseNumber (ctrlText 1400),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
		
		hint format ["! TRANSFERT BANCAIRE ! \n -------------------------------------------- \n \n Le virement d'un montant de %1 Euros à destination de %2 à bien été éxécuté. \n\n Des frais à hauteur de 2 pourcent concernant les frais de virement ont étés prélevés, soit %3 Euros ! \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",floor parseNumber (ctrlText 1400),_nom_joueur_recoit_argent,fraisdevirement_deux];
		
		[[[_nom_joueur_transfert_argent, _nom_joueur_recoit_argent, _montant_argent_transfere],"divers\banque\virement_argent_recu.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
		
		_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
		_detail_du_log = format ["%1 à transféré %2 Euros à %3.",name player, floor parseNumber (ctrlText 1400), _nom_joueur_recoit_argent];
		["Historique Argent Virement Joueurs", "Historique Argent Virement Joueurs", _heure_du_log, _detail_du_log] call fn_SaveToServer;

		closeDialog 0;
		sleep 10;
		temps_attente_avant_virement = 0;
	}else
	{
		hint "Désolé, tu n'as pas assez d'argent sur ton compte bancaire !";
	};
}else
{
	hint "Désolé, il faut entrer plus de 0 Euros !";
};