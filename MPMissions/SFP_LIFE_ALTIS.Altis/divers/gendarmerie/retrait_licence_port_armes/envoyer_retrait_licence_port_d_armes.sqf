// =======================================================================================================================================================================================
									// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
									  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_joueur = cursortarget;
_message = "";
if (isnil "_le_joueur") exitwith {hint "Erreur sur la personne, recommence !";};
if !(_le_joueur iskindof "man") exitwith {hint "Erreur sur la personne, ce n'est pas un joueur !";};


if (!isnil {_le_joueur getvariable "permis_port_d_arme"}) then
{
	_le_joueur setvariable ["permis_port_d_arme", nil,true];
	_message = _message + "Port d'arme : L'avait et a été enlevé. \n\n";
}else
{
	_message = _message + "Port d'arme : Ne l'avait pas. \n\n";
};

if (!isnil {_le_joueur getvariable "licence_fusils"}) then
{
	_le_joueur setvariable ["licence_fusils", nil,true];
	_message = _message + "Licence fusils : L'avait et a été enlevé.";
}else
{
	_message = _message + "Licence fusils : Ne l'avait pas.";
};

titletext [format["Récapitualif %2 : \n---------------------\n \n %1.", _message, name _le_joueur], "PLAIN",2];
hint format ["Récapitualif %2 : \n---------------------\n \n %1.", _message, name _le_joueur];

[[[name player, _le_joueur],"divers\gendarmerie\retrait_licence_port_armes\avertir_joueur_licence_port_arme_en_moins.sqf"],"BIS_fnc_execVM", _le_joueur, false] spawn BIS_fnc_MP;
