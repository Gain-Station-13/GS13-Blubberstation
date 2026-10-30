/datum/gas_reaction/standard/lipoifium_formation/init_factors()
	factor = list(
		/datum/gas/plasma = "Plasma is consumed at 0.5 moles per mole of lipoifium created.",
		/datum/gas/tritium = "Tritium is consumed at 0.5 moles per mole of lipoifium created.",
		/datum/gas/lipoifium = "Lipoifium is formed at 2 moles per mole of tritium and plasma consumed.",
		"Temperature" = "Maximum temperature of 100 kelvin to occur. The closer the temperature to 0, the faster the reaction occurs.",
		"Energy" = "[FIRE_CARBON_ENERGY_RELEASED] joules of energy is released per mol of lipoifium formed.",
	)

/datum/gas_reaction/standard/galbanium_formation/init_factors()
	factor = list(
		/datum/gas/lipoifium = "Lipoifium is consumed at 0.5 moles per mole of galbanium created.",
		/datum/gas/bz = "BZ is consumed at 0.5 moles per mole of galbanium created.",
		/datum/gas/galbanium = "Galbanium is formed at 2 moles per mole of lipoifium and BZ consumed.",
		"Temperature" = "Minimum temperature of 5 000 kelvin to occur. The closer the temperature to 10 000, the faster the reaction occurs.",
		"Energy" = "[FIRE_CARBON_ENERGY_RELEASED / 2] joules of energy is consumed per mol of galbanium formed.",
	)
