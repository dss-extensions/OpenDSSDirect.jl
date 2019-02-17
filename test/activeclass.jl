
init8500()

@testset "ActiveClass" begin

@test ActiveClass.First() == 1
@test ActiveClass.Next() == 2
@test ActiveClass.NumElements() == 12
@test ActiveClass.Count() == 12
@test ActiveClass.Name() == "feeder_regb"
@test ActiveClass.Name(ActiveClass.Name()) == nothing
@test ActiveClass.ActiveClassName() == "RegControl"
x = ActiveClass.AllNames()
@test length(x) == ActiveClass.Count()
@test x[1] == "feeder_rega"

arr = String[]
for i in OpenDSSDirect.EachMember(ActiveClass); push!(arr, ActiveClass.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(ActiveClass, ActiveClass.Name))
    @test n == arr[i]
end
@test arr == ActiveClass.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(ActiveClass))

end # testset
