
init8500()

@testset "Isource" begin

@test Isource.Count() == 0
@test Isource.First() == 0
@test Isource.Next() == 0
@test_throws OpenDSSDirect.OpenDSSDirectException Isource.Name()
@test_throws OpenDSSDirect.OpenDSSDirectException Isource.Name("invalid_isource_name")
@test Isource.AllNames()[end] == "NONE" # TODO: should this return empty array instead?

# Add an arbitrary ISource to test the rest
OpenDSSDirect.Text.Command("""
New Isource.TestISource phases=1 Bus1=SX2691950C.1 frequency=60 Angle=30 Amps=1.1
""")

@test Isource.First() == 1
@test_throws OpenDSSDirect.OpenDSSDirectException Isource.Idx(0)
@test_throws OpenDSSDirect.OpenDSSDirectException Isource.Idx(7)
@test Isource.Idx() == 1
@test Isource.Amps() == 1.1
@test Isource.Amps(Isource.Amps()) == nothing
@test Isource.AngleDeg() == 30.0
@test Isource.AngleDeg(Isource.AngleDeg()) == nothing
@test Isource.Frequency() == 60.0
@test Isource.Frequency(Isource.Frequency()) == nothing
@test Isource.Name() == "testisource"
@test Isource.Count() == 1
@test Isource.First() == 1
@test Isource.Next() == 0

@test Isource.Name(Isource.Name()) == nothing

arr = String[]
for i in OpenDSSDirect.EachMember(Isource); push!(arr, Isource.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(Isource, Isource.Name))
    @test n == arr[i]
end
@test arr == Isource.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(Isource))

end # testset
