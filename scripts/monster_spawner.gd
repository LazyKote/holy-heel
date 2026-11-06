extends Node2D
@export var path_follow : PackedScene
@export var total_monster_spawned : int
@export var paths: Array[Path2D]

var monsters : Array[PathFollow2D] = []
var monsters_alive = 0

enum WaveState {PREPARATION, FIGHT, WAVE_END}
var current_state = WaveState.PREPARATION
@export var preparation_time = 10.0
@export var monsters_to_spawn = 2
@export var spawn_delay = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match current_state:
		WaveState.PREPARATION:
			preparation_time -= delta
			if preparation_time <= 0:
				current_state = WaveState.FIGHT
				start_wave()
		WaveState.FIGHT:
			if monsters_alive == 0:
				current_state = WaveState.WAVE_END
		WaveState.WAVE_END:
			preparation_time = 10
			monsters_to_spawn +=2
			current_state = WaveState.PREPARATION

func spawn_monster():
	var c : PathFollow2D = path_follow.instantiate()
	var chosen_path = paths.pick_random()
	chosen_path.add_child(c)
	#total_monster_spawned +=1
	#monsters.append(c)
	
	var monster_node = c.get_node("Monster")
	monster_node.monster_died.connect(om_monster_died)

func om_monster_died():
	monsters_alive -=1

func start_wave():
	monsters_alive += monsters_to_spawn
	for i in range(monsters_to_spawn):
		spawn_monster()
		await get_tree().create_timer(spawn_delay).timeout

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Test"):
		spawn_monster()
