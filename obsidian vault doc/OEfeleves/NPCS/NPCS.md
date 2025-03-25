back link:[[CORE]]

Properties:
IsPlayerInRange = false (false by default)
Group: `NPC properties`
{
	@export dialogue_resource : Resource
	@export TextureResource : Resource
}

When loaded, the `TextureResource` is set as the texture of the `AnimatedSprite2D`.
[[NPCS]] consist of an `AnimatedSprite2D` and an `Area2D` node, along with an internal boolean variable that tracks whether the player is within range. The script includes two signals from `Area2D`—`on_body_entered()` and `on_body_exited()`—which update this variable accordingly.
Each frame, the script checks if the player is within range and whether they are already engaged in dialogue (tracked by [[Global]].`IsInDialogue`). This prevents multiple dialogues from starting simultaneously. If the player is in range and not already in a dialogue, the script listens for the interact input event (default: "F" key on PC, "A" on console).
When the event is detected, a dialogue starts using `dialogue_resource`. No separate load function is required, as the resource is loaded when assigned as a property. The starting point for the dialogue is set to `"start"` in [[Dialogues]].


NPCS:
[[Jane]]
[[Victor]]