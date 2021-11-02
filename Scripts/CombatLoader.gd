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

onready var m_nPlayerTeam: Team = get_tree().get_nodes_in_group("PlayerTeam")[0]
onready var m_nEnemyTeam: Team = get_tree().get_nodes_in_group("EnemyTeam")[0]

func _ready():
	for iUnit in range(4):
		m_nPlayerTeam.add_unit(PLAYER_UNIT_SCENES[iUnit].instance())
		m_nEnemyTeam.add_unit(ENEMY_UNIT_SCENES[iUnit].instance())
