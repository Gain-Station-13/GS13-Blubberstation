// Placeable mirror that makes you fatter to the next stage

/obj/structure/mirror/fat_mirror
	name = "mirror" //Exact same text. Good luck.
	desc = "Mirror mirror on the wall, who's the most robust of them all?"
	/// How long the mirror stays broken after use
	var/recharge_time = 60 SECONDS
	/// Whether the mirror is currently recharging
	var/recharging = FALSE

/obj/item/wallframe/mirror/fat_mirror
	name = "calorite laced mirror"
	desc = "An unmounted mirror laced with calorite. Attach it to a wall for use."
	icon = 'icons/obj/watercloset.dmi'
	icon_state = "mirror"
	custom_materials = list(
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/calorite = SHEET_MATERIAL_AMOUNT * 5)
	result_path = /obj/structure/mirror/fat_mirror
	pixel_shift = 28

/datum/crafting_recipe/mirror/fat_mirror
	name = "Calorite Laced Mirror"
	result = /obj/item/wallframe/mirror/fat_mirror
	reqs = list(
		/obj/item/stack/sheet/glass = 5,
		/obj/item/stack/sheet/mineral/silver = 2,
		/obj/item/stack/sheet/mineral/calorite = 5,
		)
	category = CAT_FURNITURE

/obj/structure/mirror/fat_mirror/attack_hand(mob/living/carbon/human/user)
	. = ..()
	if(!ishuman(user) || broken || recharging)
		return TRUE
	if(!user.can_perform_action(src, FORBID_TELEKINESIS_REACH))
		return TRUE
	make_fat(user)
	return TRUE

/obj/structure/mirror/fat_mirror/proc/make_fat(mob/living/carbon/looker)
	if(!istype(looker) || !looker.check_weight_prefs(FATTENING_TYPE_MAGIC))
		return FALSE
	var/fat_to_add = looker.fatness_until_next_level()
	if(!fat_to_add)
		fat_to_add = FATNESS_LEVEL_BLOB // If someone is a blob, just add the amount of fatness needed to be a blob in the first place.
	fat_to_add += 25 // a little buffer so they don't instantly burn it off.
	looker.adjust_fatness(fat_to_add, FATTENING_TYPE_MAGIC, TRUE)
	to_chat(looker, span_warning("You take a look in the mirror. Have you been getting fatter lately?"))
	playsound(src, 'sound/effects/hit_on_shattered_glass.ogg', 70, TRUE)

	// mirror cooldown section
	recharging = TRUE
	icon_state = "mirror_broke"
	visible_message(span_warning("[src] cracks and shatters!"))
	addtimer(CALLBACK(src, "restore_mirror"), recharge_time)
	return TRUE

/obj/structure/mirror/fat_mirror/proc/restore_mirror()
	if(QDELETED(src))
		return
	recharging = FALSE
	icon_state = initial(icon_state)
	visible_message(span_notice("[src] seeps out an orange goo, repairing it's cracks."))

/obj/structure/mirror/fat_mirror/atom_deconstruct(disassembled = TRUE)
	if(!disassembled)
		new /obj/item/shard(loc)
	else if(broken)
		new /obj/item/wallframe/mirror/broken(loc) //you broke it, good job. No more fun.
	else
		new /obj/item/wallframe/mirror/fat_mirror(loc)
