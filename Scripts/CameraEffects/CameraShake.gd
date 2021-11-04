extends Node2D

export var m_fDuration: float = 0.5
export var m_fFrequency: float = 15
export var m_fAmplitude: float = 16

onready var m_nCamera: Camera2D = get_parent().get_parent().get_node("Camera2D")

onready var m_nTween: Tween = $Tween
onready var m_nDurationTimer: Timer = $DurationTimer
onready var m_nFrequencyTimer: Timer = $FrequencyTimer

func _ready():
	m_nDurationTimer.connect("timeout", self, "_on_duration_timer_timeout")
	m_nFrequencyTimer.connect("timeout", self, "_on_frequency_timer_timeout")

func shake():
	m_nDurationTimer.start(m_fDuration)
	m_nFrequencyTimer.start(1 / m_fFrequency)
	_new_shake()

func _new_shake():
	var nRandomAmplitude: Vector2 = Vector2(rand_range(-m_fAmplitude, m_fAmplitude),
											rand_range(-m_fAmplitude, m_fAmplitude))
	
	m_nTween.interpolate_property(m_nCamera, "offset", m_nCamera.offset, nRandomAmplitude,
								1 / m_fFrequency, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	m_nTween.start()

func _on_duration_timer_timeout():
	m_nTween.interpolate_property(m_nCamera, "offset", m_nCamera.offset, Vector2.ZERO,
								1 / m_fFrequency, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	m_nTween.start()
	m_nFrequencyTimer.stop()

func _on_frequency_timer_timeout():
	_new_shake()
