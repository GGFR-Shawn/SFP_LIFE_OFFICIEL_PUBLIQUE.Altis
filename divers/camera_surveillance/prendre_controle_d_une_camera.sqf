// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_endroit_de_la_camera_by_maxou = les_position_des_cameras select (_this select 0 select 1) select 0;
_camera_choisit_by_maxou = ((nearestObjects [_endroit_de_la_camera_by_maxou, ["Land_HandyCam_F"], 30]) select 0);
_position_camera_choisit_by_maxou = getPosATL ((nearestObjects [_endroit_de_la_camera_by_maxou, ["Land_HandyCam_F"], 30]) select 0);

if (isnil "_endroit_de_la_camera_by_maxou") exitwith {titletext ["\n\n\n\n Erreur choix caméra ... Previens moi, Maxou.","PLAIN DOWN"];};
if (isnil "_camera_choisit_by_maxou") exitwith {titletext ["\n\n\n\n Désolé, cette caméra est HS.","PLAIN DOWN"];};
if (!isnil {_camera_choisit_by_maxou getvariable "camera_video_surveillance_detruite"}) exitwith {titletext ["\n\n\n\n Désolé, cette caméra est HS.","PLAIN DOWN"];};
if (!isnil {_camera_choisit_by_maxou getvariable "camera_video_surveillance_en_cours_d_utilisation"}) exitwith {titletext ["\n\n\n\n Désolé, cette caméra est en cours d'utilisation.","PLAIN DOWN"];};

if (isnil "j_utilise_une_camera_de_video_surveillance") then {j_utilise_une_camera_de_video_surveillance = 0;};
if (j_utilise_une_camera_de_video_surveillance >= 1) exitwith {titletext ["Désolé, tu as déja demander un visionnage ...","PLAIN DOWN"];};
j_utilise_une_camera_de_video_surveillance = 1;

closedialog 0;

couper_connection_camera_by_maxou = 
{
	creation_camera_video_surveillance_sfp_maxou cameraEffect ["terminate","back"]; 
	camDestroy creation_camera_video_surveillance_sfp_maxou;
	creation_camera_video_surveillance_sfp_maxou = nil;
	valeur_souris_surveillance_by_maxou = nil;
	ppEffectDestroy effet_connection_camera_surveillance_by_maxou;
	
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", key_suppression_creation_camera_video_surveillance_sfp_maxou];
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", desactiver_touche_camera_by_maxou];
	(findDisplay 46) displayRemoveEventHandler ["MouseMoving", desactiver_souris_camera_by_maxou];
};

_camera_choisit_by_maxou setvariable ["camera_video_surveillance_en_cours_d_utilisation",1,true];

titletext ["Connection à la vidéo surveillance ...","PLAIN DOWN"];
sleep 2;
titletext ["Connection réussi au 192.168.1.12 ...","PLAIN DOWN"];
sleep 2;
titletext ["Attente de ping ...","PLAIN DOWN"];
sleep 2;
titletext ["Connection, réussi. \n Ne bouger pas la souris ou la connection coupera ...","PLAIN DOWN"];
sleep 3;
titletext ["Utiliser les touches 4,6,8,2,- et + du clavier numérique pour gerer la camera ... \n Appuyer sur ENTREE pour eteindre la caméra ...","PLAIN DOWN"];


if ((dayTime > 20 && dayTime < 23.99) or (dayTime >= 0 && dayTime < 6)) then {camUseNVG true;}else{camUseNVG false;};
creation_camera_video_surveillance_sfp_maxou = "camera" camCreate _position_camera_choisit_by_maxou;
creation_camera_video_surveillance_sfp_maxou cameraEffect ["internal","back"];
creation_camera_video_surveillance_sfp_maxou camSetFOV 1;
creation_camera_video_surveillance_sfp_maxou camCommit 0;

waitUntil {camCommitted creation_camera_video_surveillance_sfp_maxou};
creation_camera_video_surveillance_sfp_maxou camCommand "manual on";

[] spawn
{
	while {!isnil "creation_camera_video_surveillance_sfp_maxou"} do
	{
		effet_connection_camera_surveillance_by_maxou = ppEffectCreate ['filmGrain', 3000];
		effet_connection_camera_surveillance_by_maxou ppEffectEnable true;
		effet_connection_camera_surveillance_by_maxou ppEffectAdjust [1.9,1.9,1.9, [0,0,0,0.99], [0,0,0,0.9], [0,0,0,0.9]];
		effet_connection_camera_surveillance_by_maxou ppEffectCommit 5;
	};
};

waitUntil {camCommitted creation_camera_video_surveillance_sfp_maxou};

waituntil {!(IsNull (findDisplay 46))};
listes_des_touches_a_desactiver = [75,77,72,80,78,74,28];

key_suppression_creation_camera_video_surveillance_sfp_maxou = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 28) then {[] call couper_connection_camera_by_maxou;}"];
desactiver_touche_camera_by_maxou = (findDisplay 46) displayAddEventHandler ["KeyDown", "if !((_this select 1) in listes_des_touches_a_desactiver) then {true}"];
desactiver_souris_camera_by_maxou = (findDisplay 46) displayAddEventHandler ["MouseMoving", "if (isnil 'valeur_souris_surveillance_by_maxou') then {valeur_souris_surveillance_by_maxou = _this select 1}; if (valeur_souris_surveillance_by_maxou != _this select 1) then {[] call couper_connection_camera_by_maxou;};"];

waituntil {isnil "valeur_souris_surveillance_by_maxou";};
_camera_choisit_by_maxou setvariable ["camera_video_surveillance_en_cours_d_utilisation",nil,true];
j_utilise_une_camera_de_video_surveillance = nil;