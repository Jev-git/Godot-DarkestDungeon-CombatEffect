extends Node2D
class_name Team

export var m_bIsOnTheRight: bool = false

func add_unit(_nUnit: Unit):
	add_unit_at_pos(_nUnit, get_child_count())

func add_unit_at_pos(_nUnit: Unit, _iPos: int):
	_nUnit.position.x = _iPos * VISUAL_CONSTS.DISTANCE_BETWEEN_UNIT
	_nUnit.position.x *= 1 if m_bIsOnTheRight else -1
	_nUnit.scale.x *= -1 if m_bIsOnTheRight else 1
	add_child(_nUnit)
