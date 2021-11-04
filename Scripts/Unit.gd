extends Node2D
class_name Unit

export var m_bIsSkill1Melee: bool

onready var m_nAnimPlayer: AnimationPlayer = $AnimationPlayer

func _ready():
	m_nAnimPlayer.play("Idle")

func play_anim(_sAnimName: String):
	m_nAnimPlayer.play(_sAnimName)

func stop_anim():
	m_nAnimPlayer.stop()

func is_melee_skill(_sSkillName: String) -> bool:
	return m_bIsSkill1Melee
