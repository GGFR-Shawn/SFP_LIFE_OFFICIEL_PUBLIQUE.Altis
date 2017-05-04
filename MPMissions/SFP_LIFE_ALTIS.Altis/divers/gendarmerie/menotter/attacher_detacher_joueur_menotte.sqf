// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_condition";
_condition = _this select 3 select 0;
if (isnil "_condition") exitwith {hint "Erreur sur la detection ...";};

[] call detection_du_joueur_arrete_gendarmerie;

switch _condition do
{
	case "1" :
	{
		le_joueur_arrete_gendarmerie attachTo [player,[0.25,1,0]];
	};
	
	case "2" :
	{
		detach le_joueur_arrete_gendarmerie;
	};
};