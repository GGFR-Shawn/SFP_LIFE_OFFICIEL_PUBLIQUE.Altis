// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_vehicule = _this select 0;
if (isnil "_le_vehicule") exitwith {};

_pot_echappement = "#particlesource" createVehicleLocal (position _le_vehicule);
_pot_echappement setParticleCircle [0, [0, 0, 0]];
_pot_echappement setParticleRandom [1, [0, 0, 0], [-2, -2, 2], 0.1, 1 , [0.1, 0.1, 0.1, 0.1], 0, 0];
_pot_echappement setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7, 1,1], "", "Billboard", 10, 6 , [ 0 , 0, -0.7], [0.5, 0.5, 0.5], 10, -2, -1.5,0.1, [0.8, 0.8, 0.8], [[0,0,0,1], [0,0,0,1], [0,0,0,1],[0,0,0,1]], [1], 11, 0, "", "", position _le_vehicule];
_pot_echappement setDropInterval 0.00015;
sleep 0.07;
deletevehicle _pot_echappement;
