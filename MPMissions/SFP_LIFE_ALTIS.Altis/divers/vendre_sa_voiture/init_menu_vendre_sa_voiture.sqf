// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_detail_du_log","_prime_de_vente"];
if (revive_mon_side == west) exitwith {hint "! VENTE DE VEHICULE ! \n -------------------------- \n\n Désolé mais les gendarmes ne peuvent pas vendre leurs voitures ... ! \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};
if (!isnil {player getvariable "sarl_car_shop"} && !isnil {cursortarget getvariable "sarl_car_shop"}) exitwith {hint "! VENTE DE VEHICULE ! \n -------------------------- \n\n Désolé vous ne pouvez pas vendre de véhicule entre personne du CarShop ... ! \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};


//---------------------------------------------------------------- Explication ----------------------------------------------------------------------------
hint format ["! VENTE DE VEHICULE ! \n -------------------------- \n\n Bonjour %1 et bienvenue dans l'aire des ventes ! \n\n Ici, vous pourrez vendre votre véhicule en suivant les indications qui vont s'afficher ... \n\n Pense à négocier le prix du véhicule avant la vente ...\n ------------------------------------------------\n www.sfpteam.fr \n By Maxou",name player];
sleep 10;
hint "! VENTE DE VEHICULE ! \n -------------------------- \n\n Pour commencer : \n\n 1) Il te suffit de pointer ta souris sur le joueur à qui tu souhaites vendre ton véhicule ... \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";


//------------------------------------------------------------- Selection du joueur ----------------------------------------------------------------------------
waituntil {cursortarget iskindof "Man"};
if !(isplayer cursortarget) exitwith {hint "! VENTE DE VEHICULE ! \n -------------------------- \n\n Désolé, ce n'est pas un joueur ! \n\n Recommence ... \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};
waituntil {cursortarget iskindof "Man" && isplayer cursortarget};
_cestpourqui = [name cursortarget];
hint format ["! VENTE DE VEHICULE ! \n -------------------------- \n\n Très bien, %1 à bien été selectionné ! \n\n 2) Pointes maintenant ta souris sur TON véhicule pour le lui vendre ... \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou",_cestpourqui];


//---------------------------------------------------------- Vérification appartenance ----------------------------------------------------------------------------
waitUntil {!isnil {cursortarget getvariable "vehicule_info_parvariable"}}; 
if (cursortarget getvariable "vehicule_info_parvariable" select 0 != name player) exitwith {hint "! VENTE DE VEHICULE ! \n -------------------------- \n\n Désolé, Ce n'est pas ton véhicule ! \n\n Recommence ... \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou";};


//--------------------------------------------------------- Vérification appartenance OK ----------------------------------------------------------------------------
waituntil {cursortarget getvariable "vehicule_info_parvariable" select 0 == name player};
_okpourchangementdunom = cursortarget;
_nomduvehicule = getText ( configFile >> "CfgVehicles" >> typeOf(_okpourchangementdunom) >> "displayName");
_okpourchangementdunom setvariable ["vehicule_info_parvariable",_cestpourqui,true];

if (isnil "jesuis_au_taff_a_la_sarl_car_shop_pour_respawn") then
{
	hint format ["! VENTE DE VEHICULE ! \n -------------------------- \n\n Félicitation, le %1 à bien été vendu à %2 ! \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou",_nomduvehicule,_cestpourqui];
	
	_detail_du_log = format ["à revendu un véhicule de type %1 à %2 !",_nomduvehicule, (_cestpourqui select 0)];
}else
{
	if (!isnil {_okpourchangementdunom getvariable "prix_du_vehicule_neuf"}) then
	{
		_prime_de_vente = (((_okpourchangementdunom getvariable "prix_du_vehicule_neuf") / 100) * 5);
		if (_prime_de_vente < 300) then 
		{
			_prime_de_vente = 300;
		};
	}else
	{
		_prime_de_vente = 1500;
	};
	
	player setvariable ["mon_argent_poche_by_sfp_maxou",(player getvariable "mon_argent_poche_by_sfp_maxou") + _prime_de_vente,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
	hint format ["! VENTE DE VEHICULE ! \n -------------------------- \n\n Félicitation, le %1 à bien été vendu à %2 ! \n\n Grace au Carshop tu viens de remporter %3 Euros ! \n ------------------------------------------------\n www.sfpteam.fr \n By Maxou",_nomduvehicule,_cestpourqui ,_prime_de_vente];
	
	_detail_du_log = format ["à revendu un véhicule de type %1 à %2 et a remporté %3 Euros !",_nomduvehicule, _cestpourqui, _prime_de_vente];
};

_heure_du_log = format ["%1/%2/%3 à %4H%5Min %6:",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, name player];
["Historique Revente Vehicule", "Listes Des Ventes", _heure_du_log, _detail_du_log] call fn_SaveToServer;
