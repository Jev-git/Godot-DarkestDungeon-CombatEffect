extends Node2D
class_name Unit

onready var m_nAnimPlayer: AnimationPlayer = $AnimationPlayer

func _ready():
	m_nAnimPlayer.play("Idle")
