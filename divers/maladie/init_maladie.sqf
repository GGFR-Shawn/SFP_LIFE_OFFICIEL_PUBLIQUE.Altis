// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waitUntil {alive player};
waituntil {!isnil "fin_verification_apres_chargement"};
if (debug_mission_pour_dev) exitwith {};
if (getPlayerUID player in sfp_config_liste_admin) exitWith {};
if (player getvariable "ma_date_de_naissance" < 240) exitwith {};
if (round (random 3) != 2) exitwith {}; // Aléatoire maladie

while {true} do 
{
	sleep (3000 + (random 1600));
	sleep (3000 + (random 1600));
	
	_choix_tomber_malade = ["1","2"] call bis_fnc_selectrandom;
	if (_choix_tomber_malade == "1") then
	{
		if (isnil {player getvariable "j_ai_un_antibiotique"}) then
		{
			tempsavantmort = ceil(random 40) + 20;
			hint "! MALADIE DANGEREUSE ! \n\n Une vague de microbes vient de tomber sur Altis ! \n\n Tu viens de tomber malade !! \n\n Rends toi immédiatement à l'hopital pour te faire soigner ! \n\n Vite vite vite ! \n\n La prochaine fois, pour ne pas être touché, achète un antibiotique au médecin !\n ------------------------ \n By SFP Maxou";
			jesuismalade = 1;	
			maladiealeatoire = (floor(random 10) + 1);
			switch (maladiealeatoire) do
			{
				case 1:
				{
					nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
					nonapsi_ef ppEffectEnable true;
					nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.02, [9.5, 1.5, 3.5, 0.2], [9.0, 7.0, 5.2, 4.5],[0.4,0.0,0.0, 0.7]];
					nonapsi_ef ppEffectCommit 1;
				};
				case 2:
				{
					"colorCorrections" ppEffectAdjust [2, 30, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
					"colorCorrections" ppEffectCommit 0;
					"colorCorrections" ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];  
					"colorCorrections" ppEffectCommit 3;
					"colorCorrections" ppEffectEnable true;
					"filmGrain" ppEffectEnable true; 
					"filmGrain" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
					"filmGrain" ppEffectCommit 5;
					[] spawn 
					{
						waituntil {isplayer player};
						setwind [0.201112,0.204166,true];
						while {true} do 
						{
							_ran = ceil random 5;
							_obj = vehicle player;
							_pos = getPosATL _obj;

							setwind [0.201112*2,0.204166*2,false];
							_velocity = [random 10,random 10,-1];
							_color = [1.0, 0.9, 0.8];
							_alpha = 0.02 + random 0.02;
							_ps = "#particlesource" createVehicleLocal _pos;  
							_ps setParticleParams [["A3\Data_f\ParticleEffects\Universal\universal.p3d", 16, 12, 8], "", "Billboard", 1, 3, [0, 0, -6], _velocity, 1, 1.275, 1, 0, [9], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", _obj];
							_ps setParticleRandom [3, [30, 30, 0], [0, 0, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
							_ps setParticleCircle [0.1, [0, 0, 0]];
							_ps setDropInterval 0.01;

							sleep (random 1);
							deletevehicle _ps;
							_delay = 10 + random 20;
							sleep _delay;
						};
					};		
				};
				case 4:
				{
					setaperture 24;
					ppColor = ppEffectCreate ["ColorCorrections", 1999];
					ppColor ppEffectEnable true;
					ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0.0], [1, 1, 1, 1.0]];
					ppColor ppEffectCommit 0;

					ppBlur = ppEffectCreate ["dynamicBlur", 505];
					ppBlur ppEffectEnable true; 
					ppBlur ppEffectAdjust [.5];
					ppBlur ppEffectCommit 0;

					ppInversion = ppEffectCreate ['colorInversion', 2555];
					ppInversion ppEffectEnable true;
					ppInversion ppEffectAdjust [1,1,1];
					ppInversion ppEffectCommit 0;

					ppGrain = ppEffectCreate ["filmGrain", 2005];
					ppGrain ppEffectEnable true;
					ppGrain ppEffectAdjust [0.02, 1, 1, 0, 1];
					ppGrain ppEffectCommit 0;
				};
				case 5:
				{
					nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
					nonapsi_ef ppEffectEnable true;
					nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.1, [1.0, 0.2, 0.2, 0.0], [1.0, 0.4, 0.0, 0.1],[1.0,0.3,0.3, 0.5]];
					nonapsi_ef ppEffectCommit 2;
					sleep 0.5;
					nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.1, [0.0, 0.0, 0.0, 0.0], [0.0, 0.0, 0.0, 5.0],[0.4,0.0,0.0, 0.7]];
					nonapsi_ef ppEffectCommit 1;		
				};
				case 6:
				{
					nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
					nonapsi_ef ppEffectEnable true;
					nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.01, [0.0, 0.0, 0.0, 0.0], [8.0, 5.0, 2.0, 3.0],[0.4,0.0,0.0, 0.7]];
					nonapsi_ef ppEffectCommit 1;		
				};
				case 7:
				{
					ppe = ppEffectCreate ["colorCorrections", 1555]; 
					ppe ppEffectAdjust [1, 0.75, 0, [0.8,0.9,1,-0.1], [1,1,1,2], [-0.5,0,-1,5]]; 
					ppe ppEffectCommit 1;
					ppe ppEffectEnable true; 
					ppe2 = ppEffectCreate ["filmGrain", 1555]; 
					ppe2 ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false]; 
					ppe2 ppEffectCommit 1;
					ppe2 ppEffectEnable true;
				};
				case 8:
				{
					ppe = ppEffectCreate ["colorCorrections", 1555]; 
					ppe ppEffectAdjust [1, 0.75, 0, [0.8,0.9,1,-0.1], [1,1,1,2], [-0.5,0,-1,5]]; 
					ppe ppEffectCommit 1;
					ppe ppEffectEnable true; 
					ppe2 = ppEffectCreate ["filmGrain", 1555]; 
					ppe2 ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false]; 
					ppe2 ppEffectCommit 1;
					ppe2 ppEffectEnable true;
				};
				case 9:
				{
					ppe = ppEffectCreate ["colorCorrections", 1555]; 
					ppe ppEffectAdjust [1, 0.75, 0, [0.8,0.9,1,-0.1], [1,1,1,2], [-0.5,0,-1,5]]; 
					ppe ppEffectCommit 1;
					ppe ppEffectEnable true; 
					ppe2 = ppEffectCreate ["filmGrain", 1555]; 
					ppe2 ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false]; 
					ppe2 ppEffectCommit 1;
					ppe2 ppEffectEnable true;
				};
				case 10:
				{
					nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
					nonapsi_ef ppEffectEnable true;
					nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.02, [2.5, 0.5, 0.5, 0.2], [5.0, 2.0, 6.0, 2.0],[0.4,0.0,0.0, 0.7]];
					nonapsi_ef ppEffectCommit 1;
				};
				case 11:
				{
					nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
					nonapsi_ef ppEffectEnable true;
					nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.03, [11.2, 0.1, 0.2, 0.2], [12.2, 8.7, 3.6, 7.2],[0.4,0.0,0.0, 0.7]];
					nonapsi_ef ppEffectCommit 1;
				};
			};
			execvm "divers\maladie\tempsavantmort.sqf";
			execvm "divers\maladie\effets.sqf";
			if (isnil {player getvariable "je_suis_malade_a_la_sauvegarde"}) then {player setVariable["je_suis_malade_a_la_sauvegarde",true,true];};
		}else
		{
			hint "Une vague de microbe c'est abatu sur Altis ! \n\n Grace à ton antibiotique, tu n'es pas touché !";
		};
	};
};
