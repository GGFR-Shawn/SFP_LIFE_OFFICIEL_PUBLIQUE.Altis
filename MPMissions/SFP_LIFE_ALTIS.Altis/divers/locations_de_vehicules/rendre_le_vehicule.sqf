//By Maxou http://www.sfpteam.fr/ - INTERDICTION DE RECOPIER !!//
//Poursuite pénale possible ! Voir http://amar.arma3.fr/ !

if (jaireserverunevoiture == 1) then
{
	Hint "Pour rendre ton véhicule à la ALTIS LOCATION, il te suffit de pointer ta souris sur le véhicule qui t'a été loué !";
	
	waituntil {((typeOf cursortarget == "C_Quadbike_01_F_Location") or (typeOf cursortarget == "C_SUV_01_Location_Maxou"))};
	
	_levehiculedelocation = cursortarget;
	
	if (((_levehiculedelocation getvariable 'vehicule_info_parvariable') select 0) == 'Altis location\nVéhicule de location\n Véhicule SANS PERMIS') then
	{
		hint "Le véhicule de location à bien été rendu, merci de votre confiance !";
		jairendulavoituredelocation = 1;
		jaireserverunevoiture = 0;
		
		sleep 2;
		
		deletevehicle _levehiculedelocation;
	};
}else
{
	hint "Désolé, tu n'as pas encore loué de voiture pour le moment.";
};
