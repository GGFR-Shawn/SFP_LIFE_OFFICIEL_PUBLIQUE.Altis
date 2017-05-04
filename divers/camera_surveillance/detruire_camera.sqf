// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (vehicle player != player) exitwith {hint "Descend de ton véhicule ...";}; 
if (!isnil {la_camera_de_videosurveillance getvariable "camera_en_cours_de_cassage"}) exitwith {hint "Désolé, cette camera est déja entrain d'etre cassé / ou à subit des dégats et est surveillé !";};
if (isnil "je_commence_a_detruire_la_camera") then {je_commence_a_detruire_la_camera = 0;};
if (je_commence_a_detruire_la_camera >= 1) exitwith {hint "Désolé, tu es déja entrain de casser une camera !";};
je_commence_a_detruire_la_camera = 1;

[[[getPosATL player, player],"divers\camera_surveillance\avertir_gendarmerie.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

hint "! CAMERA DE VIDEOSURVEILLANCE ! \n -------------------------------------------- \n Tu vas essayer de détruire les caméras de vidéosurveillance ... \n\n C'est partie !!!! \n ----------------------------- \n By SFP Maxou \n www.sfpteam.fr";
sleep 3;

la_camera_de_videosurveillance = (nearestObjects [player, ["Land_HandyCam_F"], 10]) select 0;
la_camera_de_videosurveillance setvariable ["camera_en_cours_de_cassage",1,true];

_temps_avant_de_finir_de_casser_la_camera = (120 + (random 180));
_temps_avant_de_finir_de_casser_la_camera spawn {[_this] call bar_de_progression_by_maxou;};
while {alive player && _temps_avant_de_finir_de_casser_la_camera > 0 && isnil {player getvariable "joueur_menotte"} && player distance la_camera_de_videosurveillance < 10} do
{
	sleep 1;
	_temps_avant_de_finir_de_casser_la_camera = round (_temps_avant_de_finir_de_casser_la_camera - 1);
	titleText [format["Encore %1 secondes avant de casser la camera !", _temps_avant_de_finir_de_casser_la_camera], "PLAIN DOWN"];
};

bar_de_progression_by_maxou_reinitialisation = true;

if (player distance la_camera_de_videosurveillance > 10) exitwith {je_commence_a_detruire_la_camera = 0; titleText ["Sabotage annulé ! Tu es trop loin de la caméra !", "PLAIN DOWN"]; la_camera_de_videosurveillance setvariable ["camera_en_cours_de_cassage",nil,true]; [0] call bar_de_progression_by_maxou;};
if (!isnil {player getvariable "joueur_menotte"}) exitwith {je_commence_a_detruire_la_camera = 0; titleText ["Sabotage annulé ! Vous avez été arreté !", "PLAIN DOWN"]; la_camera_de_videosurveillance setvariable ["camera_en_cours_de_cassage",nil,true]; [0] call bar_de_progression_by_maxou;};
if (!alive player) exitwith {je_commence_a_detruire_la_camera = 0; la_camera_de_videosurveillance setvariable ["camera_en_cours_de_cassage",nil,true]; [0] call bar_de_progression_by_maxou;};

je_commence_a_detruire_la_camera = 0;

la_camera_de_videosurveillance setvariable ["camera_video_surveillance_detruite",1,true];
[[[getPosATL la_camera_de_videosurveillance],"divers\camera_surveillance\petit_effet_fumee_camera.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;


titleText ["Vous avez détruit une caméra de surveillance ! Elle est actuellement en surchauffe et sera automatiquement démonté par les employés de mairie ...", "PLAIN DOWN"];

