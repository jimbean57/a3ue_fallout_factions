#include "script_component.hpp"

class CfgPatches 
{
    class ADDON 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QDOUBLES(PREFIX,core)};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class A3A 
{
    #include "Templates.hpp"
    #include "CfgLogistics.hpp" //this should be at the end of the config.cpp as it will redefine the macro ADDON
};

class Fallout_BoS_Icon
    {
        name = "Brotherhood of Steel";
        icon = QPATHTOFOLDER(Templates\Fallout\bos_icon.paa);
        size = 1.0;
        color[] = {1, 1, 1, 1};
        shadow = 0;
    };

class Fallout_NCR_Icon
    {
        name = "New California Republic";
        icon = QPATHTOFOLDER(Templates\Fallout\ncr_icon.paa);
        size = 1.0;
        color[] = {1, 1, 1, 1};
        shadow = 0;
    };

#include "CfgMarkers.hpp"