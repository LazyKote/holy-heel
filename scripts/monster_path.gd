extends PathFollow2D
var speed = 80
@onready var monster = $Monster

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monster.anim.play("walking")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	progress +=0.75
