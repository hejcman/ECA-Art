extends Control

var playing = false
var rng = RandomNumberGenerator.new()
var color_threshold = 0.5
var continuous = false

var path = "res://screenshot-test.png"
var height = 0
var width = 0
var background = Color.black

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func dec2bin(var decimal_value):
	var binary_string = "" 
	var temp 
	var count = 7 # Checking up to 7 bits 
	while(count >= 0):
		temp = decimal_value >> count 
		if(temp & 1):
			binary_string = binary_string + "1"
		else:
			binary_string = binary_string + "0"
		count -= 1
	return binary_string


func generate_random_color() -> Color:
	var h = rng.randf_range(0.0, 1.0)
	var s = rng.randf_range(0.0, 1.0)
	var v = rng.randf_range(0.0, 1.0)
	return Color.from_hsv(h, s, v)


func get_random_rule_color() -> Color:
	var r = rng.randi_range(0, 7)
	return self.get_node("VBoxContainer/PanelContainer/HBoxContainer/Rule" + str(r)).color


func set_color_rule(rule):
	var binary = dec2bin(rule)
	
	var idx = 0
	for digit in binary:
		if digit == "0":
			self.get_node("VBoxContainer/PanelContainer/HBoxContainer/Rule" + str(7-idx)).color = Color.black
		else:
			self.get_node("VBoxContainer/PanelContainer/HBoxContainer/Rule" + str(7-idx)).color = Color.white
		idx += 1


func _input(event):
	var button = self.get_node("VBoxContainer/PanelContainer/HBoxContainer/Play")
	if event.is_action_pressed("draw_pause"):
		button.pressed = not button.pressed
		_on_PlayButton_pressed()


func _on_PlayButton_pressed():
	playing = not playing


func _on_RandomizeButton_pressed():
	for x in range(8):
		var node = self.get_node("VBoxContainer/PanelContainer/HBoxContainer/Rule" + str(x))
		node.color = generate_random_color()


func _on_TresholdSlider_value_changed(value):
	color_threshold = value



func _save_screenshot():
	var img = self.get_node("VBoxContainer/ViewportContainer/Viewport/ViewportCamera").get_viewport().get_texture().get_data()
	img.flip_y()
	img.save_png("screenshot_" + path)


func _export_canvas():
	var img = self.get_node("VBoxContainer/ViewportContainer/Viewport/DrawingCanvas").get_texture().get_data()
	img.save_png(path)


func _on_Continue_toggled(button_pressed):
	continuous = button_pressed
