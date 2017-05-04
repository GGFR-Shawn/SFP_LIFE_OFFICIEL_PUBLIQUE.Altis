// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

[] spawn
{
	if (isnil "personne_dans_mon_groupe") then {personne_dans_mon_groupe = [];};
	_delai_maj_personne_dans_mon_group = 3;

	setGroupIconsVisible [true, true];
	
	while {true} do
	{
		{
			if (group _x == group player) then
			{
				if !(name _x in personne_dans_mon_groupe) then 
				{
					personne_dans_mon_groupe = personne_dans_mon_groupe + [name _x];
				};
				
				if (vehicle _x == _x && leader (group player) == _x && _x != player) then
				{
					_le_text = format ["Leader : %1 (%2 M).",name _x,round(_x distance player)];
					
					group player addGroupIcon ["b_inf"];
					group player setGroupIconParams [[0.94,0,0,1], _le_text, 1, true];
				};
			}else
			{
				if (name _x in personne_dans_mon_groupe) then 
				{
					personne_dans_mon_groupe = personne_dans_mon_groupe - [name _x];
				};				
			};
			sleep 0.03; 
		} forEach playableUnits;
		
		if (isnil "historique_personne_dans_mon_groupe") then {historique_personne_dans_mon_groupe = personne_dans_mon_groupe;};
		if (count historique_personne_dans_mon_groupe != count personne_dans_mon_groupe) then 
		{
			historique_personne_dans_mon_groupe = personne_dans_mon_groupe;
			
			['personne_dans_mon_groupe', historique_personne_dans_mon_groupe] call uid_sauvegarde_ecrire_local_joueur_sfp;
		};
		
		sleep _delai_maj_personne_dans_mon_group;
		
		{clearGroupIcons group _x;} forEach allUnits;
	};
};