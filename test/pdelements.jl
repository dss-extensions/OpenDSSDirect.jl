
init8500()


@testset "PDElements" begin

@test PDElements.Count() == 4904
@test PDElements.First() == 1
@test PDElements.Next() == 1
@test PDElements.IsShunt() == 0
@test PDElements.NumCustomers() == 0
@test PDElements.TotalCustomers() == 0
@test PDElements.ParentPDElement() == 0
@test PDElements.FromTerminal() == 1
@test PDElements.SectionID() == 0
@test PDElements.FaultRate() ≋ 0.1
@test PDElements.FaultRate(PDElements.FaultRate()) == nothing
@test PDElements.PctPermanent() ≋ 20.0
@test PDElements.PctPermanent(PDElements.PctPermanent()) == nothing
@test PDElements.Lambda() ≋ 0.0
@test PDElements.AccumulatedL() ≋ 0.0
@test PDElements.RepairTime() ≋ 3.0
@test PDElements.TotalMiles() ≋ 0.0
@test PDElements.Name() == "Line.ln5502549-1"
@test PDElements.Name(PDElements.Name()) == nothing

arr_names = String[]
arr_phases = Int32[]
for i in OpenDSSDirect.EachMember(PDElements)
    push!(arr_names, PDElements.Name())
    push!(arr_phases, CktElement.NumPhases())
end
for (i, n) in enumerate(OpenDSSDirect.EachMember(PDElements, PDElements.Name))
    @test n == arr_names[i]
end

# There are disabled elements (which are not iterated), so do a partial check instead
@test arr_names[1:200] == PDElements.AllNames()[1:200]
@test arr_phases[1:200] == PDElements.AllNumPhases()[1:200]

@test length(arr_names) + 5 == length(OpenDSSDirect.EachMember(PDElements))

end # testset

