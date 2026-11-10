class_name MainUI extends CanvasLayer


@export var wave_counter_label : Label
@export var money_label : Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func wave_counter_update(wave_number):
	wave_counter_label.text = str(wave_number)

func money_label_update(money_number):
	money_label.text = str(money_number)
