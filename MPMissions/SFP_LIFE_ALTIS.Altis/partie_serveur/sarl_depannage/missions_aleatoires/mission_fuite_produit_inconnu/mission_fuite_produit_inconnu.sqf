// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : Mission Dir : Démarrage script produit toxique 1/2." spawn historique_creation_log_sfp;

// -------------------------------------------------------------------- La position ------------------------------------------------------------------ //
_nom_du_secteur_fuite_produit_inconnu = [poliakko,Neochori,Zaros,Chalkeia,Lakka,Therisa];
_nom_du_secteur_valide_fuite_produit_inconnu = _nom_du_secteur_fuite_produit_inconnu call BIS_fnc_selectRandom;

// ----------------------------------------------------------------- verifier si joueur en ville -------------------------------------------------------- //
_pos = [((getPosATL _nom_du_secteur_valide_fuite_produit_inconnu select 0) + (random 1000)),((getPosATL _nom_du_secteur_valide_fuite_produit_inconnu select 1) + (random 1000)),0];
_verifierjoueurautour = _pos nearEntities [["man"], 30];
if ({isPlayer _x} count (_verifierjoueurautour) > 0) exitwith {sleep 0.3; execvm "partie_serveur\sarl_depannage\missions_aleatoires\mission_fuite_produit_inconnu\mission_fuite_produit_inconnu.sqf";};

// ----------------------------------------------------------------- verifier de la surface -------------------------------------------------------- //
_surface = surfaceType _pos;
_verificationsurface = ["#GdtGrassShort","#GdtGrassTall","#GdtAsphalt","#GdtGrassDry"];
if !(_surface in _verificationsurface) exitwith {sleep 0.3; execvm "partie_serveur\sarl_depannage\missions_aleatoires\mission_fuite_produit_inconnu\mission_fuite_produit_inconnu.sqf";};

// ----------------------------------------------------------------- verifier pas de maison -------------------------------------------------------- //
if (count (nearestObjects [_pos, ["HOUSE"],5]) >= 1) exitwith {sleep 0.3; execvm "partie_serveur\sarl_depannage\missions_aleatoires\mission_fuite_produit_inconnu\mission_fuite_produit_inconnu.sqf";};

// -------------------------------------------------------------------- Choix des objets --------------------------------------------------------------------
_quelle_objet_prendre_pour_la_fuite_produit_inconnu = [ "Land_GarbageContainer_closed_F","Land_GarbageContainer_open_F","Land_MetalBarrel_empty_F","Land_Sacks_goods_F","Land_Tyres_F","Land_JunkPile_F","Land_GarbageBags_F"];
_quelle_objet_prendre_choisit_pour_la_fuite_produit_inconnu = _quelle_objet_prendre_pour_la_fuite_produit_inconnu call BIS_fnc_selectRandom;

// --------------------------------------------------------------- Création de la fuite de produit inconnu --------------------------------------------------------------------
_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script DIR", "Historique Script DIR", _heure_du_log, "Demarrage script produits toxique."] call saveToDB;
"DIAG SFP : Mission Dir : Démarrage script produit toxique 2/2." spawn historique_creation_log_sfp;

createMarker ["spawn_produit_inconnu", _pos];
"spawn_produit_inconnu" setMarkerShape "ICON";
"spawn_produit_inconnu" setMarkerColor "Colorred";
"spawn_produit_inconnu" setMarkerSize [1.5,1.5];
"spawn_produit_inconnu" setMarkerType "hd_dot";
"spawn_produit_inconnu" setMarkerText "Fuite produit chimique !";	

_creation_de_la_fuite_produit_inconnu = createvehicle [_quelle_objet_prendre_choisit_pour_la_fuite_produit_inconnu, _pos,[], 0, "CAN_COLLIDE"];
_creation_de_la_fuite_produit_inconnu allowdamage false;
_creation_de_la_fuite_produit_inconnu setDir random 360;
_creation_de_la_fuite_produit_inconnu setvariable ["la_fuite_produit_inconnu_pour_sarl_depannage",(floor (300 + (random 300))),true];

[[[_creation_de_la_fuite_produit_inconnu, _pos],"divers\nos_entreprises\sarl_depannage\mission_aleatoire\fuite_produit_inconnu\creation_fuite_produit_inconnu.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
sleep 1;

_detection_fin_produit_inconnu = false;
while {!_detection_fin_produit_inconnu} do
{
	sleep 2;
	_compter_fuite_produit_inconnu = 0;
	{
		if (!isnil {_x getvariable "la_fuite_produit_inconnu_pour_sarl_depannage"}) then
		{
			_compter_fuite_produit_inconnu = round (_compter_fuite_produit_inconnu + 1);
		};		
	} foreach (nearestObjects [_pos, [_quelle_objet_prendre_choisit_pour_la_fuite_produit_inconnu],60]);
	
	if (_compter_fuite_produit_inconnu < 1) then {_detection_fin_produit_inconnu = true;};
};
	
	
deleteMarker "spawn_produit_inconnu";

if (!isnil "_creation_de_la_fuite_produit_inconnu") then {deletevehicle _creation_de_la_fuite_produit_inconnu;};

demarage_d_une_mission_dir_sfp = nil;

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script DIR", "Historique Script DIR", _heure_du_log, "Fin script mission fuite produits toxique."] call saveToDB;
"DIAG SFP : Mission Dir : Fin script produit toxique." spawn historique_creation_log_sfp;

