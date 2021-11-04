extends Node2D

onready var m_nPlayerTeam: Team = get_tree().get_nodes_in_group("PlayerTeam")[0]
onready var m_nEnemyTeam: Team = get_tree().get_nodes_in_group("EnemyTeam")[0]

onready var m_nVignette: TextureRect = $Vignette

onready var m_nMoveUnitsScript: Node2D = $MoveUnits
onready var m_nCameraZoom: Node2D = $Camera2D/CameraZoom
onready var m_nCameraShake: Node2D = $Camera2D/CameraShake
onready var m_nCameraTilt: Node2D = $Camera2D/CameraTilt
onready var m_nCameraPan: Node2D = $Camera2D/CameraPan

onready var m_bIsFreezing: bool = false

func _ready():
	m_nMoveUnitsScript.connect("moved", self, "_on_units_moved")

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("ui_accept"):
			if !m_bIsFreezing:
				m_nMoveUnitsScript.move_in()
				m_nCameraZoom.zoom_in()
				m_nCameraShake.shake()
				m_nCameraTilt.tilt(true)
				m_nCameraPan.start(true)
			else:
				m_nMoveUnitsScript.move_out()
				m_nCameraZoom.zoom_out()
				m_nCameraTilt.reset()
				m_nCameraPan.stop()
				
			m_bIsFreezing = !m_bIsFreezing
			m_nVignette.visible = m_bIsFreezing

