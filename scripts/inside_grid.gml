///inside_grid(what grid, x0, y0);

    // INPUT

    var bgrid = argument0;
    var ix = argument1;
    var iy = argument2;
    
    // LOCAL
    
    var grw = ds_grid_width(bgrid);
    var grh = ds_grid_height(bgrid);
    
    // RUN SCRIPT
    
    if((ix >= 1) && (ix <= grw) 
    && (iy >= 1) && (iy <= grh))
    {
        return true;
    }
        else
    {
        return false;
    }

