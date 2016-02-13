include("init.jl")
init8500()

dss("""
New XYCurve.MyPvsT npts=4  xarray=[0  25  75  100]  yarray=[1.2 1.0 0.8  0.6] 
New XYCurve.MyEff npts=4  xarray=[.1  .2  .4  1.0]  yarray=[.86  .9  .93  .97]  
""")

@testset "XYCurves" begin 

@test XYCurves.Count() == 2
@test XYCurves.First() == 1
@test XYCurves.Next() == 2
@test XYCurves.Npts() == 4
@test XYCurves.Npts(XYCurves.Npts()) == 0
@test XYCurves.X() ≈ 0.1
@test XYCurves.X(XYCurves.X()) ≈ 0.0
@test XYCurves.Y() ≈ 1.0
@test XYCurves.Y(XYCurves.Y()) ≈ 0.0
@test XYCurves.XShift() ≈ 0.0
@test XYCurves.XShift(XYCurves.XShift()) ≈ 0.0
@test XYCurves.YShift() ≈ 0.0
@test XYCurves.YShift(XYCurves.YShift()) ≈ 0.0
@test XYCurves.XScale() ≈ 1.0
@test XYCurves.XScale(XYCurves.XScale()) ≈ 0.0
@test XYCurves.YScale() ≈ 1.0
@test XYCurves.YScale(XYCurves.YScale()) ≈ 0.0
@test XYCurves.Name() == "myeff"
@test XYCurves.Name(XYCurves.Name()) == ""
@test XYCurves.XArray() == Any[]      ## WRONG?
# @show XYCurves.XArray(XYCurves.XArray())
@test XYCurves.YArray() == Any[]      ## WRONG?
# @show XYCurves.YArray(XYCurves.YArray())

end # testset

