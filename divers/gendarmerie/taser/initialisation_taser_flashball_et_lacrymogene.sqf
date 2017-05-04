// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

player addEventHandler ["Fired", 
{
	// Taser
	if (_this select 5 == "16Rnd_9x21_Mag_Taser_Maxou") then
	{
		deleteVehicle (_this select 6);
		
		if !(cursortarget iskindof "man") then
		{	
			titleText["\n\n\n\n\n\n\n\n Tir raté ! Personne en face !", "PLAIN",0];
		};
		if (cursortarget distance player > 25) then
		{	
			titleText["\n\n\n\n\n\n\n\n Tir raté ! Tu es trop loin du citoyen !", "PLAIN",0];
		};
		if (cursortarget iskindof "man" && cursortarget distance player < 25) then
		{
			titleText["Tir Réussi !", "PLAIN DOWN",0];
			_joueur_prit_le_taser = cursortarget;
			[[[_joueur_prit_le_taser],"divers\gendarmerie\taser\effet_taser_si_joueur_detecte.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
		};
	};
	
	// Flash Ball
	if (_this select 5 == "16Rnd_9x21_Mag_Flash_Ball_Maxou") then
	{
		_la_munition_velocity = velocity (_this select 6);
		deleteVehicle (_this select 6);
	
		if (cursortarget iskindof "man" && player distance cursortarget <= 15) then
		{
			titleText [format["Tir Annulé ! Trop près d'un joueur ! Il faut être à plus de 15 mètre et vous êtes à %1 mètre !",round (player distance cursortarget)],"PLAIN DOWN"];
		}else
		{
			_la_balle_by_sfp_maxou = createVehicle ["Land_TacticalBacon_F", [0,0,0], [], 0, "CAN_COLLIDE"];
			_la_balle_by_sfp_maxou attachto [player,[0.1,-0.3,0.1],"righthand"];
			detach _la_balle_by_sfp_maxou;
			
			_vel = velocity _la_balle_by_sfp_maxou;
			_speed = 3.2;
			
			_la_balle_by_sfp_maxou setVelocity [
			(_vel select 0) + ((_la_munition_velocity select 0) * _speed), 
			(_vel select 1) + ((_la_munition_velocity select 1) * _speed), 
			(_vel select 2) + ((_la_munition_velocity select 2) * _speed)
			];
						
			[_la_balle_by_sfp_maxou] execvm "divers\gendarmerie\taser\effet_flash_ball_detection_joueur.sqf";
		};
	};
	
	// Lacrymogène
	if (_this select 5 == "Lacryo_SFP_3Rnd_X3") then
	{
		deleteVehicle (_this select 6);
		
		if (round random 10 == 1) then {systemchat "Rappel : Distance max du pistolet lacrymo est de 7 mètres.";};
		
		[] spawn
		{		
			_temps_lacrymogene = 3.6; // Suivant durée du son et de l'animation
			
			[[[player, _temps_lacrymogene],"divers\gendarmerie\taser\effet_lacrymo_fumee.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
			
			while {_temps_lacrymogene > 0} do
			{
				_temps_lacrymogene = _temps_lacrymogene - 0.1;
				
				if (cursortarget iskindof "man" && cursortarget distance player < 7 && isnil {cursortarget getvariable "joueur_recu_lacrymogene"}) then
				{
					_joueur_recu_la_lacrymo = cursortarget;
					
					_joueur_recu_la_lacrymo setvariable ["joueur_recu_lacrymogene",true,true];
					
					[_joueur_recu_la_lacrymo, _temps_lacrymogene] spawn 
					{
						_le_joueur = _this select 0;
						_temps_lacrymogene = _this select 1;
						if (isnil "_le_joueur" or isnil "_temps_lacrymogene") exitwith {hint "Erreur detection lacrymo ...";};
						
						sleep (_temps_lacrymogene + 5);
						_le_joueur setvariable ["joueur_recu_lacrymogene", nil, true];
					};
					
					titleText [format["%1 a recu de la lacrymogene !", name _joueur_recu_la_lacrymo], "PLAIN DOWN",0];
					[[[_joueur_recu_la_lacrymo, round (1 + random 2)],"divers\gendarmerie\taser\effet_lacrymo_si_joueur_detecte.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
				};
				sleep 0.1;
			};
		};	
	};	
}];
