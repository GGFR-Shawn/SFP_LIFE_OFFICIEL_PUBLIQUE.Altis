// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

if( ((vehicle player) != player))then
{
    if ((player getVariable "mon_argent_banque_by_sfp_maxou") >= 5000) then
    {
        _total = 0;
        _workwasdone = False;
        _veh = (vehicle player);
        _vefuel = fuel _veh;
        _veh setfuel 0;
        
        Hint "Alors voyons voir ce qu'il faut faire...";
        
        sleep 3;

        _w1 = _veh getHitPointDamage "HitLBWheel";
        _w2 = _veh getHitPointDamage "HitLFWheel";
        _w3 = _veh getHitPointDamage "HitRBWheel";
        _w4 = _veh getHitPointDamage "HitRFWheel";
        _body = _veh getHitPointDamage "HitBody";
        _Engine = _veh getHitPointDamage "HitEngine";
        _Fuel = _veh getHitPointDamage "HitFuel";

        if(_w1 != 0) then {
            _total = _total + (_w1 * 500);
        };
        if(_w2 != 0) then {
            _total = _total + (_w2 * 500);
        };
        if(_w3 != 0) then {
            _total = _total + (_w3 * 500);
        };
        if(_w4 != 0) then {
            _total = _total + (_w4 * 500);
        };
        if(_body != 0) then {
            _total = _total + (_body * 1000);
        };
        if(_Engine != 0) then {
            _total = _total + (_Engine * 1000);
        };
        if(_Fuel != 0) then {
            _total = _total + (_Fuel * 1000);
        };

        if (_body != 0) then {
            
            ["VehicleRepair",["Réparation carrosserie", "textures\icones\vehicles\veh-hunt-hull.paa"]] call bis_fnc_showNotification;
            
            sleep (_body * 6.5);
            _veh setHitPointDamage ["HitBody",0];
            _veh setHitPointDamage ["HitGlass1",0];
            _veh setHitPointDamage ["HitGlass2",0];
            _veh setHitPointDamage ["HitGlass3",0];
            _veh setHitPointDamage ["HitGlass4",0];
            _veh setHitPointDamage ["HitGlass5",0];
            _veh setHitPointDamage ["HitLGlass",0];
            _veh setHitPointDamage ["HitRGlass",0];
            _workwasdone = True;
        };
        
        if(_Engine != 0) then {
            
            ["VehicleRepair",["Réparation Moteur", "textures\icones\vehicles\veh-hunt-eng.paa"]] call bis_fnc_showNotification;
            
            sleep (_Engine * 6);
            _veh setHitPointDamage ["HitEngine",0];
            _workwasdone = True;
        };
        
        if(_fuel != 0) then {
            
            ["VehicleRepair",["Réparation Gasoil", "textures\icones\vehicles\veh-hunt-fuel.paa"]] call bis_fnc_showNotification;
            
            sleep (_Fuel * 5);
            _veh setHitPointDamage ["HitFuel",0];
            _workwasdone = True;
        };
        
        if((_w1 != 0) || (_w2 != 0) || (_w3 != 0) || (_w4 != 0)) then
        {
            ["VehicleRepair",["Réparation Roues", "textures\icones\vehicles\veh-hunt-wheels.paa"]] call bis_fnc_showNotification;
            
            sleep (_w1 * 5);
            _veh setHitPointDamage ["HitLBWheel",0];
            sleep (_w2 * 5);
            _veh setHitPointDamage ["HitLFWheel",0];
            sleep (_w3 * 5);
            _veh setHitPointDamage ["HitRBWheel",0];
            sleep (_w4 * 5);
            _veh setHitPointDamage ["HitRFWheel",0];
            _veh setHitPointDamage ["HitLF2Wheel",0];
            _veh setHitPointDamage ["HitRF2Wheel",0];
            _veh setHitPointDamage ["HitRMWheel",0];
            _veh setHitPointDamage ["HitLMWheel",0];
            _workwasdone = True;
        };
        
        if(_workwasdone) then
        {
            hint "Polir votre voiture";
            sleep 2;
            _mymon = player getVariable "mon_argent_banque_by_sfp_maxou";
            player setVariable["mon_argent_banque_by_sfp_maxou",( _mymon - (round _total)),true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
            Hint format ["Le prix du service est %1 %2. Vous avez maintenant %1 %3","€",(round _total),(player getVariable "mon_argent_banque_by_sfp_maxou") call retour_formatage_chiffre_sfp];
            _veh setfuel _vefuel;
			sleep 2;
			_veh setfuel _vefuel;
        }
        else
        {
            hint "Après un contrôle appronfondi, votre véhicule n'a pas besoin d'être réparé.";
            _veh setfuel _vefuel;
			sleep 2;
			_veh setfuel _vefuel;
        };
    }
    else
    {
        hint "Vous devez avoir 5000 Euros ou plus sur votre compte bancaire pour s'assurer que vous pouvez couvrir le coût du service";
    };
}
else
{
    hint "Vous devez être dans un véhicule terrestre pour reparer !";
};

