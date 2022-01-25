///prox_random(grid, prox cell, min radius, max radius, chance 0-1, iterations);

    // INPUT VARS
    
    var grid = argument0;
    var gocell = argument1;
    var rad1 = argument2;
    var rad2 = argument3;
    var chance = argument4 / 100;
    var rpt = argument5;
    
    // LOCAL WASTE
    
    var grw = ds_grid_width(grid);
    var grh = ds_grid_width(grid);
    
    var tempgrid = ds_grid_create(grw, grh);
    ds_grid_copy(tempgrid, grid);
    
    var rad = irandom_range(rad1, rad2);
    var radtimer = 3 + irandom(5);
    var rndrad = true;
    if rad1 == rad2 { rndrad = false; }
    
    // LOOOOOOP
    
    repeat(rpt){
    
        for(var xx = 0; xx < grw; xx++){
            for(var yy = 0; yy < grh; yy++){
            
                if grid[# xx, yy] != gocell
                {
                    if ds_grid_value_disk_exists(grid, xx, yy, rad, gocell)
                    {
                        // Check against odds
                        if random(1) < chance
                        {
                            tempgrid[# xx, yy] = gocell;
                        }
                        
                        // Check if new rad
                        if rndrad == true
                        {
                            radtimer--;
                            
                            if radtimer <= 0
                            {
                                rad = irandom_range(rad1, rad2);
                                radtimer = 3 + irandom(10);
                            }
                        }
                    }
                }
            }
        }
        ds_grid_copy(grid, tempgrid);
    }
    
    ds_grid_destroy(tempgrid);
