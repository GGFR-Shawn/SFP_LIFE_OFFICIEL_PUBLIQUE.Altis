// =======================================================================================================================================================================================
								// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
								  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

[] spawn {sleep 600; je_veux_cambrioler = 0; publicvariable "je_veux_cambrioler";};
"je_veux_cambrioler_activation_headless" addPublicVariableEventHandler 
{
	"DIAG SFP : Cambriolage : Demande recu par le serveur." spawn historique_creation_log_sfp;

	if (!isnil "je_veux_cambrioler_reception_ok") exitwith {};
	if (je_veux_cambrioler < 1) exitwith {};
	
	"DIAG SFP : Cambriolage : Demande validé par le serveur." spawn historique_creation_log_sfp;

	je_veux_cambrioler_reception_ok = true;
	
	sleep 1200;
	
	je_veux_cambrioler_reception_ok = nil;
	
	je_veux_cambrioler = 0;
	publicvariable "je_veux_cambrioler";
	
	"DIAG SFP : Cambriolage : De nouveau accessible." spawn historique_creation_log_sfp;	
};


"station_service_en_cours_de_braquage" addPublicVariableEventHandler 
{
	if (!isnil "station_service_en_cours_de_braquage_reception_ok") exitwith {};
	if (station_service_en_cours_de_braquage < 1) exitwith {};
	
	station_service_en_cours_de_braquage_reception_ok = true;
	
	sleep 1200;
	
	station_service_en_cours_de_braquage_reception_ok = nil;
	
	station_service_en_cours_de_braquage = 0;
	sleep 0.045;
	publicvariable "station_service_en_cours_de_braquage";
};
