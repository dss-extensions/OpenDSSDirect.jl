
init8500()


@testset "SwtControls" begin

@show SwtControls.First()
@show SwtControls.Next()
@show SwtControls.Action()
@show SwtControls.Action(SwtControls.Action())
@show SwtControls.IsLocked()
@show SwtControls.IsLocked(SwtControls.IsLocked())
@show SwtControls.SwitchedTerm()
@show SwtControls.SwitchedTerm(SwtControls.SwitchedTerm())
@show SwtControls.Count()
@show SwtControls.Delay()
@show SwtControls.Delay(SwtControls.Delay())
@show SwtControls.Name()
@show SwtControls.Name(SwtControls.Name())
@show SwtControls.SwitchedObj()
@show SwtControls.SwitchedObj(SwtControls.SwitchedObj())
@show SwtControls.AllNames()

arr = String[]
for i in OpenDSSDirect.EachMember(SwtControls); push!(arr, SwtControls.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(SwtControls, SwtControls.Name))
    @test n == arr[i]
end
@test arr == SwtControls.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(SwtControls))

end # testset

