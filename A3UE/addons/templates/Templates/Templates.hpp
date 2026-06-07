class Templates 
{
    /*
 
    */
    class Vanilla_Base;
    /*

    */

class Fallout_BoS : Vanilla_Base
{
    basepath = QPATHTOFOLDER(Templates\Fallout);
    side = "Inv";
    flagTexture = QPATHTOFOLDER(Templates\Fallout\bos_flag.paa);
    name = "Brotherhood of Steel";
    file = "BOS";
    maps[] = {};
    climate[] = {};
    description = "Brothahood of STEAL type shit.";
    markerIcon = "Fallout_BoS_Icon"; // <-- THIS is what setMarkerType receives
};

class Fallout_NCR : Vanilla_Base
{
    basepath = QPATHTOFOLDER(Templates\Fallout);
    side = "Occ";
    flagTexture = QPATHTOFOLDER(Templates\Fallout\ncr_flag.paa);
    name = "New California Republic";
    file = "NCR";
    maps[] = {};
    climate[] = {};
    description = "Even after a nuclear war California is still a statist shithole.";
    markerIcon = "Fallout_NCR_Icon"; // <-- THIS is what setMarkerType receives
};

    class Fallout_Legion : Vanilla_Base
    {
        basepath = QPATHTOFOLDER(Templates\Fallout);
        side = "Reb";
        flagTexture = QPATHTOFOLDER(Templates\Fallout\flag_legion_co.paa);
        name = "Caesar's Legion";
        file = "LEG";
        maps[] = {};
        climate[] = {}; // they a desert type fr fr
        description = "Erm.... based?";
    };
    class Fallout_Civilians : Vanilla_Base
    {
        basepath = QPATHTOFOLDER(Templates\Fallout);
        side = "Civ";
        flagTexture = QPATHTOFOLDER(Templates\Fallout\flag_legion_co.paa);
        name = "Couriers";
        file = "NVCIV";
        maps[] = {};
        climate[] = {}; // they a desert type fr fr
        description = "Benny is gonna get it.";
    };

/*
TODO
    class Fallout_Raiders : Vanilla_Base
    {
        basepath = QPATHTOFOLDER(Templates\Fallout);
        side = "Riv"; // rivals — they beef wit everybody
        flagTexture = QPATHTOFOLDER(Templates\Fallout\flag_raiders_co.paa);
        name = "Raiders";
        file = "fallout_raiders";
        maps[] = {};
        climate[] = {"arid", "temperate", "tropical"}; // they everywhere, no cap
        description = "Raiders wildin out across the whole wasteland. watch out.";
    };
*/

};
/*
    climates you can use: {"arid", "arctic", "temperate", "tropical"}
    pick what fits ur vibe
*/