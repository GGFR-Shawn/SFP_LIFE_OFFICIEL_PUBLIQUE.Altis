// =======================================================================================================================================================================================
											// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
											  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_objet_max_autorise_dans_la_maison = 3;
{
	if (!isnil {_x getvariable "object_decoration_interieur"}) then
	{
		_objet_max_autorise_dans_la_maison = round (_objet_max_autorise_dans_la_maison - 1);
	};
} foreach (nearestObjects [player, les_objets_quon_peut_placer, 20]);
if (_objet_max_autorise_dans_la_maison < 1) exitwith {titletext ["Désolé, seul 5 objets max sont autorisés (abus).","PLAIN DOWN"];};


if ((lbCurSel 1500) == -1) exitwith {Hint "! DECORATEUR INTERIEUR ! \n ----------------------------------- \n\n Désolé, tu n'as pas selectionné d'objet à poser ! \n ----------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

l_object_decorateur_choisit = nil;
_nom_de_l_object_a_poser = lbtext [1500, lbCurSel 1500];
if (isnil "_nom_de_l_object_a_poser") exitwith {Hint "! DECORATEUR INTERIEUR ! \n ----------------------------------- \n\n Erreur sur l'objet selectionné, recommence ... \n ----------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

for "_i" from 0 to (count sfp_config_listes_objects_decorateurs - 1) do
{
	if (_nom_de_l_object_a_poser == sfp_config_listes_objects_decorateurs select _i select 1) then
	{
		l_object_decorateur_choisit = sfp_config_listes_objects_decorateurs select _i select 0;
	};
};

if (isnil "l_object_decorateur_choisit") exitwith {Hint "! DECORATEUR INTERIEUR ! \n ----------------------------------- \n\n Erreur sur l'objet choisit, recommence ... \n ----------------------------------- \n By SFP Maxou \n www.sfpteam.fr";};

closedialog 0;

player allowdamage false;

l_object_decorateur_choisit_attache = createVehicle [l_object_decorateur_choisit, [(getPosATL player select 0) - (30),getPosATL player select 1,getPosATL player select 2], [], 0, "NONE"];
detach l_object_decorateur_choisit_attache;
l_object_decorateur_choisit_attache attachto [player,[0,4,1]];
l_object_decorateur_choisit_attache setvariable ["object_decoration_interieur",true,true];
objet_architecte_attache = true;

player allowdamage true;

titletext ["Objet bien posé, arma peut mêtre un peu de temps à le detecter, patiente donc ;) \n\n PS : Sache que ces objets sont sauvegardés ... \n PS 2 : Les maisons sont buggées. L'objet partira donc sous le sol, il reviendra après le reboot.","PLAIN DOWN"];
