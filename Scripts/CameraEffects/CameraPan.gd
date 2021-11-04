extends Node2D

export var m_fPanSpeed: float = 10

onready var m_nCamera: Camera2D = get_parent().get_parent().get_node("Camera2D")

onready var m_bIsPanning: bool = false
onready var m_bIsPanningToTheRight: bool = true

func start(_bToTheRight: bool):
	m_bIsPanning = true
	m_bIsPanningToTheRight = _bToTheRight

func stop():
	m_bIsPanning = false
	m_nCamera.offset.x = 0

func _process(delta):
	if m_bIsPanning:
		m_nCamera.offset.x += delta * m_fPanSpeed * 1 if m_bIsPanningToTheRight else -1
