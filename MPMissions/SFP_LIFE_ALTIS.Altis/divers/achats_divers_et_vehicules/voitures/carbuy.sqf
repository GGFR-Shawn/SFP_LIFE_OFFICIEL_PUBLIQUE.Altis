// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================
private ["_son_prix","_remise","_direction"];

_argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
_choix_selectionne_voiture = lbCurSel 1500;
_vehicule_a_creer = liste_recherche_informations_vehicules select _choix_selectionne_voiture select 0;
_son_nom = getText ( configFile >> "CfgVehicles" >> _vehicule_a_creer >> "displayName");
_son_prix = prix_de_depart select _choix_selectionne_voiture;
_direction = 0;
carspawn = nil;

if (player in list menu_gign_choix_armes) then {carspawn = getMarkerPos "copcarspawn";};
if (player distance (getpos locationdevehiculebymaxou_1) < 15) then {carspawn = getMarkerPos "achatspawncar";};
if (player distance (getpos base_gang) < 22) then {carspawn = getMarkerPos "terrorcarspawn";};
if (player distance achat_voiture_en_ville < 15) then {carspawn = getMarkerPos "achatspawnville2";};
if (player distance (getmarkerpos "achatspawnedessa") < 50) then {carspawn = getMarkerPos "achatspawnedessa";};
if (player distance caisse_carshop < 15 && !isnil "jesuis_au_taff_a_la_sarl_car_shop_pour_respawn") then {carspawn = getMarkerPos "car_shop_spawn_vehicule"; _direction = 245; _son_prix = _son_prix - ((_son_prix / 100) * 55);};
if ([] call nombre_de_vehicule_max_sur_la_carte <= 0) exitwith {hint "! ACHAT DE VEHICULE ! \n -------------------------------------------- \n \n Opération impossible ! \n\n Vous avez trop de véhicules sur la carte ... \n\n Sauvegardez vos véhicules en trop pour éviter Desync et lag du serveur. \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (isnil "carspawn") exitwith {hint "! ACHAT DE VEHICULE ! \n -------------------------------------------- \n \n Opération impossible ! \n\n Impossible de trouver le lieu de spawn ... \n\n-------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

if (isnil "_argent_actuellement") exitwith {hint "Erreur, recommence ...";};
if (isnil "_choix_selectionne_voiture") exitwith {hint "Erreur, recommence ...";};
if (isnil "_vehicule_a_creer") exitwith {hint "Erreur, recommence ...";};
if (isnil "_son_nom") exitwith {hint "Erreur, recommence ...";};
if (isnil "_son_prix") exitwith {hint "Erreur, recommence ...";};
if (_argent_actuellement < _son_prix) exitwith {Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];};
if (!isClass (configFile >> "CfgVehicles" >> (liste_recherche_informations_vehicules select (lbCurSel 1500) select 0))) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
if (player getVariable "license_permis_de_conduire_by_sfp_maxou" < 1) exitwith {hint "Vous devez posséder un permis de conduire pour acheter un véhicule";};
if (count (nearestObjects [carspawn, ["Car","Ship","Air"], 5]) > 0) exitwith {hint "Achat impossible, un autre véhicule est déjà sur la zone !";};

_veh = createVehicle [_vehicule_a_creer, carspawn, [], 0, "NONE"];
_veh setdir _direction;

if (!alive _veh) exitwith {closeDialog 0; deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye !";};

_veh spawn {sleep 2; _this spawn sfp_afficher_dernier_vehicule_achete;};
[_veh,[name player], [] call compil_plaque_immatriculation, _son_prix] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";
[_veh] execvm "divers\inventaire_des_vehicules\remize_a_zero.sqf";

player setVariable ['mon_argent_banque_by_sfp_maxou', _argent_actuellement - _son_prix,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
hint format ['! ACHAT VEHICULE ! \n -------------------- \n\n Vous avez achete une %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce vehicule t''appartiens, n''oublie pas de monter dedans ! \n\n ----------------------------------- \n www.sfpteam.fr \n By SFP Maxou', _son_nom, (_son_prix) call retour_formatage_chiffre_sfp, (player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

closeDialog 0;

waituntil {sleep 1; vehicle player != player};

hint "Le vehicule a bien ete declare a votre nom.";
_veh setdamage 0;
