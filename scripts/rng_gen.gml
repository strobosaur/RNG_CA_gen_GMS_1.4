///rng_gen(grid, coords pts, min dist, border 0-1, 1:square 0:circle, size, type)

    // INPUT
    
    var grid = argument0;
    var pts = argument1;
    var mindist = argument2;
    var border = argument3;
    var square = argument4;
    var size = argument5;
    var type = argument6;
    
    // LOCAL VARS
    
    var gw = ds_grid_width(grid);
    var gh = ds_grid_height(grid);
    
    var xpad = (gw * border) div 2;
    var ypad = (gh * border) div 2;
    
    var xl = ds_list_create();
    var yl = ds_list_create();
    
    var ax = 0;
    var ay = 0;
    
    var bx = 0;
    var by = 0;
    
    var cx = 0;
    var cy = 0;
    
    var ab = 0;
    var ac = 0;
    var bc = 0;
    
    var connect = false;
    
    // RELATIVE NEIGHBOURHOOD GRAPH
    // ==============================
    // LOOP I: Spread random points
    
    while pts != 0
    {
        // SQUARE BORDER
        if square == 1
        {
            cx = irandom_range(xpad, gw-xpad);
            cy = irandom_range(ypad, gh-ypad);
        } else {
        
        // CIRCLE BORDER
            var len = irandom((min(gw, gh)-xpad) div 2);
            var dir = irandom(360);
            
            cx = round((gw / 2) + lengthdir_x(len, dir));
            cy = round((gh / 2) + lengthdir_y(len, dir));;
        }
        
        ds_list_add(xl, cx);
        ds_list_add(yl, cy);
        
        pts--;
    }
    
    // LOOP II: List all A&B distances
    
    for(var i = 0; i < ds_list_size(xl); i++){
        for(var j = i+1; j < ds_list_size(xl); j++){    
    
        ax = ds_list_find_value(xl, i);
        ay = ds_list_find_value(yl, i);
        
        bx = ds_list_find_value(xl, j);
        by = ds_list_find_value(yl, j);
            
        ab = point_distance(ax, ay, bx, by);
        
        if ab < mindist { continue; }
        
        connect = true;
        
        // LOOP III: Compare every A&B pair with the others
        
        for(var k = 0; k < ds_list_size(xl); k++){
        
            cx = ds_list_find_value(xl, k);
            cy = ds_list_find_value(yl, k);
            
            if ((cx == bx) && (cy == by)) || ((cx == ax) && (cy == ay))
            {
                continue;
            }
            
            ac = point_distance(ax, ay, cx, cy);
            bc = point_distance(bx, by, cx, cy);
            
            if (ac < mindist) || ( bc < mindist) { continue; }
            
            // No connection if C is closer to both A & B
            if (ac < ab) && (bc < ab)
            {
                connect = false;
                break;
            }
        }
        
        // Make grid line between connected points
        if connect == true
        {
            grid[# ax-1, ay-1] = 1;
            grid[# bx-1, by-1] = 1;
            
            var dir = point_direction(ax, ay, bx, by);
            
            for(var l = 0; l <= ab; l++){
            
                var lx = round(ax + lengthdir_x(l, dir));
                var ly = round(ay + lengthdir_y(l, dir));
                
                ds_grid_set_disk(grid, lx-1, ly-1, size, type);
                
//                grid[# lx, ly] = 1;
                
                }
            }
        }
    }
    
    // DS CLEANUP
    ds_list_destroy(xl);
    ds_list_destroy(yl);
