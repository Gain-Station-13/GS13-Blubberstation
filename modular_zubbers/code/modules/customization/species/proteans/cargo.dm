/datum/supply_pack/science/protean_organs
	name = "Protean Organs"
	desc = "Contains three sets of organs for Protean crewmembers." //GS13 EDIT, Made it 3 instead of 2.
	contains = list(/obj/item/organ/stomach/protean = 3, /obj/item/organ/heart/protean = 3)
	crate_name = "\improper Protean organs"
	/* GS13 EDIT START
	access = ACCESS_ROBOTICS
	access_view = ACCESS_ROBOTICS
	*/ GS13 EDIT END
	crate_type = /obj/structure/closet/crate/secure/science/robo

/datum/supply_pack/science/protean_vessel
	name = "Protean Vessel"
	desc = "Contains a blank Protean body, the refactory on its last legs, long enough to place the core in the vessel, but will quickly deteriorate as soon as the core goes inside."
	cost = CARGO_CRATE_VALUE * 5 // Not expensive but not the cheapest
	contains = list(/mob/living/carbon/human/species/protean/empty = 1)
	crate_name = "\improper Protean vessel"
	/* GS13 EDIT START
	access = ACCESS_ROBOTICS
	access_view = ACCESS_ROBOTICS
	*/ GS13 EDIT END
	crate_type = /obj/structure/closet/crate/secure/science/robo
