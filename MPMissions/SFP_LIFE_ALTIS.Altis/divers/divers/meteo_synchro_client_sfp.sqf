// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 4; !isnil "meteo_sfp_maxou";};
private ["_neige_sfp","_resultat_neige","_resultat_rafale_de_vent","_resultat_creme_solaire_sfp"];

// Synchro Météo Serveur
if (!hasinterface) then
{
	1 setfog 0;
	sleep 3;
	skipTime 24;
	sleep 4;
	0 setFog 0;
	forceWeatherChange;
	999999 setFog 0;			
};

// Synchro Météo Serveur et client
1 setfog 0;
sleep 3;

while {true} do
{
	_temps_duree_changement_sfp = [ meteo_sfp_maxou, 0, 60 ] call BIS_fnc_param;
	_nuages_sfp = [ meteo_sfp_maxou, 1, overcast ] call BIS_fnc_param;
	_brouillard_sfp = [ meteo_sfp_maxou, 2, fog ] call BIS_fnc_param;
	_pluie_sfp = [ meteo_sfp_maxou, 3, 0 ] call BIS_fnc_param;
	_rafale_de_vent_sfp = [ meteo_sfp_maxou, 4, 0 ] call BIS_fnc_param;
	_vent_sfp = [ meteo_sfp_maxou, 5, 0 ] call BIS_fnc_param;
	_vague_sfp = [ meteo_sfp_maxou, 6, 0 ] call BIS_fnc_param; 
	_neige_sfp = [ meteo_sfp_maxou, 7, 0 ] call BIS_fnc_param; 

	_temps_duree_changement_sfp setovercast _nuages_sfp;
	_temps_duree_changement_sfp setfog _brouillard_sfp;
	_temps_duree_changement_sfp setrain _pluie_sfp;
	_temps_duree_changement_sfp setGusts _rafale_de_vent_sfp;
	_temps_duree_changement_sfp setWaves _vague_sfp;
	setWind [_vent_sfp, _vent_sfp, true];
	
	_neige_sfp spawn
	{
		_neige_sfp = _this;
		if (_neige_sfp) then
		{
			if (isnil "creation_neige_publique_sfp") then
			{
				creation_neige_publique_sfp = "#particlesource" createVehicleLocal (getPosATL player);
				creation_neige_publique_sfp setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1,0,1,0],"","Billboard",1,10,[0,0,0],[0,0,-10],10,1,0,1,[0.12,0.12],[[1,1,1,0.5],[1,1,1,0.5]],[0,1],0.25,1,"","", player];
				creation_neige_publique_sfp setParticleRandom [0, [25, 25, 18], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
				creation_neige_publique_sfp setParticleCircle [0.0, [0, 0, 0]];
				creation_neige_publique_sfp setDropInterval 0.001;
				_position_de_depart = getPosATL player;
				while {!isnil "creation_neige_publique_sfp"} do
				{
					if (player distance _position_de_depart > 100) then
					{
						creation_neige_publique_sfp setPosATL (getPosATL player);
					};
					sleep 2;
				};						
			};
		}else
		{
			if (!isnil "creation_neige_publique_sfp") then
			{
				deletevehicle creation_neige_publique_sfp;
				creation_neige_publique_sfp = nil;
			};
		};
	};

	if (!isnil "desactiver_message_infos_ecran") then
	{
		if (desactiver_message_infos_ecran < 1) then
		{
			if (_neige_sfp) then {_resultat_neige = "Oui";}else{_resultat_neige = "Non";};
			if (_vent_sfp < 20) then {_resultat_rafale_de_vent = 0;}; if (_vent_sfp >= 20) then {_resultat_rafale_de_vent = round (_vent_sfp * 3 + (random 20) + 7);}; if (_vent_sfp >= 30) then {_resultat_rafale_de_vent = round (_vent_sfp * 3 + (random 30) + 15);}; if (_vent_sfp >= 40) then {_resultat_rafale_de_vent = round (_vent_sfp * 3 + (random 60) + 30);};
			if (_temps_duree_changement_sfp != 60) then {_resultat_creme_solaire_sfp = "";}else{_resultat_creme_solaire_sfp = "Sortez vos crèmes solaires, aucun changement n'aura lieu aujourd'hui !";};
			
			if (round (random 10) == 1) then
			{	
				_meteo_sfp_maxou = format 
				["
					<t color='#D9B398' size='1.4' align='center'>! SFP METEO !</t>
					<t align='center'>-------------------------------------------------</t>
					<br/>
					Voici les dernières prévisions de SFP METEO pour les %1 prochaine(s) heure(s) :
					<br/>
					<br/>
					<t align='left'>
					<t size='1'>Nuages : <t color='#179101' size='1'>%2 %9</t>.</t><br/>
					<t size='1'>Pluie : <t color='#179101' size='1'>%3 %9</t>.</t><br/>
					<t size='1'>Brouillard : <t color='#179101' size='1'>%4 %9</t>.</t><br/>
					<t size='1'>Neige : <t color='#179101' size='1'>%5</t>.</t><br/>
					<t size='1'>Vent : <t color='#179101' size='1'>%6 Km/H</t>.</t><br/>
					<t size='1'>Rafale : <t color='#179101' size='1'>%7 Km/H</t>.</t><br/>
					<t size='1'>Puissance Vague : <t color='#179101' size='1'>%8 %9</t>.</t><br/>
					</t>
					<t align='center'>-------------------------------------------------</t><br/>
					<t color='#FFFFFF' size='1'>www.sfpteam.fr, by Maxou.</t>
				",
					round (_temps_duree_changement_sfp / 60),
					round (_nuages_sfp * 100),
					round (_pluie_sfp * 100),
					round (_brouillard_sfp * 100),
					_resultat_neige,
					round (_vent_sfp * 3),
					_resultat_rafale_de_vent,
					round (_vague_sfp * 100),
					"%",
					_resultat_creme_solaire_sfp
				];
				hintsilent parseText _meteo_sfp_maxou;		
			};
		};
	};

	1 setfog 0;
	
	sleep 100;
};


