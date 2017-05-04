// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

[] call compter_personne_dans_mon_groupe; 
if (nombre_de_personne_dans_mon_group <= 1) exitwith {player globalchat "Vous n'etes pas dans un groupe ...";};

// closedialog 0;
// waituntil {!dialog};

// cutText["","BLACK FADED"];
// 0 cutFadeOut 9999999;

_nom_du_menu = "Menu_tablette_sfp_Menu_Groupe_Go_Pro";

createDialog _nom_du_menu;
disableSerialization;

_numero_add = 1500;
{
	_nom_ajout = format ["%1",name _x];
	lbAdd [_numero_add, _nom_ajout];
} foreach personne_actuellement_dans_mon_groupe;
	
lbSort [((uiNamespace getVariable _nom_du_menu) displayCtrl _numero_add), "ASC"];

// waituntil {!dialog;};
// cutText["","BLACK IN"];
