// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!hasInterface) exitwith {};

_endroit_tir_feux_artifice = _this select 0;
_type = _this select 1;
_velocity_sfp = _this select 2;
_force_explosion_sfp = _this select 3;
_nombre_de_particule_sfp = _this select 4; 
_couleur_feu_sfp = _this select 5;
_explosion_fragments_tableau = _this select 6;
_explosion_fragments_substitu_tableau = _this select 7;
_random_temps_attente = _this select 8;
_random_temps_attente_long = _this select 9;
_bruit_du_lancement_feu_sfp = _this select 10;
_bruit_whist_sfp = _this select 11;
_bruit_explosion_feu_sfp = _this select 12;
_bruit_simple_sfp = _this select 13;
_bruit_simple_groupe_sfp = _this select 14;
_random_temps_attente_court = _this select 15;
///////////////////////////////////////////////

_fusee_lancement_feu_sfp ="CMflare_Chaff_Ammo" createVehicleLocal [_endroit_tir_feux_artifice select 0,_endroit_tir_feux_artifice select 1, 0]; 
_fusee_lancement_feu_sfp setVelocity _velocity_sfp; 

_lumiere_fusee_lancement_feu_sfp = "#lightpoint" createVehicleLocal [0,0,0];
_lumiere_fusee_lancement_feu_sfp setLightBrightness random 1;
_lumiere_fusee_lancement_feu_sfp setLightColor [1,0.3,0];
_lumiere_fusee_lancement_feu_sfp setLightUseFlare true;
_lumiere_fusee_lancement_feu_sfp setLightFlareMaxDistance 1000;
_lumiere_fusee_lancement_feu_sfp setLightFlareSize random 2;

_lumiere_fusee_lancement_feu_deux_sfp = "#lightpoint" createVehicleLocal [0,0,0];
_lumiere_fusee_lancement_feu_deux_sfp setLightBrightness 0.08;
_lumiere_fusee_lancement_feu_deux_sfp setLightColor [1,0.8,0];
_lumiere_fusee_lancement_feu_deux_sfp setLightUseFlare true;
_lumiere_fusee_lancement_feu_deux_sfp setLightFlareMaxDistance 1000;
_lumiere_fusee_lancement_feu_deux_sfp setLightFlareSize 1;
_lumiere_fusee_lancement_feu_sfp lightAttachObject  [_fusee_lancement_feu_sfp,[0,0,0]];
_lumiere_fusee_lancement_feu_deux_sfp lightAttachObject  [_fusee_lancement_feu_sfp,[0,0,0]];

_fusee_lancement_feu_sfp say3D _bruit_du_lancement_feu_sfp;
if (_type == "fizzer") then {_fusee_lancement_feu_sfp say3D _bruit_whist_sfp;};

sleep (2 + _random_temps_attente_court);

deleteVehicle _lumiere_fusee_lancement_feu_sfp;
deleteVehicle _lumiere_fusee_lancement_feu_deux_sfp;

_nul2 = "FxExploArmor3" createVehicleLocal (getPos _fusee_lancement_feu_sfp);
sleep 0.15;
_nul2 say3D _bruit_explosion_feu_sfp;

for [{_i=0},{_i < count _explosion_fragments_tableau},{_i=_i+1}] do 
{
	[_fusee_lancement_feu_sfp,_type,_explosion_fragments_tableau,_explosion_fragments_substitu_tableau,_couleur_feu_sfp,_nombre_de_particule_sfp,_i,_random_temps_attente,_random_temps_attente_long,_bruit_simple_sfp,_bruit_simple_groupe_sfp,_bruit_explosion_feu_sfp] spawn 
	{
		_fusee_lancement_feu_sfp = _this select 0;
		_type2 = _this select 1;
		_fragments = _this select 2;
		_subfragments = _this select 3;
		_couleur_deux = _this select 4;
		_nombres_de_particule_2 = _this select 5;
		_selection_sfp = _this select 6;
		_random_attente_deux = _this select 7;
		_random_attente_deux_long = _this select 8;
		_singleFizz1 = _this select 9;
		_groupFizz1 = _this select 10;
		_bruit_explosion_deux = _this select 11;

		_nul2 ="CMflare_Chaff_Ammo" createVehicleLocal (getPos _fusee_lancement_feu_sfp); 
		_fumee_feu_sfp ="SmokeLauncherAmmo" createVehicleLocal (getPos _fusee_lancement_feu_sfp);	
		_nul2 setVelocity (_fragments select _selection_sfp);

		_lumiere_fusee_lancement_feu_deux_sfp = "#lightpoint" createVehicleLocal [0,0,0];
		_lumiere_fusee_lancement_feu_deux_sfp setLightBrightness 1.0;
		_lumiere_fusee_lancement_feu_deux_sfp setLightAmbient _couleur_deux;		
		_lumiere_fusee_lancement_feu_deux_sfp setLightColor _couleur_deux;
		_lumiere_fusee_lancement_feu_deux_sfp lightAttachObject  [_nul2,[0,0,0]];
		_lumiere_fusee_lancement_feu_deux_sfp setLightUseFlare true;
		_lumiere_fusee_lancement_feu_deux_sfp setLightFlareMaxDistance 1000;
		_lumiere_fusee_lancement_feu_deux_sfp setLightFlareSize 3;
		
		if (_type2 == "normal") then 
		{
			sleep (3 + (random 1));
			deleteVehicle _lumiere_fusee_lancement_feu_deux_sfp;
		};
		
		if (_type2 == "fizzer")  then
		{
			sleep 1.0;
			deleteVehicle _lumiere_fusee_lancement_feu_deux_sfp;
			
			_nul2 say3D _bruit_explosion_deux;
		
			for [{_j=0},{_j < (count _subfragments)},{_j=_j+1}] do 
			{			
				[_nul2,_type2,_subfragments,_couleur_deux,_j,_random_attente_deux,_random_attente_deux_long,_singleFizz1,_groupFizz1,_bruit_explosion_deux] spawn 
				{
					_lanceur_deux_sfp = _this select 0;
					_type3 = _this select 1;
					_subfragments2 = _this select 2;
					_couleur_sfp_trois = _this select 3;
					_selection_2_sfp = _this select 4;
					_random_attente_3 = _this select 5;
					_random_attente_3_long = _this select 6;
					_singleFizz2 = _this select 7;
					_groupFizz2 = _this select 8;
					_bangSound2 = _this select 9;
					_posx = (getPos _lanceur_deux_sfp) select 0;
					_posy = (getPos _lanceur_deux_sfp) select 1;
					_posz = (getPos _lanceur_deux_sfp) select 2;
					
					deleteVehicle _lanceur_deux_sfp;
					
					_nul3 ="F_20mm_White" createVehicleLocal [_posx + ((random 20)-10),_posy+ ((random 20)-10),_posz+ ((random 20)-10)];
					_nul3 setVelocity (_subfragments2 select _selection_2_sfp);
					_light3 = "#lightpoint" createVehicleLocal [0,0,0];
					_light3 setLightBrightness 2;
					_light3 setLightAmbient _couleur_sfp_trois;
					_light3 setLightColor _couleur_sfp_trois;
					_light3 lightAttachObject  [_nul3,[0,0,0]];
					_light3 setLightUseFlare true;
					_light3 setLightFlareMaxDistance 1000;
					_light3 setLightFlareSize 1;

					sleep (random 1);
					
					_nul3 say3D (_singleFizz2);

					sleep (2 - (random 1.5));

					deleteVehicle _light3;
					deleteVehicle _nul3;
				};
			};
		};

		if (_type2 == "rain")  then 
		{
			sleep 1.0;
			
			_nul2 say3D _bruit_explosion_deux;
		
			[_nul2,_type2,_fragments,_couleur_deux,_selection_sfp,_random_attente_deux,_random_attente_deux_long,_singleFizz1,_groupFizz1,_bruit_explosion_deux] spawn 
			{
				_lanceur_deux_sfp = _this select 0;
				_type2 = _this select 1;
				_subfragments2 = _this select 2;
				_couleur_sfp_trois = _this select 3;
				_selection_2_sfp = _this select 4;
				_random_attente_3 = _this select 5;
				_random_attente_3_long = _this select 6;
				_singleFizz2 = _this select 7;
				_groupFizz2 = _this select 8;
				_bangSound2 = _this select 9;
				_posx = (getPos _lanceur_deux_sfp) select 0;
				_posy = (getPos _lanceur_deux_sfp) select 1;
				_posz = (getPos _lanceur_deux_sfp) select 2;

				deleteVehicle _lanceur_deux_sfp;
				
				_nul3 ="FxWindPollen1" createVehicleLocal [getPos _lanceur_deux_sfp select 0,getPos _lanceur_deux_sfp select 1,getPos _lanceur_deux_sfp select 2];
				_nul3 setVelocity (_subfragments2 select _selection_2_sfp);

				_light3 = "#lightpoint" createVehicleLocal [0,0,0];
				_light3 setLightBrightness 2;
				_light3 setLightAmbient _couleur_sfp_trois;
				_light3 setLightColor _couleur_sfp_trois;
				_light3 lightAttachObject  [_nul3,[0,0,0]];
				_light3 setLightUseFlare true;
				_light3 setLightFlareMaxDistance 1000;
				_light3 setLightFlareSize 1;

				sleep (random 1);
				
				_nul3 say3D (_singleFizz2);

				sleep (2 - (random 1.5));
				
				deleteVehicle _light3;
				deleteVehicle _nul3;
			};
			sleep 1;
			deleteVehicle _lumiere_fusee_lancement_feu_deux_sfp;
		};
	};
};

sleep 1;

_nul2 say3D (_bruit_simple_groupe_sfp);
sleep 2;
deleteVehicle _nul2;
