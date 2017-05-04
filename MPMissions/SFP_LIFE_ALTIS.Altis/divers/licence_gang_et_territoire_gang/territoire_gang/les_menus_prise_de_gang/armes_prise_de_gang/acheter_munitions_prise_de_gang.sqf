// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_parametrage_du_tableau", "_prise_en_compte_du_tableau"];
_parametrage_du_tableau = parametrage_armes_pistolets_prises_de_gang; 
_prise_en_compte_du_tableau = armes_pistolets_prises_de_gang;
if (isnil "_parametrage_du_tableau" or isnil "_prise_en_compte_du_tableau") exitwith {hint "Erreur choix du tableau, recommence ...";};

// =======================================================================================================================================================================================
															// !!! LANCEMENT CONFIGURATION NE PAS TOUCHER !!!!!!
// =======================================================================================================================================================================================
_position_choix_dans_le_dialogue = (lbCurSel (_parametrage_du_tableau select 3));
_ou_prendre_l_argent = _parametrage_du_tableau select 1;

_son_nom = _prise_en_compte_du_tableau select _position_choix_dans_le_dialogue select 0;
_choix_des_munitions = (_prise_en_compte_du_tableau select _position_choix_dans_le_dialogue select 4) call bis_fnc_selectrandom; 
_son_prix = _prise_en_compte_du_tableau select _position_choix_dans_le_dialogue select 5;

_munitions_actuellement = 1; 
for "_i" from 0 to (count magazinesAmmoFull player) do 
{
	if (((magazinesAmmoFull player) select _i select 0) == _choix_des_munitions) then 
	{
		_munitions_actuellement = _munitions_actuellement + 1;
	};
};

if (isnil "_position_choix_dans_le_dialogue" or isnil "_ou_prendre_l_argent" or isnil "_son_nom" or isnil "_choix_des_munitions" or isnil "_son_prix") exitwith {hint "Erreur sur le choix, recommence ...";};
if (player getVariable _ou_prendre_l_argent < _son_prix) exitwith {Hint format ["Vous avez %1 Euros et il vous faut %2 Euros",(player getVariable _ou_prendre_l_argent),(_son_prix)];};
if !(player canAdd _choix_des_munitions) exitwith {hint "Impossible, vous n'avez plus de place !";};

player setVariable [_ou_prendre_l_argent, (player getvariable _ou_prendre_l_argent) - _son_prix,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
player addMagazine _choix_des_munitions;
hint format['------------------------------------------------ \n ! ACHAT MUNITIONS CAPTURE GANG ! \n ------------------------------------------------ \n\n Munitions de : %1. \n Actuellement : %2 munitions. \n Prix : %3 Euros. \n\n Il vous reste %4 Euros. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr',_son_nom, _munitions_actuellement,_son_prix, (player getVariable _ou_prendre_l_argent) call retour_formatage_chiffre_sfp];

