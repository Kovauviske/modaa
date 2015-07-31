/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	case "life_inv_oilu": {"Petroleo"};
	case "life_inv_oilp": {"Euro-Diesel"};
	case "life_inv_heroinu": {"Heroína não processada"};
	case "life_inv_heroinp": {"Heroína processada"};
	case "life_inv_cannabis": {"Maconha não processada"};
	case "life_inv_marijuana": {"Maconha"};
	case "life_inv_apple": {"Maçã"};
	case "life_inv_rabbit": {"Carne de Coelho"};
	case "life_inv_salema": {"Sardinha"};
	case "life_inv_ornate": {"Vermelho"};
	case "life_inv_mackerel": {"File de pescada"};
	case "life_inv_tuna": {"Atum"};
	case "life_inv_mullet": {"Bacalhau"};
	case "life_inv_catshark": {"Peixe"};
	case "life_inv_turtle": {"Carne de tartaruga"};
	case "life_inv_fishingpoles": {"Angel"};
	case "life_inv_water": {"Garrafa de Agua"};
	case "life_inv_coffee": {"Cafe"};
	case "life_inv_turtlesoup": {"Sopa de Tartaruga"};
	case "life_inv_donuts": {"Donuts"};
	case "life_inv_fuelE": {"Galão de Gasolina(Vazio)"};
	case "life_inv_fuelF": {"Gasolina"};
	case "life_inv_pickaxe": {"Picareta"};
	case "life_inv_copperore": {"Cobre"};
	case "life_inv_ironore": {"Minério De Ferro"};
	case "life_inv_ironr": {"Barra De Ferro"};
	case "life_inv_copperr": {"Barras de cobre"};
	case "life_inv_sand": {"Areia"};
	case "life_inv_salt": {"Bloco de Sal"};
	case "life_inv_saltr": {"Sal refinado"};
	case "life_inv_glass": {"Vidro"};
	case "life_inv_diamond": {"Diamante Bruto"};
	case "life_inv_diamondr": {"Diamante lapidado"};
	case "life_inv_tbacon": {"Toisin"};
	case "life_inv_redgull": {"RedBull"};
	case "life_inv_lockpick": {"Chave Mestra"};
	case "life_inv_peach": {"Pêssego"};
	case "life_inv_coke": {"Cocaina não processada"};
	case "life_inv_cokep": {"Cocaina em pó"};
	case "life_inv_spikeStrip": {"Barra de pregos"};
	case "life_inv_rock": {"Pedra"};
	case "life_inv_cement": {"Saco de cimento"};
	case "life_inv_goldbar": {"Barra de ouro"};
	case "life_inv_wine": {"Vinho"};
	case "life_inv_grapes": {"Uvas"};
	case "life_inv_methu": {"Metanfetamina sem processo"};
	case "life_inv_methp": {"Metanfetamina Pura"};
	case "life_inv_storage1": {"Caixa Pequena)"};
	case "life_inv_storage2": {"Caixa Grande"};
	case "life_inv_battery": {"Bateria de Telefone"};
	case "life_inv_blastingcharge": {"Explosivos C4"};
	case "life_inv_boltcutter": {"Alicate"};
	case "life_inv_defusekit": {"Anti-C4"};
	case "life_inv_painkillers": {"Analgésico"};
	case "life_inv_morphium": {"Morfina"};
	case "life_inv_zipties": {"Algema"};
	case "life_inv_storagesmall": {"Pequena caixa de armazenamento"};
	case "life_inv_storagebig": {"Grande Caixa de armazenamento"};
	case "life_inv_mauer": {"Barra de Britz"};
	case "life_inv_mash": {"Grão triturado"};
	case "life_inv_yeast": {"Fermento"};
	case "life_inv_rye": {"Centeio"};
	case "life_inv_hops": {"Cordas"};
	case "life_inv_whiskey": {"Garraga de RedLabel"};
	case "life_inv_beerp": {"Caixa de Itaipava"};
	case "life_inv_bottles": {"Garrafas de vidro"};
	case "life_inv_cornmeal": {"Maizena"};
	case "life_inv_bottledwhiskey": {"Redlabel"};
	case "life_inv_bottledbeer": {"Itaipava"};
	case "life_inv_bottledshine": {"Garraga de Licor"};
	case "life_inv_moonshine": {"Licor"};
	case "life_inv_puranium": {"Mistura de urânio"}; // Add This
    case "life_inv_ipuranium": {"Produto de Urânio III"}; // Add This
    case "life_inv_uranium1": {"Urânio Primario"}; // Add This
    case "life_inv_uranium2": {"Urânio Bruto"}; // Add This
    case "life_inv_uranium3": {"Urânio purificado"}; // Add This
    case "life_inv_uranium4": {"Urânio Concentrado"}; // Add This
    case "life_inv_uranium": {"Urânio"}; // Add This
	case "life_inv_kidney": {"Rim"};
	case "life_inv_scalpel": {"Bisturi"};

	//License Block
	case "license_civ_driver": {"Carteira de motorista"};
	case "license_civ_air": {"Licença de piloto"};
	case "license_civ_heroin": {"Traficante de Heroina"};
	case "license_civ_gang": {"Licença de Gangue"};
	case "license_civ_oil": {"Licença Petrobras"};
	case "license_civ_dive": {"Licença para Mergulho"};
	case "license_civ_boat": {"Licença para Barco"};
	case "license_civ_gun": {"Licença de Porte de Arma"};
	case "license_cop_air": {"Licença de piloto"};
	case "license_cop_swat": {"Treinamento para BOPE"};
	case "license_cop_cg": {"Treinamento de Guarda Costeira"};
	case "license_civ_rebel": {"Treinamento Rebelde"};
	case "license_civ_truck": {"Lincença de Caminhão"};
	case "license_civ_diamond": {"Lincença para Diamantes"};
	case "license_civ_copper": {"Processamento de cobre"};
	case "license_civ_iron": {"Licença de Ferro"};
	case "license_civ_sand": {"Licença de Areia"};
	case "license_civ_salt": {"Licença de Sal"};
	case "license_civ_coke": {"Traficante de Cocaina"};
	case "license_civ_marijuana": {"Traficante de Maconha"};
	case "license_civ_cement": {"Licença de Cimento POTY"};
	case "license_civ_meth": {"Traficante de Metanfetamina"};
	case "license_civ_grapes": {"Licença de Vinho"};
	case "license_civ_moonshine": {"Processamento de Tequila"};
	case "license_civ_meth": {"Licença para Metanfetamina"};
	case "license_med_air": {"Licença Ambulancia Aeria"};
	case "license_civ_home": {"Licença de Casa"};
	case "license_med_adac": {"Licença de Cirugião"};
	case "license_civ_stiller": {"Licença de destilador"};
	case "license_civ_liquor": {"Licença de bebidas"};
	case "license_civ_bottler": {"Licença de engarrafamento"};
	case "license_civ_uranium": {"Licença de Urânio"};
};
