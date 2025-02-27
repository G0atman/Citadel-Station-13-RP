/* Make language great again
/datum/design/item/implant/language
	name = "Language implant"
	id = "implant_language"
	req_tech = list(TECH_MATERIAL = 5, TECH_BIO = 5, TECH_DATA = 4, TECH_ENGINEERING = 4) //This is not an easy to make implant.
	materials = list(MAT_STEEL = 7000, MAT_GLASS = 7000, MAT_GOLD = 2000, MAT_DIAMOND = 3000)
	build_path = /obj/item/implantcase/vrlanguage
*/
// /datum/design/item/implant/backup
// 	name = "Backup implant"
// 	id = "implant_backup"
// 	req_tech = list(TECH_MATERIAL = 2, TECH_BIO = 2, TECH_DATA = 4, TECH_ENGINEERING = 2)
// 	materials = list(MAT_STEEL = 2000, MAT_GLASS = 2000)
// 	build_path = /obj/item/implantcase/backup

/datum/design/item/weapon/sizegun
	name = "Size gun"
	id = "sizegun"
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3, TECH_POWER = 2)
	materials = list(MAT_STEEL = 3000, MAT_GLASS = 2000, MAT_URANIUM = 2000)
	build_path = /obj/item/gun/energy/sizegun
	sort_string = "TAAAB"

/datum/design/item/bluespace_jumpsuit
	name = "Bluespace jumpsuit"
	id = "bsjumpsuit"
	req_tech = list(TECH_BLUESPACE = 2, TECH_MATERIAL = 3, TECH_POWER = 2)
	materials = list(MAT_STEEL = 4000, MAT_GLASS = 4000)
	build_path = /obj/item/clothing/under/bluespace
	sort_string = "TAAAC"

// /datum/design/item/sleevemate
// 	name = "SleeveMate 3700"
// 	id = "sleevemate"
// 	req_tech = list(TECH_MATERIAL = 3, TECH_MAGNET = 2, TECH_BIO = 2)
// 	materials = list(MAT_STEEL = 4000, MAT_GLASS = 4000)
// 	build_path = /obj/item/sleevemate
// 	sort_string = "TAAAD"

// /datum/design/item/bodysnatcher
// 	name = "Body Snatcher"
// 	id = "bodysnatcher"
// 	req_tech = list(TECH_MAGNET = 3, TECH_BIO = 3, TECH_ILLEGAL = 2)
// 	materials = list(MAT_STEEL = 4000, MAT_GLASS = 4000)
// 	build_path = /obj/item/bodysnatcher

/datum/design/item/item/pressureinterlock
	name = "APP pressure interlock"
	id = "pressureinterlock"
	req_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2, TECH_ENGINEERING = 2)
	materials = list(MAT_STEEL = 1000, MAT_GLASS = 250)
	build_path = /obj/item/pressurelock
	sort_string = "TAADA"

/datum/design/item/weapon/advparticle
	name = "Advanced anti-particle rifle"
	id = "advparticle"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 5, TECH_POWER = 3, TECH_MAGNET = 3)
	materials = list(MAT_STEEL = 5000, MAT_GLASS = 1000, MAT_GOLD = 1000, MAT_URANIUM = 750)
	build_path = /obj/item/gun/energy/particle/advanced
	sort_string = "TAADB"

/datum/design/item/weapon/particlecannon
	name = "Anti-particle cannon"
	id = "particlecannon"
	req_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 5, TECH_POWER = 4, TECH_MAGNET = 4)
	materials = list(MAT_STEEL = 10000, MAT_GLASS = 1500, MAT_GOLD = 2000, MAT_URANIUM = 1000, MAT_DIAMOND = 2000)
	build_path = /obj/item/gun/energy/particle/cannon
	sort_string = "TAADC"

/datum/design/item/hud/omni
	name = "AR glasses"
	id = "omnihud"
	req_tech = list(TECH_MAGNET = 4, TECH_COMBAT = 3, TECH_BIO = 3)
	materials = list(MAT_STEEL = 1000, MAT_GLASS = 1000)
	build_path = /obj/item/clothing/glasses/omnihud
	sort_string = "GAAFB"

/datum/design/item/translocator
	name = "Personal translocator"
	id = "translocator"
	req_tech = list(TECH_MAGNET = 5, TECH_BLUESPACE = 5, TECH_ILLEGAL = 6)
	materials = list(MAT_STEEL = 4000, MAT_GLASS = 2000, MAT_URANIUM = 4000, MAT_DIAMOND = 2000)
	build_path = /obj/item/perfect_tele
	sort_string = "HABAF"

/datum/design/item/nif
	name = "nanite implant framework"
	id = "nif"
	req_tech = list(TECH_MAGNET = 5, TECH_BLUESPACE = 5, TECH_MATERIAL = 5, TECH_ENGINEERING = 5, TECH_DATA = 5)
	materials = list(MAT_STEEL = 5000, MAT_GLASS = 8000, MAT_URANIUM = 6000, MAT_DIAMOND = 6000)
	build_path = /obj/item/nif
	sort_string = "HABBC"

/datum/design/item/nifbio
	name = "bioadaptive NIF"
	id = "bioadapnif"
	req_tech = list(TECH_MAGNET = 5, TECH_BLUESPACE = 5, TECH_MATERIAL = 5, TECH_ENGINEERING = 5, TECH_DATA = 5, TECH_BIO = 5)
	materials = list(MAT_STEEL = 10000, MAT_GLASS = 15000, MAT_URANIUM = 10000, MAT_DIAMOND = 10000)
	build_path = /obj/item/nif/bioadap
	sort_string = "HABBD" //Changed String from HABBE to HABBD
//Addiing bioadaptive NIF to Protolathe

/datum/design/item/nifrepairtool
	name = "adv. NIF repair tool"
	id = "anrt"
	req_tech = list(TECH_MAGNET = 5, TECH_BLUESPACE = 5, TECH_MATERIAL = 5, TECH_ENGINEERING = 5, TECH_DATA = 5)
	materials = list(MAT_STEEL = 200, MAT_GLASS = 3000, MAT_URANIUM = 2000, MAT_DIAMOND = 2000)
	build_path = /obj/item/nifrepairer
	sort_string = "HABBE" //Changed String from HABBD to HABBE

// Resleeving Circuitboards

/datum/design/circuit/transhuman_clonepod
	name = "grower pod"
	id = "transhuman_clonepod"
	req_tech = list(TECH_DATA = 3, TECH_BIO = 3)
	build_path = /obj/item/circuitboard/transhuman_clonepod
	sort_string = "HAADA"

/datum/design/circuit/transhuman_synthprinter
	name = "SynthFab 3000"
	id = "transhuman_synthprinter"
	req_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 3)
	build_path = /obj/item/circuitboard/transhuman_synthprinter
	sort_string = "HAADB"

/datum/design/circuit/transhuman_resleever
	name = "Resleeving pod"
	id = "transhuman_resleever"
	req_tech = list(TECH_ENGINEERING = 4, TECH_BIO = 4)
	build_path = /obj/item/circuitboard/transhuman_resleever
	sort_string = "HAADC"

/datum/design/circuit/resleeving_control
	name = "Resleeving control console"
	id = "resleeving_control"
	req_tech = list(TECH_DATA = 5)
	build_path = /obj/item/circuitboard/resleeving_control
	sort_string = "HAADE"

/datum/design/circuit/body_designer
	name = "Body design console"
	id = "body_designer"
	req_tech = list(TECH_DATA = 5)
	build_path = /obj/item/circuitboard/body_designer
	sort_string = "HAADF"

/datum/design/circuit/partslathe
	name = "Parts lathe"
	id = "partslathe"
	req_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/circuitboard/partslathe
	sort_string = "HABAD"

/datum/design/item/weapon/netgun
	name = "\'Retiarius\' capture gun" //cit change
	id = "netgun"
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 5, TECH_MAGNET = 3)
	materials = list(MAT_STEEL = 6000, MAT_GLASS = 3000)
	build_path = /obj/item/gun/energy/netgun
	sort_string = "TAADF"

/datum/design/circuit/algae_farm
	name = "Algae Oxygen Generator"
	id = "algae_farm"
	req_tech = list(TECH_ENGINEERING = 3, TECH_BIO = 2)
	build_path = /obj/item/circuitboard/algae_farm
	sort_string = "HABAE"

/datum/design/circuit/thermoregulator
	name = "thermal regulator"
	id = "thermoregulator"
	req_tech = list(TECH_ENGINEERING = 4, TECH_POWER = 3)
	build_path = /obj/item/circuitboard/thermoregulator
	sort_string = "HABAF"

/datum/design/circuit/bomb_tester
	name = "Explosive Effect Simulator"
	id = "bomb_tester"
	req_tech = list(TECH_PHORON = 3, TECH_DATA = 2, TECH_MAGNET = 2)
	build_path = /obj/item/circuitboard/bomb_tester
	sort_string = "HABAG"

/datum/design/circuit/quantum_pad
	name = "Quantum Pad"
	id = "quantum_pad"
	req_tech = list(TECH_ENGINEERING = 4, TECH_POWER = 4, TECH_BLUESPACE = 4)
	build_path = /obj/item/circuitboard/quantumpad
	sort_string = "HABAH"

//////Micro mech stuff
/datum/design/circuit/mecha/gopher_main
	name = "'Gopher' central control"
	id = "gopher_main"
	build_path = /obj/item/circuitboard/mecha/gopher/main
	sort_string = "NAAEA"

/datum/design/circuit/mecha/gopher_peri
	name = "'Gopher' peripherals control"
	id = "gopher_peri"
	build_path = /obj/item/circuitboard/mecha/gopher/peripherals
	sort_string = "NAAEB"

/datum/design/circuit/mecha/polecat_main
	name = "'Polecat' central control"
	id = "polecat_main"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/circuitboard/mecha/polecat/main
	sort_string = "NAAFA"

/datum/design/circuit/mecha/polecat_peri
	name = "'Polecat' peripherals control"
	id = "polecat_peri"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/circuitboard/mecha/polecat/peripherals
	sort_string = "NAAFB"

/datum/design/circuit/mecha/polecat_targ
	name = "'Polecat' weapon control and targeting"
	id = "polecat_targ"
	req_tech = list(TECH_DATA = 4, TECH_COMBAT = 2)
	build_path = /obj/item/circuitboard/mecha/polecat/targeting
	sort_string = "NAAFC"

/datum/design/circuit/mecha/weasel_main
	name = "'Weasel' central control"
	id = "weasel_main"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/circuitboard/mecha/weasel/main
	sort_string = "NAAGA"

/datum/design/circuit/mecha/weasel_peri
	name = "'Weasel' peripherals control"
	id = "weasel_peri"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/circuitboard/mecha/weasel/peripherals
	sort_string = "NAAGB"

/datum/design/circuit/mecha/weasel_targ
	name = "'Weasel' weapon control and targeting"
	id = "weasel_targ"
	req_tech = list(TECH_DATA = 4, TECH_COMBAT = 2)
	build_path = /obj/item/circuitboard/mecha/weasel/targeting
	sort_string = "NAAGC"

////// RIGSuit Stuff
/*
/datum/design/item/rig
	req_tech = list(TECH_MATERIAL = 5, TECH_POWER = 5, TECH_MAGNET = 5)
	materials = list(MAT_STEEL = 6000, MAT_GLASS = 6000, MAT_SILVER = 6000, MAT_URANIUM = 4000)

/datum/design/item/rig/eva
	name = "eva hardsuit (empty)"
	id = "eva_hardsuit"
	build_path = /obj/item/rig/eva
	sort_string = "HCAAA"

/datum/design/item/rig/mining
	name = "industrial hardsuit (empty)"
	id = "ind_hardsuit"
	build_path = /obj/item/rig/industrial
	sort_string = "HCAAB"

/datum/design/item/rig/research
	name = "ami hardsuit (empty)"
	id = "ami_hardsuit"
	build_path = /obj/item/rig/hazmat
	sort_string = "HCAAC"

/datum/design/item/rig/medical
	name = "medical hardsuit (empty)"
	id = "med_hardsuit"
	build_path = /obj/item/rig/medical
	sort_string = "HCAAD"
*/

/datum/design/item/rig_module
	req_tech = list(TECH_MATERIAL = 5, TECH_POWER = 5, TECH_MAGNET = 5)
	materials = list(MAT_STEEL = 6000, MAT_GLASS = 6000, MAT_SILVER = 4000, MAT_URANIUM = 2000)

/datum/design/item/rig_module/plasma_cutter
	name = "rig module - plasma cutter"
	id = "rigmod_plasmacutter"
	build_path = /obj/item/rig_module/device/plasmacutter
	sort_string = "HCAAE"

/datum/design/item/rig_module/diamond_drill
	name = "rig module - diamond drill"
	id = "rigmod_diamonddrill"
	build_path = /obj/item/rig_module/device/drill
	sort_string = "HCAAF"

/datum/design/item/rig_module/maneuvering_jets
	name = "rig module - maneuvering jets"
	id = "rigmod_maneuveringjets"
	build_path = /obj/item/rig_module/maneuvering_jets
	sort_string = "HCAAG"

/datum/design/item/rig_module/anomaly_scanner
	name = "rig module - anomaly scanner"
	id = "rigmod_anomalyscanner"
	build_path = /obj/item/rig_module/device/anomaly_scanner
	sort_string = "HCAAH"

/datum/design/item/rig_module/orescanner
	name = "rig module - ore scanner"
	id = "rigmod_orescanner"
	build_path = /obj/item/rig_module/device/orescanner
	sort_string = "HCAAI"

/datum/design/item/rig_module/orescanneradv
	name = "rig module - adv. ore scanner"
	id = "rigmod_orescanner_adv"
	build_path = /obj/item/rig_module/device/orescanner/advanced
	sort_string = "HCAAJ"
