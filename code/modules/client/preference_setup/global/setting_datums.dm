var/list/_client_preferences
var/list/_client_preferences_by_key
var/list/_client_preferences_by_type

/proc/get_client_preferences()
	if(!_client_preferences)
		_client_preferences = list()
		for(var/ct in subtypesof(/datum/client_preference))
			var/datum/client_preference/client_type = ct
			if(initial(client_type.description))
				_client_preferences += new client_type()
	return _client_preferences

/proc/get_client_preference(var/datum/client_preference/preference)
	if(istype(preference))
		return preference
	if(ispath(preference))
		return get_client_preference_by_type(preference)
	return get_client_preference_by_key(preference)

/proc/get_client_preference_by_key(var/preference)
	if(!_client_preferences_by_key)
		_client_preferences_by_key = list()
		for(var/ct in get_client_preferences())
			var/datum/client_preference/client_pref = ct
			_client_preferences_by_key[client_pref.key] = client_pref
	return _client_preferences_by_key[preference]

/proc/get_client_preference_by_type(var/preference)
	if(!_client_preferences_by_type)
		_client_preferences_by_type = list()
		for(var/ct in get_client_preferences())
			var/datum/client_preference/client_pref = ct
			_client_preferences_by_type[client_pref.type] = client_pref
	return _client_preferences_by_type[preference]

/datum/client_preference
	var/description
	var/key
	var/enabled_by_default = TRUE
	var/enabled_description = "Yes"
	var/disabled_description = "No"

/datum/client_preference/proc/may_toggle(var/mob/preference_mob)
	return TRUE

/datum/client_preference/proc/toggled(var/mob/preference_mob, var/enabled)
	return

/*********************
* Player Preferences *
*********************/

/datum/client_preference/play_admin_midis
	description ="Play admin midis"
	key = "SOUND_MIDI"

/datum/client_preference/play_lobby_music
	description ="Play lobby music"
	key = "SOUND_LOBBY"

/datum/client_preference/play_lobby_music/toggled(var/mob/preference_mob, var/enabled)
	if(!preference_mob.client || !preference_mob.client.media)
		return

	if(enabled)
		preference_mob.client.playtitlemusic()
	else
		preference_mob.client.media.stop_music()

/datum/client_preference/play_ambiance
	description ="Play ambience"
	key = "SOUND_AMBIENCE"

/datum/client_preference/play_ambiance/toggled(var/mob/preference_mob, var/enabled)
	if(!enabled)
		SEND_SOUND(preference_mob, sound(null, repeat = 0, wait = 0, volume = 0, channel = 1))
		SEND_SOUND(preference_mob, sound(null, repeat = 0, wait = 0, volume = 0, channel = 2))
// Need to put it here because it should be ordered riiiight here.
/datum/client_preference/play_jukebox
	description ="Play jukebox music"
	key = "SOUND_JUKEBOX"

/datum/client_preference/play_jukebox/toggled(var/mob/preference_mob, var/enabled)
	if(!enabled)
		preference_mob.stop_all_music()
	else
		preference_mob.update_music()

/datum/client_preference/eating_noises
	description = "Eating Noises"
	key = "EATING_NOISES"
	enabled_description = "Noisy"
	disabled_description = "Silent"

/datum/client_preference/digestion_noises
	description = "Digestion Noises"
	key = "DIGEST_NOISES"
	enabled_description = "Noisy"
	disabled_description = "Silent"

/datum/client_preference/weather_sounds
	description ="Weather sounds"
	key = "SOUND_WEATHER"
	enabled_description = "Audible"
	disabled_description = "Silent"

/datum/client_preference/supermatter_hum
	description ="Supermatter hum"
	key = "SOUND_SUPERMATTER"
	enabled_description = "Audible"
	disabled_description = "Silent"

/datum/client_preference/ghost_ears
	description ="Ghost ears"
	key = "CHAT_GHOSTEARS"
	enabled_description = "All Speech"
	disabled_description = "Nearby"

/datum/client_preference/ghost_sight
	description ="Ghost sight"
	key = "CHAT_GHOSTSIGHT"
	enabled_description = "All Emotes"
	disabled_description = "Nearby"

/datum/client_preference/ghost_radio
	description ="Ghost radio"
	key = "CHAT_GHOSTRADIO"
	enabled_description = "All Chatter"
	disabled_description = "Nearby"

/datum/client_preference/chat_tags
	description ="Chat tags"
	key = "CHAT_SHOWICONS"
	enabled_description = "Show"
	disabled_description = "Hide"

/datum/client_preference/air_pump_noise
	description ="Air Pump Ambient Noise"
	key = "SOUND_AIRPUMP"
	enabled_description = "Audible"
	disabled_description = "Silent"

/datum/client_preference/mob_tooltips
	description ="Mob tooltips"
	key = "MOB_TOOLTIPS"
	enabled_description = "Show"
	disabled_description = "Hide"

/datum/client_preference/attack_icons
	description ="Attack icons"
	key = "ATTACK_ICONS"
	enabled_description = "Show"
	disabled_description = "Hide"

/datum/client_preference/pickup_sounds
	description = "Picked Up Item Sounds"
	key = "SOUND_PICKED"

	enabled_description = "Enabled"
	disabled_description = "Disabled"

/datum/client_preference/drop_sounds
	description = "Dropped Item Sounds"
	key = "SOUND_DROPPED"
	enabled_description = "Enabled"
	disabled_description = "Disabled"

/datum/client_preference/hotkeys_default
	description ="Hotkeys Default"
	key = "HUD_HOTKEYS"
	enabled_description = "Enabled"
	disabled_description = "Disabled"
	enabled_by_default = FALSE // Backwards compatibility

/datum/client_preference/show_typing_indicator
	description ="Typing indicator"
	key = "SHOW_TYPING"
	enabled_description = "Show"
	disabled_description = "Hide"

/datum/client_preference/show_typing_indicator/toggled(var/mob/preference_mob, var/enabled)
	if(!enabled)
		preference_mob.set_typing_indicator(FALSE)

/datum/client_preference/show_ooc
	description ="OOC chat"
	key = "CHAT_OOC"
	enabled_description = "Show"
	disabled_description = "Hide"

/datum/client_preference/show_looc
	description ="LOOC chat"
	key = "CHAT_LOOC"
	enabled_description = "Show"
	disabled_description = "Hide"

/datum/client_preference/show_dsay
	description ="Dead chat"
	key = "CHAT_DEAD"
	enabled_description = "Show"
	disabled_description = "Hide"

/datum/client_preference/check_mention
	description ="Emphasize Name Mention"
	key = "CHAT_MENTION"
	enabled_description = "Emphasize"
	disabled_description = "Normal"

/datum/client_preference/show_progress_bar
	description ="Progress Bar"
	key = "SHOW_PROGRESS"
	enabled_description = "Show"
	disabled_description = "Hide"

/datum/client_preference/browser_style
	description = "Fake NanoUI Browser Style"
	key = "BROWSER_STYLED"
	enabled_description = "Fancy"
	disabled_description = "Plain"

/datum/client_preference/ambient_occlusion
	description = "Fake Ambient Occlusion"
	key = "AMBIENT_OCCLUSION_PREF"
	enabled_by_default = FALSE
	enabled_description = "On"
	disabled_description = "Off"

/datum/client_preference/ambient_occlusion/toggled(var/mob/preference_mob, var/enabled)
	. = ..()
	if(preference_mob && preference_mob.plane_holder)
		var/datum/plane_holder/PH = preference_mob.plane_holder
		PH.set_ao(VIS_OBJS, enabled)
		PH.set_ao(VIS_MOBS, enabled)

/datum/client_preference/instrument_toggle
	description ="Hear In-game Instruments"
	key = "SOUND_INSTRUMENT"

/datum/client_preference/anonymous_ghost_chat
	description = "Anonymous Ghost Chat"
	key = "ANON_GHOST_CHAT"
	enabled_by_default = FALSE
	enabled_description = "Hide ckey"
	disabled_description = "Show ckey"

/datum/client_preference/show_in_advanced_who
	description = "Show my status in advanced who"
	key = "SHOW_IN_ADVANCED_WHO"
	enabled_by_default = TRUE
	enabled_description = "Visible"
	disabled_description = "Hidden"

/datum/client_preference/announce_ghost_joinleave
	description = "Announce joining/leaving as a ghost/observer"
	key = "ANNOUNCE_GHOST_JOINLEAVE"
	enabled_by_default = TRUE
	enabled_description = "Announce"
	disabled_description = "Silent"

/datum/client_preference/help_intent_firing
	description = "Allow firing on help intent"
	key = "HELP_INTENT_SAFETY"
	enabled_by_default = FALSE
	enabled_description = "Allow"
	disabled_description = "Forbid"

/datum/client_preference/status_indicators
	description = "Status Indicators"
	key = "SHOW_STATUS"
	enabled_description = "Show"
	disabled_description = "Hide"

/datum/client_preference/status_indicators/toggled(mob/preference_mob, enabled)
	. = ..()
	if(preference_mob && preference_mob.plane_holder)
		var/datum/plane_holder/PH = preference_mob.plane_holder
		PH.set_vis(VIS_STATUS, enabled)

/datum/client_preference/parallax
	description = "Parallax (fancy space, disable for FPS issues"
	key = "PARALLAX_ENABLED"
	enabled_description = "Enabled"
	disabled_description = "Disabled"

/datum/client_preference/parallax/toggled(mob/preference_mob, enabled)
	. = ..()
	preference_mob?.client?.parallax_holder?.Reset()
/datum/client_preference/overhead_chat
	description = "Overhead Chat"
	key = "OVERHEAD_CHAT"
	enabled_description = "Show"
	disabled_description = "Hide"
	enabled_by_default = TRUE

/********************
* Staff Preferences *
********************/
/datum/client_preference/admin/may_toggle(var/mob/preference_mob)
	return check_rights(R_ADMIN, 0, preference_mob)

/datum/client_preference/mod/may_toggle(var/mob/preference_mob)
	return check_rights(R_MOD|R_ADMIN, 0, preference_mob)

/datum/client_preference/debug/may_toggle(var/mob/preference_mob)
	return check_rights(R_DEBUG|R_ADMIN, 0, preference_mob)

/datum/client_preference/mod/show_attack_logs
	description = "Attack Log Messages"
	key = "CHAT_ATTACKLOGS"
	enabled_description = "Show"
	disabled_description = "Hide"
	enabled_by_default = FALSE

/datum/client_preference/debug/show_debug_logs
	description = "Debug Log Messages"
	key = "CHAT_DEBUGLOGS"
	enabled_description = "Show"
	disabled_description = "Hide"
	enabled_by_default = FALSE

/datum/client_preference/admin/show_chat_prayers
	description = "Chat Prayers"
	key = "CHAT_PRAYER"
	enabled_description = "Show"
	disabled_description = "Hide"

/datum/client_preference/holder/may_toggle(var/mob/preference_mob)
	return preference_mob && preference_mob.client && preference_mob.client.holder

/datum/client_preference/holder/play_adminhelp_ping
	description = "Adminhelps"
	key = "SOUND_ADMINHELP"
	enabled_description = "Hear"
	disabled_description = "Silent"

/datum/client_preference/holder/hear_radio
	description = "Radio chatter"
	key = "CHAT_RADIO"
	enabled_description = "Show"
	disabled_description = "Hide"

/datum/client_preference/holder/show_rlooc
	description ="Remote LOOC chat"
	key = "CHAT_RLOOC"
	enabled_description = "Show"
	disabled_description = "Hide"

/datum/client_preference/holder/obfuscate_stealth_dsay
	description = "Obfuscate Stealthmin Dsay"
	key = "OBFUSCATE_STEALTH_DSAY"
	enabled_by_default = FALSE
	enabled_description = "On"
	disabled_description = "Off"

/datum/client_preference/holder/stealth_ghost_mode
	description = "Stealthmin Ghost Mode"
	key = "STEALTH_GHOST_MODE"
	enabled_by_default = FALSE
	enabled_description = "Obfuscate Ghost"
	disabled_description = "Normal Ghost"


/datum/client_preference/debug/age_verified
	description = "(Debug) Age Verified Status"
	key = "AGE_VERIFIED"
	enabled_description = "TRUE"
	disabled_description = "FALSE"
	enabled_by_default = FALSE

/datum/client_preference/autocorrect
	description = "Autocorrect"
	key = "AUTOCORRECT"
	enabled_description = "Enabled"
	disabled_description = "Disabled"

/datum/client_preference/examine_look
	description = "Examine Messages"
	key = "EXAMINE_LOOK"
	enabled_description = "Show"
	disabled_description = "Hide"
