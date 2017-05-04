// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (isnil "j_avertit_que_j_ouvre_altis_et_furious") then {j_avertit_que_j_ouvre_altis_et_furious = 1;_null = [{hint "! ALTIS && FURIOUS ! \n ------------------------------ \n\n La société ALTIS && FURIOUS vient d'ouvrir ! \n\n Rendez vous à leur lieu de spawn pour prendre vos véhicules de course ! ;) \n\n ------------------------------ \n www.sfpteam.fr \n By SFP Maxou";},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;};

private ["_son_prix","_remise"];

_argent_actuellement = player getVariable "mon_argent_banque_by_sfp_maxou";
_choix_selectionne_voiture = lbCurSel 1500;
_vehicule_a_creer = liste_recherche_informations_vehicules select _choix_selectionne_voiture;
_son_nom = getText ( configFile >> "CfgVehicles" >> _vehicule_a_creer >> "displayName");
_son_prix = prix_de_depart select _choix_selectionne_voiture;

carspawn = getMarkerPos "achatspawn_sarl_altis_et_furious";

if (isnil "_argent_actuellement") exitwith {hint "Erreur, recommence ...";};
if (isnil "_choix_selectionne_voiture") exitwith {hint "Erreur, recommence ...";};
if (isnil "_vehicule_a_creer") exitwith {hint "Erreur, recommence ...";};
if (isnil "_son_nom") exitwith {hint "Erreur, recommence ...";};
if (isnil "_son_prix") exitwith {hint "Erreur, recommence ...";};
if (_argent_actuellement < _son_prix) exitwith {Hint format ["Vous avez %1 Euros et besoin de %2 Euros",(player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp,(le_prix_de_larticle)];};
if (!isClass (configFile >> "CfgVehicles" >> (liste_recherche_informations_vehicules select (lbCurSel 1500)))) exitwith {hint "Désolé, vous n'avez pas le launcher pour acheter ce véhicule ! \n\n Télécharger le sur www.sfpteam.fr ...";};
if (player getVariable "license_permis_de_conduire_by_sfp_maxou" < 1) exitwith {hint "Vous devez posséder un permis de conduire pour acheter un véhicule";};
if (count (nearestObjects [carspawn, ["Car","Ship","Air"], 5]) > 0) exitwith {hint "Achat impossible, un autre véhicule est déjà sur la zone !";};


_veh = createVehicle [_vehicule_a_creer, carspawn, [], 0, "NONE"];
_veh setdir 310;

if (!alive _veh) exitwith {closeDialog 0; deletevehicle _veh; hint "Le véhicule à explosé !";};

[_veh,[name player], ["SARL FAST AND FURIOUS","SARL FAST AND FURIOUS"], 0] execvm "persistence\voitures_remettre_parametre_lors_dachat_neuf.sqf";
[_veh,true] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";
[_veh] execvm "divers\inventaire_des_vehicules\remize_a_zero.sqf";
_veh spawn {_veh = _this; sleep 3; [[[_veh,0],"divers\vehiclelock\synchro_verrouillage.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;};

player setVariable ['mon_argent_banque_by_sfp_maxou', _argent_actuellement - _son_prix,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
hint format ['! ACHAT VEHICULE ! \n -------------------- \n\n Vous avez acheté une %1 pour %2 Euros ! Il vous reste %3 Euros ! \n\n ! ATTENTION ! \n Pour que ce véhicule t''appartiens, n''oublie pas de monter dedans ! \n\n ----------------------------------- \n www.sfpteam.fr \n By SFP Maxou', _son_nom, (_son_prix) call retour_formatage_chiffre_sfp, (player getVariable 'mon_argent_banque_by_sfp_maxou') call retour_formatage_chiffre_sfp];

closeDialog 0;

waituntil {sleep 1; vehicle player != player};

hint "Le vehicule a bien ete declare a votre nom.";
_veh setdamage 0;
