// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// =================================================================================================================================================================
																			// CHOIX SI METEORITE //
// =================================================================================================================================================================
waituntil {sleep 1; !isnil "sfp_config_activer_meteorite"};

_choix_si_meteorite = ["1","2","3"] call bis_fnc_selectrandom;
if (_choix_si_meteorite != "1") exitwith {};
if (!sfp_config_activer_meteorite) exitwith {};
// =====================================================================================================================================================================================================================
																		// TEMPS D'ATTENTE METEORITE //
// =====================================================================================================================================================================================================================
"DIAG SFP : Météorite : Démarrage du script en attente." spawn historique_creation_log_sfp;

_temps_attente_meteorite = round ((20 * 60) + ((random 60) * 60)); // Minimum 20 minutes
sleep _temps_attente_meteorite;
// =================================================================================================================================================================
															// ENREGISTRER INIDB HISTORIQUE //
// =================================================================================================================================================================

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Meteorite", "Historique Meteorite", _heure_du_log, "Demarrage script meteorites."] call saveToDB;
"DIAG SFP : Météorite : Démarrage du script validé." spawn historique_creation_log_sfp;
// =================================================================================================================================================================

// =================================================================================================================================================================
																		// PUISSANCE ET DUREE DU METEORITE //
// =================================================================================================================================================================
puissance_des_meteorites = [1,2,3,4,5,6,7,8,9,10] call bis_fnc_selectrandom;
duree_de_la_pluie_des_meteorites = (20 + (random 20));

// =================================================================================================================================================================
																	// NOM DES VILLES OU FAIRE L'EFFET //
// =================================================================================================================================================================
nom_secteur_meteorites = ["Neochori","Alikampos","Edessa","Dorida","Agios Konstantinos","kalithea","Zaros","Chalkeia","poliakko","Kavala","Lakka","Therisa","Neochori","Pyrgos","Agios_dionysios","Charkia","Stravos","Panochori"] call bis_fnc_selectrandom;

// =================================================================================================================================================================
																// CONVERTIR LA VILLE EN TRIGGER DE POSITION //
// =================================================================================================================================================================
if (nom_secteur_meteorites == "Neochori") then {nom_secteur_meteorites_position = Neochori;};if (nom_secteur_meteorites == "Alikampos") then {nom_secteur_meteorites_position = Alikampos;};if (nom_secteur_meteorites == "Edessa") then {nom_secteur_meteorites_position = Edessa;};if (nom_secteur_meteorites == "Dorida") then {nom_secteur_meteorites_position = Dorida;};
if (nom_secteur_meteorites == "kalithea") then {nom_secteur_meteorites_position = kalithea;};if (nom_secteur_meteorites == "Zaros") then {nom_secteur_meteorites_position = Zaros;};if (nom_secteur_meteorites == "Chalkeia") then {nom_secteur_meteorites_position = Chalkeia;};if (nom_secteur_meteorites == "poliakko") then {nom_secteur_meteorites_position = poliakko;};if (nom_secteur_meteorites == "Kavala") then {nom_secteur_meteorites_position = Kavala;};
if (nom_secteur_meteorites == "Lakka") then {nom_secteur_meteorites_position = Lakka;};if (nom_secteur_meteorites == "Therisa") then {nom_secteur_meteorites_position = Therisa;};if (nom_secteur_meteorites == "Neochori") then {nom_secteur_meteorites_position = Neochori;};if (nom_secteur_meteorites == "Pyrgos") then {nom_secteur_meteorites_position = Pyrgos;};
if (nom_secteur_meteorites == "Agios_dionysios") then {nom_secteur_meteorites_position = Agios_dionysios;};
if (nom_secteur_meteorites == "Charkia") then {nom_secteur_meteorites_position = Charkia;};if (nom_secteur_meteorites == "Stravos") then {nom_secteur_meteorites_position = Stravos;};
if (nom_secteur_meteorites == "Panochori") then {nom_secteur_meteorites_position = Panochori;};

if (isnil "nom_secteur_meteorites_position") exitwith {sleep 0.3; execvm "partie_serveur\divers_propre\meteorite\meteorite_serveur_initialisation.sqf";};
// =================================================================================================================================================================
																// AVERTIR TOUS LES JOUEURS DU METEORITE //
// =================================================================================================================================================================
publicvariable "puissance_des_meteorites";
publicvariable "nom_secteur_meteorites";

sleep 1; // Pour attendre l'envoi de la variable

// Joueur actuellement connecté
[{titletext [format ["! METEORITE ! \n ---------------------------------------------------------------- \n Attention, une pluie de météorite de niveau %1 à été apercu au dessus de Altis (%2) ! \n Méfiance !!!!!! \n --------------- \n By SFP Maxou",puissance_des_meteorites, nom_secteur_meteorites],"PLAIN DOWN"]},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;

// Joueur se connectant (pour information)
// [] spawn 
// {
	// sleep (60 * 3);
	// [{titletext [format ["! METEORITE ! \n ---------------------------------------------------------------- \n Suite à la dernière pluie de météorite de niveau %1 sur Altis (%2) ! \n Des maisons ont peut être étées détruites ! \n --------------- \n By SFP Maxou",puissance_des_meteorites, nom_secteur_meteorites],"PLAIN DOWN"]},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
// };
// =================================================================================================================================================================
														// CREER SERVEUR ET ENVOYER SUR LES JOUEURS L'EFFET METEORITE //
// =================================================================================================================================================================

"DIAG SFP : Météorite : Démarrage du script validé et en attente." spawn historique_creation_log_sfp;

sleep (30 + (random 250)); // Attente simulation que les météorites arrivent

for "_i" from 0 to (round (duree_de_la_pluie_des_meteorites / 2)) do
{
	_pos_un = [10000,-10000] call bis_fnc_selectrandom;
	_pos_deux = [10000,-10000] call bis_fnc_selectrandom;
	
	[[(position nom_secteur_meteorites_position select 0) + (random _pos_un),(position nom_secteur_meteorites_position select 1) + (random _pos_deux),(800 + (random 1000))]] execvm "partie_serveur\divers_propre\meteorite\creation_des_meteorites_serveur.sqf";
	
	_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
	["Historique Meteorite", "Historique Meteorite", _heure_du_log, "Lancement d une meteorites."] call saveToDB;
	"DIAG SFP : Météorite : Lancement d'une météorite." spawn historique_creation_log_sfp;

	sleep (7 + (random 10));
};

// =================================================================================================================================================================
															// ENREGISTRER INIDB HISTORIQUE //
// =================================================================================================================================================================
_heure_du_log = format ["%1/%2/%3 à %4H%5Min:", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4];
_detail_du_log = format ["Des météorites sont tombés sur Altis, l effet etait de %1 ...", puissance_des_meteorites];
["Historique Meteorite", "Historique Meteorite", _heure_du_log, _detail_du_log] call saveToDB;
"DIAG SFP : Météorite : Fin du script météorite." spawn historique_creation_log_sfp;
