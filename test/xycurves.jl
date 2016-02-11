include("init.jl")
init8500()

dss("""
New XYCurve.MyPvsT npts=4  xarray=[0  25  75  100]  yarray=[1.2 1.0 0.8  0.6] 
New XYCurve.MyEff npts=4  xarray=[.1  .2  .4  1.0]  yarray=[.86  .9  .93  .97]  
""")

@testset "xycurves" begin 

@test xycurves(:Count) == 2
@test xycurves(:First) == 1
@test xycurves(:Next) == 2
@test xycurves(:Npts) == 4
@test xycurves(:Npts, xycurves(:Npts)) == 0
@test xycurves(:X) ≈ 0.1
@test xycurves(:X, xycurves(:X)) ≈ 0.0
@test xycurves(:Y) ≈ 1.0
@test xycurves(:Y, xycurves(:Y)) ≈ 0.0
@test xycurves(:XShift) ≈ 0.0
@test xycurves(:XShift, xycurves(:XShift)) ≈ 0.0
@test xycurves(:YShift) ≈ 0.0
@test xycurves(:YShift, xycurves(:YShift)) ≈ 0.0
@test xycurves(:XScale) ≈ 1.0
@test xycurves(:XScale, xycurves(:XScale)) ≈ 0.0
@test xycurves(:YScale) ≈ 1.0
@test xycurves(:YScale, xycurves(:YScale)) ≈ 0.0
@test xycurves(:Name) == "myeff"
@test xycurves(:Name, xycurves(:Name)) == ""
@test xycurves(:XArray) == Any[]      ## WRONG?
# @show xycurves(:XArray, xycurves(:XArray))
@test xycurves(:YArray) == Any[]      ## WRONG?
# @show xycurves(:YArray, xycurves(:YArray))

end # testset

