///cellR1_4(grid, x, y, neighbour)

    var grid = argument0;
    var xx = argument1;
    var yy = argument2;
    var type = argument3;
    
    var n = 0;
    
    if grid[#xx-2, yy-1] == type { n++;}
    if grid[#xx, yy-1] == type { n++;}
    if grid[#xx-1, yy-2] == type { n++;}
    if grid[#xx-1, yy] == type { n++;}
    
    return n;
