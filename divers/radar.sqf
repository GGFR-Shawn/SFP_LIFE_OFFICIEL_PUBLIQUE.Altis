// =======================================================================================================================================================================================
															// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
															  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_vehicule","_vitesse","_information","_immatriculation"];
_arme_autorise = ["Pistolet_Radar_Gendarmerie_SFP","Pistolet_Radar_Gendarmerie_SFP_Reseau"];
if !(currentWeapon player in _arme_autorise) exitWith {hint "Vous n'avez pas le pistolet radar en main !";};
if (isnil "autorisation_arme_pistolet_radar_gendarmerie") then {autorisation_arme_pistolet_radar_gendarmerie = 0;};
if (revive_mon_side != west) exitWith {};
if (autorisation_arme_pistolet_radar_gendarmerie >= 1) exitwith {};
autorisation_arme_pistolet_radar_gendarmerie = 1;

_arme_autorise spawn
{
	_arme_autorise = _this;
	if (isnil "affichage_point_rouge_ecran") then
	{
		affichage_point_rouge_ecran = true;
		
		29000 cutRsc ["Point_Rouge_Sur_L_Ecran_SFP","PLAIN"];
		
		waituntil {sleep 0.1; !(currentWeapon player in _arme_autorise)};
		
		29000 cuttext ["","PLAIN"];
		
		affichage_point_rouge_ecran = nil;
	};
};

while {currentWeapon player in _arme_autorise} do 
{
	if (!isnil {cursortarget getvariable "vehicule_info_parvariable"}) then 
	{
		_vehicule = cursorTarget;
		_vitesse = format ["%1 km/h.",round (speed _vehicule)];
		_information = "Machine sans reseau";
		_immatriculation = "";
		
		if (currentWeapon player == "Pistolet_Radar_Gendarmerie_SFP_Reseau") then 
		{
			if !(isnil {_vehicule getvariable "vehicule_info_parvariable"}) then
			{	
				_vitesse = format ["%1 km/h.",round (speed _vehicule)];
				_information = _vehicule getvariable "vehicule_info_parvariable" select 0;
				_immatriculation = format ["%1", _vehicule getvariable "plaque_immatriculation_news" select 0];
			}else
			{
				_information = "Véhicule sans proprio.";
			};
		};
		
		hintsilent parseText format 
		[
			"
				<t color='#ffffff'><t size='1.8'><t align='center'>! Radar mobile !</t></t></t>
				<br/>
				<t size='0.8'><t align='center'>Actualisé toutes les secondes</t></t>
				<br/>
				<t align='center'><t size='1'>----------------------------------</t></t>
				<br/>
				<br/>
				<t align='center'><t size='1.3'>Vitesse du véhicule :</t></t>

				<t color='#33CC33'>%1</t>
				<br/>
				<br/>
				<t align='center'><t size='1.3'>Info plaque :</t></t>
				<br/>
				<t color='#33CC33'>%2</t>
				<br/>
				<br/>
				<t color='#33CC33'>%3</t>
				<br/>
				<br/>
				<t align='center'><t size='1'>----------------------------------</t></t>
				<br/>
				<t align='center'><t size='1'>By Maxou - www.sfpteam.fr</t></t>
			",
				_vitesse,
				_information,
				_immatriculation
		];
	}else
	{
		hintsilent parseText format 
		[
			"
				<t color='#ffffff'><t size='1.8'><t align='center'>! Radar mobile !</t></t></t>
				<br/>
				<t size='0.8'><t align='center'>Actualisé toutes les secondes</t></t>
				<br/>
				<t align='center'><t size='1'>----------------------------------</t></t>
				<br/>
				<br/>
				<t align='center'><t size='1.3'>Vitesse du véhicule :</t></t>

				<t color='#33CC33'>%1</t>
				<br/>
				<br/>
				<t align='center'><t size='1.3'>Info plaque :</t></t>
				<br/>
				<t color='#33CC33'>%2</t>
				<br/>
				<br/>
				<t align='center'><t size='1'>----------------------------------</t></t>
				<br/>
				<t align='center'><t size='1'>By Maxou - www.sfpteam.fr</t></t>
			",
				"0",
				"Aucun véhicule pointé"
		];
	};
	sleep 1;
};

autorisation_arme_pistolet_radar_gendarmerie = nil;