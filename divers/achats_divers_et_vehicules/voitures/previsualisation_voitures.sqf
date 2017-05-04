// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_la_classe_du_vehicule_sfp = liste_recherche_informations_vehicules select (lbCurSel 1500) select 0;
_le_dialogue_du_vehicule_sfp = liste_recherche_informations_vehicules select (lbCurSel 1500) select 1;
_position_spawn_vehicule = sfp_config_position_des_previsualitions_des_vehicules;
if (!isClass (configFile >> "CfgVehicles" >> _la_classe_du_vehicule_sfp)) exitwith {hint "Désolé, vous n'avez pas le launcher pour prévisualiser ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};

cutText["","BLACK IN", 2];

_creation_vehicule_previsualiser = _la_classe_du_vehicule_sfp createVehicleLocal _position_spawn_vehicule ;  
_creation_vehicule_previsualiser allowDamage false;
_creation_vehicule_previsualiser enableSimulation false;
_creation_vehicule_previsualiser setDir 22 ;  

createdialog "Fermer_Previsualisation_Du_Vehicule";

camUseNVG false;
showCinemaBorder false;

_camera_previsualisation_vehicule_sfp = "camera" camCreate [(getPosATL _creation_vehicule_previsualiser select 0) + (10), (getPosATL _creation_vehicule_previsualiser select 1) - (10),(getPosATL _creation_vehicule_previsualiser select 2) + (1)];
_camera_previsualisation_vehicule_sfp cameraEffect ["EXTERNAL","back"];

_camera_previsualisation_vehicule_sfp camPrepareTarget [(getPosATL _creation_vehicule_previsualiser select 0), (getPosATL _creation_vehicule_previsualiser select 1),(getPosATL _creation_vehicule_previsualiser select 2)];
_camera_previsualisation_vehicule_sfp camPreparePos [(getPosATL _creation_vehicule_previsualiser select 0) + (5), (getPosATL _creation_vehicule_previsualiser select 1) + (3),(getPosATL _creation_vehicule_previsualiser select 2) + (2)];;
_camera_previsualisation_vehicule_sfp camPrepareFOV 1;
_camera_previsualisation_vehicule_sfp camCommitPrepared 8;

while {!(isnull (findDisplay 9874)) && alive player} do
{
	sleep 0.1;
};

deletevehicle _creation_vehicule_previsualiser;

_camera_previsualisation_vehicule_sfp cameraEffect ["terminate","back"];
camDestroy _camera_previsualisation_vehicule_sfp;
