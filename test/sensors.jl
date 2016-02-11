include("init.jl")
init8500()


@testset "sensors" begin 

@show sensors(:Count)
@show sensors(:First)
@show sensors(:Next)
@show sensors(:IsDelta)
@show sensors(:IsDelta, sensors(:IsDelta))
@show sensors(:ReverseDelta)
@show sensors(:ReverseDelta, sensors(:ReverseDelta))
@show sensors(:MeteredTerminal)
@show sensors(:MeteredTerminal, sensors(:MeteredTerminal))
@show sensors(:Reset)
@show sensors(:ResetAll)
@show sensors(:PctError)
@show sensors(:PctError, sensors(:PctError))
@show sensors(:Weight)
@show sensors(:Weight, sensors(:Weight))
@show sensors(:kVBase)
@show sensors(:kVBase, sensors(:kVBase))
@show sensors(:Name)
@show sensors(:Name, sensors(:Name))
@show sensors(:MeteredElement)
@show sensors(:MeteredElement, sensors(:MeteredElement))
@show sensors(:AllNames)
@show sensors(:Currents)
@show sensors(:Currents, sensors(:Currents))
@show sensors(:kvar)
@show sensors(:kvar, sensors(:kvar))
@show sensors(:kW)
@show sensors(:kW, sensors(:kW))

end # testset

