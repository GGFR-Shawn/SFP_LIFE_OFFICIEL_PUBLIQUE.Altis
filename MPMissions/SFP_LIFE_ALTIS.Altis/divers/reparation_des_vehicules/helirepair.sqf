// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if !((vehicle player) iskindof "Air") exitwith {hint "Vous devez être dans un hélicoptère pour reparer !";};
if ((player getVariable "mon_argent_banque_by_sfp_maxou") < 30000) exitwith {hint "Vous avez besoin de 30 000 Euros ou plus sur votre compte bancaire pour s'assurer que vous pouvez couvrir le coût du service !";};

_total = 0;
_workwasdone = false;
_veh = (vehicle player);
_veh setfuel 0;

Hint "Patiente, check UP en cours ...";

sleep 3;

_VR = _veh getHitPointDamage "HitVRotor";
_HR = _veh getHitPointDamage "HitHRotor";
_AV = _veh getHitPointDamage "HitAvionics";
_body = damage _veh;
_Engine = _veh getHitPointDamage "HitEngine";

if (!isnil "_VR") then 
{
	if (_VR != 0) then 
	{
		_total = _total + (_VR * 15000);
	};
};
 if (!isnil "_HR") then 
{
   if (_HR != 0) then 
	{
		_total = _total + (_HR * 15000);
	};
};
if (!isnil "_AV") then 
{
	if (_AV != 0) then 
	{
		_total = _total + (_AV * 10000);
	};
};
if (!isnil "_body") then 
{
	if (_body != 0) then 
	{
		_total = _total + (_body * 30000);
	};
};
if (!isnil "_Engine") then 
{
	if (_Engine != 0) then 
	{
		_total = _total + (_Engine * 10000);
	};
};

if (!isnil "_AV") then 
{
   if (_AV != 0) then
	{
		hint "Fixer/Remplacer élément de carrosserie ...";
		
		sleep (_AV* 15);
		
		_veh setHitPointDamage ["HitAvionics",0];
		_workwasdone = True;
	};
};

if (!isnil "_Engine") then 
{
	if (_Engine != 0) then
	{
		
		hint "Fixe/Remplacement de votre moteur...";
		
		sleep (_Engine * 15);
		
		_veh setHitPointDamage ["HitEngine",0];
		_workwasdone = True;
	};
};
		
if (!isnil "_VR" && !isnil "HR") then 
{
	if ((_VR != 0) || (_HR != 0)) then
	{
		
		Hint "Remplacement du rotor...";
		
		sleep (_VR * 10);
		
		_veh setHitPointDamage ["HitVRotor",0];
		
		sleep (_HR * 10);
		
		_veh setHitPointDamage ["HitHRotor",0];
		_workwasdone = True;
	};
};

if (_body != 0) then
{
	Hint "Fixation général ...";
	
	sleep (_body * 15);
	
	_veh setHitPointDamage ["HitHull",0];
	_veh setHitPointDamage ["HitGlass1",0];
	_veh setHitPointDamage ["HitGlass2",0];
	_veh setHitPointDamage ["HitGlass3",0];
	_veh setHitPointDamage ["HitGlass4",0];
	_veh setHitPointDamage ["HitGlass5",0];
	_veh setHitPointDamage ["HitGlass6",0];
	_veh setHitPointDamage ["HitLGlass",0];
	_veh setHitPointDamage ["HitRGlass",0];
	_veh setdamage 0;
	
	_workwasdone = True;
};

hint "Vérification du carburant...";

sleep 3;

_veh setfuel 1;
_total = _total + 1000;
player setVariable["mon_argent_banque_by_sfp_maxou",((player getVariable "mon_argent_banque_by_sfp_maxou") - (round _total)),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";

if(_workwasdone) then
{
	sleep 2;
}
else
{
	hint "Après un contrôle appronfondi, votre véhicule n'a pas besoin d'être réparé !";
	sleep 3;
};

Hint format ["Le prix du control est de %1%2. Vous avez maintenant %1% 3","€",(round _total) call retour_formatage_chiffre_sfp, (player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp];