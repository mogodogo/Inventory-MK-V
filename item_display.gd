class_name ItemDisplay
extends TextureButton

const SceneReference : PackedScene = preload("res://item_display.tscn")

var ItemRepresentation : Item:
	set(value):
		size = Item.GridToPosition(value.Size)
		texture_normal = value.GetDisplay()
		ItemRepresentation = value
		$Label.visible = value.Stack != 1
		$Label.text = str(value.Stack)

static func NewDisplay(Representation : Item) -> ItemDisplay:
	var display : ItemDisplay = SceneReference.instantiate()
	display.ItemRepresentation = Representation
	return display
