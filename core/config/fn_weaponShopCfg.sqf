#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for the weapon shops.

	Return:
	String: Close the menu
	Array:
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop ==nil) exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Você não é um policial"};
			default
			{
				["Loja de Recruta",
					[
						["Rangefinder",nil,1000],
						["arifle_sdar_F","Taser Rifle",30000],
						["hgun_Rook40_F","Taser Pistola",15000],
						["hgun_Rook40_snds_F","Taser Pistola Silenciador",100],
						["16Rnd_9x21_Mag","16 Magazin",100],
						["20Rnd_556x45_UW_mag","556 Magazin",100]
					]
				];
			};
		};
	};

	case "cop_visier":
	{
		switch(true) do
		{
			case (playerSide != west): {"Você não é um policial!"};
			case (__GETC__(life_coplevel) < 1): {"Sua patente é inferior, você não tem acesso a loja!"};
			default
			{
				["Altis Visiere & Sonstiges",
					[
						["ItemMap",nil,10],
						["ItemWatch",nil,10],
						["ItemCompass",nil,10],
						["ItemGPS",nil,10],
						["ToolKit",nil,10],
						["Medikit",nil,10],
						["NVGoggles_OPFOR",nil,10],
						["Chemlight_red",nil,10],
						["Chemlight_yellow",nil,10],
						["Chemlight_green",nil,10],
						["Chemlight_blue",nil,10],
						["acc_flashlight",nil,10],
						["acc_pointer_IR",nil,10],
						["B_UavTerminal",nil,10],
						["Rangefinder",nil,10],
						["optic_Holosight",nil,10],
						["optic_ACO_smg",nil,10],
						["optic_MRCO",nil,10],
						["optic_LRPS",nil,10],
						["optic_DMS",nil,10],
						["optic_NVS",nil,10],
						["optic_Arco",nil,10],
						["muzzle_snds_L",nil,10],
						["muzzle_snds_M",nil,10],
						["muzzle_snds_H",nil,10]
					]
				];
			};
		};
	};

	case "adac_basic":
	{
		switch (true) do
		{
			case (playerSide != independent): {"Você não é um cirugião"};
			case (__GETC__(life_mediclevel) < 2): {"Você só pode acessar essa loja se for um cirugião !"};
			default {
				["ADAC Shop",
					[
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ToolKit",nil,10],
						["FirstAidKit",nil,10],
						["Medikit",nil,10],
						["NVGoggles",nil,10],
						["Chemlight_red",nil,20],
						["Chemlight_yellow",nil,20],
						["Chemlight_green",nil,20],
						["Chemlight_blue",nil,20]
					]
				];
			};
		};
	};

	case "med_basic":
	{
		switch (true) do
		{
			case (playerSide != independent): {"Você não é medico"};
			case (__GETC__(life_mediclevel) < 1): {"Você só pode acessar essa loja se for um médico."};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ToolKit",nil,10],
						["FirstAidKit",nil,10],
						["Medikit",nil,10],
						["NVGoggles",nil,10],
						["Chemlight_red",nil,20],
						["Chemlight_yellow",nil,20],
						["Chemlight_green",nil,20],
						["Chemlight_blue",nil,20]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Você não é um policial"};
			case (__GETC__(life_coplevel) < 2): {"Você não é um cabo"};
			default
			{
				["Loja de Cabo",
					[
						["Rangefinder",nil,1000],
						["arifle_sdar_F","Taser Rifle",30000],
						["hgun_Rook40_F","Taser Pistola",15000],
						["arifle_MX_F",nil,65000],
						["hgun_Rook40_snds_F","Taser Pistola Silenciador",100],
						["16Rnd_9x21_Mag","16 Magazin",100],
						["20Rnd_556x45_UW_mag","556 Magazin",100],
						["30Rnd_65x39_caseless_mag",nil,130],
						["optic_Arco",nil,2500]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Você não é um policial"};
			case (__GETC__(life_coplevel) < 3): {"Você não é sargento"};
			default
			{
				["Loja de Sargento",
					[
						["SMG_02_ACO_F",nil,15000],
						["hgun_ACPC2_F",nil,17500],
						["HandGrenade_Stone", "Flashbang",15000],
						["arifle_MXC_F",nil,30000],
						["arifle_MX_Black_Hamr_pointer_F",nil,50000],
						["optic_Arco",nil,2500],
						["optic_Lrps",nil,2500],
						["optic_SOS",nil,2500],
						["optic_MRCO",nil,2500],
						["optic_NVS",nil,10000],
						["muzzle_snds_H",nil,2750],
						["30Rnd_65x39_caseless_mag",nil,100],
						["30Rnd_9x21_Mag",nil,60],
						["9Rnd_45ACP_Mag",nil,200]
					]
				];
			};
		};
	};

	case "cop_kommisar":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Você não é um policial"};
			case (__GETC__(life_coplevel) < 4): {"Você não é um Tenente"};
			default
			{
				["Loja de tenente",
					[
						["SMG_02_ACO_F",nil,10000],
						["hgun_ACPC2_F",nil,17500],
						["HandGrenade_Stone","Flashbang",1500],
						["arifle_MXC_F",nil,30000],
						["arifle_MX_Black_Hamr_pointer_F",nil,50000],
						["srifle_GM6_F",nil,600000],
						["srifle_DMR_05_blk_F",nil,400000],
						["optic_Arco",nil,2500],
						["optic_Lrps",nil,2500],
						["optic_SOS",nil,2500],
						["optic_MRCO",nil,2500],
						["optic_NVS",nil,10000],
						["muzzle_snds_H",nil,2750],
						["30Rnd_65x39_caseless_mag",nil,100],
						["30Rnd_9x21_Mag",nil,60],
						["5Rnd_127x108_Mag",nil,6000],
						["10Rnd_93x64_DMR_05_Mag",nil,5000],
						["9Rnd_45ACP_Mag",nil,200]
					]
				];
			};
		};
	};

	case "cop_sek":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Você não é um policial"};
			case (__GETC__(life_coplevel) < 5): {"Você não é um Major"};
			default
			{
				["Loja de major",
					[
						["SMG_02_ACO_F",nil,10000],
						["hgun_ACPC2_F",nil,17500],
						["HandGrenade_Stone","Flashbang",1000],
						["arifle_MXC_F",nil,30000],
						["arifle_MX_Black_Hamr_pointer_F",nil,50000],
						["srifle_GM6_F",nil,300000],
						["srifle_DMR_05_blk_F",nil,200000],
						["optic_Arco",nil,2500],
						["optic_Lrps",nil,2500],
						["optic_SOS",nil,2500],
						["optic_MRCO",nil,2500],
						["optic_NVS",nil,10000],
						["muzzle_snds_H",nil,2750],
						["30Rnd_65x39_caseless_mag",nil,100],
						["30Rnd_9x21_Mag",nil,60],
						["5Rnd_127x108_Mag",nil,6000],
						["10Rnd_93x64_DMR_05_Mag",nil,5000],
						["9Rnd_45ACP_Mag",nil,200]
					]
				];
			};
		};
	};

	case "cop_gsg":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Você não é um policial"};
			case (__GETC__(life_coplevel) < 6): {"Você não é um Caveira"};
			default
			{
				["Loja de general",
					[
						["SMG_02_ACO_F",nil,10000],
						["hgun_ACPC2_F",nil,17500],
						["HandGrenade_Stone","Flashbang",1000],
						["arifle_MXC_F",nil,30000],
						["arifle_MX_Black_Hamr_pointer_F",nil,50000],
						["srifle_GM6_F",nil,300000],
						["srifle_DMR_05_blk_F",nil,200000],
						["B_UavTerminal",nil,100000],
						["optic_Arco",nil,2500],
						["optic_Lrps",nil,2500],
						["optic_SOS",nil,2500],
						["optic_MRCO",nil,2500],
						["optic_NVS",nil,10000],
						["muzzle_snds_H",nil,2750],
						["30Rnd_65x39_caseless_mag",nil,100],
						["30Rnd_9x21_Mag",nil,60],
						["5Rnd_127x108_Mag",nil,6000],
						["10Rnd_93x64_DMR_05_Mag",nil,5000],
						["9Rnd_45ACP_Mag",nil,200]
					]
				];
			};
		};
	};

	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Você não é um policial"};
			case (!license_civ_rebel): {"Você precisa ter licença rebelde"};
			default
			{
				["Loja de armas rebeldes",
					[
						["optic_DMS",nil,40000],
			            ["arifle_TRG20_F",nil,25000],
						["arifle_Katiba_F",nil,30000],
						["arifle_Katiba_GL",nil,100000],
						["srifle_DMR_01_F",nil,50000],
						["arifle_SDAR_F",nil,20000],
						["srifle_EBR_F",nil,150000],
						["LMG_Zafir_F",nil,250000],
						["optic_Holosight",nil,1200],
						["srifle_LRR_F",nil,300000],
						["srifle_DMR_05_blk_F",nil,500000],
						["MMG_01_hex_F",nil,500000],
						["MiniGrenade",nil,20000],
						["Rangefinder",nil,10000],
						["SmokeShell",nil,2000],
						["SmokeShellRed",nil,2000],
						["SmokeShellGreen",nil,2000],
						["SmokeShellYellow",nil,2000],
						["SmokeShellPurple",nil,2000],
						["SmokeShellBlue",nil,2000],
						["SmokeShellOrange",nil,2000],
						["1Rnd_Smoke_Grenade_shell",nil,10000],
						["ToolKit",nil,5000],
						["NVGoggles",nil,1000],
						["FirstAidKit",nil,500],
						["optic_Arco",nil,2500],
						["optic_Lrps",nil,2500],
						["muzzle_snds_M",nil,1000],
						[" muzzle_snds_H",nil,1000],
						["muzzle_snds_B",nil,1000],
						["muzzle_snds_93mmg",nil,1000],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["acc_flashlight",nil,1000],
						["optic_Hamr",nil,7500],
						["30Rnd_9x21_Mag",nil,200],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["10Rnd_762x51_Mag",nil,500],
						["20Rnd_762x51_Mag",nil,1000],
						["150Rnd_762x54_Box",nil,5000],
						["7Rnd_408_Mag",nil,3000],
						["10Rnd_93x64_DMR_05_Mag",nil,5000],
						["150Rnd_93x64_Mag",nil,15000],
						["30Rnd_65x39_caseless_green",nil,275]
					]
				];
			};
		};
	};

	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Você não é um policial"};
			case (!license_civ_gun): {"Você não tem nenhuma licença de arma!"};
			default
			{
				["Loja de Arma",
					[
						["hgun_P07_F",nil,15000],
						["hgun_Pistol_heavy_02_F",nil,20000],
						["hgun_ACPC2_F",nil,17500],
						["hgun_PDW2000_F",nil,30000],
						["optic_ACO_grn_smg",nil,2500],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};

	case "donator":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"Você não é um doador!"};
			case (__GETC__(life_donator) == 1):
			{
				["Loja de doador",
					[
						["hgun_P07_F",nil,1250],
						["hgun_PDW2000_F",nil,6500],
						["hgun_ACPC2_F",nil,11500],
						["optic_ACO_grn_smg",nil,750],
						["hgun_pistol_heavy_01_F",nil,6000],
						["optic_MRCO",nil,10000],
						["ToolKit",nil,50],
						["NVGoggles",nil,350],
						["Rangefinder",nil,5000],
						["itemgps",nil,50],
						["FirstAidKit",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};

			case (__GETC__(life_donator) == 2):
			{
				["Loja de doador",
					[
						["hgun_P07_F",nil,500],
						["hgun_PDW2000_F",nil,6500],
						["hgun_pistol_heavy_01_F",nil,6000],
						["arifle_Mk20C_plain_F",nil,45000],
						["optic_ACO_grn_smg",nil,750],
						["optic_MRCO",nil,10000],
						["NVGoggles",nil,350],
						["ToolKit",nil,100],
						["itemGPS",nil,100],
						["FirstAidKit",nil,25],
						["Rangefinder",nil,5000],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["11Rnd_45ACP_Mag",nil,85],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
			};

			case (__GETC__(life_donator) == 3):
			{
				["Loja de mercenário",
					[
						["hgun_P07_F",nil,5000],
						["hgun_PDW2000_F",nil,10000],
						["arifle_TRG21_F",nil,250000],
						["arifle_Mk20C_F",nil,100000],
						["arifle_Mk20_F",nil,125000],
						["arifle_Mk20_GL_F",nil,150000],
						["srifle_DMR_01_F",nil,250000],
						["srifle_EBR_F",nil,225000],
						["arifle_Katiba_F",nil,25000],
						["hgun_pistol_heavy_01_F",nil,12500],
						["hgun_ACPC2_F",nil,13500],
						["optic_ACO_grn",nil,7500],
						["optic_MRCO",nil,10000],
						["optic_LRPS",nil,50000],
						["optic_DMS",nil,25000],
						["Rangefinder",nil,15000],
						["SmokeShellGreen",nil,2500],
						["1Rnd_SmokeGreen_Grenade_shell",nil,5000],
						["muzzle_snds_L",nil,5000],
						["muzzle_snds_acp",nil,10000],
						["muzzle_snds_M",nil,30000],
						["muzzle_snds_H",nil,20000],
						["NVGoggles_INDEP",nil,2500],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_65x39_caseless_green",nil,750],
						["10Rnd_762x51_Mag",nil,750],
						["20Rnd_762x51_Mag",nil,750],
						["30Rnd_9x21_Mag",nil,75],
						["11Rnd_45ACP_Mag",nil,85],
						["9Rnd_45ACP_Mag",nil,100],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
		    };
		};
	};

	case "genstore":
	{
		["Mercado geral",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ItemMap",nil,50],
				["ItemCompass",nil,50],
				["ItemWatch",nil,50],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,1500],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};

	case "uranium":
    {
        switch(true) do
        {
            case (playerSide != civilian): {"Você não é um civil"};
            case (!license_civ_uranium): {"Você precisa de uma licença de urânio"};
            default
            {
                ["Urânio Shop",
                    [
                        ["ToolKit",nil,200],
                        ["FirstAidKit",nil,100],
                        ["U_I_HeliPilotCoveralls","Terno anti-radiação",50000]
                    ]
                ];
            };
        };
    };
};
