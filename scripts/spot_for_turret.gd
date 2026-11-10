extends Area2D

var turret_path = preload("res://scenes/turret.tscn")
var is_occupied = false
var player_inside = false

@export var wave_manager : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		player_inside = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		player_inside = false

func _unhandled_input(event: InputEvent) -> void:
	if player_inside and not is_occupied:
		if Input.is_action_just_pressed("interact"):
			build()

func build():
	var money = wave_manager.how_much_money()
	if money < 10:
		return
	is_occupied = true
	wave_manager.subtract_money(10)
	var turret = turret_path.instantiate()
	turret.position = self.global_position
	turret.rotation = self.global_rotation
	get_parent().call_deferred("add_child", turret)
