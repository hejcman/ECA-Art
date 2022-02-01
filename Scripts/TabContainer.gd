extends TabContainer


func _ready():
	self.set_popup(self.get_node("WindowDialog"))


func _input(event):
	if event.is_action_pressed("discard_canvas"):
		self.remove_child(self.get_current_tab_control())


func new_drawing(name, width, height, background, path):
	var tab = Tabs.new()
	var viewport = load("SystemViewport.tscn").instance()
	viewport.path = path
	viewport.width = int(width)
	viewport.height = int(height)
	viewport.background = background
	tab.name = name
	tab.tab_close_display_policy = Tabs.CLOSE_BUTTON_SHOW_ALWAYS
	tab.add_child(viewport)
	self.add_child(tab)
