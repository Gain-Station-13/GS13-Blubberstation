// Calorite gas mask, makes you fatter when you wear it, technically can count as trapped?

/obj/item/clothing/mask/gas/fattening
	name = "drone mask"
	desc = "A mask that can be connected to an air supply. When seen from certain angles, an orange light is reflected by it."
	icon = 'modular_gs/icons/obj/clothing/fat_mask.dmi'
	worn_icon = 'modular_gs/icons/mob/mask.dmi'
	icon_state = "fat_mask"

	var/weight_time = 60 SECONDS

/obj/item/clothing/mask/gas/fattening/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_MASK)
		weight_add()

/obj/item/clothing/mask/gas/fattening/proc/weight_add()
	if(QDELETED(src))
		return
	var/mob/living/carbon/wearer = loc
	if(!istype(wearer))
		return
	if(wearer.get_item_by_slot(ITEM_SLOT_MASK) != src)
		return
	wearer.adjust_fatness(2, FATTENING_TYPE_ITEM)
	addtimer(CALLBACK(src, PROC_REF(weight_add)), weight_time)

/datum/crafting_recipe/fatgasmask
	name = "Drone Mask"
	result = /obj/item/clothing/mask/gas/fattening
	reqs = list(
		/obj/item/clothing/mask/gas = 1,
		/obj/item/stack/sheet/mineral/calorite = 1,
		)
	category = CAT_CLOTHING
