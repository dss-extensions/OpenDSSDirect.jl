include("init.jl")
init8500()


@testset "bus" begin 

circuit(:SetActiveBus, "M1047751")

@test bus(:NumNodes) == 1
@test bus(:ZscRefresh) == 1
@test bus(:Coorddefined) == true
@test bus(:GetUniqueNodeNumber) == 0
@test bus(:N_Customers) == 0
@test bus(:SectionID) == 0
@test bus(:kVBase) ≈ 7.199557856794634
@test bus(:x) == 1.67080628884553e6
@test bus(:x, bus(:x)) == 0.0
@test bus(:y) ≈ 1.22880000004359e7
@test bus(:y, bus(:y)) == 0.0
@test bus(:Distance) == 0.0
@test bus(:Lambda) == 0.0
@test bus(:N_interrupts) == 0.0
@test bus(:Int_Duration) == 0.0
@test bus(:Cust_Interrupts) == 0.0
@test bus(:Cust_Duration) == 0.0
@test bus(:TotalMiles) == 0.0
@test bus(:Name) == "m1047751"
@test bus(:Voltages) ≈ [9.037209332903377 + 8.118316247127675im]
@test bus(:SeqVoltages) ≈ [-1.0,-1.0,-1.0]
@test bus(:Nodes) == [1]
@test bus(:Voc) ≈ [0.0im]
@test bus(:Isc) ≈ [0.0im]
@test bus(:PuVoltage) ≈ [0.0012552450459682668 + 0.0011276131685595049im]
@test bus(:ZscMatrix) ≈ [9.037209332903377 + 8.118316247127675im]
@test bus(:Zsc1) ≈ 9.037209332903377 + 8.118316247127675im
@test bus(:Zsc0) ≈ 9.037209332903377 + 8.118316247127675im
@test bus(:YscMatrix) ≈ [0.06123674530606539 - 0.05501026323794743im]
@test bus(:CplxSeqVoltages) ≈ [-1.0 - 1.0im,-1.0 - 1.0im,-1.0 - 1.0im]
@test bus(:VLL) ≈ [-99999.0 + 0.0im]
@test bus(:puVLL) ≈ [-99999.0 + 0.0im]
@test bus(:VMagAngle) ≈ [12.148177279538402, 41.934023780152195]''
@test bus(:puVmagAngle) ≈ [0.0016873504625111767, 41.934023780152195]''

end # testset