include("init.jl")
init8500()


@testset "circuit" begin 

@test circuit(:NumCktElements) == 6103
@test circuit(:NumBuses) == 4876
@test circuit(:NumNodes) == 8541
@test circuit(:FirstPCElement) == 1
@test circuit(:NextPCElement) == 2
@test circuit(:FirstPDElement) == 1
@test circuit(:NextPDElement) == 2
@test circuit(:Sample) == 0
@test circuit(:SaveSample) == 0
@test circuit(:SetActiveBusi, 2) == 0
@test circuit(:FirstElement) == 1
@test circuit(:NextElement) == 2
@test circuit(:UpdateStorage) == 0
@test circuit(:ParentPDElement) == 0
@test circuit(:EndOfTimeStepUpdate) == 0
# @test circuit(:Capacity, 10.0, 20.0) ≈ 0.0    # ERROR
@test circuit(:Name) == "ieee8500"
@test circuit(:Disable, circuit(:AllElementNames)[10]) == ""
@test circuit(:Enable, circuit(:AllElementNames)[10]) == ""
@test circuit(:SetActiveElement, circuit(:AllElementNames)[10]) == "9"
@test circuit(:SetActiveBus, circuit(:AllBusNames)[10]) == "9"
@test circuit(:SetActiveClass, activeclass(:ActiveClassName)) == "16"
@test circuit(:Losses) ≈ 1.218242333223247e6 + 2.798391857088721e6im
@test circuit(:LineLosses) ≈ 1042.0872998508387 + 1674.1606828559168im
@test circuit(:SubstationLosses) ≈ 65.18947074155649 + 752.3006305284744im
@test circuit(:TotalPower) ≈ -12004.740450109337 - 1471.1749507157301im 
@test circuit(:AllBusVolts)[end] ≈ -85.01962676301814 + 84.47523352214344im
@test circuit(:AllBusVMag)[end] ≈ 0.9980241903846725
@test circuit(:AllElementNames)[end] == "RegControl.vreg4_c"
@test circuit(:AllBusNames)[end] == "sx3784018a"
@test circuit(:AllElementLosses)[end] ≈ 0.0
@test circuit(:AllBusMagPu)[end] ≈ 0.9980241903846725
@test circuit(:AllNodeNames)[end] == "sx3784018a.2"
# @show circuit(:SystemY)
@test circuit(:AllBusDistances)[end] ≈ 0.0
@test circuit(:AllNodeDistances)[end] ≈ 0.0
# @test circuit(:AllNodeVmagByPhase)[end]    # ERROR
# @test circuit(:AllNodeVmagPUByPhase)[end]    # ERROR
# @test circuit(:AllNodeDistancesByPhase)[end]    # ERROR
# @test circuit(:AllNodeNamesByPhase)[end]    # ERROR
@test circuit(:YNodeVArray)[end] ≈ -85.01962676301814 + 84.47523352214344im
@test circuit(:YNodeOrder)[end] == "SX3784018A.2"
@test circuit(:YCurrents)[end] ≈ 0.032757937074590515 - 0.054281873453359im

end # testset

