extends Timer

var mintime = 0.8
var maxtime = 2.5

func _ready():
	randtime()
	connect('timeout', self, "randtime")
	
func _start():
	randtime()
	.start()
	
func randtime():
	set_wait_time(rand_range(mintime, maxtime))
