/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Mercado",["water","rabbit","apple","storagebig","storagesmall","bottledbeer","bottledwhiskey","redgull","battery","tbacon","lockpick","pickaxe","zipties","peach","boltcutter","blastingcharge"]]};
	case "rebel": {["Mercado Rebelde",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","blastingcharge"]]};
	case "gang": {["Mercado de Gangue", ["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","blastingcharge","boltcutter"]]};
	case "wongs": {["Central de comida",["turtlesoup","turtle","moonshine"]]};
	case "coffee": {["Cafe Club",["coffee","donuts"]]};
	case "heroin": {["Boca de fumo",["cocainep","heroinp","marijuana","methp"]]};
	case "fishmarket": {["Revendedor de Peixe",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Revendedor de Vidro",["glass"]]};
	case "iron": {["LOja Industrial",["iron_r","copper_r"]]};
	case "diamond": {["Revendedor de Diamante",["diamond","diamondc"]]};
	case "salt": {["Revendedor de Cimento",["salt_r"]]};
	case "cop": {["Loja de Itens Policial",["donuts","coffee","spikeStrip","mauer","battery","painkillers","redgull","defusekit"]]};
	case "cement": {["Revendedor de Cimento",["cement"]]};
	case "beer": {["Bar das Coleguinhas",["wine"]]};
	case "pharmacy": {["Drogaria",["painkillers","morphium","scalpel","kidney"]]};
	case "medic": {["Suprimentos médicos",["apple","donuts","coffee","battery","redgull","fuelF"]]};
	case "speakeasy": {["Itaipava Logistica",["bottledbeer","bottledwhiskey","bottledshine"]]};
	case "bar": {["Loja de Bebidas",["bottles","cornmeal"]]};
	case "uranium": {["Mercado de Urânio",["uranium","puranium"]]};
};