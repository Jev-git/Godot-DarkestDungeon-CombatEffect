extends Node2D

export var m_fAngle: float = 2

onready var m_nCamera: Camera2D = get_parent()

func tilt(_bToTheRight: bool):
	m_nCamera.set_rotation_degrees(rand_range(0, m_fAngle) * -1 if _bToTheRight else 1)

func reset():
	m_nCamera.set_rotation_degrees(0)
