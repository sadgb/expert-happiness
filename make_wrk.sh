./wrk  -t 1 -c 1  -s my_script.lua --latency http://localhost:3000 > 1 
./wrk  -t 6 -c 10  -s my_script.lua --latency http://localhost:3000 > 10 
./wrk  -t 6 -c 100 -s my_script.lua --latency http://localhost:3000 > 100 
./wrk  -t 6 -c 1000  -s my_script.lua --latency http://localhost:3000 > 1000 
cat 1 10 100 1000 | wrk2img output.png
open output.png
