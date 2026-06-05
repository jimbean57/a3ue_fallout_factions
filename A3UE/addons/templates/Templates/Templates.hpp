class Templates 
{
    /*
        aight so a "Class" just be holdin stuff. by itself it don't DO nothing.
        antistasi scripts gon come thru and grab all the classes from the configs.
        like say we got a function that grab all factions and show they name —
        these classes just sittin there as storage, key-value pairs n all that.
    */
    class Vanilla_Base;
    /*
        Vanilla_Base is a class up in the main Antistasi Ultimate mod. it got
        values for factions and whatnot already.
        class inheritance is lowkey real useful — you ain't gotta redefine
        every single value in every class. peep the wiki if u ain't up on it.
    */

    class Fallout_BoS : Vanilla_Base
    {
        basepath = QPATHTOFOLDER(Templates\Fallout); // where we keepin our stuff at
        side = "Inv"; // they occupyin fr
        flagTexture = QPATHTOFOLDER(Templates\Fallout\flag_bos_co.paa); // slap the flag on it
        name = "Brotherhood of Steel"; // what show up in the menu
        file = "BOS"; // the .sqf finna get added automatic
        maps[] = {}; // ain't prioritized on no specific map
        climate[] = {}; // where they comfortable at
        description = "Brothahood of STEAL type shit.";
    };

    class Fallout_NCR : Vanilla_Base
    {
        basepath = QPATHTOFOLDER(Templates\Fallout);
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Fallout\flag_ncr_co.paa);
        name = "New California Republic";
        file = "NCR";
        maps[] = {};
        climate[] = {};
        description = "Even after a nuclear war California is still a statist shithole.";
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