// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_position = _this select 0;

_ps1 = "#particlesource" createVehicleLocal _position;
_ps1 setParticleCircle [0, [0, 0, 0]];
_ps1 setParticleRandom [1, [0, 0, 1], [50, 50, 0], 0.1, 0.1, [1, 1, 0, 0.9], 0, 0];
_ps1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 9, 5,100], "", "Billboard", 10, 1000, [0, 0, 1], [0.5, 0.5, 0.5], 10, 9.1, 7.9, 0.05, [70, 70, 6], [[0,0,0,0.1], [0,0,0,0.1], [0,0,0,0.1],[0,0,0,0.9]], [0.125], 1, 5, "", "", _position];
_ps1 setDropInterval 0.002;
sleep 1.2;
deletevehicle _ps1;

_temps_delai_porte = 1200; // Divise 2
for "_i" from 0 to _temps_delai_porte do
{
	_ps1 = "#particlesource" createVehicleLocal _position;
	_ps1 setParticleCircle [0, [0, 0, 0]];
	_ps1 setParticleRandom [0.2, [0.5, 0.5, 1], [1, 1, 1], 0.1, 0.1, [1, 0, 0, 0], 0, 0];
	_ps1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7, 1,1], "", "Billboard", 10, 60, [0, 0, 0], [0.5, 0.5, 0.5], 10, 0.1, 1, 10, [1, 1, 1], [[0,0,0,0.1], [0,0,0,0.1], [0,0,0,0.1],[0,0,0,0.9]], [0.125], 1, 5, "", "", _position];
	_ps1 setDropInterval 0.02;
	sleep 0.5;
	deletevehicle _ps1;
};