extends Node

# Player condition variables
var fingers: int = 5            # Number of fingers (0–5)
var vision: float = 100.0       # Vision clarity/field of view (0–100)
var hearing: float = 100.0      # Hearing clarity (0–100)
var mobility: float = 100.0     # Movement ability (0–100)
var stability: float = 0.0
# Called when the node enters the scene tree
func _ready():
	print_status()

# -------------------------
# Status Modifiers
# -------------------------
func lose_finger(amount: int = 1):
	fingers = max(fingers - amount, 0)
	print("Lost a finger! Current fingers:", fingers)

func reduce_vision(amount: float):
	vision = max(vision - amount, 0)
	print("Vision deteriorated! Current vision:", vision)

func reduce_hearing(amount: float):
	hearing = max(hearing - amount, 0)
	print("Hearing loss! Current hearing:", hearing)

func reduce_mobility(amount: float):
	mobility = max(mobility - amount, 0)
	print("Joint pain! Current mobility:", mobility)

func reduce_stability(amount: float):
	stability = min(stability+amount,100)
	print("What'd you take? Current Shakiness:", stability)
	
# -------------------------
# Check Status
# -------------------------
func is_disabled() -> bool:
	# Example: fully disabled if no fingers OR all senses drop too low
	return fingers == 0 or (vision <= 0 and hearing <= 0 and mobility <= 0)

func print_status():
	print("Player Status → Fingers:", fingers,
		  " Vision:", vision,
		  " Hearing:", hearing,
		  " Mobility:", mobility,
		  " Shakiness:", stability)
