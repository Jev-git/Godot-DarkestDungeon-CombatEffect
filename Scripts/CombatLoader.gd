extends Node2D

export var m_psUnit: PackedScene

onready var m_nPlayerUnits: Node2D = get_tree().get_nodes_in_group("PlayerUnits")[0]
onready var m_nEnemyUnits: Node2D = get_tree().get_nodes_in_group("EnemyUnits")[0]

func _ready():
	for iUnit in range(4):
		var nPlayerUnit: Unit = m_psUnit.instance()
		var nEnemyUnit: Unit = m_psUnit.instance()
		
		nPlayerUnit.position.x = - iUnit * VISUAL_CONSTS.DISTANCE_BETWEEN_UNIT
		nEnemyUnit.position.x = iUnit * VISUAL_CONSTS.DISTANCE_BETWEEN_UNIT
		nEnemyUnit.scale.x = -1
		
		m_nPlayerUnits.add_child(nPlayerUnit)
		m_nEnemyUnits.add_child(nEnemyUnit)
