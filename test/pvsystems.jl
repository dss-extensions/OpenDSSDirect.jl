
OpenDSSDirect.Text.Command("""
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

@testset "PVsystems" begin

@test PVsystems.Count() == 1
@test PVsystems.First() == 1
@test PVsystems.Next() == 0
@test PVsystems.Idx() == 1
@test PVsystems.Idx(PVsystems.Idx()) == nothing
@test PVsystems.Irradiance() ≋ 0.8
@test PVsystems.Irradiance(PVsystems.Irradiance()) == nothing
@test PVsystems.kW() ≋ 382.66666666666674
@test PVsystems.kvar() ≋ 0.0
@test PVsystems.kvar(PVsystems.kvar()) == nothing
@test PVsystems.pf() ≋ 1.0
@test PVsystems.pf(PVsystems.pf()) == nothing
@test PVsystems.kVARated() ≋ 500.0
@test PVsystems.kVARated(PVsystems.kVARated()) == nothing

arr = String[]
for i in OpenDSSDirect.EachMember(PVsystems); push!(arr, PVsystems.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(PVsystems, PVsystems.Name))
    @test n == arr[i]
end
@test arr == PVsystems.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(PVsystems))

end # testset

