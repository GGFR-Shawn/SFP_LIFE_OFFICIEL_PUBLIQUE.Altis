// ===================================================================================================================================================================================================================
														// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
														  // Poursuite pénal possible ! Voir amar.arma3.fr //
// ===================================================================================================================================================================================================================


"le_vehicule_a_surveiller_pour_supprimer" addPublicVariableEventHandler 
{
	"DIAG SFP : Supprimer véhicule transport : Demande suivi d'un véhicule." spawn historique_creation_log_sfp;
	
	private ["_le_vehicule","_proprietaire_du_vehicule","_condition"];
	_le_vehicule = le_vehicule_a_surveiller_pour_supprimer; le_vehicule_a_surveiller_pour_supprimer = nil;
	_proprietaire_du_vehicule = _le_vehicule getvariable "vehicule_info_parvariable" select 0;
	if (isnil "_le_vehicule" or isnil "_proprietaire_du_vehicule") exitwith {};
	
	"DIAG SFP : Supprimer véhicule transport : Demande suivi d'un véhicule validé." spawn historique_creation_log_sfp;
	
	while {alive _le_vehicule} do
	{
		_condition = false;
		{
			if (name _x == _proprietaire_du_vehicule) then
			{
				_condition = true;
			};
		} foreach allunits;
		
		if (!_condition) then 
		{
			deletevehicle _le_vehicule;
			
			_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
			_detail_du_log = format ["Le vehicule de %1 à été supprimé car il c'est déconnecté.", _proprietaire_du_vehicule];
			["Historique Script Vehicule Livraison Etc", "Historique Script Vehicule Livraison Etc", _heure_du_log, _detail_du_log] call saveToDB;
			"DIAG SFP : Supprimer véhicule transport : Véhicule supprimé car joueur non connecté." spawn historique_creation_log_sfp;
		};
		
		sleep 3;
	};
};

