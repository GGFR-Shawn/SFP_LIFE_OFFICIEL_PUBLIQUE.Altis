// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {alive player};
waitUntil {!isNil "fin_verification_apres_chargement"};
waitUntil {sleep 2; isnil {player getvariable "besoin_d_un_revive_news"}};
if (revive_mon_side != civilian) exitwith {};

condition_saboter_camera =
{
	_condition_camera = false;
	_detection_camera = nearestObjects [getPosATL player, ["Land_HandyCam_F"], 9];
	
	if (!isnil "_detection_camera") then
	{
		if (count _detection_camera >= 1 && !isnil {_detection_camera select 0 getvariable "camera_de_videosurveillance"}) then
		{
			_condition_camera = true;
		};
	};
	_condition_camera
};

je_commence_a_detruire_la_camera = 0;

player addAction ["<t color=""#ff0000"">" + "Essayer Détruire Caméra","divers\camera_surveillance\detruire_camera.sqf",[],8,true,true,"","[] call condition_saboter_camera && je_commence_a_detruire_la_camera < 1"];