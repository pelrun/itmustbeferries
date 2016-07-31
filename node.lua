gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

node.set_flag("slow_gc")

util.resource_loader{
    "shader31c3.frag";
    "noise.png";
    "tiles.png";
    "bold.ttf";
    "hsbne.png";
}

function node.render()
    local now = sys.now()


    local x = math.sin(now/62) * 320
    local y = math.cos(now/128) * 200

    gl.perspective(80 + math.cos(now/5) * 3, x + math.sin(now/14)*10, y + math.cos(now/14.4)*20, -100, x, y, 0)
    gl.rotate(math.cos(now/9)*5, 0, 0, 1)

    shader31c3:use{
        time = now / 1234.5;
        noise = noise;
        tile_res = {16, 16};
        res = {16.0 * 12, 16.0 * 12};
    }

    local size = 60
    tiles:draw(-16*size, -16*size, 16*size, 16*size)

    gl.ortho()

    bold:write(1,10,"Live Public Transport Timetable       2:20pm",50,1,1,1,1)

    local start = 150
    local height = 60


    bold:write(1,start+height*0,"6 min   2:26pm  Ferry towards UQ Saint Lucia",50,1,0,0,0.5)
    bold:write(1,start+height*1,"35 min  2:55pm  Ferry towards UQ Saint Lucia",50,0,1,0,1)
    bold:write(1,start+height*2,"64 min  3:24pm  Ferry towards UQ Saint Lucia",50,1,1,1,0.5)
    bold:write(1,start+height*3,"94 min  3:54pm  Ferry towards UQ Saint Lucia",50,1,1,1,0.5)
    bold:write(1,start+height*4,"124 min 4:24pm  Ferry towards UQ Saint Lucia",50,1,1,1,0.5)

    bold:write(1,start+height*7,"15 minute walk to ferry!",50,1,1,1,1)

    shader31c3:deactivate()
    util.draw_correct(hsbne,NATIVE_WIDTH-200,NATIVE_HEIGHT-200,NATIVE_WIDTH,NATIVE_HEIGHT)
end
