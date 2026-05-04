function detach --wraps='nohup'
	nohup $argv >/dev/null 2>&1 &
end
