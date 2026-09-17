extends CharacterBody2D

@export var speed := 200.0
@export var attack_frame_time := 0.05  
@export var idle_frame_time := 0.15    
@export var walk_frame_time := 0.1     

@onready var icon: Sprite2D = $"Icon(Sprite2D)"
@onready var attack_area: Area2D = $"AttackArea(Area2D)"
@onready var attack_shape: CollisionShape2D = $"AttackArea(Area2D)/CollisionShape2D"
@onready var slash_effect: Sprite2D = $"AttackArea(Area2D)/SlashEffect(Sprite2D)"


var idle_texture := preload("res://Assets/Player/Dark_Hatman_Topdown_Character/Animations/Idle/darkhatman_idle_sheet_64x64.png")
var walk_texture := preload("res://Assets/Player/Dark_Hatman_Topdown_Character/Animations/Walk/darkhatman_walk_sheet_64x64.png")
var attack_texture := preload("res://Assets/Player/Dark_Hatman_Topdown_Character/Animations/Attack_Without_Effect/darkhatman_attack_sheet_64x64.png")
var slash_texture := preload("res://Assets/Player/Dark_Hatman_Topdown_Character/Animations/AttackEffect/attackeffect_sheet_64x64t.png")


const IDLE_ROWS := 4    
const WALK_ROWS := 8    
const ATTACK_ROWS := 4  
const SLASH_ROWS := 3   


const ATTACK_HITBOX_DISTANCE := 24.0

var is_attacking := false
var last_direction := Vector2.DOWN  

var anim_frame := 0
var anim_timer := 0.0

func _ready():
	
	attack_area.position = Vector2.ZERO
	attack_shape.position = Vector2(0, ATTACK_HITBOX_DISTANCE)
	attack_shape.disabled = true
	
	slash_effect.texture = slash_texture
	slash_effect.hframes = 4
	slash_effect.vframes = SLASH_ROWS
	slash_effect.position = Vector2.ZERO
	slash_effect.scale = icon.scale
	slash_effect.visible = false
	
	
	icon.texture = idle_texture
	icon.hframes = 4
	icon.vframes = IDLE_ROWS
	icon.flip_h = false
	icon.frame = 0 * 4 + _get_dir_col(last_direction)

func _physics_process(delta):
	if is_attacking:
		move_and_slide()
		return

	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()

	if direction != Vector2.ZERO:
		last_direction = direction
		_animate_walk(delta)
	else:
		_animate_idle(delta)

	if Input.is_action_just_pressed("attack"):
		do_attack()

func _get_dir_col(dir: Vector2) -> int:
	
	if abs(dir.x) > abs(dir.y):
		return 2 if dir.x > 0 else 3
	else:
		return 1 if dir.y < 0 else 0

func _animate_idle(delta):
	if icon.texture != idle_texture:
		icon.texture = idle_texture
		icon.hframes = 4
		icon.vframes = IDLE_ROWS
		anim_frame = 0
		anim_timer = 0.0

	var col := _get_dir_col(last_direction)
	icon.flip_h = false

	anim_timer += delta
	if anim_timer >= idle_frame_time:
		anim_timer = 0.0
		anim_frame = (anim_frame + 1) % IDLE_ROWS

	icon.frame = anim_frame * 4 + col

func _animate_walk(delta):
	if icon.texture != walk_texture:
		icon.texture = walk_texture
		icon.hframes = 4
		icon.vframes = WALK_ROWS
		anim_frame = 0
		anim_timer = 0.0

	var col := _get_dir_col(last_direction)
	icon.flip_h = false

	anim_timer += delta
	if anim_timer >= walk_frame_time:
		anim_timer = 0.0
		anim_frame = (anim_frame + 1) % WALK_ROWS

	icon.frame = anim_frame * 4 + col

func do_attack():
	is_attacking = true
	velocity = Vector2.ZERO

	var col := _get_dir_col(last_direction)

	var hitbox_offset := Vector2.ZERO
	match col:
		0:
			hitbox_offset = Vector2(0, ATTACK_HITBOX_DISTANCE)
		1:
			hitbox_offset = Vector2(0, -ATTACK_HITBOX_DISTANCE)
		2:
			hitbox_offset = Vector2(ATTACK_HITBOX_DISTANCE, 0)
		3:
			hitbox_offset = Vector2(-ATTACK_HITBOX_DISTANCE, 0)

	attack_area.position = Vector2.ZERO
	attack_shape.position = hitbox_offset

	
	icon.texture = attack_texture
	icon.hframes = 4
	icon.vframes = ATTACK_ROWS
	icon.flip_h = false

	slash_effect.texture = slash_texture
	slash_effect.hframes = 4
	slash_effect.vframes = SLASH_ROWS
	slash_effect.position = Vector2.ZERO
	slash_effect.scale = icon.scale
	slash_effect.flip_h = false


	icon.frame = 0 * 4 + col
	slash_effect.visible = false
	attack_shape.disabled = true
	await get_tree().create_timer(attack_frame_time).timeout
	if not is_inside_tree():
		return


	icon.frame = 1 * 4 + col
	slash_effect.frame = 0 * 4 + col
	slash_effect.visible = true
	attack_shape.disabled = false
	await get_tree().create_timer(attack_frame_time).timeout
	if not is_inside_tree():
		return


	icon.frame = 2 * 4 + col
	slash_effect.frame = 1 * 4 + col
	slash_effect.visible = true
	attack_shape.disabled = false
	await get_tree().create_timer(attack_frame_time).timeout
	if not is_inside_tree():
		return


	icon.frame = 3 * 4 + col
	slash_effect.frame = 2 * 4 + col
	slash_effect.visible = true
	attack_shape.disabled = true
	await get_tree().create_timer(attack_frame_time).timeout
	if not is_inside_tree():
		return


	slash_effect.visible = false
	attack_shape.disabled = true
	is_attacking = false

	icon.texture = idle_texture
	icon.hframes = 4
	icon.vframes = IDLE_ROWS
	anim_frame = 0
	anim_timer = 0.0
	icon.frame = 0 * 4 + col
