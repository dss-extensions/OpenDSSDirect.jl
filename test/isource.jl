
init8500()


@testset "Isource" begin

@test Isource.Count() == 0
@test Isource.First() == 0
@test Isource.Next() == 0
@test Isource.Amps() == 0.0
@test Isource.Amps(Isource.Amps()) == nothing
@test Isource.AngleDeg() == 0.0
@test Isource.AngleDeg(Isource.AngleDeg()) == nothing
@test Isource.Frequency() == 0.0
@test Isource.Frequency(Isource.Frequency()) == nothing
@test Isource.Name() == "vreg4_c"
@test Isource.Name(Isource.Name()) == nothing
@test Isource.AllNames()[end] == "NONE" # TODO: should this return empty array instead?

arr = String[]
for i in OpenDSSDirect.EachMember(Isource); push!(arr, Isource.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(Isource, Isource.Name))
    @test n == arr[i]
end
@test_broken arr == Isource.AllNames() # TODO: should this return empty array instead of ["NONE"]
@test length(arr) == length(OpenDSSDirect.EachMember(Isource))

end # testset
