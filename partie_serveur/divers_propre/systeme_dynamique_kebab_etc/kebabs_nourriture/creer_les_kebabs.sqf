// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_position_kebab";

"DIAG SFP : Kébab : Démarrage du script." spawn historique_creation_log_sfp;

_listes_des_kebabs = ["Land_Kiosk_gyros_F","Land_Kiosk_blueking_F","Land_Kiosk_redburger_F","Land_Kiosk_papers_F"];
_position_des_kebabs_sfp = [[12631.8,14405.1,0.130655],[12457.8,14183.5,0.000237465],[12821.6,14258,0.413352],[12862.7,15025.6,0.104622],[11445.6,14140,0.0123177],[12397,15775.5,0.000936508],[12459.6,15964,0.000183105],[10958.9,13494,0.00131607],[10664.1,12229,0.114347],[9478.55,16047.6,0.371841],[9336.92,15856.6,0.0645447],[9057.49,15747.2,0.351768],[14547.3,17572.6,0.000185013],[14918.1,17585.3,0.0106544],[9222.97,12001.2,0.000331879],[14867.6,11065.9,0.368423],[16044.3,16458.2,-0.045845],[9067.68,12038,0.178848],[13888.7,18556.4,0.0546284],[14120.5,18512.3,0.268637],[16864.8,15449.7,0.17486],[16580.4,12463.4,0.00103951],[13959.6,18689.9,0.203318],[16753.1,12710.9,0.0712872],[16699.7,12476.3,0.158437],[9385.12,10930.3,0.12003],[16802.3,12466.4,0.441105],[16247.5,17299.7,0.000356674],[16913.8,12596.4,0.0299263],[17436.3,13965.6,0.0335321],[7410.7,15359.3,0.000606537],[10294.1,19133.9,0.30336],[8685.38,18277.2,0.200287],[8577.4,18427.6,0.174057],[18141.9,15285.2,0.000556946],[7061.8,16400.9,0.206673],[17450.7,18313.4,0.000760555],[6175.81,15071.9,0.000642776],[7094.83,10971.2,0.0484614],[17867.3,18147.6,9.15527e-005],[18790.8,16724,0.000148773],[18884.5,16552.4,3.24249e-005],[14652.6,20791.3,0.359207],[19454.8,13279.3,0.0688019],[5440.28,15074,0.00117874],[5396.18,15033.5,6.48499e-005],[4872.44,16123.7,0.39521],[5068.6,11194.1,0.0833092],[20209.2,11743.6,0.230148],[5091.48,10758.6,0.0863266],[20295.9,11598.6,0.567421],[4163.78,14956.3,0.0537682],[4264.1,16475.4,0.443501],[20731.7,16592,0.165577],[18408.5,8183,0.0422368],[3807.56,13691.7,0.000730515],[4139.35,11705.2,0.364689],[3768.91,13105.7,0.000297546],[20969.2,16957.7,0.171925],[3647.94,13517.1,0.292462],[21017.8,16909.2,0.061512],[3603.58,13785.5,0.230996],[3691.13,12880.2,0.000349045],[3712.7,12726,0.0705776],[3637.18,13099.4,8.29697e-005],[3552.04,14003.8,0.121327],[3725.45,12269.2,0.320274],[9286.33,22810.1,0.330221],[21328.9,16368.7,0.00200653],[3419.44,13289.1,0.0920091],[3328.02,14246.8,0.00105095],[3375.2,13243.6,-0.0791597],[3854.19,17509.1,0.0618324],[3781.75,11220.6,0.16692],[3377.01,12608.8,0.0712233],[3661.4,11467.9,0.00102758],[20199.6,19613.9,0.146326],[21537.5,10942.6,0.104544],[20579.2,8925.19,0.0901108],[23089.2,15784.3,0.166587],[20841.3,6838.91,0.116264],[25626,21383.5,5.34058e-005],[25793.6,21307.9,0.0874786],[27497.1,20857.4,0.00156879],[26902.7,23180.7,-0.0788822],[27060.2,23358,-0.00414848],[26901.8,24337.5,0.00226593]];
_nombre_max_de_kebab = round (10 + (random 10));
_nombre_de_kebab_creer = 0;

for "_i" from 0 to (round (count _position_des_kebabs_sfp - 1)) do
{
	if (_nombre_max_de_kebab > 0) then
	{
		if (round random 2 == 1) then
		{
			if (count ((_position_des_kebabs_sfp select _i) nearEntities [["Man"], 5]) < 1) then
			{
				_le_kebab_sfp = (nearestObjects [(_position_des_kebabs_sfp select _i), _listes_des_kebabs,10]) select 0;
				_nombre_max_de_kebab = round (_nombre_max_de_kebab - 1);
				_nombre_de_kebab_creer = round (_nombre_de_kebab_creer + 1);
				
				direction_kebab = ((getdir _le_kebab_sfp) - 180); 
				_position_kebab = [(getPosATL _le_kebab_sfp select 0) - (0), (getPosATL _le_kebab_sfp select 1) + (0.1), getPosATL _le_kebab_sfp select 2];

				group2 = Creategroup CIVILIAN; 
				_creer_marchand_kebab = group2 createUnit ["C_man_1_1_F", _position_kebab, [], 0, "CAN_COLLIDE"];
				_creer_marchand_kebab disableAI "MOVE";
				_creer_marchand_kebab stop true;
				_creer_marchand_kebab allowDamage false; 
				_creer_marchand_kebab setdir ((getdir _le_kebab_sfp) - 180);

				_nom_du_marker_kebab = format ["vendeur_kebab_repere_%1",round ((_position_kebab) select 0)];
				_repere_vendeur_kebab = createMarker [_nom_du_marker_kebab, _position_kebab];
				_repere_vendeur_kebab setMarkerColor "ColorBrown";
				_repere_vendeur_kebab setMarkerShape "ICON";
				_repere_vendeur_kebab setMarkerType "loc_PowerWave";
				_repere_vendeur_kebab setMarkerSize [0.6, 0.6];
				
				[[[_creer_marchand_kebab],"divers\systeme_dynamique_kebab_etc\kebabs_nourriture\addaction_jebab.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
				
				_choix_faillite_kebab = ["1","2","3","4","5"] call bis_fnc_selectrandom;
				if (_choix_faillite_kebab == "1") then
				{
					[_creer_marchand_kebab,_nom_du_marker_kebab,"1"] execvm "partie_serveur\divers_propre\systeme_dynamique_kebab_etc\kebabs_nourriture\kebab_faillite.sqf";
				};
			};
		};
	};
};

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
_detail_du_log = format ["Nombre de kebab creer : %1", _nombre_de_kebab_creer];
["Historique Divers", "Historique Divers", _heure_du_log, _detail_du_log] call saveToDB;
"DIAG SFP : Kébab : Fin du script." spawn historique_creation_log_sfp;
