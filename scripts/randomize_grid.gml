///randomize_grid(grid, chance);

    // INPUT VARS
    
    var grid = argument0;
    var r = argument1 / 100;
    
    // LOCAL WASTE
    
    var grw = ds_grid_width(grid);
    var grh = ds_grid_width(grid);
    
    // LOOOOOOP

    for(var xx = 0; xx <= grw-1; xx++){
        for(var yy = 0; yy <= grh-1; yy++){
        
        if random(1) < r
        {
            grid[# xx, yy] = 1;
        } else {
            grid[# xx, yy] = 0;
        }
    }
}
