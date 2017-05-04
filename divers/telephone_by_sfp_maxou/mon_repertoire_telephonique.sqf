// =======================================================================================================================================================================================
					// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
					  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

createdialog "Menu_tablette_sfp_mon_repertoire_telephonique_dialogue";
((uiNamespace getVariable "Menu_tablette_sfp_mon_repertoire_telephonique_dialogue") displayCtrl 1009) ctrlSetTextColor [0,0.91,0.07,1];
((uiNamespace getVariable "Menu_tablette_sfp_mon_repertoire_telephonique_dialogue") displayCtrl 1009) ctrlSetText format ["%1", player getvariable "mon_numero_de_telephone"];

_numero_add = -1;
{
	_le_numero_de_telephone = _x select 0;
	_le_correspondant = _x select 1;
	_numero_add = round (_numero_add + 1);
	
	lbAdd [11173, format ["%1 - %2.",_le_correspondant, _le_numero_de_telephone]];
	lbSetColor [11173, _numero_add, [0,0,0,1]];
	lbSort [((uiNamespace getVariable "Menu_tablette_sfp_Donner_Numero_De_Telephone") displayCtrl 11173), "ASC"];
} forEach mon_repertoire_de_telephone;
