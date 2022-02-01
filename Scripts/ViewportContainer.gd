extends ViewportContainer


func _on_ViewportCamera_move_start():
	self.set_default_cursor_shape(6)


func _on_ViewportCamera_move_end():
	self.set_default_cursor_shape(0)
