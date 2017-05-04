_vehicle = _this select 0;


_vehicle setVariable["BIS_randomSeed1",6,true];

_vehicle animate ["HideServices", 0];
_vehicle animate ["HideBackpacks", 0];
_vehicle animate ["HideBumper2", 0];
_vehicle animate ["HideConstruction", 0];
_vehicle animate ["HideDoor1", 0];
_vehicle animate ["HideDoor2", 0];
_vehicle animate ["HideDoor3", 1];
_vehicle animate ["BeaconsStart", 1];

_vehicle setObjectTextureGlobal [0, "textures\voiture_depanneuse.jpg"];




