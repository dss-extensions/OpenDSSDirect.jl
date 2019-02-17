

init8500()


@testset "LineCodes" begin

arr = String[]
for i in OpenDSSDirect.EachMember(LineCodes); push!(arr, LineCodes.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(LineCodes, LineCodes.Name))
    @test n == arr[i]
end
@test arr == LineCodes.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(LineCodes))

end # testset

