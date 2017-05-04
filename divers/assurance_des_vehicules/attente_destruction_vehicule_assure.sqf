// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_vehicule = _this select 0;
_sa_plaque = _le_vehicule getvariable "plaque_immatriculation_news" select 0;
_le_proprietaire = _le_vehicule getvariable "vehicule_info_parvariable" select 0;
_montant_du_remboursement = _le_vehicule getvariable "voiture_possede_une_assurance";
if (isnil "_le_vehicule" or isnil "_sa_plaque" or isnil "_le_proprietaire" or isnil "_montant_du_remboursement") exitwith {hint "Erreur, lancement de votre assurance ...";};

while {alive _le_vehicule} do
{
	sleep 3;
};

if (isNull _le_vehicule) exitwith {}; // rien n'a faire puisque sauvegardé
if (_le_proprietaire != _le_vehicule getvariable "vehicule_info_parvariable" select 0) exitwith {}; // rien n'a faire puisque vendu

if !(alive _le_vehicule) then
{
	hint format ["! ASSUR'SFP ! \n ------------------------------------- \n\n Le véhicule %1 à bien été remboursé de son explosion (%2 %3). \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou", getText ( configFile >> "CfgVehicles" >> typeof _le_vehicule >> "displayName"), (_montant_du_remboursement) call retour_formatage_chiffre_sfp, "€"];
	titletext [format ["! ASSUR'SFP ! \n ---------------------------------------------------------------- \n Le véhicule %1 à bien été remboursé de son explosion (%2 %3). \n --------------- \n By SFP Maxou", getText ( configFile >> "CfgVehicles" >> typeof _le_vehicule >> "displayName"), (_montant_du_remboursement) call retour_formatage_chiffre_sfp, "€"],"PLAIN",3];
	
	player setvariable ["mon_argent_banque_by_sfp_maxou", (player getvariable "mon_argent_banque_by_sfp_maxou") + (_montant_du_remboursement), true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp"; 
	
	_heure_du_message = format ["%1/%2/%3 à %4H%5Min (Arma : %6) :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
	_detail_du_message = format ["%1 a été remboursé de %2 (vehicule : %3 -- Plaque %4) explosé.",name player, (_montant_du_remboursement) call retour_formatage_chiffre_sfp, typeof _le_vehicule, le_vehicule_a_assurer_sfp getvariable "plaque_immatriculation_news" select 0];
	["Historique Assurance Souscription", "Historique Assurance Souscription", _heure_du_message, _detail_du_message] call fn_SaveToServer;
};