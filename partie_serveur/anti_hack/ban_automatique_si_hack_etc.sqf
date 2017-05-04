// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : Ban automatique : Initialisation démarré" spawn historique_creation_log_sfp;

_check_fichier_ban = ("AUTO BAN Script Maxou") call base_de_donnee_existante; 

if !(_check_fichier_ban) then 
{
	listes_joueurs_banni_automatiquement = []; 
	sleep 0.5; 
	publicvariable "listes_joueurs_banni_automatiquement";
	
	["AUTO BAN Script Maxou", "AUTO BAN Script Maxou", "Listes des joueurs banni", listes_joueurs_banni_automatiquement] call saveToDB;
}else
{
	listes_joueurs_banni_automatiquement = ["AUTO BAN Script Maxou", "AUTO BAN Script Maxou", "Listes des joueurs banni", "test_valeur_existe"] call loadFromDB_Local_Serveur; 
	
	if (!([listes_joueurs_banni_automatiquement] call verification_si_donnee_existe)) then
	{	
		listes_joueurs_banni_automatiquement = []; 
	};
	
	publicvariable "listes_joueurs_banni_automatiquement";
};


"mettre_a_jour_liste_ban_auto" addPublicVariableEventHandler 
{
	if (isnil "mettre_a_jour_liste_ban_auto") exitwith {};
	
	listes_joueurs_banni_automatiquement = listes_joueurs_banni_automatiquement + [mettre_a_jour_liste_ban_auto];
	publicvariable "listes_joueurs_banni_automatiquement";
	mettre_a_jour_liste_ban_auto = nil;
	
	["AUTO BAN Script Maxou", "AUTO BAN Script Maxou", "Listes des joueurs banni", listes_joueurs_banni_automatiquement] call saveToDB;
	
	"DIAG SFP : Ban automatique : mit à jour 1." spawn historique_creation_log_sfp;
};

"rescan_mettre_a_jour_liste_ban_auto" addPublicVariableEventHandler 
{
	["AUTO BAN Script Maxou", "AUTO BAN Script Maxou", "Listes des joueurs banni", listes_joueurs_banni_automatiquement] call saveToDB;

	"DIAG SFP : Ban automatique : mit à jour 2." spawn historique_creation_log_sfp;
};
