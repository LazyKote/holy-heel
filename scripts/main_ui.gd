class_name MainUI extends CanvasLayer


@export var wave_counter_label : Label
@export var money_label : Label
@export var pause : MarginContainer


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		pause.visible = !pause.visible
		get_tree().paused = pause.visible


func wave_counter_update(wave_number):
	wave_counter_label.text = str(wave_number)


func money_label_update(money_number):
	money_label.text = str(money_number)
