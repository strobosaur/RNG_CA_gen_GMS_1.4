///ca_random(grid, live, dead, R1s, live cut off , dead cut off, interations, smoothness)

    // INPUT VARS
    
    var grid = argument0;
    var live = argument1;
    var dead = argument2;
    var R1s = argument3;
    var live_cutoff = argument4;
    var dead_cutoff = argument5;
    var rpt = argument6;
    var smooth = argument7;
    
    // LOCAL WASTE
    
    var gridw = ds_grid_width(grid);
    var gridh = ds_grid_width(grid);
    
    var xx = 0;
    var yy = 0;
    
    var cell = 0;
    
    // LOOOOOOP
    repeat(rpt)
    {
        xx = irandom_range(1, gridw);
        yy = irandom_range(1, gridh);
        
        cell = grid[# xx-1, yy-1];
        
        if cellR1(grid, xx, yy, live) > R1s
        {
            grid[#xx-1, yy-1] = 1;
        }
        else
        {
            grid[#xx-1, yy-1] = 0;
        }
    }
    
    // LONE LIVE CELL REMOVAL
    for (var rpt = 0; rpt <= smooth; rpt++)
    {
        for(var i = 1; i <= gridw; i++)
        {
            for(var j = 1; j <= gridh; j++)
            {
                cell = grid[# i-1, j-1];
                
                if cellR1_4(grid, i, j, dead) >= live_cutoff
                && cell == live
                {
                    grid[#i-1, j-1] = 0;
                }
            }
        }
    }
    
    // LONE DEAD CELL REMOVAL
    for (var rpt = 0; rpt < smooth; rpt++)
    {
        for(var i = 1; i <= gridw; i++)
        {
            for(var j = 1; j <= gridh; j++)
            {
                cell = grid[# i-1, j-1];
                
                if cellR1_4(grid, i, j, dead) >= dead_cutoff
                && cell == dead
                {
                    grid[#i-1, j-1] = 0;
                }
            }
        }
    }
