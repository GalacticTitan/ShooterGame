extends CanvasLayer

var green: Color = Color("6bbfa3")
var red: Color = Color(0.9, 0, 0, 1)

@onready var laser_label: Label = $WeaponContainer/GridContainer/LaserLabel
@onready var grenade_label: Label = $WeaponContainer/GridContainer/GrenadeLabel
@onready var laser_icon: TextureRect = $WeaponContainer/GridContainer/LaserIcon
@onready var grenade_icon: TextureRect = $WeaponContainer/GridContainer/GrenadeIcon
@onready var health_bar: TextureProgressBar = $MarginContainer/TextureProgressBar

func _ready():
	Globals.connect("health_change", update_health_progress)
	Globals.connect("grenade_change", update_grenade_text)
	Globals.connect("laser_change", update_laser_text)
	update_grenade_text()
	update_laser_text()
	update_health_progress()

func update_laser_text():
	var amount = Globals.laser_amount;
	laser_label.text = str(amount)
	update_color(amount, laser_label, laser_icon)


func update_grenade_text():
	var amount = Globals.grenade_amount;
	grenade_label.text = str(amount)
	update_color(amount, grenade_label, grenade_icon)
	
func update_health_progress():
	health_bar.value = Globals.health
	
func update_color(amount: int, label: Label, icon: TextureRect) -> void:
	if amount > 0:
		label.modulate = green
		icon.modulate = green
	else :
		label.modulate = red
		icon.modulate = red
