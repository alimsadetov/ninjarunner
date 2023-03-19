extends Timer

var mintime = 1
var maxtime = 3

func _ready():
	randtime()
	connect('timeout', self, "randtime")
	
func _start():
	randtime()
	.start()
	
func randtime():
	set_wait_time(rand_range(mintime, maxtime))
