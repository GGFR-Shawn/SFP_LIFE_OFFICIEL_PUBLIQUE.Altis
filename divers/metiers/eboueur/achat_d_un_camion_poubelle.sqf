//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénal possible ! Voir http://amar.arma3.fr/ !

argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
carspawn = getMarkerPos "achats_camion_poubelle";
le_nom_de_larticle = "un camion de collecte de déchets ménager";
le_prix_de_larticle = 4000;
vehname = "B_Truck_01_box_F";

if (revive_mon_side != civilian) exitwith {hint "Désolé, tu dois être un civil pour acheter ce véhicule !";};
if ((player getVariable "mon_argent_banque_by_sfp_maxou") < le_prix_de_larticle) exitwith {Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp, (le_prix_de_larticle)];};
if (player getVariable "license_permis_de_conduire_poids_lourd_by_sfp_maxou" < 1) exitwith {hint "Désolé, vous devez posséder le permis poid lourd !";};
if (count (nearestObjects [carspawn, ["Car","Ship","Air"], 5]) > 0) exitwith {hint "Achat impossible, un autre véhicule est déjà sur la zone !";};

_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];

if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

_numero_de_plaque = [] call compil_plaque_immatriculation;
[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
[_veh] execvm "divers\metiers\eboueur\eboueur_gagner_argent.sqf";
[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

collectedechets = _veh addAction ["<t color=""#ff0000"">" + "Charger les déchets","divers\metiers\eboueur\charger_dechets.sqf",[],7,true,true,'','(_target distance _this) < 12'];
dechargerdechets = _veh addAction ["<t color=""#ff0000"">" + "Decharger les déchets","divers\metiers\eboueur\decharger_dechets.sqf",[],7,true,true,'','(_target distance _this) < 12'];
lancermission = _veh addAction ["<t color=""#4FD5D6"">" + "Lancer La Collecte De Déchets","divers\metiers\eboueur\lancer_mission.sqf",[],7,true,true,'','(_target distance _this) < 12'];
jepeuxramasserdechets = 1;

waituntil {sleep 1;vehicle player != player};
hint "Le vehicule a bien ete declare a votre nom.";
_veh setdamage 0;

waituntil {(!alive _veh) or (!alive player)};
sleep 10;
jepeuxramasserdechets = 1;	

deleteMarkerLocal "pointdecollecteun"; deletevehicle tasdedechetsun;
deleteMarkerLocal "pointdecollectedeux"; deletevehicle tasdedechetsdeux;
deleteMarkerLocal "pointdecollectetrois"; deletevehicle tasdedechetstrois;
deleteMarkerLocal "pointdecollectequatre"; deletevehicle tasdedechetsquatre;
deleteMarkerLocal "pointdecollectecinq"; deletevehicle tasdedechetscinq;
deleteMarkerLocal "pointdecollectesix"; deletevehicle tasdedechetssix;
