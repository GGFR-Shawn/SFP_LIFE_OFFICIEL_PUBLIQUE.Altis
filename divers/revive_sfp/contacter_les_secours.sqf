// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_compter_nombre_secouriste_connecte = 0;
_compter_nombre_blesse_attente_revive_actuellement = call compilation_revive_calcul_droit_demande_urgence;
_listes_des_secouristes = [];
_listes_envoi_secouristes = [];

{
	if (!isnil {_x getvariable "sarl_pompier_en_ligne"}) then 
	{
		_listes_envoi_secouristes = _listes_envoi_secouristes + [_x];
		_listes_des_secouristes = _listes_des_secouristes + [name _x]; 
		_compter_nombre_secouriste_connecte = round (_compter_nombre_secouriste_connecte + 1);
	};
} foreach playableunits;

if (_compter_nombre_secouriste_connecte < 1) exitwith {player globalchat "Désolé, les pompiers ne sont pas connectés actuellement !";};
if (_compter_nombre_blesse_attente_revive_actuellement < 1) exitwith {player globalchat "Désolé, les services d'urgences sont très prisés en ce moment ! Patiente ou respawn ...";};


_nom_des_secouristes = "";
for "_i" from 0 to (count _listes_des_secouristes - 1) do
{
	_nom_des_secouristes = _nom_des_secouristes + format ["%1 ",_listes_des_secouristes select _i];
};
if (isnil "_listes_des_secouristes" or isnil "_nom_des_secouristes") exitwith {hint "Erreur recommence !";};

player setvariable ["mon_argent_banque_by_sfp_maxou",(player getVariable "mon_argent_banque_by_sfp_maxou") + (tarif_menu_revive select 1),true];
format_du_message_revive_contact_urgence = format ["\n\n Votre demande à bien été envoyée aux services d'urgences. \n\n Ils sont actuellement %1 connectés : (%2) \n\n Tiens bon !!! \n\n Par ailleur, vous avez gagné %3 %4 grace à votre demande !",_compter_nombre_secouriste_connecte,_nom_des_secouristes, tarif_menu_revive select 1, "€"];	

[[player],"avertit_demande_secours_revive", _listes_envoi_secouristes,false] spawn BIS_fnc_MP;

player setVariable ["detection_demande_revive",true,true];
revive_contacter_service_urgence = 1;

_temps_mise_a_jour_revive = 10;
for [{_i = revive_temps_respawn_autoriser_apres_contact_urgence}, {_i > 0 && revive_contacter_service_urgence >= 1}, {_i = _i - _temps_mise_a_jour_revive}] do
{
	player globalchat format ["Autorisation de respawn forcé dans %1 secondes ...",_i];
	sleep _temps_mise_a_jour_revive;
};

revive_contacter_service_urgence = 0;
