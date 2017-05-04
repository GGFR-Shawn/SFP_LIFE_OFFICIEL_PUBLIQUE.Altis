//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

player addEventHandler ["Fired", 
{
	// Effet Tremblement
	addCamShake [if (cameraView == "EXTERNAL") then [{0.1}, {2 max random 3}], 0.4, 500];

	// Effet de balle
	_arme_du_tir = currentWeapon player;
	
	if (_arme_du_tir != "") then
	{
		if (_arme_du_tir in sfp_config_armes_autorisation_effet) then
		{
			if (isnil "autorisation_camera_camera") then
			{	
				_ma_balle = _this select 6;
				
				autorisation_camera_camera = 1;
				[_ma_balle] execvm "divers\effet_de_balle\effet_balle.sqf";
			};
		};
	};
}];
