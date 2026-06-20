function wake-archimedes --wraps='ssh'
	ssh omni@192.168.2.30 sudo etherwake 30:56:0f:64:89:44
end
