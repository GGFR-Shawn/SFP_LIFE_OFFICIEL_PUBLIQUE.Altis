// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_vehicule = cursortarget;
_montant_de_l_amende = floor parseNumber (ctrlText 1400);
if (isnil "_montant_de_l_amende") exitwith {hint "Erreur sur le montant, recommence ...";};
if (isnil "_le_vehicule") exitwith {hint "Erreur sur le véhicule, recommence ...";};
if (isnil {_le_vehicule getvariable "plaque_immatriculation_news"}) exitwith {hint "! AMENDE VEHICULE ! \n ------------------------------------- \n\n Désolé, \n\n Ce n'est pas le véhicule d'un joueur ... \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (_le_vehicule getvariable "vehicule_info_parvariable" select 0 == name player) exitwith {hint "! AMENDE VEHICULE ! \n ------------------------------------- \n\n Désolé, \n\n Tu ne peux pas mettre d'amende sur ton véhicule ... \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (!isnil {_le_vehicule getvariable "amende_vehicule"}) exitwith {hint "! AMENDE VEHICULE ! \n ------------------------------------- \n\n Désolé, \n\n Le véhicule a déja une amende ... \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};
if (!alive _le_vehicule) exitwith {hint "! AMENDE VEHICULE ! \n ------------------------------------- \n\n Désolé, \n\n Ce véhicule est HS ... \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou";};

[[[_le_vehicule getvariable "vehicule_info_parvariable" select 0, _montant_de_l_amende, position player, _le_vehicule],"divers\gendarmerie\amendes _sur_un_vehicule\avertir_joueur_amende_sur_le_vehicule.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

_le_vehicule setvariable ["amende_vehicule",[_montant_de_l_amende, name player],true];

hint format ["! AMENDE VEHICULE ! \n ------------------------------------- \n\n Bonjour %1, \n\n L'amende d'un montant de %2 Euros à bien été avisé sur le véhicule. \n\n Le conducteur, %3, sera avisé une fois dans son véhicule. \n\n S'il refuse de payer, l'information sera indiquée sur son casier. \n -------------------------------------------------\n www.sfpteam.fr \n By SFP Maxou",name player, (_montant_de_l_amende) call retour_formatage_chiffre_sfp, _le_vehicule getvariable "vehicule_info_parvariable" select 0];

closedialog 0;

_heure_du_message = format ["%1/%2/%3 à %4H%5Min (Arma : %6) :",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
_detail_du_message = format ["%1 a depose une amende de %2 euros sur le vehicule de %3 pour plaque %4).",name player, (_montant_de_l_amende) call retour_formatage_chiffre_sfp, _le_vehicule getvariable "vehicule_info_parvariable" select 0, _le_vehicule getvariable "plaque_immatriculation_news" select 0];
["Historique Amende Sur Un Vehicule", "Historique Amende Sur Un Vehicule", _heure_du_message, _detail_du_message] call fn_SaveToServer;
