##this just displays an item, nothing more, nothing less
class_name ItemDisplay
extends TextureButton

var SetSize : bool
const Scene : PackedScene = preload("uid://b5rfxy62u8ot3")


var ItemRepresentation : Item:
	set(value):
		if SetSize:
			size = Item.GridToPosition(value.Size)
		texture_normal = value.GetDisplay()
		ItemRepresentation = value
		$Label.visible = value.Stack != 1
		$Label.text = str(value.Stack)

static func NewDisplay(Representation : Item, Size : bool) -> ItemDisplay:
	var display : ItemDisplay = Scene.instantiate()
	display.SetSize = Size
	display.ItemRepresentation = Representation
	return display
