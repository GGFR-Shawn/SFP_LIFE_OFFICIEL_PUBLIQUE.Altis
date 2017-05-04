// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : Mission Dir : Lancement script fuite eau 1/2." spawn historique_creation_log_sfp;

_nom_du_secteur_fuite_d_eau = [poliakko,Neochori,Zaros,Chalkeia,Lakka,Therisa];
nomdusecteur_valide_fuite_d_eau = _nom_du_secteur_fuite_d_eau call BIS_fnc_selectRandom;

// ----------------------------------------------------------------- verifier si joueur en ville -------------------------------------------------------- //
_pos = [((getPosATL nomdusecteur_valide_fuite_d_eau select 0) + (random 1000)),((getPosATL nomdusecteur_valide_fuite_d_eau select 1) + (random 1000)),0];
_verifierjoueurautour = _pos nearEntities [["man"], 30];
if ({isPlayer _x} count (_verifierjoueurautour) > 0) exitwith {sleep 0.3; execvm "partie_serveur\sarl_depannage\missions_aleatoires\mission_canalisation_sarl_depannage\mission_canalisation_dir.sqf";};

// ----------------------------------------------------------------- verifier de la surface -------------------------------------------------------- //
_surface = surfaceType _pos;
_verificationsurface = ["#GdtAsphalt"];
if !(_surface in _verificationsurface) exitwith {sleep 0.3; execvm "partie_serveur\sarl_depannage\missions_aleatoires\mission_canalisation_sarl_depannage\mission_canalisation_dir.sqf";};

// ----------------------------------------------------------------- verifier pas de maison -------------------------------------------------------- //
if (count (nearestObjects [_pos, ["HOUSE"],20]) >= 1) exitwith {sleep 0.3; execvm "partie_serveur\sarl_depannage\missions_aleatoires\mission_canalisation_sarl_depannage\mission_canalisation_dir.sqf";};

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script DIR", "Historique Script DIR", _heure_du_log, "Début script mission fuite eau."] call saveToDB;
"DIAG SFP : Mission Dir : Lancement script fuite eau 2/2." spawn historique_creation_log_sfp;

// -------------------------------------------------------------------- Choix des objets --------------------------------------------------------------------
_quelle_objet_prendre_pour_la_fuite = [ "Land_IndPipe1_90degL_F","Land_IndPipe1_90degR_F","Land_IndPipe1_valve_F","Land_IndPipe1_ground_F"];
quel_objet_prendre_choisit_pour_la_fuite = _quelle_objet_prendre_pour_la_fuite call BIS_fnc_selectRandom;

// --------------------------------------------------------------- Création effet explosion + fumée --------------------------------------------------------------------
_bombe_fuite = "Bo_GBU12_LGB_MI10" createVehicle [_pos select 0, ((_pos select 1) + random 3),_pos select 2];sleep (random 2);
_bombe_fuite = "Bo_GBU12_LGB_MI10" createVehicle [_pos select 0, ((_pos select 1) + random 3),_pos select 2];sleep (random 2);
_bombe_fuite = "Bo_GBU12_LGB_MI10" createVehicle [_pos select 0, ((_pos select 1) + random 3),_pos select 2];sleep (random 2);
_fumee_fuite = "SmokeShell" createVehicle _pos;
sleep 1;

// --------------------------------------------------------------- Création de la fuite deau --------------------------------------------------------------------
createMarker ["spawn_fuite_d_eau", _pos];
"spawn_fuite_d_eau" setMarkerShape "ICON";
"spawn_fuite_d_eau" setMarkerColor "Colorred";
"spawn_fuite_d_eau" setMarkerSize [1.5,1.5];
"spawn_fuite_d_eau" setMarkerType "hd_dot";
"spawn_fuite_d_eau" setMarkerText "Fuite d'eau detecté !";	

_creation_de_la_fuite_deau = createvehicle [quel_objet_prendre_choisit_pour_la_fuite, [_pos select 0, _pos select 1, (_pos select 2) - 0.5],[], 0, "CAN_COLLIDE"];
_creation_de_la_fuite_deau allowdamage false;
_creation_de_la_fuite_deau setDir random 360;
_creation_de_la_fuite_deau setvariable ["je_fuie_pour_sarl_depannage",1,true];

[[[_creation_de_la_fuite_deau,_pos],"divers\nos_entreprises\sarl_depannage\mission_aleatoire\fuite_d_eau\creation_objet_en_fuite.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
sleep 1;

_detection_fin_de_fuite = false;
while {!_detection_fin_de_fuite} do
{
	sleep 2;
	_compter_les_fuites_deau = 0;
	{
		if (!isnil {_x getvariable "je_fuie_pour_sarl_depannage"}) then
		{
			_compter_les_fuites_deau = round (_compter_les_fuites_deau + 1);
		};		
	} foreach (nearestObjects [_pos, [quel_objet_prendre_choisit_pour_la_fuite],80]);
	
	if (_compter_les_fuites_deau < 1) then {_detection_fin_de_fuite = true;};
};
	
	
deleteMarker "spawn_fuite_d_eau";

if (!isnil "_creation_de_la_fuite_deau") then {deletevehicle _creation_de_la_fuite_deau;};

demarage_d_une_mission_dir_sfp = nil;

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script DIR", "Historique Script DIR", _heure_du_log, "Fin script mission fuite eau."] call saveToDB;
"DIAG SFP : Mission Dir : Fin script eau." spawn historique_creation_log_sfp;
