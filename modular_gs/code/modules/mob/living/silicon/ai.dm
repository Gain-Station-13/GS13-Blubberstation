GAME_VERB(/mob/living/silicon/ai, print_fat_stats, "Station BFI Printout", "AI Commands")

	src.get_fatness_stats()

/mob/living/silicon/ai/proc/get_fatness_stats()
	var/mob/living/carbon/fattest = null
	var/mob/living/carbon/thinnest = null
	var/total_bfi = 0
	var/total_carbons = 0
	for(var/datum/mind/crewmember as anything in get_crewmember_minds())
		var/mob/living/carbon/crewmember_carbon = crewmember.current
		if(!iscarbon(crewmember_carbon))
			continue
		
		total_bfi += crewmember_carbon.fatness
		total_carbons += 1
		if (isnull(fattest) || crewmember_carbon.fatness > fattest.fatness)
			fattest = crewmember_carbon

		if (isnull(thinnest) || crewmember_carbon.fatness < thinnest.fatness)
			thinnest = crewmember_carbon
	
	if (total_carbons == 0)
		to_chat(usr, span_warning("There are no crewmembers on board!"))
		return

	var/average_bfi = total_bfi / total_carbons
	to_chat(usr, span_info("The average crew BFI is: [average_bfi]."))
	to_chat(usr, span_info("The fattest crewmember is: [fattest], with a BFI value of: [fattest.fatness]."))
	to_chat(usr, span_info("The thinnest crewmember is: [thinnest], with a BFI value of: [thinnest.fatness]."))
