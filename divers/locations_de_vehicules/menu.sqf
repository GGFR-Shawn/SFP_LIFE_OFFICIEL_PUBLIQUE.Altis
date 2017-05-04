//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

private "_condition";
_condition = false;
{if (!isnil {_x getvariable "sarl_taxis_gsept_en_ligne"}) then {_condition = true;};} foreach playableUnits;
if (_condition) exitwith {hint "Désolé, tu ne peux pas louer de véhicule pour le moment car des TAXIS sont en jeu ! \n\n Appel la SARL TAXIS !";	};

if (!_condition) then
{
	createDialog "LocationDeVehicules";

	hint "! ALTIS LOCATION !\n---------------------- \n\n - Vous pourrez louer ici un véhicule SANS PERMIS puisque bridé ! \n\n - L'assurance tout risques est incluse en cas de dégat au véhicule ! \n\n - Les locations sont limités à UNE par joueur ! \n\n ---------------------- \n By SFP Maxou";

	ctrlSetText[11172,format["Argent Banque : %1 Euros",(player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp]];
	if(revive_mon_side == civilian) then
	{
		lbAdd[11173,"Quad : 180 Euros/Heure"];
		lbAdd[11173,"4X4 : 360 Euros/Heure"];
	};
};