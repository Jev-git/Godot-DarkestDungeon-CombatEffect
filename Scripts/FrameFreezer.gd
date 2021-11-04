extends Node2D

onready var m_nPlayerTeam: Team = get_tree().get_nodes_in_group("PlayerTeam")[0]
onready var m_nEnemyTeam: Team = get_tree().get_nodes_in_group("EnemyTeam")[0]

onready var m_nVignette: TextureRect = $Vignette
onready var m_nFreezeTimer: Timer = $Timer
onready var m_nCamera: Camera2D = $Camera2D
onready var m_nTween: Tween = $Tween
onready var m_nScreenShake: Node2D = $Camera2D/ScreenShake
onready var m_nScreenTilt: Node2D = $Camera2D/ScreenTilt

var m_iFreezePlayerUnitIndex: int
var m_iFreezeEnemyUnitIndex: int
var m_nFreezePlayerUnit: Unit
var m_nFreezeEnemyUnit: Unit

onready var m_bIsFreezing: bool = false

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
				
				m_nFreezePlayerUnit.position.x = -VISUAL_CONSTS.DISTANCE_BETWEEN_UNIT
				m_nFreezeEnemyUnit.position.x = VISUAL_CONSTS.DISTANCE_BETWEEN_UNIT
				
				add_child(m_nFreezePlayerUnit)
				add_child(m_nFreezeEnemyUnit)
				
				m_nFreezePlayerUnit.play_anim("Skill1")
				m_nFreezeEnemyUnit.play_anim("TakeDamage")
				
				for nUnit in m_nPlayerTeam.get_children():
					nUnit.stop_anim()
				for nUnit in m_nEnemyTeam.get_children():
					nUnit.stop_anim()
				
				m_nCamera.zoom = Vector2(0.8, 0.8)
				
				m_nScreenShake.shake()
				m_nScreenTilt.tilt(true)
			else:
				m_nFreezePlayerUnit.play_anim("Idle")
				m_nFreezeEnemyUnit.play_anim("Idle")
				
				remove_child(m_nFreezePlayerUnit)
				remove_child(m_nFreezeEnemyUnit)
				
				m_nPlayerTeam.add_unit_at_pos(m_nFreezePlayerUnit, m_iFreezePlayerUnitIndex)
				m_nEnemyTeam.add_unit_at_pos(m_nFreezeEnemyUnit, m_iFreezeEnemyUnitIndex)
				
				m_nFreezePlayerUnit = null
				m_nFreezeEnemyUnit = null
				
				for nUnit in m_nPlayerTeam.get_children():
					nUnit.resume_anim()
				for nUnit in m_nEnemyTeam.get_children():
					nUnit.resume_anim()
				
				m_nCamera.zoom = Vector2(1, 1)
				m_nScreenTilt.reset()
				
			m_bIsFreezing = !m_bIsFreezing
			m_nVignette.visible = m_bIsFreezing
