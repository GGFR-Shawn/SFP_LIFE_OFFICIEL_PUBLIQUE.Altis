//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

if (player distance cursortarget < 5 && (!isnil {cursortarget getvariable "vehicule_info_parvariable"})) exitwith {hint "Désolé tu ne peux pas poser d'objets à proximité des véhicules ...";};

if(revive_mon_side == west) then
{
	if((lbCurSel 1500) == 0) then
	{
		if (dayTime > 7 && dayTime < 18) exitwith {hint "Il ne fait pas nuit ... !";};  

		_avantderniere = 1;
		_maxdemateclairage = 2;
		if (jepeuxreprendreunmatdeclairageobject < _maxdemateclairage) then
		{
			jepeuxreprendreunmatdeclairageobject = jepeuxreprendreunmatdeclairageobject + 1;
			if (jepeuxreprendreunmatdeclairageobject == _avantderniere) then {hint "Encore un mat d'éclairage disponible !";};
			player allowdamage false;
			_mat_eclairage_creer = createVehicle ["Land_PortableLight_double_F", getPosATL player, [], 0, '']; 
			_mat_eclairage_creer attachTo [player,[0,1.5,1]];
			detach _mat_eclairage_creer;
			sleep 2;
			player allowdamage true;
		}else
		{
			hint "Il n'y à plus de mat disponible ! Supprime ceux qui ne servent plus pour en ajouter de nouveaux !";
		};
	};
	if((lbCurSel 1500) == 1) then
	{
		_avantderniere = 7;
		_maxdebarriere = 8;
		if (jepeuxreprendreunebarriere < _maxdebarriere) then
		{
			jepeuxreprendreunebarriere = jepeuxreprendreunebarriere + 1;
			if (jepeuxreprendreunebarriere == _avantderniere) then {hint "Encore une barrière disponible !";};
			player allowdamage false;
			_barrierecreer = createVehicle ["RoadBarrier_F", getPosATL player, [], 0, '']; 
			_barrierecreer attachTo [player,[0,3.5,1]];
			detach _barrierecreer;
			sleep 2;
			player allowdamage true;
		}else
		{
			hint "Il n'y à plus de barrière disponible ! Supprime celles qui ne servent plus pour en ajouter de nouvelles !";
		};
	};
	if((lbCurSel 1500) == 2) then
	{
		_avantderniere = 19;
		_maxdecone = 20;
		if (jepeuxreprendreuncone < _maxdecone) then
		{
			jepeuxreprendreuncone = jepeuxreprendreuncone + 1;
			if (jepeuxreprendreuncone == _avantderniere) then {hint "Encore un cone disponible !";};
			player allowdamage false;
			_conecreer = createVehicle ["RoadCone_L_F", getPosATL player, [], 0, '']; 
			_conecreer attachTo [player,[0,3.5,1]];
			detach _conecreer;
			sleep 2;
			player allowdamage true;
		}else
		{
			hint "Il n'y à plus de cone disponible ! Supprime ceux qui ne servent plus pour en ajouter de nouveaux !";
		};
	};
	if((lbCurSel 1500) == 3) then
	{
		if (jepeuxreprendreuneherse < 1) then
		{
			jepeuxreprendreuneherse = 1;
			player allowdamage false;
			_hersecreer = createVehicle ["Pole_F", getPosATL player, [], 0, '']; 
			_hersecreer attachTo [player,[0,3.5,1.5]];
			detach _hersecreer;
			sleep 0.045;
			[_hersecreer] execvm "divers\poser_objets\flics\herse\creuver_les_pneus.sqf";
			sleep 2;
			player allowdamage true;
		}else
		{
			hint "Il seule herse de disponible ! Supprime celle qui ne sert plus pour en ajouter une nouvelle !";
		};
	};
	if((lbCurSel 1500) == 4) then
	{
		_avantderniere = 1;
		_maxdepanneauhaltegendarmerie = 2;
		if (jepeuxreprendreunpanneauhaltegendarmerie < _maxdepanneauhaltegendarmerie) then
		{
			jepeuxreprendreunpanneauhaltegendarmerie = jepeuxreprendreunpanneauhaltegendarmerie + 1;
			if (jepeuxreprendreunpanneauhaltegendarmerie == _avantderniere) then {hint "Encore un panneau halte gendarmerie disponible !";};
			player allowdamage false;
			_panneau_halte_gendarmerie_creer = createVehicle ["SFP_Panneau_Pied_Rond", getPosATL player, [], 0, '']; 
			_panneau_halte_gendarmerie_creer attachTo [player,[0,3.5,1]];
			detach _panneau_halte_gendarmerie_creer;
			sleep 2;
			player allowdamage true;
		}else
		{
			hint "Il n'y à plus de panneau disponible ! Supprime ceux qui ne servent plus pour en ajouter de nouveaux !";
		};
	};
	if((lbCurSel 1500) == 5) then
	{
		if ((player getvariable "coffre_fort") < 1) exitwith {hint "Désolé, tu n'as pas de coffre fort !";};

		_verif_maison = nearestObjects [getPosATL player, ["house"], 6];
		la_maison = _verif_maison select 0;
				
		if (isnil "la_maison") exitwith {hint "Désolé, tu dois être dans ta maison pour poser le coffre fort !";};
		if (isnil {la_maison getvariable "proprietaire_de_la_maison"}) exitwith {hint "Désolé, la maison n'appartient à personne !";};
		if (la_maison getvariable "proprietaire_de_la_maison" select 0 != name player) exitwith {hint format[ "Désolé, tu n'es pas dans ta maison mais celle de %1 !",la_maison getvariable "proprietaire_de_la_maison" select 0];};

		player allowdamage false;sleep 0.02;
		_creer_coffre_fort = createVehicle ["Box_East_Grenades_F", getPosATL player, [], 0, '']; 
		_creer_coffre_fort attachTo [player,[0,1.5,1]];
		detach _creer_coffre_fort;
		player setvariable ["coffre_fort",round ((player getvariable "coffre_fort") - 1),true];
		player setvariable ["usedspace",round ((player getvariable "usedspace") - 70),true];
		_creer_coffre_fort setvariable ["proprietaire_du_coffre",name player,true];
		closedialog 0;
		sleep 1;
		clearWeaponCargoGlobal _creer_coffre_fort;
		clearMagazineCargoGlobal _creer_coffre_fort;
		clearItemCargoGlobal _creer_coffre_fort;
		hint "Un dialogue va s'ouvrir, il faut obligatoirement choisir un mot de passe en chiffre !";
		sleep 1;
		createdialog "CoffreFortDefinirMotDePasse";
		noesckeydeux = (findDisplay 4844) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"];
		ctrlSetText[11115,format["Propriétaire : %1",(_creer_coffre_fort getVariable "proprietaire_du_coffre")]];
		waituntil {!isnil "mot_de_passe_du_coffre_fort"};
		_creer_coffre_fort setvariable ["mot_de_passe_du_coffre_fort",mot_de_passe_du_coffre_fort,true];
		[_creer_coffre_fort] execvm "divers\coffre_fort\remise_a_zero_coffre_fort.sqf";
		sleep 1;
		mot_de_passe_du_coffre_fort = nil;
		_creer_coffre_fort = nil;
		sleep 2;
		player allowdamage true;
	};
};		

		
		
//------------------------------------------------------------- CIVILS ----------------------------------------------------------------------		
//------------------------------------------------------------- CIVILS ----------------------------------------------------------------------		
//------------------------------------------------------------- CIVILS ----------------------------------------------------------------------		
//------------------------------------------------------------- CIVILS ----------------------------------------------------------------------		
//------------------------------------------------------------- CIVILS ----------------------------------------------------------------------		
//------------------------------------------------------------- CIVILS ----------------------------------------------------------------------		
//------------------------------------------------------------- CIVILS ----------------------------------------------------------------------		
//------------------------------------------------------------- CIVILS ----------------------------------------------------------------------		
//------------------------------------------------------------- CIVILS ----------------------------------------------------------------------		
//------------------------------------------------------------- CIVILS ----------------------------------------------------------------------		
		
		
		
if(revive_mon_side == civilian) then
{
	if((lbCurSel 1500) == 0) then
	{
		if (player getvariable "tente_pour_dormir" < 1) exitwith {hint "Désolé, tu n'as pas de tente de couchage. \n\n Tu peux en acheter une en quincaillerie pour dormir.";};
		
		_surface = surfaceType getPosATL player;
		_verificationsurface = ["#GdtGrassShort","#GdtGrassTall","#GdtGrassDry","#GdtGrassGreen"];
		if !(_surface in _verificationsurface) exitwith {hint "Désolé, tu n'es pas dans l'herbe !";};

		player setVariable ['tente_pour_dormir', (player getVariable "tente_pour_dormir") - 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") - 10,true];
		player allowdamage false;
		_tentecreer = createVehicle ["Land_TentA_F", getPosATL player, [], 0, '']; 
		_tentecreer attachTo [player,[0,3.5,0.4]];
		_tentecreer setvariable ["cestmatante",1,false];
		detach _tentecreer;
		closedialog 0;
		sleep 2;
		player allowdamage true;
	};
	if((lbCurSel 1500) == 1) then
	{
		if (isnil {player getvariable "sarl_depannage"} && isnil {player getvariable "sarl_pompier"}) exitwith {hint "Désolé, tu ne fais pas partie de l'entreprise SARL DIR ou SARL POMPIER !";};
		if (je_suis_en_service_a_la_sarl_depannage < 1 && isnil "jesuis_au_taff_a_la_sarl_pompier") exitwith {hint "Désolé, tu n'es pas en service à la SARL DIR ou à la SARL POMPIER!";};
		if (dayTime > 7 && dayTime < 18) exitwith {hint "Il ne fait pas nuit ... !";};  

		_avantderniere = 1;
		_maxdemateclairage = 2;
		if (jepeuxreprendreunmatdeclairageobject < _maxdemateclairage) then
		{
			jepeuxreprendreunmatdeclairageobject = jepeuxreprendreunmatdeclairageobject + 1;
			if (jepeuxreprendreunmatdeclairageobject == _avantderniere) then {hint "Encore un mat d'éclairage disponible !";};
			player allowdamage false;
			_mat_eclairage_creer = createVehicle ["Land_PortableLight_double_F", getPosATL player, [], 0, '']; 
			_mat_eclairage_creer attachTo [player,[0,1.5,1]];
			detach _mat_eclairage_creer;
			sleep 2;
			player allowdamage true;
		}else
		{
			hint "Il n'y à plus de mat disponible ! Supprime ceux qui ne servent plus pour en ajouter de nouveaux !";
		};
	};
	if((lbCurSel 1500) == 2) then
	{
		if (isnil {player getvariable "sarl_depannage"} && isnil {player getvariable "sarl_pompier"}) exitwith {hint "Désolé, tu ne fais pas partie de l'entreprise SARL DIR ou SARL POMPIER !";};
		if (je_suis_en_service_a_la_sarl_depannage < 1 && isnil "jesuis_au_taff_a_la_sarl_pompier") exitwith {hint "Désolé, tu n'es pas en service à la SARL DIR ou à la SARL POMPIER!";};
		_avantderniere = 19;
		_maxdecone = 20;
		if (jepeuxreprendreuncone < _maxdecone) then
		{
			jepeuxreprendreuncone = jepeuxreprendreuncone + 1;
			if (jepeuxreprendreuncone == _avantderniere) then {hint "Encore un cone disponible !";};
			player allowdamage false;
			_conecreer = createVehicle ["RoadCone_L_F", getPosATL player, [], 0, '']; 
			_conecreer attachTo [player,[0,3.5,1]];
			detach _conecreer;
			sleep 2;
			player allowdamage true;
		}else
		{
			hint "Il n'y à plus de cone disponible ! Supprime ceux qui ne servent plus pour en ajouter de nouveaux !";
		};
	};
	if((lbCurSel 1500) == 3) then
	{
		if (isnil {player getvariable "sarl_depannage"}) exitwith {hint "Désolé, tu ne fais pas partie de l'entreprise SARL DIR !";};
		if (je_suis_en_service_a_la_sarl_depannage < 1) exitwith {hint "Désolé, tu n'es pas en service à la SARL DIR !";};
		_avantderniere = 10;
		_maxdebarrieredechantierdde = 7;
		if (jepeuxreprendreunebarrieredechantier < _maxdebarrieredechantierdde) then
		{
			jepeuxreprendreunebarrieredechantier = jepeuxreprendreunebarrieredechantier + 1;
			if (jepeuxreprendreunebarrieredechantier == _avantderniere) then {hint "Encore une barrière disponible !";};
			player allowdamage false;
			_barrierecreerchantierdde = createVehicle ["SFP_Barriere_Chantier", getPosATL player, [], 0, '']; 
			_barrierecreerchantierdde attachTo [player,[0,3.5,1.27]];
			detach _barrierecreerchantierdde;
			sleep 2;
			player allowdamage true;
		}else
		{
			hint "Il n'y à plus de barrière disponible ! Supprime ceux qui ne servent plus pour en ajouter de nouveaux !";
		};
	};
	if((lbCurSel 1500) == 4) then
	{
		if (isnil {player getvariable "sarl_depannage"} && isnil {player getvariable "sarl_pompier"}) exitwith {hint "Désolé, tu ne fais pas partie de l'entreprise SARL DIR ou SARL POMPIER !";};
		if (je_suis_en_service_a_la_sarl_depannage < 1 && isnil "jesuis_au_taff_a_la_sarl_pompier") exitwith {hint "Désolé, tu n'es pas en service à la SARL DIR ou à la SARL POMPIER!";};
		_avantderniere = 6;
		_maxdebarrieredechantierdde = 7;
		if (jepeuxreprendreunebarrieredechantier_orange < _maxdebarrieredechantierdde) then
		{
			jepeuxreprendreunebarrieredechantier_orange = jepeuxreprendreunebarrieredechantier_orange + 1;
			if (jepeuxreprendreunebarrieredechantier_orange == _avantderniere) then {hint "Encore une barrière disponible !";};
			player allowdamage false;
			_barrierecreerchantierdde = createVehicle ["PlasticBarrier_03_orange_F", getPosATL player, [], 0, '']; 
			_barrierecreerchantierdde attachTo [player,[0,3.5,1.27]];
			detach _barrierecreerchantierdde;
			sleep 2;
			player allowdamage true;
		}else
		{
			hint "Il n'y à plus de barrière disponible ! Supprime ceux qui ne servent plus pour en ajouter de nouveaux !";
		};
	};
	if((lbCurSel 1500) == 5) then
	{
		if (isnil {player getvariable "sarl_depannage"} && isnil {player getvariable "sarl_pompier"}) exitwith {hint "Désolé, tu ne fais pas partie de l'entreprise SARL DIR ou SARL POMPIER !";};
		if (je_suis_en_service_a_la_sarl_depannage < 1 && isnil "jesuis_au_taff_a_la_sarl_pompier") exitwith {hint "Désolé, tu n'es pas en service à la SARL DIR ou à la SARL POMPIER!";};
		_avantderniere = 1;
		_maxdepanneaudangerdde = 2;
		if (jepeuxreprendreunpanneaudangerdde < _maxdepanneaudangerdde) then
		{
			jepeuxreprendreunpanneaudangerdde = jepeuxreprendreunpanneaudangerdde + 1;
			if (jepeuxreprendreunpanneaudangerdde == _avantderniere) then {hint "Encore un panneau danger disponible !";};
			player allowdamage false;
			_panneau_danger_dde_creer = createVehicle ["SFP_Panneau_Pied_Triangle", getPosATL player, [], 0, '']; 
			_panneau_danger_dde_creer attachTo [player,[0,3.5,1]];
			detach _panneau_danger_dde_creer;
			sleep 2;
			player allowdamage true;
		}else
		{
			hint "Il n'y à plus de panneau disponible ! Supprime ceux qui ne servent plus pour en ajouter de nouveaux !";
		};
	};
	if((lbCurSel 1500) == 6) then
	{
		if ((player getvariable "coffre_fort") < 1) exitwith {hint "Désolé, tu n'as pas de coffre fort !";};

		_verif_maison = nearestObjects [getPosATL player, ["house"], 6];
		la_maison = _verif_maison select 0;
				
		if (isnil "la_maison") exitwith {hint "Désolé, tu dois être dans ta maison pour poser le coffre fort !";};
		if (isnil {la_maison getvariable "proprietaire_de_la_maison"}) exitwith {hint "Désolé, la maison n'appartient à personne !";};
		if (la_maison getvariable "proprietaire_de_la_maison" select 0 != name player) exitwith {hint format[ "Désolé, tu n'es pas dans ta maison mais celle de %1 !",la_maison getvariable "proprietaire_de_la_maison" select 0];};

		player allowdamage false;sleep 0.02;
		_creer_coffre_fort = createVehicle ["Box_East_Grenades_F", getPosATL player, [], 0, '']; 
		_creer_coffre_fort attachTo [player,[0,1.5,1]];
		detach _creer_coffre_fort;
		player setvariable ["coffre_fort",round ((player getvariable "coffre_fort") - 1),true];
		player setvariable ["usedspace",round ((player getvariable "usedspace") - 70),true];
		_creer_coffre_fort setvariable ["proprietaire_du_coffre",name player,true];
		closedialog 0;
		sleep 1;
		clearWeaponCargoGlobal _creer_coffre_fort;
		clearMagazineCargoGlobal _creer_coffre_fort;
		clearItemCargoGlobal _creer_coffre_fort;
		hint "Un dialogue va s'ouvrir, il faut obligatoirement choisir un mot de passe en chiffre !";
		sleep 1;
		createdialog "CoffreFortDefinirMotDePasse";
		noesckeydeux = (findDisplay 4844) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"];
		ctrlSetText[11115,format["Propriétaire : %1",(_creer_coffre_fort getVariable "proprietaire_du_coffre")]];
		waituntil {!isnil "mot_de_passe_du_coffre_fort"};
		_creer_coffre_fort setvariable ["mot_de_passe_du_coffre_fort",mot_de_passe_du_coffre_fort,true];
		[_creer_coffre_fort] execvm "divers\coffre_fort\remise_a_zero_coffre_fort.sqf";
		sleep 1;
		mot_de_passe_du_coffre_fort = nil;
		_creer_coffre_fort = nil;
		sleep 2;
		player allowdamage true;
	};
	if((lbCurSel 1500) == 7) then
	{
		if ((player getvariable "valise_pour_le_farming") < 1) exitwith {hint "Désolé, tu n'as pas de valise de farming !";};

		player setvariable ["valise_pour_le_farming",0,true];
		player setVariable["usedspace",(player getVariable "usedspace") - (listes_des_farming_avec_parametre select 49 select 2),true];
		valise = createVehicle ["Land_Suitcase_F", getPosATL player, [], 0, "CAN_COLLIDE"];
		valise setVectorDirAndUp [[0.5,0,0],[0,0,0.5]];
		valise setvariable ["valise_prise",0,true];
		valise setvariable ["valise_de_farming",1,true];
		valise setvariable ["totalspace",(player getvariable "totalspace"),true];
		valise setvariable ["usedspace",0,true];
		hint "Valise posée au sol. \n\n Patiente quelques secondes qu'arma l'initialise ...";
	};
	if((lbCurSel 1500) == 8) then
	{
		if (player getvariable "item_plante_pour_planter" < 1) exitwith {hint "Désolé, tu n'as pas de plantes illégales. \n\n Tu peux en acheter à la pépinière.";};
		
		closedialog 0;
		while {!((surfaceType getPosATL player) in ["#GdtGrassShort","#GdtGrassTall","#GdtGrassDry","#GdtGrassGreen","#GdtDirt"])} do 
		{
			hintsilent "Désolé, tu n'es pas dans l'herbe ! \n\n Trouve un endroit correct, la plante sera plantée automatiquement. Tu pourras biensur la déplacer ensuite.";
			sleep 0.2;
		};

		player setVariable ['item_plante_pour_planter', (player getVariable "item_plante_pour_planter") - 1,true];
		player setVariable["usedspace",(player getVariable "usedspace") - 25,true];
		player allowdamage false;

		_liste_des_plantes_illegale_achat = sfp_config_liste_des_plantes_illegale call BIS_fnc_selectRandom;
		_plante_creer = createVehicle [_liste_des_plantes_illegale_achat, getPosATL player, [], 0, '']; 
		_plante_creer attachTo [player,[0,3.5,0.4]];
		detach _plante_creer;
		
		nouvel_achat_plante_illegale = _plante_creer;
		publicvariable "nouvel_achat_plante_illegale";

		waituntil {!isnil {_plante_creer getvariable "jour_recolte"} && !isnil {_plante_creer getvariable "niveau_eau"}};
		player allowdamage true;
		hint format['! ACHAT PLANTATION ! \n --------------------------------------- \n\n La plante à bien été planté. \n\n Niveau eau actuel : %1 pourcent. \n Recolte dans : %2 heures IRL. \n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou',round (_plante_creer getvariable "niveau_eau"),round ((_plante_creer getvariable "jour_recolte") / 60)];
	};
};

sleep 1;
player allowdamage true;
