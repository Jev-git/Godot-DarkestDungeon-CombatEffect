extends Node2D
class_name Unit

onready var m_nAnimPlayer: AnimationPlayer = $AnimationPlayer

func _ready():
	m_nAnimPlayer.play("Idle")

func play_anim(_sAnimName: String):
	m_nAnimPlayer.play(_sAnimName)

func stop_anim():
	m_nAnimPlayer.stop()

func resume_anim():
	m_nAnimPlayer.play("Idle")
