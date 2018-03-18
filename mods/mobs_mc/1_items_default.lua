--MCmobs v0.5
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")
--THIS IS THE MASTER ITEM LIST TO USE WITH DEFAULT

-- intllib
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

local c = mobs_mc.is_item_variable_overridden

-- Chicken
if c("chicken_raw") then
	minetest.register_craftitem("mobs_mc:chicken_raw", {
		description = S("Raw Chicken"),
		_doc_items_longdesc = S("Raw chicken is a food item and can be eaten safely. Cooking it will increase its nutritional value."),
		inventory_image = "mcl_mobitems_chicken_raw.png",
		groups = { food = 2, eatable = 2 },
		on_use = minetest.item_eat(2),
	})
end

if c("chicken_cooked") then
	minetest.register_craftitem("mobs_mc:chicken_cooked", {
		description = S("Cooked Chicken"),
		_doc_items_longdesc = S("A cooked chicken is a healthy food item which can be eaten."),
		inventory_image = "mcl_mobitems_chicken_cooked.png",
		groups = { food = 2, eatable = 6 },
		on_use = minetest.item_eat(6),
	})
end

if c("chicken_raw") and c("chicken_cooked") then
	minetest.register_craft({
		type = "cooking",
		output = "mobs_mc:chicken_cooked",
		recipe = "mobs_mc:chicken_raw",
		cooktime = 5,
	})
end

if c("feather") then
	minetest.register_craftitem("mobs_mc:feather", {
		description = S("Feather"),
		_doc_items_longdesc = S("Feathers are used in crafting and are dropped from chickens."),
		inventory_image = "mcl_mobitems_feather.png",
	})
end

-- Cow
if c("beef_raw") then
	minetest.register_craftitem("mobs_mc:beef_raw", {
		description = S("Raw Beef"),
		_doc_items_longdesc = S("Raw beef is the flesh from cows and can be eaten safely. Cooking it will greatly increase its nutritional value."),
		inventory_image = "mcl_mobitems_beef_raw.png",
		groups = { food = 2, eatable = 3 },
		on_use = minetest.item_eat(3),
	})
end

if c("beef_cooked") then
	minetest.register_craftitem("mobs_mc:beef_cooked", {
		description = S("Steak"),
		_doc_items_longdesc = S("Steak is cooked beef from cows and can be eaten."),
		inventory_image = "mcl_mobitems_beef_cooked.png",
		groups = { food = 2, eatable = 8 },
		on_use = minetest.item_eat(8),
	})
end

if c("beef_raw") and c("beef_cooked") then
	minetest.register_craft({
		type = "cooking",
		output = "mobs_mc:beef_cooked",
		recipe = "mobs_mc:beef_raw",
		cooktime = 5,
	})
end


if c("milk") then
	-- milk
	minetest.register_craftitem("mobs_mc:milk_bucket", {
		description = S("Milk"),
		_doc_items_longdesc = S("Milk is a food item obtained by using a bucket on a cow."),
		inventory_image = "mobs_bucket_milk.png",
		groups = { food = 3, eatable = 1 },
		on_use = minetest.item_eat(1, "bucket:bucket_empty"),
		stack_max = 1,
	})
end

if c("mushroom_stew") then
	minetest.register_craftitem("mobs_mc:mushroom_stew", {
		description = S("Mushroom Stew"),
		_doc_items_longdesc = S("Mushroom stew is a healthy soup."),
		inventory_image = "farming_mushroom_stew.png",
		groups = { food = 3, eatable = 6 },
		on_use = minetest.item_eat(6, "mobs_mc:bowl"),
		stack_max = 1,
	})
end

-- Saddle
if c("saddle") then
	-- Overwrite the saddle from Mobs Redo
	minetest.register_craftitem(":mobs:saddle", {
		description = S("Saddle"),
		_doc_items_longdesc = S("Saddles can be put on horses, donkeys, mules and pigs in order to mount them."),
		_doc_items_usagehelp = S("Rightclick an animal while holding a saddle to put on the saddle. You can now mount the animal by rightclicking it again."),
		inventory_image = "mcl_mobitems_saddle.png",
		stack_max = 1,
	})
end

if c("saddle") and c("lether") and c("string") and c("iron_ingot") then
	minetest.register_craft({
		output = "mobs_mc:saddle",
		recipe = {
			{"mobs:leather", "mobs:leather", "mobs:leather"},
			{"farming:string", "", "farming:string"},
			{"default:steel_ingot", "", "default:steel_ingot"}
		},
	})
end

-- Horse Armor
local horse_armor_use = S("Rightclick a horse to put on the horse armor. Donkeys and mules can't wear horse armor.")
-- TODO: Balance the horse armor strength, compare with MC armor strength
if c("iron_horse_armor") then
	minetest.register_craftitem("mobs_mc:iron_horse_armor", {
		description = S("Iron Horse Armor"),
		_doc_items_longdesc = S("Iron horse armor can be worn by horses to increase their protection from harm a bit."),
		_doc_items_usagehelp = horse_armor_use,
		inventory_image = "mobs_mc_iron_horse_armor.png",
		_horse_overlay_image = "mobs_mc_horse_armor_iron.png",
		stack_max = 1,
		groups = { horse_armor = 85 },
	})
end
if c("gold_horse_armor") then
	minetest.register_craftitem("mobs_mc:gold_horse_armor", {
		description = S("Golden Horse Armor"),
		_doc_items_longdesc = S("Golden horse armor can be worn by horses to increase their protection from harm."),
		_doc_items_usagehelp = horse_armor_use,
		inventory_image = "mobs_mc_gold_horse_armor.png",
		_horse_overlay_image = "mobs_mc_horse_armor_gold.png",
		stack_max = 1,
		groups = { horse_armor = 60 },
	})
end
if c("diamond_horse_armor") then
	minetest.register_craftitem("mobs_mc:diamond_horse_armor", {
		description = S("Diamond Horse Armor"),
		_doc_items_longdesc = S("Diamond horse armor can be worn by horses to greatly increase their protection from harm."),
		_doc_items_usagehelp = horse_armor_use,
		inventory_image = "mobs_mc_diamond_horse_armor.png",
		_horse_overlay_image = "mobs_mc_horse_armor_diamond.png",
		stack_max = 1,
		groups = { horse_armor = 45 },
	})
end

-- Pig
if c("porkchop_raw") then
	minetest.register_craftitem("mobs_mc:porkchop_raw", {
		description = S("Raw Porkchop"),
		_doc_items_longdesc = S("A raw porkchop is the flesh from a pig and can be eaten safely. Cooking it will greatly increase its nutritional value."),
		inventory_image = "mcl_mobitems_porkchop_raw.png",
		groups = { food = 2, eatable = 3 },
		on_use = minetest.item_eat(3),
	})
end

if c("porkchop_cooked") then
	minetest.register_craftitem("mobs_mc:porkchop_cooked", {
		description = S("Cooked Porkchop"),
		_doc_items_longdesc = "Cooked porkchop is the cooked flesh of a pig and is used as food.",
		inventory_image = "mcl_mobitems_porkchop_cooked.png",
		groups = { food = 2, eatable = 8 },
		on_use = minetest.item_eat(8),
	})
end

if c("porkchop_raw") and c("porkchop_cooked") then
	minetest.register_craft({
		type = "cooking",
		output = "mobs_mc:porkchop_cooked",
		recipe = "mobs_mc:porkchop_raw",
		cooktime = 5,
	})
end

if c("carrot_on_a_stick") then
	minetest.register_tool("mobs_mc:carrot_on_a_stick", {
		description = S("Carrot on a Stick"),
		_doc_items_longdesc = S("A carrot on a stick can be used on saddled pigs to ride them. Pigs will also follow anyone who holds a carrot on a stick near them."),
		_doc_items_usagehelp = S("Rightclick a saddled pig with the carrot on a stick to mount it. You can now ride it like a horse."),
		wield_image = "mcl_mobitems_carrot_on_a_stick.png",
		inventory_image = "mcl_mobitems_carrot_on_a_stick.png",
		sounds = { breaks = "default_tool_breaks" },
	})
end

-- Poor-man's recipes for carrot on a stick
if c("carrot_on_a_stick") and c("stick") and c("string") and minetest.get_modpath("farming") then
	minetest.register_craft({
		output = "mobs_mc:carrot_on_a_stick",
		recipe = {
			{"",            "",            "farming:string"    },
			{"",            "group:stick", "farming:string" },
			{"group:stick", "",            "farming:bread" },
		}
	})

-- FIXME: Identify correct farming mod (check if it includes the carrot item)
	minetest.register_craft({
		output = "mobs_mc:carrot_on_a_stick",
		recipe = {
			{"",            "",            "farming:string"    },
			{"",            "group:stick", "farming:string" },
			{"group:stick", "",            "farming:carrot" },
		}
	})
end

if c("carrot_on_a_stick") and c("stick") and c("string") and minetest.get_modpath("fishing") and minetest.get_modpath("farming") then
	minetest.register_craft({
		type = "shapeless",
		output = "mobs_mc:carrot_on_a_stick",
		recipe = {"fishing:pole_wood", "farming:carrot"},
	})
end

-- Rabbit
if c("rabbit_raw") then
	minetest.register_craftitem("mobs_mc:rabbit_raw", {
		description = S("Raw Rabbit"),
		_doc_items_longdesc = S("Raw rabbit is a food item from a dead rabbit. It can be eaten safely. Cooking it will increase its nutritional value."),
		inventory_image = "mcl_mobitems_rabbit_raw.png",
		groups = { food = 2, eatable = 3 },
		on_use = minetest.item_eat(3),
	})
end

if c("rabbit_cooked") then
	minetest.register_craftitem("mobs_mc:rabbit_cooked", {
		description = S("Cooked Rabbit"),
		_doc_items_longdesc = S("This is a food item which can be eaten."),
		inventory_image = "mcl_mobitems_rabbit_cooked.png",
		groups = { food = 2, eatable = 5 },
		on_use = minetest.item_eat(5),
	})
end

if c("rabbit_raw") and c("rabbit_cooked") then
	minetest.register_craft({
		type = "cooking",
		output = "mobs_mc:rabbit_cooked",
		recipe = "mobs_mc:rabbit_raw",
		cooktime = 5,
	})
end

if c("rabbit_hide") then
	minetest.register_craftitem("mobs_mc:rabbit_hide", {
		description = S("Rabbit Hide"),
		_doc_items_longdesc = S("Rabbit hide is used to create leather."),
		inventory_image = "mcl_mobitems_rabbit_hide.png"
	})
end

if c("leather") and c("rabbit_hide") then
	minetest.register_craft({
		output = "mobs:leather",
		recipe = {
			{ "mobs_mc:rabbit_hide", "mobs_mc:rabbit_hide" },
			{ "mobs_mc:rabbit_hide", "mobs_mc:rabbit_hide" },
		}
	})
end

if c("rabbit_foot") then
	minetest.register_craftitem("mobs_mc:rabbit_foot", {
		description = S("Rabbit's Foot"),
		_doc_items_longdesc = S("This item is used in brewing."),
		inventory_image = "mcl_mobitems_rabbit_foot.png"
	})
end

-- Sheep
if c("mutton_raw") then
	minetest.register_craftitem("mobs_mc:mutton_raw", {
		description = S("Raw Mutton"),
		_doc_items_longdesc = S("Raw mutton is the flesh from a sheep and can be eaten safely. Cooking it will greatly increase its nutritional value."),
		inventory_image = "mcl_mobitems_mutton_raw.png",
		groups = { food = 2, eatable = 4 },
		on_use = minetest.item_eat(4),
	})
end

if c("mutton_cooked") then
	minetest.register_craftitem("mobs_mc:mutton_cooked", {
		description = S("Cooked Mutton"),
		_doc_items_longdesc = S("Cooked mutton is the cooked flesh from a sheep and is used as food."),
		inventory_image = "mcl_mobitems_mutton_cooked.png",
		groups = { food = 2, eatable = 8 },
		on_use = minetest.item_eat(8),
	})
end

if c("mutton_raw") and c("mutton_cooked") then
	minetest.register_craft({
		type = "cooking",
		output = "mobs_mc:mutton_cooked",
		recipe = "mobs_mc:mutton_raw",
		cooktime = 5,
	})
end

-- Slime
if c("slimeball") then
	minetest.register_craftitem("mobs_mc:slimeball", {
		description = S("Slimeball"),
		_doc_items_longdesc = S("Slimeballs are used in crafting. They are dropped from slimes."),
		inventory_image = "mcl_mobitems_slimeball.png"
	})
	if minetest.get_modpath("mesecons_materials") then
		minetest.register_craft({
			output = "mesecons_materials:glue",
			recipe = {{ "mobs_mc:slimeball" }},
		})
	end
end

-- Spider
if c("spider_eye") then
	minetest.register_craftitem("mobs_mc:spider_eye", {
		description = S("Spider Eye"),
		_doc_items_longdesc = S("Spider eyes are used mainly in crafting and brewing. Spider eyes can be eaten, but they poison you and reduce your health by 2 hit points."),
		inventory_image = "mcl_mobitems_spider_eye.png",
		wield_image = "mcl_mobitems_spider_eye.png",
		-- Simplified poisonous food
		groups = { food = 2, eatable = -2 },
		on_use = minetest.item_eat(-2),
	})
end

-- Misc.
if c("snowball") and minetest.get_modpath("default") then
	minetest.register_craft({
		output = "mobs_mc:snowball 2",
		recipe = {
			{"default:snow"},
		},
	})
	minetest.register_craft({
		output = "default:snow 2",
		recipe = {
			{"mobs_mc:snowball", "mobs_mc:snowball"},
			{"mobs_mc:snowball", "mobs_mc:snowball"},
		},
	})
	-- Change the appearance of default snow to avoid confusion with snowball
	minetest.override_item("default:snow", {
		inventory_image = "",
		wield_image = "",
	})
end

if c("bone") then
	minetest.register_craftitem("mobs_mc:bone", {
		description = S("Bone"),
		_doc_items_longdesc = S("Bones can be used to tame wolves so they will protect you. They are also useful as a crafting ingredient."),
		_doc_items_usagehelp = S("Hold the bone in your hand near wolves to attract them. Rightclick the wolf to give it a bone and tame it."),
		inventory_image = "mcl_mobitems_bone.png"
	})
	if minetest.get_modpath("bones") then
		minetest.register_craft({
			output = "mobs_mc:bone 3",
			recipe = {{ "bones:bones" }},
		})
	end
end
