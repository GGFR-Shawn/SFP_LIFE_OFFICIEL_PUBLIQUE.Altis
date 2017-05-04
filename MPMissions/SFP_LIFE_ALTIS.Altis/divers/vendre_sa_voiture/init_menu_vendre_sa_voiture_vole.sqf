// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_l_ancien_joueur";
if (!sfp_config_activer_revente_voitures_voles) exitwith {hint "! VENTE DE VEHICULE VOLE ! \n -------------------------- \n\n Désolé, \n\n Cette fonction n'est pas activé sur ce serveur. \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};
if (vehicle player == player) exitwith {hint "! VENTE DE VEHICULE VOLE ! \n -------------------------- \n\n Désolé, je sais que tu ne vaut pas grand chose mais tu n'es pas dans un véhicule ... ! \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};
if (revive_mon_side == west) exitwith {hint "! VENTE DE VEHICULE VOLE ! \n -------------------------- \n\n Désolé mais les gendarmes ne peuvent pas vendre leurs voitures ... ! \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};
if ((vehicle player) getvariable "vehicule_info_parvariable" select 0 == name player) exitwith {hint "! VENTE DE VEHICULE VOLE ! \n -------------------------- \n\n Désolé mais ce véhicule t'appartient ... \n\n Il ne peut donc pas avoir été volé ... \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};
if (((assignedVehicleRole player) select 0) != "Driver") exitwith {hint "! VENTE DE VEHICULE VOLE ! \n -------------------------- \n\n Désolé tu n'es pas le conducteur du véhicule ... \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};
if (isEngineon (vehicle player)) exitwith {hint "! VENTE DE VEHICULE VOLE ! \n -------------------------- \n\n Eteint le véhicule pour le revendre ... \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};
if (isnil {(vehicle player) getvariable "prix_du_vehicule_neuf"}) exitwith {hint "! VENTE DE VEHICULE VOLE ! \n -------------------------- \n\n Désolé, le prix du véhicule neuf est inconnu ... \n\n Nouveau script depuis le 10/10/2015. Patientez donc que les joueurs achètent de nouveau véhicule avec son prix d'enregistré ... \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};
if (((assignedVehicleRole player) select 0) != "Driver") exitwith {hint "! VENTE DE VEHICULE VOLE ! \n -------------------------- \n\n Désolé, tu n'es pas le conducteur ! \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};

_pourcentage_du_prix_sfp = 25;
_temps_de_vente_sfp = 30;
_l_ancien_joueur = objnull;
_le_vehicule_sfp = vehicle player;
_ancien_proprietaire = (_le_vehicule_sfp) getvariable "vehicule_info_parvariable" select 0;
_prix_du_vehicule_neuf_sfp = (_le_vehicule_sfp) getvariable "prix_du_vehicule_neuf";

{if (name _x == _ancien_proprietaire) then{_l_ancien_joueur = _x;};} foreach allunits;
if (_l_ancien_joueur == objnull) exitwith {hint "! VENTE DE VEHICULE VOLE ! \n -------------------------- \n\n Désolé, l'ancien propriétaire n'est pas connecté ... \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};
if (_l_ancien_joueur distance player < 400) exitwith {hint "! VENTE DE VEHICULE VOLE ! \n -------------------------- \n\n Désolé, l'ancien propriétaire est trop proche de votre position ... \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};

while {_temps_de_vente_sfp > 0 && alive player && alive (_le_vehicule_sfp) && !(isEngineon (_le_vehicule_sfp)) && ((assignedVehicleRole player) select 0) == "Driver"} do
{
	0 cuttext [format ["! VENTE DE VEHICULE VOLE ! \n --------------------------------------------------------------- \n\n Encore %1 secondes avant la vente du véhicule qui te rapportera %2 %3 !",_temps_de_vente_sfp, (round ((_prix_du_vehicule_neuf_sfp / 100) * _pourcentage_du_prix_sfp)) call retour_formatage_chiffre_sfp, "€"],"BLACK FADED",1];
	_temps_de_vente_sfp = round (_temps_de_vente_sfp - 1);
	sleep 1;
};
0 cuttext [format ["! VENTE DE VEHICULE VOLE ! \n --------------------------------------------------------------- \n\n Encore %1 secondes avant la vente du véhicule qui te rapportera %2 %3 !",_temps_de_vente_sfp, (round ((_prix_du_vehicule_neuf_sfp / 100) * _pourcentage_du_prix_sfp)) call retour_formatage_chiffre_sfp, "€"],"BLACK IN",6];
if (_temps_de_vente_sfp > 0) exitwith 
{
	hint "! VENTE DE VEHICULE VOLE ! \n -------------------------- \n\n Désolé, la vente à été annulée ... \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";
	0 cutText ["! VENTE DE VEHICULE VOLE ! \n -------------------------- \n\n Désolé, la vente à été annulée ... \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou", "BLACK IN",6];	
};

_prime_de_vente = round ((_prix_du_vehicule_neuf_sfp / 100) * _pourcentage_du_prix_sfp);
player setvariable ["mon_argent_poche_by_sfp_maxou",(player getvariable "mon_argent_poche_by_sfp_maxou") + _prime_de_vente,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
if (_prime_de_vente < 1) exitwith {hint "! VENTE DE VEHICULE VOLE ! \n -------------------------- \n\n Désolé, le vendeur n'est pas intéréssé par ce véhicule ... \n\n Essai de le vendre à un joueur ! \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};
hint format ["! VENTE DE VEHICULE VOLE ! \n -------------------------- \n\n Félicitation, le PNJ à acheté votre véhicule pour %1 %2, soit %3 %4 de sa valeur neuve ! Bon jeu. \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou", (_prime_de_vente) call retour_formatage_chiffre_sfp, "€", _pourcentage_du_prix_sfp, "%"];

deletevehicle (_le_vehicule_sfp);

_detail_du_log = format ["%1 à revendu un véhicule volé (%2) pour %3 Euros appartenant a %4. !",name player, typeof _le_vehicule_sfp, _prime_de_vente, _ancien_proprietaire];
_heure_du_log = format ["%1/%2/%3 à %4H%5Min (Arma : %6):",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Revente Vehicule Vole", "Listes Des Ventes", _heure_du_log, _detail_du_log] call fn_SaveToServer;
