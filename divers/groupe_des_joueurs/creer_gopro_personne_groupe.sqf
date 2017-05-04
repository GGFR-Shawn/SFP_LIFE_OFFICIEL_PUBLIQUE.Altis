// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

[] call compter_personne_dans_mon_groupe; 
if (nombre_de_personne_dans_mon_group <= 1) exitwith {player globalchat "Vous n'etes pas dans un groupe ...";};
if (!isnil "camera_active_pip_maxou") exitwith {player globalchat "Désolé, vous avez déja activé une gopro d'un joueur !";};

_qui_rejoindre = lbtext [1500, lbcursel 1500];
le_joueur_allumee_go_pro_by_maxou = nil;

{
	if (name _x == _qui_rejoindre) then
	{
		le_joueur_allumee_go_pro_by_maxou = _x;
	};
} foreach playableUnits;

if (isnil "le_joueur_allumee_go_pro_by_maxou") exitwith {hint "Erreur sur le nom recherché !";};
if (side player != side le_joueur_allumee_go_pro_by_maxou) exitwith {player globalchat "Désolé, vous ne pouvez pas rejoindre ce joueur puisque vous ne faite pas partie de la même class (gendarme ou civil) !";};
if (!isnil {le_joueur_allumee_go_pro_by_maxou getvariable "go_pro_active_sur_moi"}) exitwith {player globalchat "Désolé, la go pro du joueur est déja allumée !";};
if (speed le_joueur_allumee_go_pro_by_maxou != 0) exitwith {player globalchat "Désolé, le joueur n'est pas à l'arret !";};
			
							
closedialog 0;

le_joueur_allumee_go_pro_by_maxou setvariable ["go_pro_active_sur_moi",1,true];
_position_du_joueur = getPosATL le_joueur_allumee_go_pro_by_maxou;
j_eteind_la_go_pro = 0;

menu_go_pro = player addAction["<t color='#0adb00'>Eteindre la GoPro</t>", {j_eteind_la_go_pro = nil; player removeaction menu_go_pro}, [],0, false, false, "", ""];

camera_active_pip_maxou = true;
_camera_main = "Land_HandyCam_F" createVehicle _position_du_joueur;
_camera_main enablesimulation false;
_camera_main attachto [le_joueur_allumee_go_pro_by_maxou,[- 0.2, 0.018,0.19],"spine3"];
_camera_main setdir ((getdir le_joueur_allumee_go_pro_by_maxou - getdir _camera_main) + 180);

_camModule = ["rendertarget0", [[ le_joueur_allumee_go_pro_by_maxou, _position_du_joueur]], le_joueur_allumee_go_pro_by_maxou,true] call BIS_fnc_PIP;
_camModule attachto [le_joueur_allumee_go_pro_by_maxou,[- 0.21, 0.01,0.2],"spine3"];
_camModule camPrepareFOV 0.7;
_camModule camCommit 0;

disableserialization;
_le_pip_by_maxou = (uiNamespace getVariable "BIS_fnc_PIP_RscPIP");
(_le_pip_by_maxou displayCtrl 2300) ctrlCommit 0;
(_le_pip_by_maxou displayCtrl 2300) ctrlsettextcolor [1,1,1,1];	

waitUntil {sleep 1; !alive player or !alive le_joueur_allumee_go_pro_by_maxou or isnil "j_eteind_la_go_pro"};
if (!alive le_joueur_allumee_go_pro_by_maxou) then {player globalchat format ["La GoPro à été désactivée puisque %1 est mort !",name le_joueur_allumee_go_pro_by_maxou];};

while {!isnil "camera_active_pip_maxou"} do {camera_active_pip_maxou = nil;};
deletevehicle _camera_main;	
le_joueur_allumee_go_pro_by_maxou setvariable ["go_pro_active_sur_moi",nil,true];
j_eteind_la_go_pro = nil;
if (!isnil "menu_go_pro") then {player removeaction menu_go_pro};
[] call BIS_fnc_PiP;
