back link:[[CORE]]

Properties:
var IsInDialogue = false (false by default)
var Interact := [] (an empty array by default)
var previousScene = "" (empty by default)

When loaded an `InterractArray` is created by calling `InputMap.action_get_events("Interact")`.
Then, we separate the array by adding the PC and Console key-bind to the `Interract` array with 
`Interact.append(InteractArray[0].as_text().rstrip(" (Physical)"))` and `Interact.append(InteractArray[1].as_text())`. The `rstrip(" Physical")` is only done on the PC bind as the Console bind contains multiple binds for different controllers.

The variable `IsInDialogue` is used by [[NPCS]] to avoid starting multiple dialogue instances at once.

`previousScene` is required so we know where to put the player in the next scene that the player enters (for example: exiting from a house puts you to the door and not on the other side of the map were the player is supposed to enter from their "farm").