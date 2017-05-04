// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (revive_mon_side == civilian) exitwith {hint "Biensur ... 100 balles aussi ;)";};

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

_nom_du_menu = "Menu_Camera_Altis";
_titre_add_id = 1500;
_couleur_rouge = [0.99,0.04,0.01,1];

createDialog _nom_du_menu;
disableSerialization;

for "_i" from 0 to (count les_position_des_cameras - 1) do
{
	_valeur_add = format ["%1",les_position_des_cameras select _i select 1];
	lbAdd[_titre_add_id,_valeur_add];
	((uiNamespace getVariable _nom_du_menu) displayCtrl 1004) ctrlSetTextColor _couleur_rouge;
};

waituntil {!dialog;};
cutText["","BLACK IN"];