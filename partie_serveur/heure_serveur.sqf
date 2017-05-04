// =======================================================================================================================================================================================
										// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
										  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

#include "\userconfig\password_serveur\password_commande_sfp.hpp";

[] spawn
{
	// Pour attendre chargement des objets, achats des maisons etc
	sleep (round (60 * 12)); 

	le_serveur_vient_de_demarrer = 0;
	publicvariable "le_serveur_vient_de_demarrer";
};
				
// =================================================================================================================================================================================================		
													// SECURITE 20 MINUTES AVANT //
// =================================================================================================================================================================================================		

// Initialisation variable securite redemarrage 20 minutes
le_serveur_va_redemarrer_dans_20_minutes = 0; 
sleep 1;
publicVariable "le_serveur_va_redemarrer_dans_20_minutes";


private "_heure_redemarrage_securite_20_minutes";
waituntil {sleep 0.1; !isnil "sfp_config_choix_heure_redemarrage" && !isnil "heure_sfp"};

_heure_redemarrage_securite_20_minutes = [];
{
	_calcul = (format ["%1,40",round (_x - 1)]);
	_heure_redemarrage_securite_20_minutes pushback _calcul;
} foreach sfp_config_choix_heure_redemarrage;


while {true} do
{
	heure_serveur = "" call heure_sfp;
	heure_serveur set [3, round ((heure_serveur select 3) + 2)];
	if (heure_serveur select 3 >= 26) then {heure_serveur set [3,2]; heure_serveur set [2,round ((heure_serveur select 2) + 1)];};
	if (heure_serveur select 3 >= 25) then {heure_serveur set [3,1]; heure_serveur set [2,round ((heure_serveur select 2) + 1)];};
	if (heure_serveur select 3 >= 24) then {heure_serveur set [3,0]; heure_serveur set [2,round ((heure_serveur select 2) + 1)];};
	publicVariable "heure_serveur";

	_calcul_heure_securite = format ["%1,%2",round (heure_serveur select 3), round (heure_serveur select 4)];
	if (_calcul_heure_securite in _heure_redemarrage_securite_20_minutes) then 
	{
		if (isnil "redemarrage_du_serveur_avertit") then
		{
			redemarrage_du_serveur_avertit = true;
			
			le_serveur_va_redemarrer_dans_20_minutes = 1;
			publicvariable "le_serveur_va_redemarrer_dans_20_minutes";
			
			[[[],"divers\divers\redemarrage_du_serveur.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
		};
	};
	
	// Lancement script divers
	if (daytime > 22 or dayTime < 5 && isnil "lancement_script_fonction_heure") then
	{
		lancement_script_fonction_heure = true;
		
		[] execvm "partie_serveur\divers_propre\meteorite\meteorite_serveur_initialisation.sqf";
		[] execvm "partie_serveur\divers_propre\etoile_filante\etoile_filante_serveur_initialisation.sqf";
		[] execvm "partie_serveur\divers_propre\feux_d_artifice\creation_feux_artifice_serveur.sqf";
		[] execvm "partie_serveur\divers_propre\eteindre_lumiere_de_la_ville\eteindre_lumiere_de_la_ville_serveur.sqf";
	};
	
	// Lancement script toutes les heures 
	if (heure_serveur select 4 == 00) then
	{
		execvm "partie_serveur\divers_propre\divers\compter_les_services_connectes_pour_historique.sqf";
	};
	
	// Reboot du serveur
	if ((round (heure_serveur select 3)) in sfp_config_choix_heure_redemarrage && (round (heure_serveur select 4)) == 0) then 
	{
		_Password_sfp = mot_de_passe_admin_sfp;
		_Password_sfp serverCommand sfp_config_choix_redemarrage;
	};

	sleep 60;
};