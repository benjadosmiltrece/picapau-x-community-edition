extends ColorRect

var transition = false
var progress = 0.0  # Starting at 0
var bus_name = "AnalyzerBus"
var effect_index = 0
var min_db = -60  # Minimum volume in dB (very quiet)
var max_db = 0    # Maximum volume in dB (loudest)
var scale_factor = 0.2  # Starting scale factor
var scale_increment = 0.175  # How much to increment the scale per frame
var min_scale = 0.2 # Minimum scale limit
var max_scale = 0.55  # Maximum scale limit
@onready var shader_material = $".".material
func _ready() -> void:
	shader_material.set("shader_param/screen_size", Vector2(get_viewport().size.x, get_viewport().size.y))

func _process(delta):
	var bus_index = AudioServer.get_bus_index(bus_name)
	var analyzer = AudioServer.get_bus_effect_instance(bus_index, effect_index)
	
	if analyzer and analyzer is AudioEffectSpectrumAnalyzerInstance:
		var volume = analyzer.get_magnitude_for_frequency_range(20, 20000)
		if volume[0] > 0:
			var volume_db = linear_to_db(volume[0])
			print("Volume in dB: ", volume_db)
			
			# Normalize the volume_db to a 0 to 1 range
			var normalized_db = (volume_db - min_db) / (max_db - min_db)
			normalized_db = clamp(normalized_db, 0, 1)  # Ensure normalized_db stays in a reasonable range
			
			# Adjust scale factor based on normalized_db, but control the scaling rate
			var target_scale = lerp(min_scale, max_scale, pow(normalized_db, 2))  # Calculate target scale
			scale_factor = lerp(scale_factor, target_scale, scale_increment)  # Smoothly interpolate to target scale
			if transition:
				if progress < 1.0:
					progress += 0.5 * delta
					material.set("shader_parameter/scale", lerp(scale_factor / 3, 1.0, progress));
					material.set("shader_parameter/smoothness", lerp(0.37 / 3, 1.0, progress));
			else:
				material.set("shader_parameter/scale",scale_factor / 3);
	
	if material.get("shader_parameter/smoothness") > 0.7:
		$"../loading".visible = true
	if material.get("shader_parameter/smoothness") >= 1:
		get_tree().change_scene_to_file("res://worlds/slotMachine.tscn")
