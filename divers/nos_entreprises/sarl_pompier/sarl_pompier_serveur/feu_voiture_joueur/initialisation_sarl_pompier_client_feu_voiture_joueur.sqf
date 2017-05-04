// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if (!hasInterface) exitwith {};

_choix_script_pompier_maxou = _this select 0;
_choix_script_pompier_maxou_deux = _this select 1;
if (isnil "_choix_script_pompier_maxou" or isnil "_choix_script_pompier_maxou_deux") exitwith {};

switch _choix_script_pompier_maxou do
{
	case "1" :
	{
		if (player == _choix_script_pompier_maxou_deux) then
		{
			hint "!!! ATTENTION !!! \n\n Un problème moteur à été détecté sur votre véhicule ! \n\n Descendez immédiatement avant l'incendie du véhicule ! \n\n La SARL POMPIER vient d'être prévenu ! \n\n PS : Contact la SARL DIR pour te refaire le plein de gasoil et le réparer !";
			systemchat "!!! ATTENTION !!! \n\n Un problème moteur à été détecté sur votre véhicule ! \n\n Descendez immédiatement avant l'incendie du véhicule ! \n\n La SARL POMPIER vient d'être prévenu ! \n\n PS : Contact la SARL DIR pour te refaire le plein de gasoil et le réparer !";
		};
	};
};