extends Node2D

onready var m_nPlayerTeam: Node2D = get_tree().get_nodes_in_group("PlayerTeam")[0]
onready var m_nEnemyTeam: Node2D = get_tree().get_nodes_in_group("EnemyTeam")[0]

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
				
				m_nFreezePlayerUnit = m_nPlayerTeam.get_child(m_iFreezePlayerUnitIndex)
				m_nFreezeEnemyUnit = m_nEnemyTeam.get_child(m_iFreezeEnemyUnitIndex)
				
				m_nPlayerTeam.remove_child(m_nFreezePlayerUnit)
				m_nEnemyTeam.remove_child(m_nFreezeEnemyUnit)
				
				add_child(m_nFreezePlayerUnit)
				add_child(m_nFreezeEnemyUnit)
			else:
				remove_child(m_nFreezePlayerUnit)
				remove_child(m_nFreezeEnemyUnit)
				
				m_nPlayerTeam.add_child(m_nFreezePlayerUnit)
				m_nPlayerTeam.move_child(m_nFreezePlayerUnit, m_iFreezePlayerUnitIndex)
				m_nEnemyTeam.add_child(m_nFreezeEnemyUnit)
				m_nEnemyTeam.move_child(m_nFreezeEnemyUnit, m_iFreezeEnemyUnitIndex)
				
				m_nFreezePlayerUnit = null
				m_nFreezeEnemyUnit = null
				
			m_bIsFreezing = !m_bIsFreezing
			m_nVignette.visible = m_bIsFreezing
