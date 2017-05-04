//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


if (!isClass(configFile >> "CfgVehicles" >> "C_Hatchback_01_rallye_F_Maxou")) exitwith {hint "Désolé, vous n'avez pas le launcher pour louer un véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};

if((lbCurSel 11173) == -1) exitwith {Hint "Tu n'as pas selectionné de véhicule de location !";};
if(floor parseNumber (ctrlText 11175) <= 59) exitwith {_madureedelocation = (floor parseNumber (ctrlText 11175)); Hint format ["Désolé, %1 minutes n'est pas valide ! La durée minimum est de 1 heure !",_madureedelocation];};

if (player distance (getpos kavala) < 200) then {carspawn = getMarkerPos "achatspawncarlocationkavaka";};
if (player distance (markerpos "marker_achat_vehicule_aeroport") < 10) then {carspawn = getMarkerPos "achatspawncar";};
if (player distance (markerpos "marker_Galati") < 15) then {carspawn = getMarkerPos "achatspawncarlocationGalati";};
if (player distance (markerpos "achatspawnville2") < 30) then {carspawn = getMarkerPos "achatspawnville2";};
if (player distance (markerpos "spawnvehiculedelocation") < 30) then {carspawn = getMarkerPos "spawnvehiculedelocation";};


argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";

if((lbCurSel 11173) == 0) then
{
	dureeenminutes = (floor parseNumber (ctrlText 11175));
	prixdelalocation = 3 * (floor parseNumber (ctrlText 11175));
	prixfranchise = 1250;
	if((player getVariable "mon_argent_banque_by_sfp_maxou") >= prixdelalocation) then
	{
		if (jaireserverunevoiture == 0) then
		{
			jaireserverunevoiture = 1;
			vehname = "C_Quadbike_01_F_Location";
			
			_veh = createVehicle [vehname, carspawn, [], 0, "NONE"];
			vehiclelock = _veh addAction ["Deverouiller / Verrouiller Location",'divers\vehiclelock\unlocklock_location.sqf',[],10,true,true,'','vehicle player == player && (_target distance _this) < 10'];
			vehiclelock_deux = _veh addAction ["Deverouiller / Verrouiller Location",'divers\vehiclelock\unlocklock_location.sqf',[],10,true,true,'',"vehicle player != player && (((vehicle player getvariable 'vehicule_info_parvariable') select 0) == 'Altis location\nVéhicule de location\n Véhicule SANS PERMIS')"];
			tempsrestantaction = _veh addAction ["<t color=""#0080FF"">" + 'Temps restant de location','divers\locations_de_vehicules\temps_restant.sqf',[],9,true,true,'','(_target distance _this) < 10'];
			_veh setVariable["vehicule_info_parvariable",["Altis location\nVéhicule de location\n Véhicule SANS PERMIS"],true];
			_veh addEventHandler["GetOut", {(_this select 0) lock true}];
			
			_numero_de_plaque = [] call compil_plaque_immatriculation;
			[_veh,["Altis location/nVéhicule de location\n Véhicule SANS PERMIS"],_numero_de_plaque, prixdelalocation] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
			[_veh] execvm "divers\inventaire_des_vehicules\remize_a_zero.sqf";
			[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - prixdelalocation,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
			
			[] spawn 
			{
				tempsavantdepouvoirrelouer = (floor parseNumber (ctrlText 11175));			
				hint format ["! ALTIS LOCATION ! \n\n Merci de nous avoir fait confiance ! ! \n\n Durée Location : %1 Minutes \n Montant Location : %2 Euros \n Temps Restant : %3 Minutes \n Franchise : %4 Euros \n\n La franchise sera encaissée si vous ne rendez pas le véhicule avant le temps restant ! \n\n La vitesse du véhicule est limités à 55 Km/h si cela vous gène, jouer avec la touche A !\n --------------------------------- \n By SFP Maxou",dureeenminutes,prixdelalocation,tempsavantdepouvoirrelouer,prixfranchise];
				while {tempsavantdepouvoirrelouer > 0 && jairendulavoituredelocation == 0} do 
				{
					tempsavantdepouvoirrelouer = tempsavantdepouvoirrelouer - 1;
					sleep 60;
					if ((tempsavantdepouvoirrelouer >= 30) && (tempsavantdepouvoirrelouer < 31)) then {hint format ["! ATTENTION ! \n\n Il vous reste encore %1 minutes concernant votre location ! \n --------------------- \n By SFP Maxou", tempsavantdepouvoirrelouer];};
					if ((tempsavantdepouvoirrelouer >= 20) && (tempsavantdepouvoirrelouer < 21)) then {hint format ["! ATTENTION ! \n\n Il vous reste encore %1 minutes concernant votre location ! \n --------------------- \n By SFP Maxou", tempsavantdepouvoirrelouer];};
					if ((tempsavantdepouvoirrelouer >= 10) && (tempsavantdepouvoirrelouer < 11)) then {hint format ["! ATTENTION ! \n\n Il vous reste encore %1 minutes concernant votre location ! \n --------------------- \n By SFP Maxou", tempsavantdepouvoirrelouer];};
					if ((tempsavantdepouvoirrelouer >= 5) && (tempsavantdepouvoirrelouer < 6)) then {hint format ["! ATTENTION ! \n\n Il vous reste encore %1 minutes concernant votre location ! \n --------------------- \n By SFP Maxou", tempsavantdepouvoirrelouer];};
				};
				
				if ((tempsavantdepouvoirrelouer <= 0) && (jairendulavoituredelocation == 0)) then
				{
					hint format ["! ALTIS LOCATION ! \n\n La durée de location de votre véhicule est arrivé a terme ... \n\n Malheureusement, le véhicule n'à pas été rendu à temps ! \n\n Une franchise de %1 Euros va s'appliquer et le véhicule détruit. \n --------------------------------- \n By SFP Maxou",prixfranchise];
					argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
					player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - prixfranchise,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
					jaireserverunevoiture = 0;
					jairendulavoituredelocation = 1;
					sleep 1;
					deletevehicle _veh;
				};
			};
			
			waituntil {(((cursortarget getvariable 'vehicule_info_parvariable') select 0) == 'Altis location\nVéhicule de location\n Véhicule SANS PERMIS')};
			cursortarget setVariable["vehicule_info_parvariable",["Altis location\nVéhicule de location\n Véhicule SANS PERMIS"],true];
			waituntil {sleep 1;vehicle player != player};
			hint "Le véhicule à bien été déclaré au nom de la société de location.";
			_veh setdamage 0;
		}else
		{
			hint format['Désolé, une voiture est déja en location ! %1 minutes avant de pouvoir en relouer une !',tempsavantdepouvoirrelouer];
		};
	}
	else
	{
		Hint format ["Désolé, \n\n\n Vous avez : %1 Euros \n\n Il vous faut : %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,prixdelalocation];
	};
};


if((lbCurSel 11173) == 1) then
{
	dureeenminutes = (floor parseNumber (ctrlText 11175));
	prixdelalocation = 6 * (floor parseNumber (ctrlText 11175));
	prixfranchise = 2500;
	if((player getVariable "mon_argent_banque_by_sfp_maxou") >= prixdelalocation) then
	{
		if (jaireserverunevoiture == 0) then
		{
			jaireserverunevoiture = 1;
			vehname = "C_SUV_01_Location_Maxou";
			
			_veh = createVehicle [vehname, carspawn, [], 0, "NONE"];
			vehiclelock = _veh addAction ["Deverouiller / Verrouiller Location",'divers\vehiclelock\unlocklock_location.sqf',[],10,true,true,'','vehicle player == player && (_target distance _this) < 4'];
			vehiclelock_deux = _veh addAction ["Deverouiller / Verrouiller Location",'divers\vehiclelock\unlocklock_location.sqf',[],10,true,true,'',"vehicle player != player && (((vehicle player getvariable 'vehicule_info_parvariable') select 0) == 'Altis location\nVéhicule de location\n Véhicule SANS PERMIS')"];
			tempsrestantaction = _veh addAction ["<t color=""#0080FF"">" + 'Temps restant de location','divers\locations_de_vehicules\temps_restant.sqf',[],9,true,true,'','(_target distance _this) < 4'];
			_veh setVariable["vehicule_info_parvariable",["Altis location\nVéhicule de location\n Véhicule SANS PERMIS"],true];
			_veh addEventHandler["GetOut", {(_this select 0) lock true}];

			_numero_de_plaque = [] call compil_plaque_immatriculation;
			[_veh,["Altis location/nVéhicule de location\n Véhicule SANS PERMIS"],_numero_de_plaque, prixdelalocation] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
			[_veh] execvm "divers\inventaire_des_vehicules\remize_a_zero.sqf";
						[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

			player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - prixdelalocation,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

			[] spawn 
			{
				tempsavantdepouvoirrelouer = (floor parseNumber (ctrlText 11175));			
				hint format ["! ALTIS LOCATION ! \n\n Merci de nous avoir fait confiance ! ! \n\n Durée Location : %1 Minutes \n Montant Location : %2 Euros \n Temps Restant : %3 Minutes \n Franchise : %4 Euros \n\n La franchise sera encaissée si vous ne rendez pas le véhicule avant le temps restant ! \n\n La vitesse du véhicule est limités à 55 Km/h si cela vous gène, jouer avec la touche A !\n --------------------------------- \n By SFP Maxou",dureeenminutes,prixdelalocation,tempsavantdepouvoirrelouer,prixfranchise];
				while {tempsavantdepouvoirrelouer > 0 && jairendulavoituredelocation == 0} do 
				{
					tempsavantdepouvoirrelouer = tempsavantdepouvoirrelouer - 1;
					sleep 60;
					if ((tempsavantdepouvoirrelouer >= 30) && (tempsavantdepouvoirrelouer < 31)) then {hint format ["! ATTENTION ! \n\n Il vous reste encore %1 minutes concernant votre location ! \n --------------------- \n By SFP Maxou", tempsavantdepouvoirrelouer];};
					if ((tempsavantdepouvoirrelouer >= 20) && (tempsavantdepouvoirrelouer < 21)) then {hint format ["! ATTENTION ! \n\n Il vous reste encore %1 minutes concernant votre location ! \n --------------------- \n By SFP Maxou", tempsavantdepouvoirrelouer];};
					if ((tempsavantdepouvoirrelouer >= 10) && (tempsavantdepouvoirrelouer < 11)) then {hint format ["! ATTENTION ! \n\n Il vous reste encore %1 minutes concernant votre location ! \n --------------------- \n By SFP Maxou", tempsavantdepouvoirrelouer];};
					if ((tempsavantdepouvoirrelouer >= 5) && (tempsavantdepouvoirrelouer < 6)) then {hint format ["! ATTENTION ! \n\n Il vous reste encore %1 minutes concernant votre location ! \n --------------------- \n By SFP Maxou", tempsavantdepouvoirrelouer];};
				};
				
				if ((tempsavantdepouvoirrelouer <= 0) && (jairendulavoituredelocation == 0)) then
				{
					hint format ["! ALTIS LOCATION ! \n\n La durée de location de votre véhicule est arrivé a terme ... \n\n Malheureusement, le véhicule n'à pas été rendu à temps ! \n\n Une franchise de %1 Euros va s'appliquer et le véhicule détruit. \n --------------------------------- \n By SFP Maxou",prixfranchise];
					argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
					player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - prixfranchise,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
					jaireserverunevoiture = 0;
					jairendulavoituredelocation = 1;
					sleep 1;
					deletevehicle _veh;
				};
			};

			waituntil {(((cursortarget getvariable 'vehicule_info_parvariable') select 0) == 'Altis location\nVéhicule de location\n Véhicule SANS PERMIS')};
			cursortarget setVariable["vehicule_info_parvariable",["Altis location\nVéhicule de location\n Véhicule SANS PERMIS"],true];
			waituntil {sleep 1;vehicle player != player};
			hint "Le véhicule à bien été déclaré au nom de la société de location.";
			_veh setdamage 0;
		}else
		{
			hint format['Désolé, une voiture est déja en location ! %1 minutes avant de pouvoir en relouer une !',tempsavantdepouvoirrelouer];
		};
	}
	else
	{
		Hint format ["Désolé, \n\n\n Vous avez : %1 Euros \n\n Il vous faut : %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,prixdelalocation];
	};
};
