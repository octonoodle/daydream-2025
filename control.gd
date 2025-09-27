# CustomCursor.gd
# Attach this script to a Control node or CanvasLayer

extends Control

@onready var cursor_sprite: TextureRect

func _ready():
	# Hide the system cursor
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	# Create the cursor sprite
	cursor_sprite = TextureRect.new()
	add_child(cursor_sprite)
	
	# Load cursor texture (you'll need to add a cursor image to your project)
	# Replace "res://cursor.png" with your cursor image path
	var cursor_texture = load("res://back1 (1).png")  # Using Godot icon as placeholder
	cursor_sprite.texture = cursor_texture
	
	# Set cursor properties
	cursor_sprite.custom_minimum_size = Vector2(32, 32)  # Adjust size as needed
	cursor_sprite.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	
	# Make sure cursor stays on top
	z_index = 1000
	
	# Optional: Set anchor to center the cursor on mouse position
	cursor_sprite.anchor_left = 0.5
	cursor_sprite.anchor_top = 0.5
	cursor_sprite.anchor_right = 0.5
	cursor_sprite.anchor_bottom = 0.5

func _process(_delta):
	# Update cursor position to follow mouse
	var mouse_pos = get_global_mouse_position()
	cursor_sprite.global_position = mouse_pos - cursor_sprite.size / 2

func _input(event):
	# Optional: Change cursor appearance on click
	if event is InputEventMouseButton:
		if event.pressed:
			cursor_sprite.modulate = Color(0.8, 0.8, 0.8)  # Slightly darker when clicked
		else:
			cursor_sprite.modulate = Color.WHITE

# Call this function to show system cursor again (useful for debugging)
func show_system_cursor():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
# Call this function to hide system cursor again
func hide_system_cursor():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
