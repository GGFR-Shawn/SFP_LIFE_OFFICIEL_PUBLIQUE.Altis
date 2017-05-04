// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : Argent gendarmerie : Démarrage du script." spawn historique_creation_log_sfp;

/* 
	Explication :
	Valeur 1 = Personne autorisé à extraire de l'argent
	Valeur 2 = Argent sur le compte
*/

_check_whitelist = ("fond_argent_de_la_gendarmerie") call base_de_donnee_existante; 

if !(_check_whitelist) then 
{
	argent_de_la_gendarmerie = [["[SFP] Maxou"], 1000];
	["fond_argent_de_la_gendarmerie", "fond_argent_de_la_gendarmerie", 'argent_de_la_gendarmerie', argent_de_la_gendarmerie] call saveToDB;
}else
{
	argent_de_la_gendarmerie = ["fond_argent_de_la_gendarmerie", 'fond_argent_de_la_gendarmerie', "argent_de_la_gendarmerie", "test_valeur_existe"] call loadFromDB_Local_Serveur; 
};

publicvariable "argent_de_la_gendarmerie";

"argent_de_la_gendarmerie" addPublicVariableEventHandler 
{
	["fond_argent_de_la_gendarmerie", "fond_argent_de_la_gendarmerie", 'argent_de_la_gendarmerie', argent_de_la_gendarmerie] call saveToDB;
};

"DIAG SFP : Argent gendarmerie : Fin du script." spawn historique_creation_log_sfp;
