include("init.jl")
dss("""
clear
New Circuit.PVSystem  basekv=12.47  Isc3=1000 Isc1=900
New XYCurve.MyPvsT npts=4  xarray=[0  25  75  100]  yarray=[1.2 1.0 0.8  0.6] 
New XYCurve.MyEff npts=4  xarray=[.1  .2  .4  1.0]  yarray=[.86  .9  .93  .97]  
New Loadshape.MyIrrad npts=24 interval=1 mult=[0 0 0 0 0 0 .1 .2 .3  .5  .8  .9  1.0  1.0  .99  .9  .7  .4  .1 0  0  0  0  0]
New Tshape.MyTemp npts=24 interval=1 temp=[25, 25, 25, 25, 25, 25, 25, 25, 35, 40, 45, 50  60 60  55 40  35  30  25 25 25 25 25 25]
New Line.line1 Bus1=sourcebus bus2=PVbus  Length=2
New PVSystem.PV phases=3 bus1=PVbus kV=12.47  kVA=500  irrad=0.8  Pmpp=500 temperature=25 PF=1  effcurve=Myeff  P-TCurve=MyPvsT Daily=MyIrrad  TDaily=MyTemp 
set voltagebases=[12.47]
calcv
solve  ! solves at the specified irradiance and temperature
""")

@testset "pvsystems" begin 

@test pvsystems(:Count) == 1
@test pvsystems(:First) == 1
@test pvsystems(:Next) == 0
@test pvsystems(:Idx) == 1
@test pvsystems(:Idx, pvsystems(:Idx)) == 0
@test pvsystems(:Irradiance) ≈ 0.8
@test pvsystems(:Irradiance, pvsystems(:Irradiance)) ≈ 0.0
@test pvsystems(:kW) ≈ 382.66666666666674
@test pvsystems(:kvar) ≈ 0.0
@test pvsystems(:kvar, pvsystems(:kvar)) ≈ 0.0
@test pvsystems(:pf) ≈ 1.0
@test pvsystems(:pf, pvsystems(:pf)) ≈ 0.0
@test pvsystems(:kVARated) ≈ 500.0
@test pvsystems(:kVARated, pvsystems(:kVARated)) ≈ 0.0

end # testset

