extends Node2D

export var m_fEffectDuration: float = 0.5

onready var m_nPlayerTeam: Team = get_tree().get_nodes_in_group("PlayerTeam")[0]
onready var m_nEnemyTeam: Team = get_tree().get_nodes_in_group("EnemyTeam")[0]

onready var m_nVignette: TextureRect = $Vignette
onready var m_nEffectTimer: Timer = $EffectTimer

onready var m_nMoveUnitsScript: Node2D = $Effects/MoveUnits
onready var m_nCameraZoom: Node2D = $Effects/CameraZoom
onready var m_nCameraShake: Node2D = $Effects/CameraShake
onready var m_nCameraTilt: Node2D = $Effects/CameraTilt
onready var m_nCameraPan: Node2D = $Effects/CameraPan

onready var m_bIsFreezing: bool = false

func _ready():
	m_nEffectTimer.connect("timeout", self, "_on_effect_timer_timeout")

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("ui_accept"):
			if !m_bIsFreezing:
				var bIsPlayerAttacking: bool = true if randf() > 0.5 else false
				
				m_nMoveUnitsScript.move_in(bIsPlayerAttacking)
				m_nCameraZoom.zoom_in()
				m_nCameraShake.shake()
				m_nCameraTilt.tilt(bIsPlayerAttacking)
				m_nCameraPan.start(bIsPlayerAttacking)
				
				m_bIsFreezing = true
				m_nVignette.visible = true
				
				m_nEffectTimer.start()

func _on_effect_timer_timeout():
	m_nMoveUnitsScript.move_out()
	m_nCameraZoom.zoom_out()
	m_nCameraTilt.reset()
	m_nCameraPan.stop()
	m_bIsFreezing = false
	m_nVignette.visible = false
