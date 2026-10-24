/////////////// GS13 - NUTRITIONAL TECHNOLOGY

#define TECHWEB_NODE_NUTRIWEAPONS "nutritech_weapons"
#define TECHWEB_NODE_NUTRITOOLS "nutritech_tools"

/datum/techweb_node/nutritech_tools
	id = TECHWEB_NODE_NUTRITOOLS
	display_name = "Nutri-Tech Tools"
	description = "Ending world hunger was never made easier!"
	prereq_ids = list(TECHWEB_NODE_MEDBAY_EQUIP, TECHWEB_NODE_EXP_TOOLS)
	design_ids = list(
		/datum/design/calorite_collar,
		/datum/design/cyberimp_nutriment_turbo,
		/datum/design/bluespace_belt,
		/datum/design/board/adipoelectric_transformer,
		/datum/design/board/adipoelectric_generator,
		/datum/design/cookie_synthesizer,
		/datum/design/borg_cookie_synthesizer,
		/datum/design/borg_feeding_tube_upgrade,
		/datum/design/cyberimp_fat_mobility,
		/datum/design/bluespace_collar_receiver,
		/datum/design/bluespace_collar_transmitter,
		/datum/design/berry_collar,
		)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)
	required_items_to_unlock = list(
		/obj/item/gun/energy/fatoray,
		/obj/item/gun/energy/fatoray/cannon,
		/obj/item/trash/fatoray_scrap1,
		/obj/item/trash/fatoray_scrap2
		)
	hidden = TRUE

/datum/techweb_node/nutritech_weapons
	id = TECHWEB_NODE_NUTRIWEAPONS
	display_name = "Nutri-Tech Weapons"
	description = "Ever wanted to reach your daily caloric intake in just 5 seconds?"
	prereq_ids = list(TECHWEB_NODE_MEDBAY_EQUIP, TECHWEB_NODE_EXP_TOOLS)
	design_ids = list(
		/datum/design/fatoray_weak,
		/datum/design/fatoray_cannon_weak,
		/datum/design/alter_ray_metabolism,
		/datum/design/alter_ray_reverser,
		/datum/design/borg_fatoray,
		/datum/design/caloray,
		/datum/design/nanites/bwomf,
		)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)
	required_items_to_unlock = list(
		/obj/item/gun/energy/fatoray,
		/obj/item/gun/energy/fatoray/cannon,
		/obj/item/trash/fatoray_scrap1,
		/obj/item/trash/fatoray_scrap2
		)
	hidden = TRUE

#undef TECHWEB_NODE_NUTRIWEAPONS
#undef TECHWEB_NODE_NUTRITOOLS
