extends RigidBody2D
class_name MovableBox

func _integrate_forces(_state: PhysicsDirectBodyState2D) -> void:
	angular_velocity = 0
	rotation_degrees = 0
