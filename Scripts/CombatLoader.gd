extends Node2D

const PLAYER_UNIT_SCENES = [
	preload("res://Scenes/PlayerUnits/MartialHero.tscn"),
	preload("res://Scenes/PlayerUnits/BlueWitch.tscn"),
	preload("res://Scenes/PlayerUnits/Huntress.tscn"),
	preload("res://Scenes/PlayerUnits/Wizard.tscn"),
]

const ENEMY_UNIT_SCENES = [
	preload("res://Scenes/EnemyUnits/Skeleton.tscn"),
	preload("res://Scenes/EnemyUnits/Goblin.tscn"),
	preload("res://Scenes/EnemyUnits/Mushroom.tscn"),
	preload("res://Scenes/EnemyUnits/FlyingEye.tscn")
]

onready var m_nPlayerUnits: Node2D = get_tree().get_nodes_in_group("PlayerUnits")[0]
onready var m_nEnemyUnits: Node2D = get_tree().get_nodes_in_group("EnemyUnits")[0]

func _ready():
	for iUnit in range(4):
		var nPlayerUnit: Unit = PLAYER_UNIT_SCENES[iUnit].instance()
		var nEnemyUnit: Unit = ENEMY_UNIT_SCENES[iUnit].instance()
		
		nPlayerUnit.position.x = -iUnit * VISUAL_CONSTS.DISTANCE_BETWEEN_UNIT
		nEnemyUnit.position.x = iUnit * VISUAL_CONSTS.DISTANCE_BETWEEN_UNIT
		nEnemyUnit.scale.x = -1
		
		m_nPlayerUnits.add_child(nPlayerUnit)
		m_nEnemyUnits.add_child(nEnemyUnit)
