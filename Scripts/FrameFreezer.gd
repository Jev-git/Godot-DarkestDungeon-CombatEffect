extends Node2D

onready var m_nPlayerUnits: Node2D = get_tree().get_nodes_in_group("PlayerUnits")[0]
onready var m_nEnemyUnits: Node2D = get_tree().get_nodes_in_group("EnemyUnits")[0]

onready var m_nVignette: TextureRect = $Vignette
onready var m_nFreezeTimer: Timer = $Timer

var m_iFreezePlayerUnitIndex: int
var m_iFreezeEnemyUnitIndex: int
var m_nFreezePlayerUnit: Unit
var m_nFreezeEnemyUnit: Unit

onready var m_bIsFreezing: bool = false # This one is for DEBUG only

func _ready():
	randomize()

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("ui_accept"):
			if !m_bIsFreezing:
				m_iFreezePlayerUnitIndex = randi() % 4
				m_iFreezeEnemyUnitIndex = randi() % 4
				
				m_nFreezePlayerUnit = m_nPlayerUnits.get_child(m_iFreezePlayerUnitIndex)
				m_nFreezeEnemyUnit = m_nEnemyUnits.get_child(m_iFreezeEnemyUnitIndex)
				
				m_nPlayerUnits.remove_child(m_nFreezePlayerUnit)
				m_nEnemyUnits.remove_child(m_nFreezeEnemyUnit)
				
				add_child(m_nFreezePlayerUnit)
				add_child(m_nFreezeEnemyUnit)
			else:
				remove_child(m_nFreezePlayerUnit)
				remove_child(m_nFreezeEnemyUnit)
				
				m_nPlayerUnits.add_child(m_nFreezePlayerUnit)
				m_nPlayerUnits.move_child(m_nFreezePlayerUnit, m_iFreezePlayerUnitIndex)
				m_nEnemyUnits.add_child(m_nFreezeEnemyUnit)
				m_nEnemyUnits.move_child(m_nFreezeEnemyUnit, m_iFreezeEnemyUnitIndex)
				
				m_nFreezePlayerUnit = null
				m_nFreezeEnemyUnit = null
				
			m_bIsFreezing = !m_bIsFreezing
			m_nVignette.visible = m_bIsFreezing
