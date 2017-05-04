// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


while {true} do
{
	waituntil {sleep 3; vehicle player != player};

	if (!isnil {(vehicle player) getvariable "voiture_possede_un_radar_de_recul"}) then
	{
		if (count ((vehicle player) getvariable "voiture_possede_un_radar_de_recul") > 0) then
		{
			while {vehicle player != player} do
			{
				_etat_du_radar_de_recul = (vehicle player) getvariable "voiture_possede_un_radar_de_recul" select 1;
				
				if (!isnil "_etat_du_radar_de_recul") then
				{
					if (_etat_du_radar_de_recul >= 1 && speed (vehicle player) == 0  && !isnil {(vehicle player) getvariable "vehicule_info_parvariable"}) then
					{
						camera_active_pip_voiture_maxou = true;

						_camModule_voiture = ["rendertarget0", [[ (vehicle player), (getPosATL (vehicle player))]], (vehicle player),true] call BIS_fnc_PIP;
						_camModule_voiture attachto [(vehicle player),[- 0.21, -5.1,-1]];
						_camModule_voiture camPrepareFOV 0.7;
						_camModule_voiture camCommit 0;
						_camModule_voiture SetDir ((getdir (vehicle player) - (getdir _camModule_voiture)) - 180);
						_camModule_voiture camCommit 0;
						_camModule_voiture setvectordirandup [[0,-0.9,-0.3],[0,0,0.1]];

						disableserialization;
						_le_pip_by_maxou = (uiNamespace getVariable "BIS_fnc_PIP_RscPIP");
						(_le_pip_by_maxou displayCtrl 2300) ctrlCommit 0;
						(_le_pip_by_maxou displayCtrl 2300) ctrlsettextcolor [1,1,1,1];	

						waitUntil {sleep 0.1; !alive (vehicle player) or !alive player or speed (vehicle player) > 10 or (vehicle player) == player};

						while {!isnil "camera_active_pip_voiture_maxou"} do {camera_active_pip_voiture_maxou = nil;};
						if (!isnil "menu_go_pro") then {player removeaction menu_go_pro};
						[] call BIS_fnc_PiP;
					};
				};
			};
		};
	};
};