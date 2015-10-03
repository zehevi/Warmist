///dg_init(hCells,vCells)
dg_hCells = argument0;
dg_vCells = argument1;
dg_cellNum = dg_hCells*dg_vCells;
dg_cell_w = view_wview/(dg_hCells-1);
dg_cell_h = view_hview/(dg_vCells-1);

var u = 1/(dg_hCells-1);
var v = 1/(dg_vCells-1);

var i,j;
for(var n=0; n<dg_cellNum; n++)
{
    i = n mod dg_hCells;
    j = n div dg_hCells;
    dg_xOrigin[n] = i*dg_cell_w;
    dg_yOrigin[n] = j*dg_cell_h;
    dg_xOff[n] = 0;
    dg_yOff[n] = 0;
    dg_xForce[n] = 0;
    dg_yForce[n] = 0;
    dg_u[n] = i*u;
    dg_v[n] = j*v;
}

//dg_surf = surface_create(view_wview,view_hview);
