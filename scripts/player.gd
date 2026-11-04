extends CharacterBody2D
@onready var player_animation = $AnimatedSprite2D
@onready var enemy = $"../Monster"

var bullet_path = preload("res://scenes/bullet.tscn")
const speed = 250.0
var _facing: String = "down"
var spawn_location = Vector2(0, 0)

func _ready() -> void:
	enemy.attack.connect(on_enemy_attack)

func get_input():
	var input_dir = Input.get_vector("go_left", "go_right", "go_up", "go_down")
	velocity = input_dir * speed
	_update_animation(input_dir)

func _physics_process(delta):
	#look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("fire"):
		fire()
		
	get_input()
	move_and_slide()
	
func _update_animation(input_dir: Vector2) -> void:
	if input_dir == Vector2.ZERO:
		player_animation.play("idle_" + _facing)
		return

	if abs(input_dir.x) > abs(input_dir.y):
		_facing = "right" if input_dir.x > 0 else "left"
	else:
		_facing = "down" if input_dir.y > 0 else "up"

	player_animation.play("walk_" + _facing)

func on_enemy_attack():
	global_position = spawn_location

func fire():
	var bullet = bullet_path.instantiate()
	bullet.dir = rotation
	bullet.pos = $Gun.global_position
	bullet.rot = global_rotation
	get_parent().add_child(bullet)
