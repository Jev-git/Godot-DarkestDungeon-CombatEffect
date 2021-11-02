extends Node2D
class_name Unit

onready var m_nAnimPlayer: AnimationPlayer = $AnimationPlayer

func _ready():
	m_nAnimPlayer.play("Idle")

func play_anim(_sAnimName: String):
	m_nAnimPlayer.play(_sAnimName)
