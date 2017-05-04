// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_vehicule = _this select 0;
_les_armes_a_remettre_dans_le_vehicule = _this select 1;
_les_munitions_a_remettre_dans_le_vehicule = _this select 2;
_les_items_a_remettre_dans_le_vehicule = _this select 3;
_les_sac_a_dos_a_remettre_dans_le_vehicule = _this select 4;

for [{_ii = 0}, {_ii < (count (_les_armes_a_remettre_dans_le_vehicule select 0))}, {_ii = _ii + 1}] do 
{
	_le_vehicule addWeaponCargoGlobal [(_les_armes_a_remettre_dans_le_vehicule select 0) select _ii, (_les_armes_a_remettre_dans_le_vehicule select 1) select _ii];
};

for [{_ii = 0}, {_ii < (count (_les_munitions_a_remettre_dans_le_vehicule select 0))}, {_ii = _ii + 1}] do 
{
	_le_vehicule addMagazineCargoGlobal [(_les_munitions_a_remettre_dans_le_vehicule select 0) select _ii, (_les_munitions_a_remettre_dans_le_vehicule select 1) select _ii];
};

for [{_ii = 0}, {_ii < (count (_les_items_a_remettre_dans_le_vehicule select 0))}, {_ii = _ii + 1}] do 
{
	_le_vehicule addItemCargoGlobal [(_les_items_a_remettre_dans_le_vehicule select 0) select _ii, (_les_items_a_remettre_dans_le_vehicule select 1) select _ii];
};

for [{_ii = 0}, {_ii < (count (_les_sac_a_dos_a_remettre_dans_le_vehicule select 0))}, {_ii = _ii + 1}] do 
{
	_le_vehicule addBackpackCargoGlobal  [(_les_sac_a_dos_a_remettre_dans_le_vehicule select 0) select _ii, (_les_sac_a_dos_a_remettre_dans_le_vehicule select 1) select _ii];
};
