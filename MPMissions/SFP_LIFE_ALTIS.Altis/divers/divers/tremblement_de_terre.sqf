// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

[] spawn
{
	_camera_puissance_du_tremblement = (3 * puissance_du_tremblement_de_terre);
	vitesse_tremblement_camera = (10 * puissance_du_tremblement_de_terre);

	for "_i" from 0 to _camera_puissance_du_tremblement step + 0.82 do 
	{
		addCamShake [_i , duree_du_tremblement_de_terre , vitesse_tremblement_camera ]; // Niveau automatique
		sleep 0.48;
	};
};

[] spawn
{
	sleep 3;
	if (puissance_du_tremblement_de_terre >= 3) then
	{
		_nombre_de_fois_fumee = ((puissance_du_tremblement_de_terre * 10) / 2);
		for "_i" from 0 to _nombre_de_fois_fumee step + 1 do 
		{
			_fumee_tremblement_de_terre = "#particlesource" createVehicleLocal [(getPosATL nom_secteur_tremblement_de_terre_position select 0),(getPosATL nom_secteur_tremblement_de_terre_position select 1) + (50),getPosATL nom_secteur_tremblement_de_terre_position select 2];
			_fumee_tremblement_de_terre setParticleCircle [0, [1, 1, 0]];
			_fumee_tremblement_de_terre setParticleRandom [1, [(_i * 2), (_i * 2), 1], [400, 400, 11 ], 10.1 , (_i / 8) * 2 , [1, 0, 0, 0], 0, 0];
			_fumee_tremblement_de_terre setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 8, 4,10], "", "Billboard", 10, 29 , [random 100, random 100, 1], [0.5, 0.5, 0.5], 10, 3, 3, 0.2, [(random 30), (20 + (random 30)), (random 30) ], [[0,0,0,0.5 ], [0,0,0,0.1], [0,0,0,0.1],[0,0,0,0.9]], [1], 11, 0, "", "", getPosATL nom_secteur_tremblement_de_terre_position];
			_fumee_tremblement_de_terre setDropInterval 0.01;
			sleep (random 1);
			deletevehicle _fumee_tremblement_de_terre;
		};
	};
};

waituntil {!isnil "nombre_maison_detruite_tremblement"};
systemchat format ["Fin du tremblement de terre ! %1 maisons ont étés détruites/instables !", nombre_maison_detruite_tremblement];*/