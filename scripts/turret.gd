extends Node2D

@onready var target_area = $TurretTargetArea
@onready var fire_timer = $Timer
@onready var turret_sprite = $Turret/AnimatedSprite2D
@onready var shot_sound = $Shot

var enemies_in_range: Array[Node2D] = []
var bullet_path = preload("res://scenes/bullet.tscn")
var current_enemy : Monster 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fire_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_targets()
	if current_enemy:
		var target_angle = global_position.angle_to_point(current_enemy.global_position)
		turret_sprite.global_rotation = lerp_angle(turret_sprite.global_rotation, target_angle, 5.0 * delta)

func fire():
	var bullet = bullet_path.instantiate()
	var aim_angle = turret_sprite.global_rotation
	bullet.dir = aim_angle
	bullet.pos = global_position + Vector2.RIGHT.rotated(aim_angle) * 30
	bullet.rot = aim_angle
	shot_sound.play()
	get_parent().add_child(bullet)

func _on_turret_target_area_area_entered(area: Area2D) -> void:
	if area is Monster:
		enemies_in_range.append(area)

func _on_turret_target_area_area_exited(area: Area2D) -> void:
	enemies_in_range.erase(area)

func update_targets():
	enemies_in_range = enemies_in_range.filter(func(e): return is_instance_valid(e))
	if current_enemy != null:
		if not is_instance_valid(current_enemy) or not current_enemy in enemies_in_range:
			current_enemy = null
	if current_enemy == null and enemies_in_range.size() > 0:
		current_enemy = enemies_in_range[0] as Monster

func _on_timer_timeout() -> void:
	if current_enemy != null:
		fire()
	
