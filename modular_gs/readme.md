**The modularization handbook - Gain Station style**

**Failure to follow this guide will result in you being asked to change your PR.**

# Introduction

Given that we are in similar situation to our upstream, bubberstation, for most intents and purposes their modularization guide (located in `modular_zubbers/readme.md`) is to be followed, unless something is specified in this document.

# `GS13 EDIT` comments

Whenever you have to modify content outside of the `modular_gs/` folder, you are required to mark your changes with `GS13 EDIT` comments (exactly as specified, all caps). Depending on how you change your code, you will make them single or multi line.

### Single line edits

If your code is modifying only a single (or in general, small amounts of) line of code, you are only required to append a `GS13 EDIT` comment at the end, additionally describing why the change was made. Additionaly you may (but are not always be required to) add the original value of that line of code. An example is listed below:

```diff
- something = 5
+ something = 10	// GS13 EDIT, doubles the value, original: 5
```

Whether you separate the reason and original value via commas `,`, hyphens `-` or whatever else is up to you. We only require them to be present.

### Multi line edits

If you are required to comment out, change or add a large amounts of code to non modular folders, you should use multi line `GS13 EDIT` comments. These take the following format:

- use `GS13 EDIT START` to mark the beginning of your change. List the reason for the change here.
- change the code under it
- use `GS13 EDIT END` to mark the end of your changes

If possible, try to keep the original code commented out. However, this may not always be possible, in which case it's fine to change it without preserving it, as long as the `GS13 EDIT` comments are present. Additionaly, if you are adding large amounts of code to non modular files, consider instead creating a new file within the `modular_gs/` folder holding a proc which will do the things you want (for example, the `handle_gaining_weight()` proc in `modular_gs/code/modules/surgery/organs/internal/stomach/_stomach.dm`, called from `code/modules/surgery/organs/internal/stomach/_stomach.dm:200`).

For example:

<!-- yes, we use C++ here because the syntax is the most similar to DM -->
```C++
// GS13 EDIT START - stop message spam with nutripump turbo. Had to move it one tab to the right
if(send_messages)
	var/feed_text = "You feel less hungry..."
	if(owner.nutrition >= NUTRITION_LEVEL_FED)
		feed_text = "You feel very full..."
	to_chat(owner, span_notice(feed_text))
// GS13 EDIT END
```

```C++
/* GS13 EDIT START reworks lipoplasty for our fat system
if(!HAS_TRAIT_FROM(limb.owner, TRAIT_FAT, OBESITY) || limb.owner.nutrition < NUTRITION_LEVEL_WELL_FED)
	return FALSE
*/
if(limb.owner.fatness_real <= FATNESS_LEVEL_FATTER || HAS_TRAIT(limb.owner, TRAIT_WEIGHT_LOSS_IMMUNE))
	return FALSE
// GS13 EDIT END
```

```C++
/* GS13 EDIT START getting rid of quadborgs
"K1-T7Y" = list(
	SKIN_ICON_STATE = "jani",
	SKIN_ICON = CYBORG_ICON_JANI_KITTYBORG,
	SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_WIDE, TRAIT_R_SMALL),
),
"Myomer" = list(
	SKIN_ICON_STATE = "myomer-jani",
	SKIN_ICON = CYBORG_ICON_JANI_MYOMER,
	SKIN_FEATURES = list(TRAIT_R_UNIQUEPANEL, TRAIT_R_WIDE, TRAIT_R_HAS_UNIQUE_RESTING_LIGHTS),
	MYOMER_HAT_OFFSET
),
GS13 EDIT END */
```
