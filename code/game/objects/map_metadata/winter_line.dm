/obj/map_metadata/winter_line
	ID = MAP_WINTER_LINE
	title = "Winter Line (100x100x1)"
	prishtina_blocking_area_types = list(/area/prishtina/no_mans_land/invisible_wall)
	respawn_delay = 600
	squad_spawn_locations = FALSE
	min_autobalance_players = 50
	supply_points_per_tick = list(
		GERMAN = 1.00,
		USA = 1.00)
	faction_organization = list(
		GERMAN,
		USA,
		ITALIAN)
	available_subfactions = list(
		ITALIAN = 100,
		)
	faction_distribution_coeffs = list(GERMAN = 0.5, USA = 0.5)
	battle_name = "Winter Line"
	front = "Western"
	roundend_condition_sides = list(
		list(GERMAN, ITALIAN) = /area/prishtina/german/command,
		list(USA) = /area/prishtina/soviet/bunker/command)
/obj/map_metadata/camp/job_enabled_specialcheck(var/datum/job/J)
	. = TRUE
	if (istype(J, /datum/job/usa))
		if (istype(J, /datum/job/usa/marines_squad_leader))
			. = FALSE
		if (istype(J, /datum/job/usa/marines_soldier))

/obj/map_metadata/winter_line/germans_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 3600 || admin_ended_all_grace_periods)

/obj/map_metadata/winter_line/soviets_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 3600 || admin_ended_all_grace_periods)

/obj/map_metadata/winter_line/announce_mission_start(var/preparation_time)
	world << "<font size=4>All factions have <b>6 minutes</b> to prepare before combat will begin!</font>"

/obj/map_metadata/winter_line/reinforcements_ready()
	return (germans_can_cross_blocks() && soviets_can_cross_blocks())
