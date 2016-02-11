include("init.jl")
init8500()


@testset "pdelements" begin 

@test pdelements(:Count) == 4904
@test pdelements(:First) == 1
@test pdelements(:Next) == 1
@test pdelements(:IsShunt) == 0
@test pdelements(:NumCustomers) == 0
@test pdelements(:TotalCustomers) == 0
# @test pdelements(:ParentPDElement)      # ERROR
@test pdelements(:FromTerminal) == 1
@test pdelements(:SectionID) == 0
@test pdelements(:FaultRate) ≈ 0.1
@test pdelements(:FaultRate, pdelements(:FaultRate)) ≈ 0.0
@test pdelements(:PctPermanent) ≈ 20.0
@test pdelements(:PctPermanent, pdelements(:PctPermanent)) ≈ 0.0
@test pdelements(:Lambda) ≈ 0.0
@test pdelements(:AccumulatedL) ≈ 0.0
@test pdelements(:RepairTime) ≈ 3.0
@test pdelements(:TotalMiles) ≈ 0.0
@test pdelements(:Name) == "Line.ln5502549-1" 
@test pdelements(:Name, pdelements(:Name)) == "0"

end # testset

