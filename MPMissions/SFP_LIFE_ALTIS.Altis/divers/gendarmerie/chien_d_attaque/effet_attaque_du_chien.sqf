// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_la_personne_a_attaquer = _this select 0;
_nom_du_gendarme = _this select 1;
if (isnull _la_personne_a_attaquer) exitwith {};
if (isnull _nom_du_gendarme) exitwith {};

_la_personne_a_attaquer say "joueur_douleur_flash_ball";
player globalchat format ["%1 vient de se faire attaquer par le chien de %2 !",name _la_personne_a_attaquer, name _nom_du_gendarme];

[[[_la_personne_a_attaquer,"Static_Dead"],"divers\gendarmerie\chien_d_attaque\synchro_animation_chien_d_attaque.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

if (_la_personne_a_attaquer == player) then
{
	titleText [format ["\n\n\n\n\n\n\n\n Vous venez de vous faire attaquer par le chien de %1 !",name _nom_du_gendarme], "PLAIN",0];	
	
	player setHit ["hands", 1];
	player setDamage (damage player + 0.2);

	player allowdamage false;
	jesuistaze = 1;
	sleep 31.8;
	jesuistaze = 0;
	player switchmove "";
	player allowdamage true; sleep 1; player allowdamage true;
};

