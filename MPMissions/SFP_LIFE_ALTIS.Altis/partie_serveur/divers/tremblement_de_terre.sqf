// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
/*
	Micro	Moins de 1,9	Micro tremblement de terre, non ressenti9.	8 000 par jour
	Très mineur	2,0 à 2,9	Généralement non ressenti mais détecté/enregistré.	1 000 par jour
	Mineur	3,0 à 3,9	Souvent ressenti sans causer de dommages.	Léger	4,0 à 4,9	Secousses notables d'objets à l'intérieur des maisons, bruits d'entrechoquement. Les dommages restent très légers.	6 000 par an
	Modéré	5,0 à 5,9	Peut causer des dommages significatifs à des édifices mal conçus dans des zones restreintes. Pas de dommages aux édifices bien construits.	800 par an
	Fort	6,0 à 6,9	Peut provoquer des dommages sérieux sur plusieurs dizaines de kilomètres. Seuls les édifices adaptés résistent près du centre.	120 par an
	Très fort	7,0 à 7,9	Peut provoquer des dommages sévères dans de vastes zones ; tous les édifices sont touchés près du centre.	18 par an
	Majeur	8,0 à 8,9	Peut causer des dommages très sévères dans des zones à des centaines de kilomètres à la ronde. Dommages majeurs sur tous les édifices, y compris à des dizaines de kilomètres du centre.	1 par an
	Dévastateur	9,0 et plus	Dévaste des zones sur des centaines de kilomètres à la ronde. Dommages sur plus de 1000 kilomètres à la ronde.	
*/

// =================================================================================================================================================================
																// CHOIX SI TREMBLEMENT //
// =================================================================================================================================================================

waituntil {sleep 1; !isnil "sfp_config_activer_tremblement_de_terre"};

_choix_demarrage = ["1","2","3"] call bis_fnc_selectrandom;
if (_choix_demarrage != "1") exitwith {};
if (!sfp_config_activer_tremblement_de_terre) exitwith {};

sleep (60 * 160); // 2 heures 30

// =================================================================================================================================================================
															// ENREGISTRER INIDB HISTORIQUE //
// =================================================================================================================================================================
_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Tremblement De Terre", "Historique Tremblement De Terre", _heure_du_log, "Démarrage script tremblement de terre."] call saveToDB;
"DIAG SFP : Tremblement de terre démarré." spawn historique_creation_log_sfp;

// =================================================================================================================================================================
															// PUISSANCE ET DUREE DU TREMBLEMENT //
// =================================================================================================================================================================
puissance_du_tremblement_de_terre = [1,2,3,4,5,6,7,8,9,10] call bis_fnc_selectrandom;
duree_du_tremblement_de_terre = (20 + (random 30));

// =================================================================================================================================================================
															// NOM DES VILLES OU FAIRE L'EFFET //
// =================================================================================================================================================================
nom_secteur_tremblement_de_terre = ["Neochori","Alikampos","Edessa","Dorida","Agios Konstantinos","kalithea","Zaros","Chalkeia","poliakko","Kavala","Lakka","Therisa","Neochori","Pyrgos","Agios_dionysios","Charkia","Stravos","Panochori"] call bis_fnc_selectrandom;

// =================================================================================================================================================================
															// CONVERTIR LA VILLE EN TRIGGER DE POSITION //
// =================================================================================================================================================================
if (nom_secteur_tremblement_de_terre == "Neochori") then {nom_secteur_tremblement_de_terre_position = Neochori;};if (nom_secteur_tremblement_de_terre == "Alikampos") then {nom_secteur_tremblement_de_terre_position = Alikampos;};if (nom_secteur_tremblement_de_terre == "Edessa") then {nom_secteur_tremblement_de_terre_position = Edessa;};if (nom_secteur_tremblement_de_terre == "Dorida") then {nom_secteur_tremblement_de_terre_position = Dorida;};
if (nom_secteur_tremblement_de_terre == "kalithea") then {nom_secteur_tremblement_de_terre_position = kalithea;};if (nom_secteur_tremblement_de_terre == "Zaros") then {nom_secteur_tremblement_de_terre_position = Zaros;};if (nom_secteur_tremblement_de_terre == "Chalkeia") then {nom_secteur_tremblement_de_terre_position = Chalkeia;};if (nom_secteur_tremblement_de_terre == "poliakko") then {nom_secteur_tremblement_de_terre_position = poliakko;};if (nom_secteur_tremblement_de_terre == "Kavala") then {nom_secteur_tremblement_de_terre_position = Kavala;};
if (nom_secteur_tremblement_de_terre == "Lakka") then {nom_secteur_tremblement_de_terre_position = Lakka;};if (nom_secteur_tremblement_de_terre == "Therisa") then {nom_secteur_tremblement_de_terre_position = Therisa;};if (nom_secteur_tremblement_de_terre == "Neochori") then {nom_secteur_tremblement_de_terre_position = Neochori;};if (nom_secteur_tremblement_de_terre == "Pyrgos") then {nom_secteur_tremblement_de_terre_position = Pyrgos;};
if (nom_secteur_tremblement_de_terre == "Agios_dionysios") then {nom_secteur_tremblement_de_terre_position = Agios_dionysios;};
if (nom_secteur_tremblement_de_terre == "Charkia") then {nom_secteur_tremblement_de_terre_position = Charkia;};if (nom_secteur_tremblement_de_terre == "Stravos") then {nom_secteur_tremblement_de_terre_position = Stravos;};
if (nom_secteur_tremblement_de_terre == "Panochori") then {nom_secteur_tremblement_de_terre_position = Panochori;};

// =================================================================================================================================================================
															// AVERTIR TOUS LES JOUEURS DU TREMBLEMENT //
// =================================================================================================================================================================
publicvariable "puissance_du_tremblement_de_terre";
publicvariable "nom_secteur_tremblement_de_terre";
publicvariable "nom_secteur_tremblement_de_terre_position";
publicvariable "duree_du_tremblement_de_terre";

sleep 1; // Pour attendre l'envoi de la variable

// Joueur actuellement connecté
[{titletext [format ["! TREMBLEMENT DE TERRE ! \n ---------------------------------------------------------------- \n Attention, un tremblement de terre de niveau %1/10 approche la ville de %2 ! \n Mefiance ! \n --------------- \n By SFP Maxou",puissance_du_tremblement_de_terre, nom_secteur_tremblement_de_terre],"PLAIN DOWN"]},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;

// Joueur se connectant (pour ville détruite)
// [] spawn 
// {
	// sleep (60 * 2);
	// [{titletext [format ["! TREMBLEMENT DE TERRE ! \n ---------------------------------------------------------------- \n Suite au dernier tremblement de terre de niveau %1/10 sur la ville de %2 ! \n Des maisons ont peut être étées détruites ou sont instables ! \n --------------- \n By SFP Maxou",puissance_du_tremblement_de_terre, nom_secteur_tremblement_de_terre],"PLAIN DOWN"]},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
// };
// =================================================================================================================================================================
															// ENVOYER SUR LES JOUEURS DANS LA VILLE SELECTIONNE //
// =================================================================================================================================================================
sleep (30 + (random 200)); // Attente simulation que le tremblement arrive

liste_des_joueurs_dans_la_ville = [];
{
	if (_x in list nom_secteur_tremblement_de_terre_position) then
	{
		liste_des_joueurs_dans_la_ville = liste_des_joueurs_dans_la_ville + [_x];
	};
} foreach playableunits;

[[[],"divers\divers\tremblement_de_terre.sqf"],"BIS_fnc_execVM",liste_des_joueurs_dans_la_ville,false] spawn BIS_fnc_MP;

sleep 7;

// =================================================================================================================================================================
															// DETRUIRE LES MAISONS //
// =================================================================================================================================================================
nombre_maison_detruite_tremblement = 0;
if (puissance_du_tremblement_de_terre >= 3) then
{
	{
		_choix_destruction_maison = [14,36,2,7,50];
		if ((round (random 70)) in _choix_destruction_maison && isnil {_x getvariable "proprietaire_de_la_maison"}) then 
		{
			nombre_maison_detruite_tremblement = nombre_maison_detruite_tremblement + 1;
			_x setdamage (random 1);
		};
	} foreach (nearestObjects [getPosATL nom_secteur_tremblement_de_terre_position, ["house"], 1000]);
};

sleep 1;
publicvariable "nombre_maison_detruite_tremblement";
[] spawn {sleep 10; nombre_maison_detruite_tremblement = nil; publicvariable "nombre_maison_detruite_tremblement";};
// =================================================================================================================================================================
															// ENREGISTRER INIDB HISTORIQUE //
// =================================================================================================================================================================
_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
_detail_du_log = format ["Un tremblement a eu lieu est a touché %1 maison ...", nombre_maison_detruite_tremblement];
["Historique Tremblement De Terre", "Historique Tremblement De Terre", _heure_du_log, _detail_du_log] call saveToDB;

