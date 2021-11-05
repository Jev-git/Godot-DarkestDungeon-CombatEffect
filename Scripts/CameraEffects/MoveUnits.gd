extends Node2D

export var m_fMoveInDuration: float = 0.03
export var m_fMoveOutDuration: float = 0.3

onready var m_nPlayerTeam: Team = get_tree().get_nodes_in_group("PlayerTeam")[0]
onready var m_nEnemyTeam: Team = get_tree().get_nodes_in_group("EnemyTeam")[0]

onready var m_nTween: Tween = get_parent().get_node("Tween")

var m_nFreezePlayerUnit: Unit
var m_nFreezeEnemyUnit: Unit
var m_fFreezePlayerUnitOrigianlPos: Vector2
var m_fFreezeEnemyUnitOrigianlPos: Vector2
var m_bIsPlayerAttacking: bool

signal moved

func move_in(_bIsPlayerAttacking: bool):
	m_nFreezePlayerUnit = m_nPlayerTeam.get_child(randi() % 4)
	m_nFreezeEnemyUnit = m_nEnemyTeam.get_child(randi() % 4)
	
	m_fFreezePlayerUnitOrigianlPos = m_nFreezePlayerUnit.position
	m_fFreezeEnemyUnitOrigianlPos = m_nFreezeEnemyUnit.position
	
	m_nFreezePlayerUnit.set_z_index(10)
	m_nFreezeEnemyUnit.set_z_index(10)
	
	for nUnit in m_nPlayerTeam.get_children():
		nUnit.stop_anim()
	for nUnit in m_nEnemyTeam.get_children():
		nUnit.stop_anim()
	
	m_bIsPlayerAttacking = _bIsPlayerAttacking
	if m_bIsPlayerAttacking:
		m_nFreezePlayerUnit.play_anim("Skill1")
		m_nFreezeEnemyUnit.play_anim("TakeDamage")
	else:
		m_nFreezeEnemyUnit.play_anim("Skill1")
		m_nFreezePlayerUnit.play_anim("TakeDamage")
	
	if (m_bIsPlayerAttacking and m_nFreezePlayerUnit.is_melee_skill("Skill1")) or \
		(!m_bIsPlayerAttacking and m_nFreezeEnemyUnit.is_melee_skill("Skill1")):
		m_nTween.interpolate_property(m_nFreezePlayerUnit, "position",
									m_nFreezePlayerUnit.position, Vector2.ZERO,
									m_fMoveInDuration, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		m_nTween.interpolate_property(m_nFreezeEnemyUnit, "position",
									m_nFreezeEnemyUnit.position, Vector2.ZERO,
									m_fMoveInDuration, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		m_nTween.start()
func move_out():
	m_nFreezePlayerUnit.set_z_index(0)
	m_nFreezeEnemyUnit.set_z_index(0)
	
	if (m_bIsPlayerAttacking and m_nFreezePlayerUnit.is_melee_skill("Skill1")) or \
		(!m_bIsPlayerAttacking and m_nFreezeEnemyUnit.is_melee_skill("Skill1")):
		m_nTween.interpolate_property(m_nFreezePlayerUnit, "position",
									m_nFreezePlayerUnit.position, m_fFreezePlayerUnitOrigianlPos,
									m_fMoveOutDuration, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		m_nTween.interpolate_property(m_nFreezeEnemyUnit, "position",
									m_nFreezeEnemyUnit.position, m_fFreezeEnemyUnitOrigianlPos,
									m_fMoveOutDuration, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		m_nTween.start()
	
	for nUnit in m_nPlayerTeam.get_children():
		nUnit.play_anim("Idle")
	for nUnit in m_nEnemyTeam.get_children():
		nUnit.play_anim("Idle")
