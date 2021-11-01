extends Node2D

var m_psUnit: PackedScene = preload("res://Scenes/PlayerUnits/BlueWitch.tscn")

const PLAYER_UNIT_SCENES = [
	preload("res://Scenes/PlayerUnits/BlueWitch.tscn"),
	preload("res://Scenes/PlayerUnits/BlueWitch.tscn"),
	preload("res://Scenes/PlayerUnits/BlueWitch.tscn"),
	preload("res://Scenes/PlayerUnits/BlueWitch.tscn")
]

onready var m_nPlayerUnits: Node2D = get_tree().get_nodes_in_group("PlayerUnits")[0]
onready var m_nEnemyUnits: Node2D = get_tree().get_nodes_in_group("EnemyUnits")[0]

func _ready():
	for iUnit in range(4):
		var nPlayerUnit: Unit = PLAYER_UNIT_SCENES[iUnit].instance()
		nPlayerUnit.position.x = -iUnit * VISUAL_CONSTS.DISTANCE_BETWEEN_UNIT
		m_nPlayerUnits.add_child(nPlayerUnit)
	
	for iUnit in range(4):
		var nEnemyUnit: Unit = m_psUnit.instance()
		nEnemyUnit.position.x = iUnit * VISUAL_CONSTS.DISTANCE_BETWEEN_UNIT
		nEnemyUnit.scale.x = -1
		m_nEnemyUnits.add_child(nEnemyUnit)
