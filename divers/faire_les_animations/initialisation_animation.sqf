// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// 1 = playMoveNow;
// 2 = playMove;
// 3 = switchmove;

if (isnil "jesuistaze") then {jesuistaze = 0;};
if (jesuistaze == 1) exitwith {hint "Désolé, tu es tazé et ne peux donc pas jouer d'animation pour le moment ...";};
if (!isnil {player getvariable "besoin_d_un_revive_news"}) exitwith {hint "Désolé, tu es mort pour le moment et ne peux donc pas te servir de ce menu !";};
if (vehicle player != player) exitwith {hint "Désolé, animation impossible lorsque vous êtes en véhicule !";};

createdialog "Menu_tablette_sfp_Jouer_Animation";

for "_i" from 0 to (count sfp_config_listes_des_animations_sfp - 1) do
{
	lbAdd [1500, format ["%1",sfp_config_listes_des_animations_sfp select _i select 0]];
};
