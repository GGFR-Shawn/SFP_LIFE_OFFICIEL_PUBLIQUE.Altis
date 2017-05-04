//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


_ma_balle = _this select 0;
if (isnil "_ma_balle") exitwith {};

if ((dayTime > 20 && dayTime < 23.99) or (dayTime >= 0 && dayTime < 6)) then {camUseNVG true;}else{camUseNVG false;};showCinemaBorder true;

creation_camera_sfp_maxou_balle = "camera" camCreate [(getPosATL _ma_balle select 0) + (5), (getPosATL _ma_balle select 1) + (0),(getPosATL _ma_balle select 2) + (1)];

while {alive _ma_balle && speed _ma_balle > 0.5} do
{
	creation_camera_sfp_maxou_balle camsettarget _ma_balle;
	creation_camera_sfp_maxou_balle cameraeffect ["Internal", "FRONT"];
	creation_camera_sfp_maxou_balle camsetrelpos [0, 0, 0];
	creation_camera_sfp_maxou_balle camcommit 0.01;
	sleep 0.0001;
	
	if (isnil "information_vitesse_de_la_balle_by_sfp_maxou") then
	{
		information_vitesse_de_la_balle_by_sfp_maxou = 1;
		player globalchat format ["Vitesse de la balle %1 Kms/heure !",speed _ma_balle];
	};
};

waituntil {player distance _ma_balle > 2 or !alive _ma_balle};
waituntil {speed _ma_balle < 0.5 or getPosATL _ma_balle select 2 < 2};

creation_camera_sfp_maxou_balle cameraEffect ["terminate","back"];
camDestroy creation_camera_sfp_maxou_balle;

autorisation_camera_camera = nil;
information_vitesse_de_la_balle_by_sfp_maxou = nil;
