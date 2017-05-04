// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_veh = cursortarget;

if (isnil "jereparemonvehicule") then {jereparemonvehicule = 0};
if (isNil {_veh}) exitWith {hint "Rien n'est pointé !";};
if (player getvariable "license_BEP_Mecanique" < 1) exitwith {"Désolé, pour réparer un véhicule il te faut le BEP mécanique auto que tu peux avoir à l'école ! \n\n Pense également que la DIR (entreprise) existe et qu'elle peut te le réparer ;)" call message_en_bas_de_couleur_sfp;};
if (!("ToolKit" in backpackItems player)) exitwith {"Vous devez posseder un toolkit sur vous." call message_en_bas_de_couleur_sfp;};
if (!isnil {_veh getvariable "vehicule_en_reparation"}) exitwith {"Ce véhicule est déja en cours de réparation par un joueur." call message_en_bas_de_couleur_sfp;};
if (!alive _veh) exitwith {"Ce véhicule est HS." call message_en_bas_de_couleur_sfp;};

desdepanneurssontenjeu = nil;
{if (!isnil {_x getvariable "sarl_depannage_en_ligne"}) then {desdepanneurssontenjeu = 1;};} foreach allunits;
if (je_suis_en_service_a_la_sarl_depannage < 1 && !isnil "desdepanneurssontenjeu" && getdammage _veh >= 0.50) exitwith {desdepanneurssontenjeu = nil; "Votre véhicule est bien trop endommagé ! Faite appel à la société DIR ..." call message_en_bas_de_couleur_sfp;};
if (je_suis_en_service_a_la_sarl_depannage < 1 && isnil "desdepanneurssontenjeu") then {"La DIR n'est pas connecté, vous pouvez donc réparer votre véhicule avec n'importe quel dégat ..." call message_en_bas_de_couleur_sfp;};

// Temps pour les réparations
if (je_suis_en_service_a_la_sarl_depannage < 1) then
{
	temps_total_pour_la_reparation = round (60 + (random 30));
	random_temps_pour_la_reparation = round (random 30);
}else
{
	temps_total_pour_la_reparation = round (random 7);
	random_temps_pour_la_reparation = round (random 7);
};

closedialog 0;

if (jereparemonvehicule < 1) then 
{
	_queldamage_un = _veh getHitPointDamage "hitEngine"; _queldamage_un_pourcentage = _queldamage_un * 100;
	_queldamage_deux = _veh getHitPointDamage "HitLFWheel"; _queldamage_deux_pourcentage = _queldamage_deux * 100; 
	_queldamage_trois = _veh getHitPointDamage "HitRFWheel"; _queldamage_trois_pourcentage = _queldamage_trois * 100;
	_queldamage_quatre = _veh getHitPointDamage "HitBody"; _queldamage_quatre_pourcentage = _queldamage_quatre * 100; 
	_queldamage_cinq = _veh getHitPointDamage "HitFuel"; _queldamage_cinq_pourcentage = _queldamage_cinq * 100;
	if (_veh iskindof "Air") then {_queldamage_six = _veh getHitPointDamage "HitHRotor"; _queldamage_six_pourcentage = _queldamage_six * 100;}; // heli
	if (_veh iskindof "Air") then {_queldamage_sept = _veh getHitPointDamage "HitVRotor"; _queldamage_sept_pourcentage = _queldamage_sept * 100;}; // heli

	if (_queldamage_un != 0) then {temps_total_pour_la_reparation = temps_total_pour_la_reparation + ceil (random random_temps_pour_la_reparation);};
	if (_queldamage_deux != 0) then {temps_total_pour_la_reparation = temps_total_pour_la_reparation + ceil (random random_temps_pour_la_reparation);};
	if (_queldamage_trois != 0) then {temps_total_pour_la_reparation = temps_total_pour_la_reparation + ceil (random random_temps_pour_la_reparation);};
	if (_queldamage_quatre != 0) then {temps_total_pour_la_reparation = temps_total_pour_la_reparation + ceil (random random_temps_pour_la_reparation);};
	if (_queldamage_cinq != 0) then {temps_total_pour_la_reparation = temps_total_pour_la_reparation + ceil (random random_temps_pour_la_reparation);};
	if (!isnil "_queldamage_six") then {if (_queldamage_six != 0) then {temps_total_pour_la_reparation = temps_total_pour_la_reparation + ceil (random random_temps_pour_la_reparation);};}; //heli
	if (!isnil "_queldamage_sept") then {if (_queldamage_sept != 0) then {temps_total_pour_la_reparation = temps_total_pour_la_reparation + ceil (random random_temps_pour_la_reparation);};}; // heli

	if (isnil {_veh getvariable "temps_total_pour_la_reparation"}) then
	{
		_ok_temps_variable = temps_total_pour_la_reparation;
		_veh setvariable ["temps_total_pour_la_reparation",_ok_temps_variable,true];
	};
	
	if (_veh iskindof "Air") then 
	{
		hint format ["! REPARATION DU VEHICULE ! \n -------------------------------------- \n Bonjour, \n\n Voici les dégats généraux du véhicule : \n Dégats Du Moteur : %1 pour cent. \n Rotor principal : %2 pour cent. \n Rotor de queue : %3 pour cent. \n Gasoil : %4 Litres restant. \n\n %5 secondes restantes pour tout reparer ;) \n\n ----------------------------------- \n www.sfpteam.fr \n By SFP Maxou",floor _queldamage_un_pourcentage,floor _queldamage_six_pourcentage, floor _queldamage_sept_pourcentage,100 - floor _queldamage_cinq_pourcentage,_veh getvariable "temps_total_pour_la_reparation"];
	}else
	{
		hint format ["! REPARATION DU VEHICULE ! \n -------------------------------------- \n Bonjour, \n\n Voici les dégats généraux du véhicule : \n Dégats Du Moteur : %1 pour cent. \n Cardan Gauche : %2 pour cent. \n Cardan Droit : %3 pour cent. \n Carrosserie : %4 pour cent. \n Gasoil : %5 Litres restant. \n\n %6 secondes restantes pour tout reparer ;) \n\n ----------------------------------- \n www.sfpteam.fr \n By SFP Maxou",floor _queldamage_un_pourcentage,floor _queldamage_deux_pourcentage,floor _queldamage_trois_pourcentage,floor _queldamage_quatre_pourcentage,100 - floor _queldamage_cinq_pourcentage,_veh getvariable "temps_total_pour_la_reparation"];		
	};

	if (not alive player) exitWith {"Opération impossible ! \n Vous êtes mort." call message_en_bas_de_couleur_sfp;};
	if (player distance _veh > 5) exitWith {"Opération impossible ! \n Le véhicule est trop loin." call message_en_bas_de_couleur_sfp;};
	if (speed _veh > 2) exitWith {"Opération impossible ! \n Le véhicule est en mouvement." call message_en_bas_de_couleur_sfp;};
	jereparemonvehicule = 1;
	player playActionNow "medicstartup";
	sleep 0.5;
	_reparationterminee = false;
	_nomduvehicule = getText ( configFile >> "CfgVehicles" >> typeOf(_veh) >> "displayName");
	_jefaisleson = 0;
	_veh say "coupdemarteau";
	_verificationdistance = 0;
	player removeItem "ToolKit";
	
	_temps_de_reparation = _veh getvariable "temps_total_pour_la_reparation";
	_temps_de_reparation spawn {[_this] call bar_de_progression_by_maxou;};
	
	_veh setvariable ["vehicule_en_reparation",true,true];
	
	while {alive player and (player distance _veh) < 5 and speed _veh < 3 and _veh getvariable "temps_total_pour_la_reparation" > 0 && !_reparationterminee && _verificationdistance <= 1} do 
	{
		_pos1 = (getPosATL (vehicle player));
		(format["Le %2 va être repare dans %1 secondes.", _veh getvariable "temps_total_pour_la_reparation", _nomduvehicule] ) call message_en_bas_de_couleur_sfp;
		if (_veh getvariable "temps_total_pour_la_reparation" <= 0) then {_reparationterminee = true;};
		_veh setvariable ["temps_total_pour_la_reparation",(_veh getvariable "temps_total_pour_la_reparation") - 1, false];
		sleep 1;
		_jefaisleson = _jefaisleson + 1;
		_pos2 = (getPosATL (vehicle player));
		_verificationdistance = _pos1 distance _pos2; 
		if (_jefaisleson == 4) then {_veh say "coupdemarteau";_jefaisleson = 0;};
	};

	_veh setvariable ["vehicule_en_reparation",nil,true];
	_veh setvariable ["temps_total_pour_la_reparation",(_veh getvariable "temps_total_pour_la_reparation"), true];
	
	if (_veh getvariable "temps_total_pour_la_reparation" <= 0) then {_reparationterminee = true;};
	if (_reparationterminee) then 
	{
		"La réparation est terminée." call message_en_bas_de_couleur_sfp;
		_veh setdamage 0;
		_veh setvariable ["temps_total_pour_la_reparation",nil,true];
		jereparemonvehicule = 0;
	} else 
	{
		"Réparation interrompue." call message_en_bas_de_couleur_sfp;
		if (_verificationdistance > 1) then {"Réparation interrompue puisque tu as bougé." call message_en_bas_de_couleur_sfp;};
		jereparemonvehicule = 0;
        player addItem "ToolKit";
	};
	
	player switchmove "";
	player playActionNow "medicstop";	
}else
{
	hint "Une réparation est déjà en cours.";
};

bar_de_progression_by_maxou_reinitialisation = true;