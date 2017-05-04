// =======================================================================================================================================================================================
												// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
												  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_condition = _this select 3 select 0;
if (isnil "_condition") exitwith {titletext ["Erreur recommence ...","PLAIN DOWN"];};

if (speed player != 0) exitwith {titletext ["Vous devez être à l'arret ...","PLAIN DOWN"];};

if (_condition == 1) then
{
	l_object_decorateur_choisit_attache = cursortarget;
	l_object_decorateur_choisit_attache attachto [player,[0,(player distance l_object_decorateur_choisit_attache),(getPosATL l_object_decorateur_choisit_attache select 2) + (0)]];
	if (getPosATL l_object_decorateur_choisit_attache select 2 < 0) then {l_object_decorateur_choisit_attache attachto [player,[0,(player distance l_object_decorateur_choisit_attache),(getPosATL l_object_decorateur_choisit_attache select 2) + (1.8)]];};
	l_object_decorateur_choisit_attache setdir (getdir l_object_decorateur_choisit_attache - getdir player);
	objet_architecte_attache = true;
	
	if (!isnil "position_securite_objet_decorateur") then
	{
		if (player distance position_securite_objet_decorateur > 100) then
		{
			position_securite_objet_decorateur = nil;
		};
	};
	if (isnil "position_securite_objet_decorateur") then
	{
		position_securite_objet_decorateur = getPosATL player;
	
		while {!isNull attachedTo l_object_decorateur_choisit_attache} do
		{
			sleep 0.2;
			if (player distance position_securite_objet_decorateur > 12) then
			{
				detach l_object_decorateur_choisit_attache;
				l_object_decorateur_choisit_attache setPosATL position_securite_objet_decorateur;
				objet_architecte_attache = nil;
				position_l_object_decorateur_choisit_attache = nil;
				titletext ["! Protection objet ! \n\n Vous êtes partit trop loin, l'objet à été remit à sa place avant que vous l'attachiez !","PLAIN DOWN"];
			};
		};	
	};	
};

if (_condition == 2) then
{
	_surface = surfaceType getPosATL player;
	_verificationsurface = ["#GdtAsphalt"];
	if (_surface in _verificationsurface) exitwith {hint "Désolé, tu ne peux pas mettre l'objet sur la route !";};
	
	detach l_object_decorateur_choisit_attache;
	objet_architecte_attache = nil;
	position_l_object_decorateur_choisit_attache = nil;
};

