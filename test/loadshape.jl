include("init.jl")
init8500()

dss("""
    redirect $(Pkg.dir())/OpenDSSDirect/examples/ckt5/Loadshapes_ckt5.dss
    solve
""")

@testset "loadshape" begin 

@test loadshape(:Count) == 4
@test loadshape(:First) == 1
@test loadshape(:Next) == 2
@test loadshape(:Npts) == 8760
@test loadshape(:Npts, loadshape(:Npts)) == 0
@test loadshape(:Normalize) == 0
@test loadshape(:UseActual) == 0
@test loadshape(:UseActual, loadshape(:UseActual)) == 0
@test loadshape(:HrInterval) ≈ 1.0
@test loadshape(:HrInterval, loadshape(:HrInterval)) ≈ 0.0
@test loadshape(:MinInterval) ≈ 60.0
@test loadshape(:MinInterval, loadshape(:MinInterval)) ≈ 0.0
@test loadshape(:PBase) ≈ 0.0
@test loadshape(:PBase, loadshape(:PBase)) ≈ 0.0
@test loadshape(:QBase) ≈ 0.0
@test loadshape(:QBase, loadshape(:QBase)) ≈ 0.0
@test loadshape(:SInterval) ≈ 3600.0
@test loadshape(:SInterval, loadshape(:SInterval)) ≈ 0.0
@test loadshape(:Name) == "residential"
@test loadshape(:Name, loadshape(:Name)) == ""
@test loadshape(:AllNames) == ["default","residential","commercial_sm","commercial_md"]
@test loadshape(:PMult)[end] ≈ 0.366545
# @test loadshape(:PMult, loadshape(:PMult))
@test loadshape(:QMult) ≈ [0.0]
# @test loadshape(:QMult, loadshape(:QMult))
@test loadshape(:TimeArray) ≈ [0.0]
# @test loadshape(:TimeArray, loadshape(:TimeArray))

end # testset

