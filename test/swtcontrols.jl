include("init.jl")
init8500()


@testset "swtcontrols" begin 

@show swtcontrols(:First)
@show swtcontrols(:Next)
@show swtcontrols(:Action)
@show swtcontrols(:Action, swtcontrols(:Action))
@show swtcontrols(:IsLocked)
@show swtcontrols(:IsLocked, swtcontrols(:IsLocked))
@show swtcontrols(:SwitchedTerm)
@show swtcontrols(:SwitchedTerm, swtcontrols(:SwitchedTerm))
@show swtcontrols(:Count)
@show swtcontrols(:Delay)
@show swtcontrols(:Delay, swtcontrols(:Delay))
@show swtcontrols(:Name)
@show swtcontrols(:Name, swtcontrols(:Name))
@show swtcontrols(:SwitchedObj)
@show swtcontrols(:SwitchedObj, swtcontrols(:SwitchedObj))
@show swtcontrols(:AllNames)

end # testset

