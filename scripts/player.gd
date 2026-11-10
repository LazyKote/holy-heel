class_name Player extends CharacterBody2D


const speed = 200.0

var bullet_path = preload("res://scenes/bullet.tscn")
var _facing: String = "down"
var spawn_location = Vector2(0, 0)
var mouse_position
var direction_vector : Vector2

@onready var player_animation = $AnimatedSprite2D
@onready var gun_timer = $Gun/GunTimer
@onready var gun = $Gun
@onready var gun_anim = $Gun/AnimatedSprite2D
@onready var gun_sound = $Gun/AudioStreamPlayer2D
@onready var step_sound = $Step
@onready var death_sound = $Death

func _ready() -> void:
	pass


func get_input():
	var input_dir = Input.get_vector("go_left", "go_right", "go_up", "go_down")
	velocity = input_dir * speed
	_update_animation(input_dir)
	


func _physics_process(delta):
	if Input.is_action_pressed("fire"):
		fire()
	gun.look_at(get_global_mouse_position())
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


#func _on_enemy_attack():
	#global_position = spawn_location

func kill() -> void:
	print_debug("Kill Player")
	death_sound.play()
	global_position = spawn_location


func fire():
	if not gun_timer.is_stopped():
		return
	var bullet = bullet_path.instantiate()
	gun_sound.play()
	var mouse_pos = get_global_mouse_position()
	var aim_angle = global_position.angle_to_point(mouse_pos)
	bullet.dir = aim_angle
	bullet.pos = $Gun.global_position
	bullet.rot = aim_angle
	get_parent().add_child(bullet)
	gun_timer.start()
	gun_anim.play("fire")
