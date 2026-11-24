// Calorite gas mask, makes you fatter when you wear it.

/obj/item/clothing/mask/gas/fattening
	name = "drone mask"
	desc = "A mask that can be connected to an air supply. When seen from certain angles, an orange light is reflected by it."
	icon = 'modular_gs/icons/obj/clothing/fat_mask.dmi'
	worn_icon = 'modular_gs/icons/mob/mask.dmi'
	icon_state = "fat_mask"

/obj/item/clothing/mask/gas/fattening/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_MASK)
		START_PROCESSING(SSobj, src)

/obj/item/clothing/mask/gas/fattening/process(seconds_per_tick)
	if(QDELETED(src))
		STOP_PROCESSING(SSobj, src)
		return
	var/mob/living/carbon/wearer = loc
	if(!istype(wearer))
		STOP_PROCESSING(SSobj, src)
		return
	if(wearer.get_item_by_slot(ITEM_SLOT_MASK) != src)
		STOP_PROCESSING(SSobj, src)
		return
	wearer.adjust_fatness(2 * (seconds_per_tick), FATTENING_TYPE_ITEM)

/datum/crafting_recipe/fatgasmask
	name = "Drone Mask"
	result = /obj/item/clothing/mask/gas/fattening
	reqs = list(
		/obj/item/clothing/mask/gas = 1,
		/obj/item/stack/sheet/mineral/calorite = 1,
		)
	category = CAT_CLOTHING
