extends ColorRect

@export var player_status: Node
var blur_material: ShaderMaterial

func _ready():
	blur_material = material

func _process(_delta: float):
	if player_status == null:
		return

	# Normalize vision (0.0–1.0 range)
	var vision_ratio = clamp(player_status.vision / 100.0, 0.0, 1.0)

	# Nonlinear falloff: squaring makes low vision feel much worse
	var blur_amount = 1.0 - pow(vision_ratio, 2.0)

	blur_material.set_shader_parameter("blur_strength", blur_amount)
