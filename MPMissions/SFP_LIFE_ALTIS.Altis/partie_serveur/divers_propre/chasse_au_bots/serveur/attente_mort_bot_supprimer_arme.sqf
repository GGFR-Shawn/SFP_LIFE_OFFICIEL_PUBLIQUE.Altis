//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !


_le_bot = _this select 0;
_position_du_bot = getPosATL _le_bot;
"DIAG SFP : Chasse aux bots : Attente mort d'un bot pour suppression armes." spawn historique_creation_log_sfp;

waituntil {sleep 1; !alive _le_bot};

sleep 5;
{
	"DIAG SFP : Chasse aux bots : suppression de l'arme." spawn historique_creation_log_sfp;
	deleteVehicle _x;
} forEach (nearestObjects [_position_du_bot, ["GroundWeaponHolder","weaponholder","WeaponHolderSimulated"], 15]);

