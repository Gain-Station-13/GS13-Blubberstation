/// stomach volume in liters, set to 3
#define STOMACH_VOLUME 3
/// how much air to take from a turf when inhaling manually
#define INHALE_PERCENTAGE (STOMACH_VOLUME / CELL_VOLUME)
/// inflation stage above which the mob has no gravity
#define INFLATION_STAGE_NO_GRAVITY BELLY_MAX_SIZE
