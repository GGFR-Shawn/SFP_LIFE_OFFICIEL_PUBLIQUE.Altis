// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : Mission Pompiers : Démarrage script feux de poubelle 1/2." spawn historique_creation_log_sfp;

_nomdusecteur = [Neochori,Alikampos,Edessa,Dorida,kalithea,Zaros,Chalkeia,poliakko,Kavala,Lakka,Therisa,Neochori,Pyrgos,Agios_dionysios,Charkia,Stravos,Panochori];
_nomdusecteur_valide = _nomdusecteur call BIS_fnc_selectRandom;

// ----------------------------------------------------------------- verifier si joueur en ville -------------------------------------------------------- //
_pos = [((getPosATL _nomdusecteur_valide select 0) + (random 200)),((getPosATL _nomdusecteur_valide select 1) + (random 200)),0];
_verifierjoueurautour = _pos nearEntities [["man"], 30];
if ({isPlayer _x} count (_verifierjoueurautour) > 0) exitwith {sleep 0.3; execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\poubelle\initialisation_sarl_pompier_serveur_que_feu_de_poubelle_en_ville.sqf";};

// ----------------------------------------------------------------- verifier de la surface -------------------------------------------------------- //
_surface = surfaceType _pos;
_verificationsurface = ["#GdtGrassTall","#GdtGrassShort","#GdtSoil","#GdtAsphalt","#GdtGrassDry","#GdtDirt","#GdtGrassGreen"];
if (!(_surface in _verificationsurface) or surfaceIsWater _pos) exitwith {sleep 0.3; execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\poubelle\initialisation_sarl_pompier_serveur_que_feu_de_poubelle_en_ville.sqf";};

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script Pompier", "Historique Script Pompier", _heure_du_log, "Demarrage script feu de poubelle."] call saveToDB;
"DIAG SFP : Mission Pompiers : Démarrage script feux de poubelle 2/2." spawn historique_creation_log_sfp;

// -------------------------------------------------------------- Choix des objets --------------------------------------------------------------------
_quelle_objet_prendre = ["Land_GarbageContainer_closed_F","Land_GarbageContainer_open_F"];

quel_objet_prendre_choisit_poubelles = _quelle_objet_prendre call BIS_fnc_selectRandom;
publicvariable "quel_objet_prendre_choisit_poubelles";

// --------------------------------------------------------------- Création des objets déchets --------------------------------------------------------------------
creation_de_la_poubelle = createvehicle [quel_objet_prendre_choisit_poubelles, _pos, [], 0, "CAN_COLLIDE"];
waituntil {sleep 0.5; speed creation_de_la_poubelle < 0.1;};
publicvariable "creation_de_la_poubelle";

// -------------------------------------------------------------- Initialisation des effets déchets --------------------------------------------------------------------
creation_de_la_poubelle allowdamage false;
creation_de_la_poubelle setDir random 360;
creation_de_la_poubelle setvariable ["jesuisenfeu",1,true];

// -------------------------------------------------------------- Ok tache accompli --------------------------------------------------------------------
createMarker ["spawn_du_feu_poubelle_en_ville", _pos];
"spawn_du_feu_poubelle_en_ville" setMarkerShape "ICON";
"spawn_du_feu_poubelle_en_ville" setMarkerColor "Colorred";
"spawn_du_feu_poubelle_en_ville" setMarkerSize [1.5,1.5];
"spawn_du_feu_poubelle_en_ville" setMarkerType "hd_dot";
"spawn_du_feu_poubelle_en_ville" setMarkerText "Incendie Poubelle !";	

if (!isnil "creation_de_la_poubelle") then {waituntil {sleep 1; !alive creation_de_la_poubelle};};

quel_objet_prendre_choisit_poubelles = nil; publicvariable "quel_objet_prendre_choisit_poubelles";
creation_de_la_poubelle = nil; publicvariable "creation_de_la_poubelle";

deleteMarker "spawn_du_feu_poubelle_en_ville";

demarage_d_une_mission_pompier_sfp = nil;

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script Pompier", "Historique Script Pompier", _heure_du_log, "Fin script feu de poubelle."] call saveToDB;
"DIAG SFP : Mission Pompiers : Fin script feux de poubelle." spawn historique_creation_log_sfp;
