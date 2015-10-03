for(var n=0; n<dg_cellNum; n++)
{
    dg_xOff[n] += dg_xForce[n];
    dg_yOff[n] += dg_yForce[n];
    dg_xForce[n] = (-dg_xOff[n]+dg_xForce[n])*.85;
    dg_yForce[n] = (-dg_yOff[n]+dg_yForce[n])*.85;
}
