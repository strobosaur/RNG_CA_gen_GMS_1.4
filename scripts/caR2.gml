///caR2(grid, live, dead, R1s, R1b, R2n, interations)

    // INPUT VARS
    
    var grid = argument0;
    var live = argument1;
    var dead = argument2;
    var R1s = argument3;
    var R1b = argument4;
    var R2n = argument5;
    var rpt = argument6;
    
    // LOCAL WASTE
    
    var grw = ds_grid_width(grid);
    var grh = ds_grid_width(grid);
    
    var tempgrid = ds_grid_create(grw, grh);
    ds_grid_copy(tempgrid, grid);
    
    var n = 0;
    var n2 = 0;
    var cell = 0;
    
    // LOOOOOOP
    
    repeat(rpt)
    {
        for(var xx = 1; xx <= grw; xx++)
        {
            for(var yy = 1; yy <= grh; yy++)
            {
            
                n = cellR1(grid, xx, yy, live);
                n2 = cellR2(grid, xx, yy, live, false);
                
                cell = grid[# xx-1, yy-1];
                
                if (n >= R1s) 
                || (n2 <= R2n)
                {
                    tempgrid[# xx-1, yy-1] = live;
                }
                else
                {
                    tempgrid[# xx-1, yy-1] = dead;
                }
            }
        }
        ds_grid_copy(grid, tempgrid);
    }
    
    ds_grid_destroy(tempgrid);
