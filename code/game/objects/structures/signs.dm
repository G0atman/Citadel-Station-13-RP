/obj/structure/sign
	icon = 'icons/obj/decals.dmi'
	anchored = 1
	opacity = 0
	density = 0
	plane = OBJ_PLANE
	layer = ABOVE_JUNK_LAYER
	w_class = ITEMSIZE_NORMAL

/obj/structure/sign/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			qdel(src)
			return
		if(3.0)
			qdel(src)
			return
		else
	return

/obj/structure/sign/attackby(obj/item/tool as obj, mob/user as mob)	//deconstruction
	if(tool.is_screwdriver() && !istype(src, /obj/structure/sign/double))
		playsound(src, tool.tool_sound, 50, 1)
		to_chat(user, "You unfasten the sign with your [tool].")
		var/obj/item/sign/S = new(src.loc)
		S.name = name
		S.desc = desc
		S.icon_state = icon_state
		//var/icon/I = icon('icons/obj/decals.dmi', icon_state)
		//S.icon = I.Scale(24, 24)
		S.sign_state = icon_state
		qdel(src)
	else ..()

/obj/item/sign
	name = "sign"
	desc = ""
	icon = 'icons/obj/decals.dmi'
	w_class = ITEMSIZE_NORMAL		//big
	var/sign_state = ""

/obj/item/sign/attackby(obj/item/tool as obj, mob/user as mob)	//construction
	if(tool.is_screwdriver() && isturf(user.loc))
		var/direction = input("In which direction?", "Select direction.") in list("North", "East", "South", "West", "Cancel")
		if(direction == "Cancel") return
		var/obj/structure/sign/S = new(user.loc)
		switch(direction)
			if("North")
				S.pixel_y = 32
			if("East")
				S.pixel_x = 32
			if("South")
				S.pixel_y = -32
			if("West")
				S.pixel_x = -32
			else return
		S.name = name
		S.desc = desc
		S.icon_state = sign_state
		to_chat(user, "You fasten \the [S] with your [tool].")
		qdel(src)
	else ..()

/obj/structure/sign/double/map
	name = "station map"
	desc = "A framed picture of the station."

/obj/structure/sign/double/map/left
	icon_state = "map-left"

/obj/structure/sign/double/map/right
	icon_state = "map-right"

/obj/structure/sign/securearea
	name = "\improper SECURE AREA"
	desc = "A warning sign which reads 'SECURE AREA'."
	icon_state = "securearea"

/obj/structure/sign/biohazard
	name = "\improper BIOHAZARD"
	desc = "A warning sign which reads 'BIOHAZARD'."
	icon_state = "bio"

/obj/structure/sign/electricshock
	name = "\improper HIGH VOLTAGE"
	desc = "A warning sign which reads 'HIGH VOLTAGE'."
	icon_state = "shock"

/obj/structure/sign/examroom
	name = "\improper EXAM"
	desc = "A guidance sign which reads 'EXAM ROOM'."
	icon_state = "examroom"

/obj/structure/sign/vacuum
	name = "\improper HARD VACUUM AHEAD"
	desc = "A warning sign which reads 'HARD VACUUM AHEAD'."
	icon_state = "space"

/obj/structure/sign/deathsposal
	name = "\improper DISPOSAL LEADS TO SPACE"
	desc = "A warning sign which reads 'DISPOSAL LEADS TO SPACE'."
	icon_state = "deathsposal"

/obj/structure/sign/pods
	name = "\improper ESCAPE PODS"
	desc = "A warning sign which reads 'ESCAPE PODS'."
	icon_state = "pods"

/obj/structure/sign/fire
	name = "\improper DANGER: FIRE"
	desc = "A warning sign which reads 'DANGER: FIRE'."
	icon_state = "fire"

/obj/structure/sign/nosmoking_1
	name = "\improper NO SMOKING"
	desc = "A warning sign which reads 'NO SMOKING'."
	icon_state = "nosmoking"

/obj/structure/sign/nosmoking_2
	name = "\improper NO SMOKING"
	desc = "A warning sign which reads 'NO SMOKING'."
	icon_state = "nosmoking2"

/obj/structure/sign/warning
	name = "\improper WARNING"
	icon_state = "securearea"

/obj/structure/sign/warning/Initialize(mapload)
	. = ..()
	desc = "A warning sign which reads '[name]'."

/obj/structure/sign/warning/airlock
	name = "\improper EXTERNAL AIRLOCK"
	icon_state = "doors"

/obj/structure/sign/warning/biohazard
	name = "\improper BIOHAZARD"
	icon_state = "bio"

/obj/structure/sign/warning/bomb_range
	name = "\improper BOMB RANGE"
	icon_state = "blast"

/obj/structure/sign/warning/caution
	name = "\improper CAUTION"

/obj/structure/sign/warning/compressed_gas
	name = "\improper COMPRESSED GAS"
	icon_state = "hikpa"

/obj/structure/sign/warning/deathsposal
	name = "\improper DISPOSAL LEADS TO SPACE"
	icon_state = "deathsposal"

/obj/structure/sign/warning/docking_area
	name = "\improper KEEP CLEAR: DOCKING AREA"

/obj/structure/sign/warning/evac
	name = "\improper KEEP CLEAR: EVAC DOCKING AREA"
	icon_state = "evac"

/obj/structure/sign/warning/engineering_access
	name = "\improper ENGINEERING ACCESS"
	icon_state = "engine"

/obj/structure/sign/warning/fire
	name = "\improper DANGER: FIRE"
	icon_state = "fire"

/obj/structure/sign/warning/high_voltage
	name = "\improper HIGH VOLTAGE"
	icon_state = "shock"

/obj/structure/sign/warning/hot_exhaust
	name = "\improper HOT EXHAUST"
	icon_state = "fire"

/obj/structure/sign/warning/internals_required
	name = "\improper INTERNALS REQUIRED"

/obj/structure/sign/warning/lethal_turrets
	name = "\improper LETHAL TURRETS"
	icon_state = "turrets"

/obj/structure/sign/warning/lethal_turrets/Initialize(mapload)
	. = ..()
	desc += " Enter at own risk!."

/obj/structure/sign/warning/mail_delivery
	name = "\improper MAIL DELIVERY"
	icon_state = "mail"

/obj/structure/sign/warning/moving_parts
	name = "\improper MOVING PARTS"
	icon_state = "movingparts"

/obj/structure/sign/warning/nosmoking_1
	name = "\improper NO SMOKING"
	icon_state = "nosmoking"

/obj/structure/sign/warning/nosmoking_2
	name = "\improper NO SMOKING"
	icon_state = "nosmoking2"

/obj/structure/sign/warning/pods
	name = "\improper ESCAPE PODS"
	icon_state = "pods"

/obj/structure/sign/warning/radioactive
	name = "\improper RADIOACTIVE AREA"
	icon_state = "radiation"

/obj/structure/sign/warning/secure_area
	name = "\improper SECURE AREA"
	icon_state = "securearea2"

/obj/structure/sign/warning/secure_area/armory
	name = "\improper ARMORY"
	icon_state = "armory"

/obj/structure/sign/warning/server_room
	name = "\improper SERVER ROOM"
	icon_state = "server"

/obj/structure/sign/warning/siphon_valve
	name = "\improper SIPHON VALVE"

/obj/structure/sign/warning/vacuum
	name = "\improper HARD VACUUM AHEAD"
	icon_state = "space"

/obj/structure/sign/warning/vent_port
	name = "\improper EJECTION/VENTING PORT"

/obj/structure/sign/warning/emergence
	name = "\improper EMERGENT INTELLIGENCE DETAILS"
	icon_state = "rogueai"

/obj/structure/sign/warning/falling
	name = "\improper FALL HAZARD"
	icon_state = "falling"

/obj/structure/sign/warning/lava
	name = "\improper MOLTEN SURFACE"
	icon_state = "lava"

/obj/structure/sign/warning/acid
	name = "\improper ACIDIC SURFACE"
	icon_state = "acid"

/obj/structure/sign/redcross
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "bluecross"

/obj/structure/sign/greencross
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "bluecross2"

/obj/structure/sign/goldenplaque
	name = "The Most Robust Men Award for Robustness"
	desc = "To be Robust is not an action or a way of life, but a mental state. Only those with the force of Will strong enough to act during a crisis, saving friend from foe, are truly Robust. Stay Robust my friends."
	icon_state = "goldenplaque"

/obj/structure/sign/kiddieplaque
	name = "\improper AI developers plaque"
	desc = "Next to the extremely long list of names and job titles. Beneath the image, someone has scratched the word \"PACKETS\""
	icon_state = "kiddieplaque"

/obj/structure/sign/atmosplaque
	name = "\improper FEA atmospherics division plaque"
	desc = "This plaque commemorates the fall of the Atmos FEA division. For all the charred, dizzy, and brittle men who have died in its hands."
	icon_state = "atmosplaque"

/obj/structure/sign/periodic
	name = "periodic table"
	desc = "A sign reminding those visiting of the elements of the periodic table- though, they should have memorized them by now."
	icon_state = "periodic"

/obj/structure/sign/double/maltesefalcon	//The sign is 64x32, so it needs two tiles. ;3
	name = "The Maltese Falcon"
	desc = "The Maltese Falcon, Space Bar and Grill."

/obj/structure/sign/double/maltesefalcon/left
	icon_state = "maltesefalcon-left"

/obj/structure/sign/double/maltesefalcon/right
	icon_state = "maltesefalcon-right"

/obj/structure/sign/science			//These 3 have multiple types, just var-edit the icon_state to whatever one you want on the map
	name = "\improper SCIENCE!"
	desc = "A warning sign which reads 'SCIENCE'."
	icon_state = "science1"

/obj/structure/sign/chemistry
	name = "\improper CHEMISTRY"
	desc = "A warning sign which reads 'CHEMISTRY'."
	icon_state = "chemistry1"

/obj/structure/sign/botany
	name = "\improper HYDROPONICS"
	desc = "A warning sign which reads 'HYDROPONICS'."
	icon_state = "hydro1"

/obj/structure/sign/hydro
	name = "\improper HYDROPONICS"
	desc = "A sign labelling an area as a place where plants are grown."
	icon_state = "hydro2"

/obj/structure/sign/hydrostorage
	name = "\improper HYDROPONICS STORAGE"
	desc = "A sign labelling an area as a place where plant growing supplies are kept."
	icon_state = "hydro3"

/obj/structure/sign/xenobio
	name = "\improper XENOBIOLOGY"
	desc = "A warning sign which reads XENOBIOLOGY."
	icon_state = "xenobio3"

/obj/structure/sign/directions
	name = "direction sign"
	desc = "A direction sign, claiming to know the way."
	icon_state = "direction"

/obj/structure/sign/directions/Initialize(mapload)
	. = ..()
	desc = "A direction sign, pointing out which way \the [src] is."

/obj/structure/sign/directions/science
	name = "\improper Science department"
	desc = "A direction sign, pointing out which way the Science department is."
	icon_state = "direction_sci"

/obj/structure/sign/directions/engineering
	name = "\improper Engineering department"
	desc = "A direction sign, pointing out which way the Engineering department is."
	icon_state = "direction_eng"

/obj/structure/sign/directions/security
	name = "\improper Security department"
	desc = "A direction sign, pointing out which way the Security department is."
	icon_state = "direction_sec"

/obj/structure/sign/directions/medical
	name = "\improper Medical Bay"
	desc = "A direction sign, pointing out which way the Medical Bay is."
	icon_state = "direction_med"

/obj/structure/sign/directions/evac
	name = "\improper Evacuation"
	desc = "A direction sign, pointing out which way the Escape Shuttle dock is."
	icon_state = "direction_evac"

/obj/structure/sign/directions/bridge
	name = "\improper Bridge"
	icon_state = "direction_bridge"

/obj/structure/sign/directions/cargo
	name = "\improper Cargo department"
	desc = "A direction sign, pointing out which way the Cargo department is."
	icon_state = "direction_crg"

/obj/structure/sign/directions/command
	icon = 'icons/obj/decals_vr.dmi'
	name = "\improper Command department"
	desc = "A direction sign, pointing out which way the Command department is."
	icon_state = "direction_cmd"

/obj/structure/sign/directions/elevator
	icon = 'icons/obj/decals_vr.dmi'
	name = "\improper Space Elevator"
	desc = "A direction sign, pointing out which way the Space Elevator is."
	icon_state = "direction_elv"

/obj/structure/sign/directions/cryo
	name = "\improper Cryogenic Storage"
	desc = "A direction sign, pointing out which way cryogenic storage is."
	icon_state = "direction_cry"

/obj/structure/sign/directions/roomnum
	name = "room number"
	desc = "A sign detailing the number of the room beside it."
	icon_state = "roomnum"

/obj/structure/sign/christmas/lights
	name = "Christmas lights"
	desc = "Flashy and pretty."
	icon = 'icons/obj/christmas.dmi'
	icon_state = "xmaslights"

/obj/structure/sign/christmas/wreath
	name = "wreath"
	desc = "Prickly and festive."
	icon = 'icons/obj/christmas.dmi'
	icon_state = "doorwreath"

/obj/structure/sign/hostilefauna
	icon = 'icons/obj/decals_vr.dmi'
	name = "\improper Caution: Hostile fauna"
	desc = "This sign warns of hostile life forms in the area."
	icon_state = "h_fauna"

/obj/structure/sign/graffiti/pisoff
	icon = 'icons/obj/decals_vr.dmi'
	name = "\improper PIS OFF"
	desc = "This sign bears some rather rude looking graffiti instructing you to PIS OFF."
	icon_state = "pisoff"

//Eris signs

/obj/structure/sign/ironhammer
	icon = 'icons/obj/decals_vr.dmi'
	name = "Ironhammer Security"
	desc = "Sign depicts the symbolic of Ironhammer Security, the largest security provider within Trade Union of Hansa."
	icon_state = "ironhammer"

/obj/structure/sign/atmos_co2
	icon = 'icons/obj/decals_vr.dmi'
	name = "CO2 warning sign"
	desc = "WARNING! CO2 flow tube. Ensure the flow is disengaged before working."
	icon_state = "atmos_co2"

/obj/structure/sign/atmos_n2o
	icon = 'icons/obj/decals_vr.dmi'
	name = "N2O warning sign"
	desc = "WARNING! N2O flow tube. Ensure the flow is disengaged before working."
	icon_state = "atmos_n2o"

/obj/structure/sign/atmos_plasma
	icon = 'icons/obj/decals_vr.dmi'
	name = "Plasma warning sign"
	desc = "WARNING! Plasma flow tube. Ensure the flow is disengaged before working."
	icon_state = "atmos_plasma"

/obj/structure/sign/atmos_n2
	icon = 'icons/obj/decals_vr.dmi'
	name = "N2 warning sign"
	desc = "WARNING! N2 flow tube. Ensure the flow is disengaged before working."
	icon_state = "atmos_n2"

/obj/structure/sign/atmos_o2
	icon = 'icons/obj/decals_vr.dmi'
	name = "O2 warning sign"
	desc = "WARNING! O2 flow tube. Ensure the flow is disengaged before working."
	icon_state = "atmos_o2"

/obj/structure/sign/atmos_air
	icon = 'icons/obj/decals_vr.dmi'
	name = "Air warning sign"
	desc = "WARNING! Air flow tube. Ensure the flow is disengaged before working."
	icon_state = "atmos_air"

/obj/structure/sign/atmos_waste
	icon = 'icons/obj/decals_vr.dmi'
	name = "Atmos waste warning sign"
	desc = "WARNING! Waste flow tube. Ensure the flow is disengaged before working."
	icon_state = "atmos_waste"

/obj/structure/sign/deck1
	icon = 'icons/obj/decals_vr.dmi'
	desc = "A silver sign which reads 'DECK I'."
	name = "DECK I"
	icon_state = "deck1"

/obj/structure/sign/deck2
	icon = 'icons/obj/decals_vr.dmi'
	desc = "A silver sign which reads 'DECK II'."
	name = "DECK II"
	icon_state = "deck2"

/obj/structure/sign/deck3
	icon = 'icons/obj/decals_vr.dmi'
	desc = "A silver sign which reads 'DECK III'."
	name = "DECK III"
	icon_state = "deck3"

/obj/structure/sign/deck4
	icon = 'icons/obj/decals_vr.dmi'
	desc = "A silver sign which reads 'DECK IV'."
	name = "DECK IV"
	icon_state = "deck4"

/obj/structure/sign/sec1
	icon = 'icons/obj/decals_vr.dmi'
	desc = "A silver sign which reads 'SECTION I'."
	name = "SECTION I"
	icon_state = "sec1"

/obj/structure/sign/sec2
	icon = 'icons/obj/decals_vr.dmi'
	desc = "A silver sign which reads 'SECTION II'."
	name = "SECTION II"
	icon_state = "sec2"

/obj/structure/sign/sec3
	icon = 'icons/obj/decals_vr.dmi'
	desc = "A silver sign which reads 'SECTION III'."
	name = "SECTION III"
	icon_state = "sec3"

/obj/structure/sign/sec4
	icon = 'icons/obj/decals_vr.dmi'
	desc = "A silver sign which reads 'SECTION IV'."
	name = "SECTION IV"
	icon_state = "sec4"

/obj/structure/sign/nanotrasen
	icon = 'icons/obj/decals_vr.dmi'
	name = "\improper NanoTrasen"
	desc = "An old metal sign which reads 'NanoTrasen'."
	icon_state = "NT"
	catalogue_data = list(/datum/category_item/catalogue/information/organization/nanotrasen)

// Eris standards compliant hazards
/obj/structure/sign/signnew
	icon = 'icons/obj/decals_vr.dmi'

/obj/structure/sign/signnew/biohazard
	name = "BIOLOGICAL HAZARD"
	desc = "Warning: Biological and-or toxic hazards present in this area!"
	icon_state = "biohazard"

/obj/structure/sign/signnew/corrosives
	name = "CORROSIVE SUBSTANCES"
	desc = "Warning: Corrosive substances prezent in this area!"
	icon_state = "corrosives"

/obj/structure/sign/signnew/explosives
	name = "EXPLOSIVE SUBSTANCES"
	desc = "Warning: Explosive substances present in this area!"
	icon_state = "explosives"

/obj/structure/sign/signnew/flammables
	name = "FLAMMABLE SUBSTANCES"
	desc = "Warning: Flammable substances present in this area!"
	icon_state = "flammable"

/obj/structure/sign/signnew/laserhazard
	name = "LASER HAZARD"
	desc = "Warning: High powered laser emitters operating in this area!"
	icon_state = "laser"

/obj/structure/sign/signnew/danger
	name = "DANGEROUS AREA"
	desc = "Warning: Generally hazardous area! Exercise caution."
	icon_state = "danger"

/obj/structure/sign/signnew/magnetics
	name = "MAGNETIC FIELD HAZARD"
	desc = "Warning: Extremely powerful magnetic fields present in this area!"
	icon_state = "magnetics"

/obj/structure/sign/signnew/opticals
	name = "OPTICAL HAZARD"
	desc = "Warning: Optical hazards present in this area!"
	icon_state = "optical"

/obj/structure/sign/signnew/radiation
	name = "RADIATION HAZARD"
	desc = "Warning: Significant levels of radiation present in this area!"
	icon_state = "radiation"

/obj/structure/sign/signnew/secure
	name = "SECURE AREA"
	desc = "Warning: Secure Area! Do not enter without authorization!"
	icon_state = "secure"

/obj/structure/sign/signnew/electrical
	name = "ELECTRICAL HAZARD"
	desc = "Warning: Electrical hazards! Wear protective equipment."
	icon_state = "electrical"

/obj/structure/sign/signnew/cryogenics
	name = "CRYOGENIC TEMPERATURES"
	desc = "Warning: Extremely low temperatures in this area."
	icon_state = "cryogenics"

/obj/structure/sign/signnew/canisters
	name = "PRESSURIZED CANISTERS"
	desc = "Warning: Highly pressurized canister storage."
	icon_state = "canisters"

/obj/structure/sign/signnew/oxidants
	name = "OXIDIZING AGENTS"
	desc = "Warning: Oxidizing agents in this area, do not start fires!"
	icon_state = "oxidants"

/obj/structure/sign/signnew/memetic
	name = "MEMETIC HAZARD"
	desc = "Warning: Memetic hazard, wear meson goggles!"
	icon_state = "memetic"

//Eris departments

/obj/structure/sign/department
	icon = 'icons/obj/decals_vr.dmi'
	name = "department sign"
	desc = "Sign of some important ship compartment."

/obj/structure/sign/department/medbay
	name = "MEDBAY"
	icon_state = "medbay"

/obj/structure/sign/department/virology
	name = "VIROLOGY"
	icon_state = "virology"

/obj/structure/sign/department/chem
	name = "CHEMISTRY"
	icon_state = "chem"

/obj/structure/sign/department/gene
	name = "GENETICS"
	icon_state = "gene"

/obj/structure/sign/department/morgue
	name = "MORGUE"
	icon_state = "morgue"

/obj/structure/sign/department/operational
	name = "SURGERY"
	icon_state = "operational"

/obj/structure/sign/department/sci
	name = "SCIENCE"
	icon_state = "sci"

/obj/structure/sign/department/xenolab
	name = "XENOLAB"
	icon_state = "xenolab"

/obj/structure/sign/department/anomaly
	name = "ANOMALYLAB"
	icon_state = "anomaly"

/obj/structure/sign/department/dock
	name = "DOKUCHAYEV DOCK"
	icon_state = "dock"

/obj/structure/sign/department/rnd
	name = "RND"
	icon_state = "rnd"

/obj/structure/sign/department/robo
	name = "ROBOTICS"
	icon_state = "robo"

/obj/structure/sign/department/toxins
	name = "TOXINS"
	icon_state = "toxins"

/obj/structure/sign/department/toxin_res
	name = "TOXINLAB"
	icon_state = "toxin_res"

/obj/structure/sign/department/eva
	name = "E.V.A."
	icon_state = "eva"

/obj/structure/sign/department/ass
	name = "TOOL STORAGE"
	icon_state = "ass"

/obj/structure/sign/department/bar
	name = "BAR"
	icon_state = "bar"

/obj/structure/sign/department/biblio
	name = "LIBRARY"
	icon_state = "biblio"

/obj/structure/sign/department/chapel
	name = "CHAPEL"
	icon_state = "chapel"

/obj/structure/sign/department/bridge
	name = "BRIDGE"
	icon_state = "bridge"

/obj/structure/sign/department/telecoms
	name = "TELECOMS"
	icon_state = "telecoms"

/obj/structure/sign/department/conference_room
	name = "CONFERENCE"
	icon_state = "conference_room"

/obj/structure/sign/department/ai
	name = "AI"
	icon_state = "ai"

/obj/structure/sign/department/cargo
	name = "CARGO"
	icon_state = "cargo"

/obj/structure/sign/department/mail
	name = "MAIL"
	icon_state = "mail"

/obj/structure/sign/department/miner_dock
	name = "MINING DOCK"
	icon_state = "miner_dock"

/obj/structure/sign/department/cargo_dock
	name = "CARGO DOCK"
	icon_state = "cargo_dock"

/obj/structure/sign/department/eng
	name = "ENGINEERING"
	icon_state = "eng"

/obj/structure/sign/department/engine
	name = "ENGINE"
	icon_state = "engine"

/obj/structure/sign/department/gravi
	name = "GRAVGEN"
	icon_state = "gravi"

/obj/structure/sign/department/atmos
	name = "ATMOSPHERICS"
	icon_state = "atmos"

/obj/structure/sign/department/shield
	name = "SHIELDGEN"
	icon_state = "shield"

/obj/structure/sign/department/drones
	name = "DRONES"
	icon_state = "drones"

/obj/structure/sign/department/interrogation
	name = "INTERROGATION"
	icon_state = "interrogation"

/obj/structure/sign/department/commander
	name = "COMMANDER"
	icon_state = "commander"

/obj/structure/sign/department/armory
	name = "ARMORY"
	icon_state = "armory"

/obj/structure/sign/department/prison
	name = "PRISON"
	icon_state = "prison"

/obj/structure/sign/deck/first
	name = "\improper First Deck"
	icon_state = "deck-1"

/obj/structure/sign/deck/second
	name = "\improper Second Deck"
	icon_state = "deck-2"

/obj/structure/sign/deck/third
	name = "\improper Third Deck"
	icon_state = "deck-3"

/obj/structure/sign/deck/fourth
	name = "\improper Fourth Deck"
	icon_state = "deck-4"

/obj/structure/sign/hangar/one
	name = "\improper Hangar One"
	icon_state = "hangar-1"

/obj/structure/sign/hangar/two
	name = "\improper Hangar Two"
	icon_state = "hangar-2"

/obj/structure/sign/hangar/three
	name = "\improper Hangar Three"
	icon_state = "hangar-3"

/obj/structure/sign/atmos
	name = "\improper WASTE"
	icon_state = "atmos_waste"

/obj/structure/sign/atmos/o2
	name = "\improper OXYGEN"
	icon_state = "atmos_o2"

/obj/structure/sign/atmos/co2
	name = "\improper CARBON DIOXIDE"
	icon_state = "atmos_co2"

/obj/structure/sign/atmos/phoron
	name = "\improper PHORON"
	icon_state = "atmos_phoron"

/obj/structure/sign/atmos/n2o
	name = "\improper NITROUS OXIDE"
	icon_state = "atmos_n2o"

/obj/structure/sign/atmos/n2
	name = "\improper NITROGEN"
	icon_state = "atmos_n2"

/obj/structure/sign/atmos/air
	name = "\improper AIR"
	icon_state = "atmos_air"

/obj/structure/sign/poi/engineleft
	name = "I.C.V."
	desc = "The charred name of a cargo ship of some description."
	icon_state = "poi_engine1"

/obj/structure/sign/poi/engineright
	name = "I.C.V."
	desc = "The charred name of a cargo ship of some description."
	icon_state = "poi_engine2"
