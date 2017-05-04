// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 1; !isnil "marche_noir_creation";};

_reperedumarchenoir = createMarkerLocal ["marchenoirrepere", getPosATL marche_noir_creation];
_reperedumarchenoir setMarkerColorLocal "ColorRed";
_reperedumarchenoir setMarkerShapeLocal "ICON";
_reperedumarchenoir setMarkerTypeLocal "mil_warning";
_reperedumarchenoir setMarkerTextLocal " Marché Noir";
_reperedumarchenoir setMarkerSizeLocal [0.71, 0.71];

if (revive_mon_side == west) exitwith {};

menudumarchenoiradaction = marche_noir_creation addAction ["<t color=""#ff0000"">" + 'Marche noir','menu\nouveau_menu_vendre_au_marche\menu_marche_farming.sqf',["2"],7,true,true,'','player distance cursortarget < 5'];