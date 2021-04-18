
./wrk  -t 10 -c 20 -s my_script.lua --latency http://localhost:3000 -d 180  | wrk2img output.png
open output.png
