//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


if (isnil {player getvariable "sarl_pompier"}) exitwith {hint "! SARL POMPIER ! \n --------------------------------------- \n\n Bonjour, \n Vous ne pouvez pas acheter de véhicule ici puisque vous ne faite pas partie de notre entreprise.\n\n Cordialement.";};
argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
carspawn = getMarkerPos "helicoptere_sarl_pompier_un";
le_nom_de_larticle = "un helicoptère SARL POMPIER";
le_prix_de_larticle = 3000;
vehname = "SFP_EC635_SAR_Pompier";


if((player getVariable "mon_argent_banque_by_sfp_maxou") <= le_prix_de_larticle) exitwith {Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];};
if (isnil {player getvariable "license_pilote_news"}) exitwith {hint "Désolé, vous n'avez pas de license de pilote !";};

_verifierautour_deux = nearestObjects [carspawn, ["Car","Ship","Air"], 5];
_verifierautour_deux_check_ok = _verifierautour_deux select 0;
if (!isnil "_verifierautour_deux_check_ok") exitwith {hint "Achat impossible, un autre véhicule est déjà sur la zone !";};

_veh = createVehicle [vehname,carspawn,[],0,"CAN_COLLIDE"];

if (!alive _veh) exitwith {deletevehicle _veh; hint "Le vehicule à explose, vous n'avez donc rien paye ! \n\n Si soucis, ne t'amuse pas à faire exploser à la chaine ou tu seras banni definitivement !";};

player setVariable ['mon_argent_banque_by_sfp_maxou', argent_actuellement - le_prix_de_larticle,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
hint format["Vous avez acheté un %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t'appartiens, n'oublie pas de monter dedans !",le_nom_de_larticle,(le_prix_de_larticle) call retour_formatage_chiffre_sfp,(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

_numero_de_plaque = [] call compil_plaque_immatriculation;
[_veh,[name player],_numero_de_plaque, 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
[_veh] execvm "divers\nos_entreprises\sarl_pompier\sarl_pompier_client\pompier_gagner_argent.sqf";
[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

_veh setVariable["reservoir_d_eau_pour_pompier",0,true];

waituntil {sleep 1;vehicle player != player};
hint "Le vehicule a bien ete declare a votre nom.";
_veh setdamage 0;
