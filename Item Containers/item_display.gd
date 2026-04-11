##this just displays an item, nothing more, nothing less
class_name ItemDisplay
extends TextureButton

const Scene : PackedScene = preload("uid://gw3bovclhibo")

var ItemRepresentation : Item

func SetDisplay(Representation : Item) -> void:
	assert(Representation)
	texture_normal = Representation.GetDisplay()
	ItemRepresentation = Representation
	$Label.visible = Representation.Stack != 1
	$Label.text = str(Representation.Stack)

static func NewDisplay(Representation : Item, Size : Vector2) -> ItemDisplay:
	var display : ItemDisplay = Scene.instantiate()
	display.size = Size
	display.ItemRepresentation = Representation
	display.SetDisplay(Representation)
	return display
