// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {alive player};
waitUntil {!isNil "fin_verification_apres_chargement"};

player addEventHandler
[
	"Hit",
	{
		[((_this select 2) * (1000 + (random 1000)))] call BIS_fnc_bloodEffect;
	}
];

player addEventHandler 
[
	"killed",
	{
		_this execvm "divers\compilation_fonction_mp\execution_script_apres_mort\execution_script_apres_mort.sqf";
		player setvariable ["besoin_d_un_revive_news",true,true];
	}
];


if (revive_mon_side == west) then
{
	player addEventHandler ["killed", "_this execvm 'divers\gendarmerie\remettre_arme_quand_gendarme_meurt.sqf'"];
};

player addEventHandler 
[
	"WeaponAssembled", 
	{
		deleteVehicle _this select 1;
		titleText ["Interdiction d assembler !", "PLAIN", 3];
	}
];

player addEventHandler
[
	"HandleDamage",
	{
		_le_joueur_causant_dammage = _this select 3;
		_la_vitesse_du_joueur_causant_degat = speed _le_joueur_causant_dammage;
		_la_position_du_joueur_causant_degat = getPosATL _le_joueur_causant_dammage;
		_mon_nom = name player;
		if (isnil "_le_joueur_causant_dammage" or isnil "_la_vitesse_du_joueur_causant_degat" or isnil "_la_position_du_joueur_causant_degat" or isnil "_mon_nom") exitwith {};
				
		if (vehicle _le_joueur_causant_dammage != player && vehicle player == player) then
		{
			if ((assignedVehicleRole _le_joueur_causant_dammage) select 0 == "driver" && _la_vitesse_du_joueur_causant_degat > 5) then
			{
				if !(vehicle _le_joueur_causant_dammage iskindof "air") then
				{
					if (!alive player) then
					{
						if (isnil "degat_car_kill_en_cours") then {degat_car_kill_en_cours = 0;};
						if (degat_car_kill_en_cours >= 1) exitwith {};
						degat_car_kill_en_cours = 1; [] spawn {sleep 3; degat_car_kill_en_cours = nil;};
						
						titletext [format ["Vous avez subit un carkill ! Le joueur %1 va être automatiquement banni si besoin ! (MAX carkill autorisé est de %2).", name _le_joueur_causant_dammage, sfp_config_nombre_carkill_autorise],"PLAIN"];
						[[[_le_joueur_causant_dammage, _la_vitesse_du_joueur_causant_degat, _la_position_du_joueur_causant_degat, _mon_nom],"divers\anti_car_kill.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

						[_le_joueur_causant_dammage] spawn
						{
							_le_joueur = name (_this select 0);
							
							// sleep 20;
							waituntil {!isnil {player getvariable "besoin_d_un_revive_news"}};
							sleep 2;
							
							// if (!isnil {player getvariable "besoin_d_un_revive_news"}) then
							// {
								if (!isnil {player getvariable "detection_demande_revive"}) then {player setVariable ["detection_demande_revive",nil,true];};
								player setvariable ["besoin_d_un_revive_news",nil,true];
								player globalchat format ["Le kikou %1 ta carkill ... Tu as donc été réanimé automatiquement !", _le_joueur];
							// };
						};
					};
				};
			};
		};
	}
];

player addEventHandler 
[
	"fired", 
	{
		if (isplayer cursortarget) then
		{
			_le_joueur = cursortarget;
			
			_le_joueur spawn
			{
				if (isnil "protection_carte_identite_tir") then {protection_carte_identite_tir = 0;};
				if (protection_carte_identite_tir >= 1) exitwith {};
				protection_carte_identite_tir = 1;
				
				sleep 0.5;
				if (!alive _this) then
				{
					_information_carte_une = player getvariable "ma_carte_identite" select 0;
					_information_carte_deux = player getvariable "ma_carte_identite" select 1;
					_information_carte_trois = player getvariable "ma_carte_identite" select 2;
					_information_carte_quatre = player getvariable "ma_carte_identite" select 3;
					_information_carte_cinq = player getvariable "ma_carte_identite" select 4;
					_information_carte_six = player getvariable "ma_carte_identite" select 5;
					if (isnil "_information_carte_une" or isnil "_information_carte_deux" or isnil "_information_carte_trois" or isnil "_information_carte_quatre" or isnil "_information_carte_cinq" or isnil "_information_carte_six") exitwith {};
					
					if (_this getvariable "ma_carte_identite" select 1 != "nom" && isnil {_this getvariable "avertir_carte_tuer"}) then
					{
						player setVariable ["ma_carte_identite",[_information_carte_une, _information_carte_deux, format ["J'ai tué %1 (SON NOM RP : %2 %3) il y à moins de 20 secondes.",name _this, _this getvariable "ma_carte_identite" select 1, _this getvariable "ma_carte_identite" select 2], _information_carte_quatre, _information_carte_cinq, _information_carte_six], true];					
					}else
					{
						player setVariable ["ma_carte_identite",[_information_carte_une, _information_carte_deux, format ["J'ai tué %1 (SON NOM DE PROFIL) il y à moins de 20 secondes.",name _this], _information_carte_quatre, _information_carte_cinq, _information_carte_six], true];					
					};
					player setvariable ["avertir_carte_tuer",true,true];
					sleep 20;
					player setVariable ["ma_carte_identite",[_information_carte_une, _information_carte_deux, _information_carte_trois, _information_carte_quatre, _information_carte_cinq, _information_carte_six], true];
					player setvariable ["avertir_carte_tuer",nil,true];
				};
				protection_carte_identite_tir = nil;
			};
		};
	}
];

player addEventHandler
[
	"InventoryOpened",
	{
		_this execvm "divers\verrouiller_sac_a_dos\verification_sac_a_dos_nouveau.sqf";
		
		[] spawn 
		{
			waitUntil {!isNull (findDisplay 602)};
			
			player addEventHandler ["InventoryClosed", 
			{ 
				removeMissionEventHandler ["Draw3D", missionNamespace getVariable "valeur_load_sfp"]; 
			}]; 
			
			_quand_ouvert_sfp = addMissionEventHandler 
			[
				"Draw3D", 
			{ 
				(findDisplay 602 displayCtrl 111) ctrlSetText (" Charge actuel : " + "" +  str round (loadAbs player * (1 / 2.2046) / 10) + " kgs." + " (By SFP Maxou - sfpteam.fr)");
			}]; 
			
			missionNamespace setVariable ["valeur_load_sfp", _quand_ouvert_sfp];  
		}; 
	}
];

player addEventHandler ["WeaponDisassembled",
{
	_this spawn
	{
		_le_joueur = _this select 0;
		_sac_un = _this select 1;
		_sac_deux = _this select 2;
		_condition = false;
		
		if (isnil {_sac_un getvariable "vehicule_info_parvariable"}) then {_condition = true;};
		if (isnil {_sac_deux getvariable "vehicule_info_parvariable"}) then {_condition = true;};
		
		if (_condition) then 
		{
			_currBag = unitBackpack _le_joueur;

			titleText ["Les armes du territoire gang ne peuvent etre prises !", "PLAIN DOWN", 0.5];

			_le_joueur action ["TakeBag", _sac_un];

			_time = time;
			waitUntil {unitBackpack _le_joueur == _sac_un || time - _time > 3};

			_le_joueur action ["Assemble", _sac_deux];
			_sac_deux setVariable ["vehicule_info_parvariable", ["vehicule_capture_gang"], false];

			if (!isNull _currBag) then 
			{
				_le_joueur action ["TakeBag", _currBag];
			};
		};
	};
}];
