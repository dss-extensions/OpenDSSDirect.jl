
@testset "XYCurves" begin


init8500()

OpenDSSDirect.Text.Command("""
New XYCurve.MyPvsT npts=4  xarray=[0  25  75  100]  yarray=[1.2 1.0 0.8  0.6]
New XYCurve.MyEff npts=4  xarray=[.1  .2  .4  1.0]  yarray=[.86  .9  .93  .97]
""")

@test XYCurves.Count() == 2
@test XYCurves.First() == 1
@test XYCurves.Next() == 2
@test XYCurves.Npts() == 4
@test XYCurves.Npts(XYCurves.Npts()) == nothing
@test XYCurves.X() ≋ 0.1
@test XYCurves.X(XYCurves.X()) == nothing
@test XYCurves.Y() ≋ .86
@test XYCurves.Y(XYCurves.Y()) == nothing
@test XYCurves.XShift() ≋ 0.0
@test XYCurves.XShift(XYCurves.XShift()) == nothing
@test XYCurves.YShift() ≋ 0.0
@test XYCurves.YShift(XYCurves.YShift()) == nothing
@test XYCurves.XScale() ≋ 1.0
@test XYCurves.XScale(XYCurves.XScale()) == nothing
@test XYCurves.YScale() ≋ 1.0
@test XYCurves.YScale(XYCurves.YScale()) == nothing
@test XYCurves.Name() == "myeff"
@test XYCurves.Name(XYCurves.Name()) == nothing
@test XYCurves.XArray()[1] ≋ 0.1
@test XYCurves.XArray(XYCurves.XArray()) == nothing
@test XYCurves.YArray()[1] ≋ 0.86
@test XYCurves.YArray(XYCurves.YArray()) == nothing

arr = String[]
for i in OpenDSSDirect.EachMember(XYCurves); push!(arr, XYCurves.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(XYCurves, XYCurves.Name))
    @test n == arr[i]
end
@test_throws UndefVarError arr == XYCurves.AllNames() # TODO: add AllNames to XYCurves
@test length(arr) == length(OpenDSSDirect.EachMember(XYCurves))

end # testset

