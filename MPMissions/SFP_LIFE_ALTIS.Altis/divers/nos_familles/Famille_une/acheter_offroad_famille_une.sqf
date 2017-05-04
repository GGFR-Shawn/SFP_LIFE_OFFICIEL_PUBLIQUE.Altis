//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


if (isnil {player getvariable sfp_config_famille_une_nom_pour_variable}) exitwith {hint format ["! %1 ! \n --------------------------------------- \n\n Bonjour, \n Vous ne pouvez pas acheter de véhicule ici puisque vous ne faite pas partie de notre famille.\n\n Cordialement.", sfp_config_famille_une_nom];};

argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
carspawn = getMarkerPos "spawn_vehicule_famille_une";
le_nom_de_larticle = format ["un véhicule spécial %1", sfp_config_famille_une_nom];
vehname = sfp_config_famille_une_classe_du_vehicule_perso_un select 0;
le_prix_de_larticle = sfp_config_famille_une_classe_du_vehicule_perso_un select 1;

if((player getVariable "mon_argent_banque_by_sfp_maxou") <= le_prix_de_larticle) exitwith {Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];};
if((player getVariable "license_permis_de_conduire_by_sfp_maxou") <= 0) exitwith {hint "Désolé, vous n'avez pas le permis de conduire !";};

_verifierautour_deux = nearestObjects [carspawn, ["Car","Ship","Air"], 5];
_verifierautour_deux_check_ok = _verifierautour_deux select 0;
if (!isnil "_verifierautour_deux_check_ok") exitwith {hint "Achat impossible, un autre véhicule est déjà sur la zone !";};

_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];
_veh setdir 132;

if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

_numero_de_plaque = [] call compil_plaque_immatriculation;
[_veh,[name player],_numero_de_plaque, le_prix_de_larticle] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
[_veh,false] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";
[_veh] execvm "divers\inventaire_des_vehicules\remize_a_zero.sqf";

waituntil {sleep 1;vehicle player != player};
hint "Le vehicule a bien ete declare a votre nom.";
_veh setdamage 0;
