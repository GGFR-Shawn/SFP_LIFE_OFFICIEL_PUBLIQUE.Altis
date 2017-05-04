// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_pnj = _this select 0;
if (isnull _le_pnj) exitwith {};

_le_pnj addAction ["Boire Un Cafe","menu\restaurantcafe.sqf",[], 10,false,true,"",""]; 
_le_pnj addAction ["Boire une boisson","menu\restauranteau.sqf",[], 10,false,true,"",""]; 
_le_pnj addAction ["Prendre un repas","menu\restaurantnourriture.sqf",[], 10,false,true,"",""];  

_le_pnj addAction ["Acheter RedBull (6 Euros)","divers\station_service\achat_divers_station_service\acheter_redbull_station_sercice.sqf",[], 10,false,true,"",""];  
_le_pnj addAction ["Acheter Barre De Céréale (2 Euros)","divers\station_service\achat_divers_station_service\acheter_cereales_station_service.sqf",[], 10,false,true,"",""];  
_le_pnj addAction ["Acheter Bouteille Eau (1 Euros)","divers\station_service\achat_divers_station_service\acheter_bouteille_eau_station_service.sqf",[], 10,false,true,"",""];  

_le_pnj addAction ["Ressource Nourriture Disponible De L'ile","hint format [""! SYSTEME DE VIE SFP ! \n ---------------------------------- \n\n L'île dispose actuellement de %1 jours de réserve de nourriture suivant le nombre de joueur présent ! \n\n Vends des produits au marché pour augmenter celui ci ! \n ------------------------------------------------ \n www.sfp-team.fr.nf \n By SFP Maxou"",patron_des_ressources_du_serveur]",[], 10,false,true,"",""];
