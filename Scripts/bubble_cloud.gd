extends Node2D
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D

func _ready() -> void:
	gpu_particles_2d.emitting = true

func _on_gpu_particles_2d_finished() -> void:
	gpu_particles_2d.emitting = false
	queue_free()
