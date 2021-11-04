extends Node2D

export var m_fZoomFactor: Vector2 = Vector2(0.8, 0.8)
export var m_fZoomInDuration: float = 0.1
export var m_fZoomOutDuration: float = 0.5

onready var m_nCamera: Camera2D = get_parent()

onready var m_nTween: Tween = $Tween

func zoom_in():
	m_nTween.interpolate_property(m_nCamera, "zoom", Vector2(1, 1), m_fZoomFactor, m_fZoomInDuration,
								Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	m_nTween.start()

func zoom_out():
	m_nTween.interpolate_property(m_nCamera, "zoom", m_fZoomFactor, Vector2(1, 1), m_fZoomOutDuration,
								Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	m_nTween.start()
