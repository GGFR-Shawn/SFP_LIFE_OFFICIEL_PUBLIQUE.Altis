// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 2; !isnil "fin_verification_apres_chargement"};
sleep 10;

private ["_temps_avant_d_avoir_un_chargement_gratuit","_fin_detection_protection_temps_chargement_et_sauvegarde"];
_temps_mise_a_jour = 2;
_temps_autoriser_entre_chaque_modif_sauvegarde = round (7 * 60);
temps_avant_de_pouvoir_utiliser_la_sauvegarde = 0;
nombre_de_vehicule_autorise_max_par_default = 4;

if (!isnil {["nombre_de_vehicule_autorise_max_actuellement"] call uid_sauvegarde_lire_local_joueur_sfp}) then {nombre_de_vehicule_autorise_max_actuellement = ["nombre_de_vehicule_autorise_max_actuellement"] call uid_sauvegarde_lire_local_joueur_sfp;} else {nombre_de_vehicule_autorise_max_actuellement = nombre_de_vehicule_autorise_max_par_default; ['nombre_de_vehicule_autorise_max_actuellement', nombre_de_vehicule_autorise_max_actuellement] call uid_sauvegarde_ecrire_local_joueur_sfp;};
if (nombre_de_vehicule_autorise_max_actuellement > nombre_de_vehicule_autorise_max_par_default) then {nombre_de_vehicule_autorise_max_actuellement = nombre_de_vehicule_autorise_max_par_default; ['nombre_de_vehicule_autorise_max_actuellement', nombre_de_vehicule_autorise_max_actuellement] call uid_sauvegarde_ecrire_local_joueur_sfp;};
if (getplayeruid player in sfp_config_liste_moderateur) then {nombre_de_vehicule_autorise_max_par_default = 9999; nombre_de_vehicule_autorise_max_actuellement = 9999;};

// Offrir un chargement à chaque connection 
if (nombre_de_vehicule_autorise_max_actuellement <= 0) then 
{
	if (!isnil {["temps_avant_d_avoir_un_chargement_gratuit"] call uid_sauvegarde_lire_local_joueur_sfp}) then 
	{
		_temps_avant_d_avoir_un_chargement_gratuit = ["temps_avant_d_avoir_un_chargement_gratuit"] call uid_sauvegarde_lire_local_joueur_sfp;
	}else 
	{
		_temps_avant_d_avoir_un_chargement_gratuit = 60; 
		['temps_avant_d_avoir_un_chargement_gratuit', _temps_avant_d_avoir_un_chargement_gratuit] call uid_sauvegarde_ecrire_local_joueur_sfp;
	};
	
	if (_temps_avant_d_avoir_un_chargement_gratuit >= 60) then
	{
		nombre_de_vehicule_autorise_max_actuellement = 1;
		['temps_avant_d_avoir_un_chargement_gratuit', 0] call uid_sauvegarde_ecrire_local_joueur_sfp;
		[] spawn {sleep 30; titletext ["Avant votre déconnection, vous n'avez plus de mouvement de sauvegarde. Nous venons de vous en offrir 1. \n\n Le prochain sera de nouveau disponible dans 60 minutes !","PLAIN"];};
	};
	
	_temps_avant_d_avoir_un_chargement_gratuit spawn
	{
		while {_this < 60} do
		{
			['temps_avant_d_avoir_un_chargement_gratuit', round (_this + 1)] call uid_sauvegarde_ecrire_local_joueur_sfp;
			sleep 60;
		};
	};
};
	
while {isnil "_fin_detection_protection_temps_chargement_et_sauvegarde"} do
{
	_demarrage = 0;
	while {_demarrage < _temps_autoriser_entre_chaque_modif_sauvegarde && nombre_de_vehicule_autorise_max_actuellement < nombre_de_vehicule_autorise_max_par_default} do
	{
		_demarrage = round (_demarrage + _temps_mise_a_jour);
		temps_avant_de_pouvoir_utiliser_la_sauvegarde = round (_temps_autoriser_entre_chaque_modif_sauvegarde - _demarrage);
		if (_demarrage >= _temps_autoriser_entre_chaque_modif_sauvegarde) then
		{
			_demarrage = 0;
			if (nombre_de_vehicule_autorise_max_actuellement < nombre_de_vehicule_autorise_max_par_default) then 
			{
				nombre_de_vehicule_autorise_max_actuellement = round (nombre_de_vehicule_autorise_max_actuellement + 1);
				titletext [format ["Sauvegarde véhicule de nouveau accessible ! Actuellement %1 autorisé !", nombre_de_vehicule_autorise_max_actuellement],"PLAIN DOWN"];
				
				['nombre_de_vehicule_autorise_max_actuellement', nombre_de_vehicule_autorise_max_actuellement] call uid_sauvegarde_ecrire_local_joueur_sfp;
			};
		};
		sleep _temps_mise_a_jour;
	};
	
	sleep _temps_mise_a_jour;
	
	if (!isnil "jesuis_au_taff_a_la_sarl_car_shop_pour_respawn") then {_fin_detection_protection_temps_chargement_et_sauvegarde = true;};
	if (!isnil "jesuis_au_taff_a_la_sarl_taxis_gsept") then {_fin_detection_protection_temps_chargement_et_sauvegarde = true;};
};

nombre_de_vehicule_autorise_max_par_default = 100;
nombre_de_vehicule_autorise_max_actuellement = 100;

titletext [format ["Vous êtes maintenant whiteliste pour avoir plus de mouvement de sauvegarde ! \n\n Vous avez droit maintenant à %1 mouvements !", nombre_de_vehicule_autorise_max_actuellement],"PLAIN DOWN"];
