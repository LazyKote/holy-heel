extends Area2D

var turret_path = preload("res://scenes/turret.tscn")
var is_occupied = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is Player and not is_occupied:
		is_occupied = true
		var turret = turret_path.instantiate()
		turret.position = self.global_position
		get_parent().call_deferred("add_child", turret)
