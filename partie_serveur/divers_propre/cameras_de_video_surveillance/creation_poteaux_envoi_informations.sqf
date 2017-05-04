// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : Poteaux surveillance : Initialisation." spawn historique_creation_log_sfp;

les_position_des_cameras = [];

// ===========================================================================================================================================================================
debut_contruction_camera = 1;
_position_camera = [12779,14258.6,0];
les_position_des_cameras = les_position_des_cameras + [[_position_camera, "Camera Centre Ville Neochori (port)"]];

[_position_camera] execvm "partie_serveur\divers_propre\cameras_de_video_surveillance\creation_poteaux_camera_information_ok.sqf";
waituntil {debut_contruction_camera < 1};

// ===========================================================================================================================================================================
debut_contruction_camera = 1;
_position_camera = [12378.5,14366.7,0];
les_position_des_cameras = les_position_des_cameras + [[_position_camera, "Camera Centre Ville Neochori (CarShop)"]];

[_position_camera] execvm "partie_serveur\divers_propre\cameras_de_video_surveillance\creation_poteaux_camera_information_ok.sqf";
waituntil {debut_contruction_camera < 1};

// ===========================================================================================================================================================================
debut_contruction_camera = 1;
_position_camera = [14691.2,16786.1,0];
les_position_des_cameras = les_position_des_cameras + [[_position_camera,"Camera AirField"]];

[_position_camera] execvm "partie_serveur\divers_propre\cameras_de_video_surveillance\creation_poteaux_camera_information_ok.sqf";
waituntil {debut_contruction_camera < 1};

// ===========================================================================================================================================================================
debut_contruction_camera = 1;
_position_camera = [5337.13,14500.6,0];
les_position_des_cameras = les_position_des_cameras + [[_position_camera,"Camera Poste De Douane 1"]];

[_position_camera] execvm "partie_serveur\divers_propre\cameras_de_video_surveillance\creation_poteaux_camera_information_ok.sqf";
waituntil {debut_contruction_camera < 1};

// ===========================================================================================================================================================================
debut_contruction_camera = 1;
_position_camera = [10806.9,10560.2,0];
les_position_des_cameras = les_position_des_cameras + [[_position_camera,"Camera Poste De Douane 2"]];

[_position_camera] execvm "partie_serveur\divers_propre\cameras_de_video_surveillance\creation_poteaux_camera_information_ok.sqf";
waituntil {debut_contruction_camera < 1};


// ===========================================================================================================================================================================
																			// FIN
// ===========================================================================================================================================================================
publicvariable "les_position_des_cameras";

"DIAG SFP : Poteaux surveillance : Fin initialisation." spawn historique_creation_log_sfp;
