// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (lbCurSel 1500 == -1) exitwith {hint "Rien n'est selectionné ...";};

private ["_son_prix","_object_direction_by_maxou","_verification_camera_by_maxou","_distance_de_la_fleche_sfp","_veh"];
_ou_est_prit_l_argent = parametrage_vehicules_prises_de_gang select 1;
_argent_actuellement = player getVariable _ou_est_prit_l_argent;
_choix_selectionne_voiture = lbCurSel 1500;
_vehicule_a_creer = liste_vehicules_prises_de_gang select _choix_selectionne_voiture select 2;
_son_nom = getText ( configFile >> "CfgVehicles" >> _vehicule_a_creer >> "displayName");
_son_prix = liste_vehicules_prises_de_gang select _choix_selectionne_voiture select 3;
_distance_de_la_fleche_sfp = 10;
if (player in list zone_capture_de_gang) then {carspawn = getMarkerPos "spawn_vehicules_zone_capture_de_gang";};

if (isnil "_ou_est_prit_l_argent" or isnil "_argent_actuellement" or isnil "_choix_selectionne_voiture" or isnil "_vehicule_a_creer" or isnil "_son_nom" or isnil "_son_prix") exitwith {hint "Erreur, recommence ...";};
if (_argent_actuellement < _son_prix) exitwith {Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable _ou_est_prit_l_argent) call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];};
if (!isClass (configFile >> "CfgVehicles" >> (liste_vehicules_prises_de_gang select _choix_selectionne_voiture select 2))) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
if (count (nearestObjects [carspawn, ["Car","Ship","Air"], 5]) > 0) exitwith {hint "Achat impossible, un autre véhicule est déjà sur la zone !";};


_veh = createVehicle [_vehicule_a_creer, carspawn, [], 0, "NONE"];

if (!alive _veh) exitwith {closeDialog 0; deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

[_veh,[name player], ["Véhicule gang" + (format [" (%1)",possession_camp_gang select 0]),"Véhicule gang" + (format [" (%1)",possession_camp_gang select 0])], 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";
[_veh] execvm "divers\inventaire_des_vehicules\remize_a_zero.sqf";

player setVariable [_ou_est_prit_l_argent, _argent_actuellement - _son_prix,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
hint format ['! ACHAT VEHICULE PRISE DE GANG ! \n -------------------- \n\n Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t''appartiens, n''oublie pas de monter dedans ! \n\n ----------------------------------- \n www.sfpteam.fr \n By SFP Maxou', _son_nom, _son_prix, (player getVariable _ou_est_prit_l_argent) call retour_formatage_chiffre_sfp];

closeDialog 0;

if (player distance _veh > _distance_de_la_fleche_sfp) then
{
	_object_direction_by_maxou = "Sign_Arrow_Direction_Blue_F" createVehicleLocal (getPosATL player);
	if (cameraView == "External") then {_object_direction_by_maxou attachTo [player, [0, 0, 2] ];};
	if (cameraView == "Internal") then {_object_direction_by_maxou attachTo [player, [0,  4, 0.5] ];};
	[_object_direction_by_maxou, -50, -0.00364812] call BIS_fnc_setPitchBank;
	_verification_camera_by_maxou = 0;
	
	[] spawn {sleep 4; hint "Suivez la flèche pour rejoindre votre véhicule ;)";};

	while {alive player && alive _veh && !isnil "_veh" && player distance _veh > _distance_de_la_fleche_sfp && vehicle player == player} do
	{
		if (_verification_camera_by_maxou < 1) then {_verification_camera_by_maxou = 1; position_camera_by_maxou = cameraView;};
		if (cameraView != position_camera_by_maxou) then
		{
			_verification_camera_by_maxou = 0;
			position_camera_by_maxou = cameraView;
			if (cameraView == "External") then {_object_direction_by_maxou attachTo [player, [0, 0, 2] ];};
			if (cameraView == "Internal") then {_object_direction_by_maxou attachTo [player, [0,  4, 0.5] ];};
		};

		_object_direction_by_maxou setDir ([player, [(position _veh select 0),(position _veh select 1),0]] call BIS_fnc_relativedirTo);
		sleep 0.001;
	};

	deletevehicle _object_direction_by_maxou;
};

waituntil {sleep 1; vehicle player != player};

hint "Le vehicule a bien ete declare a votre nom.";
_veh setdamage 0;
