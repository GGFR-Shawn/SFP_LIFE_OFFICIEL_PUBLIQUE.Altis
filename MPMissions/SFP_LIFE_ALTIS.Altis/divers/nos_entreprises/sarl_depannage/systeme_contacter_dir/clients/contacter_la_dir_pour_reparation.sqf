// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_check_depanneur_sfp";
{if (!isnil {_x getvariable "sarl_depannage_en_ligne"}) then {_check_depanneur_sfp = true;};} foreach playableunits;
if (isnil "_check_depanneur_sfp") exitwith {hint "! REPARATION DIR ! \n ----------------------------\n Désolé, aucun dépanneur n'est connecté actuellement ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (!isnil "demande_reparation_aux_depanneurs") exitwith {hint "! REPARATION DIR ! \n ----------------------------\n Désolé, vous venez de faire une demande aux dépanneurs il y à peu ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (je_suis_en_service_a_la_sarl_depannage >= 1) exitwith {hint "! REPARATION DIR ! \n ----------------------------\n Tu fais partie de la DIR couillon ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};
if (cursortarget getvariable "vehicule_info_parvariable" select 0 != name player) exitwith {hint "! REPARATION DIR ! \n ----------------------------\n Désolé, ce n'est pas ton véhicule ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

closedialog 0;
_compter_nombre_depanneur_connecte = 0;
_listes_des_depanneurs = [];
_listes_envoi_depanneurs = [];
_le_vehicule = cursortarget;
{
	if (!isnil {_x getvariable "sarl_depannage_en_ligne"}) then 
	{
		_listes_envoi_depanneurs = _listes_envoi_depanneurs + [_x];
		_listes_des_depanneurs = _listes_des_depanneurs + [name _x]; 
		_compter_nombre_depanneur_connecte = round (_compter_nombre_depanneur_connecte + 1);
	};
} foreach playableunits;


_nom_des_depanneurs = "";
for "_i" from 0 to (count _listes_des_depanneurs - 1) do
{
	_nom_des_depanneurs = _nom_des_depanneurs + format ["%1 ",_listes_des_depanneurs select _i];
};
if (isnil "_listes_des_depanneurs" or isnil "_nom_des_depanneurs") exitwith {hint "Erreur recommence !";};

hint format ["! REPARATION DIR ! \n ----------------------------\n Votre demande à bien été envoyée aux dépanneurs. \n\n Ils sont actuellement %1 connectés : (%2) ! \n ------------------------------------- \n By SFP Maxou \n www.sfpteam.fr", _compter_nombre_depanneur_connecte, _nom_des_depanneurs];	

[[[player, getText ( configFile >> "CfgVehicles" >> typeOf (_le_vehicule) >> "displayName"), _le_vehicule],"divers\nos_entreprises\sarl_depannage\systeme_contacter_dir\clients\avertir_la_dir_intervention_demande.sqf"],"BIS_fnc_execVM", _listes_envoi_depanneurs,false] spawn BIS_fnc_MP;

_le_vehicule setVariable ["vehicule_attente_reparation",true,true];

demande_reparation_aux_depanneurs = true;

_temps_mise_a_jour_revive = 120;
for [{_i = 600}, {_i > 0}, {_i = _i - _temps_mise_a_jour_revive}] do
{
	player globalchat format ["Autorisation pour recontacter les dépanneurs dans %1 secondes ...", _i];
	sleep _temps_mise_a_jour_revive;
};

demande_reparation_aux_depanneurs = nil;