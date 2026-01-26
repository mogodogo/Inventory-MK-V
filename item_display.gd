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

func DisplayItem(ItemImage : Item) -> void:
	texture_normal = ItemImage.GetDisplay()

static func NewDisplay(Representation : Item) -> ItemDisplay:
	var display : ItemDisplay = SceneReference.instantiate()
	display.ItemRepresentation = Representation
	return display
