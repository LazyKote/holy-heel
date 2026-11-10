extends PathFollow2D
var speed = 30
@onready var monster = $Monster

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monster.anim.play("walking")
	monster.monster_died.connect(on_monster_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	progress += speed * delta

func on_monster_died():
	set_physics_process(false)
