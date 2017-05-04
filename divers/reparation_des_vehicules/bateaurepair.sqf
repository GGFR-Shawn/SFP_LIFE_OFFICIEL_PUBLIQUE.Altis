// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if ((vehicle player) iskindof "ship") then
{
    if ((player getVariable "mon_argent_banque_by_sfp_maxou") >= 50000) then
    {
        _total = 0;
        _workwasdone = False;
        _veh = (vehicle player);
        _veh setfuel 0;
        
		Hint "Alors voyons voir ce qu'il faut faire...";

        sleep 3;

        _HR = _veh getHitPointDamage "HitHRotor"; if (isnil "_HR") then {_HR = 0;};
        _AV = _veh getHitPointDamage "HitAvionics"; if (isnil "_AV") then {_AV = 0;};
        _body = _veh getHitPointDamage "HitHull"; if (isnil "_body") then {_body = 0;};
        _Engine = _veh getHitPointDamage "HitEngine"; if (isnil "_Engine") then {_Engine = 0;};

        if(_HR != 0) then {
            _total = _total + (_HR * 13250);
        };
        if(_AV != 0) then {
            _total = _total + (_AV * 8400);
        };
        if(_body != 0) then {
            _total = _total + (_body * 24000);
        };
        if(_Engine != 0) then {
            _total = _total + (_Engine * 8200);
        };

        if (_body != 0) then
        {
            Hint "Fixation du pare brise...";
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
            
            _workwasdone = True;
        };
        
        if (_AV != 0) then
        {
            hint "Fixer/Remplacer morceau de carrosserie...";
            sleep (_AV* 15);
            _veh setHitPointDamage ["HitAvionics",0];
            _workwasdone = True;
        };
        
        if (_Engine != 0) then
        {
            hint "Fixer/Remplacer votre moteur...";
            sleep (_Engine * 15);
            _veh setHitPointDamage ["HitEngine",0];
            _workwasdone = True;
        };
        
        hint "Vérification du carburant...";
        sleep 3;
        _veh setfuel 1;
        _total = _total + 1000;
        _mymon = player getVariable "mon_argent_banque_by_sfp_maxou";
        player setVariable["mon_argent_banque_by_sfp_maxou",( _mymon - (round _total)),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
        _mymon = player getVariable "mon_argent_banque_by_sfp_maxou";
        
        if(_workwasdone) then
        {
            sleep 2;
        }
        else
        {
            hint "Après un contrôle appronfondi, votre véhicule n'a pas besoin d'être réparé !";
            sleep 3;
        };

        Hint format ["Le prix du control est de %2 %1. Vous avez maintenant %3 %1","€",(round _total),_mymon];
        
    }
    else
    {
        hint "Vous devez avoir au moins	50 000 Euros ou plus sur votre compte bancaire pour s'assurer que vous pouvez couvrir le coût du service";
    };
}
else
{
    hint "Vous devez être dans un bateau pour reparer !";
};