
back link: [[CORE]]

properties:
@export var speed: float = 150.0  (Movement speed)
var pd := 0 (previous direction for animation purposes)

Every frame the players direction is zeroed out by re-declaring it (`var direction:=Vector2.ZERO`).
Next, it is checked whether the player [[Global]].`IsInDialogue`, if not , we listen to the Inputs and take their "strength" with functions provided by the [[Engine]]:
`direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")`
and
`direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")`
The direction is then normalized and applied.

To set the animations and we listen to the Inputs separately, setting the movement animations and the previous direction is noted.
`if (Input.is_action_pressed("ui_left")):`
	`$AnimatedSprite2D.play("walk_left")`
	`pd = 0`
`elif (Input.is_action_pressed("ui_right")):`
	`pd = 1`
	`$AnimatedSprite2D.play("walk_right")`
`elif (Input.is_action_pressed("ui_up")):`
	`pd=1`
	`$AnimatedSprite2D.play("walk_right")`
`elif (Input.is_action_pressed("ui_down")):`
	`pd = 0`
	`$AnimatedSprite2D.play("walk_left")`
We use the previous direction value to set the idle animation when no input is detected
`else:`
	`if(pd == 1):`
		`$AnimatedSprite2D.play("default_right")`
	`else:`
		`$AnimatedSprite2D.play("default_left")` 
