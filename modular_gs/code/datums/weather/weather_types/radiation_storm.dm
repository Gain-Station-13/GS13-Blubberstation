/datum/weather/rad_storm
	telegraph_duration = 60 SECONDS

/datum/weather/rad_storm/New(...)
	protected_areas |= list(
		/area/station/service/bar,
	)
	. = ..()
