
init8500()


@testset "Bus" begin

Circuit.SetActiveBus("M1047751")

@test Bus.NumNodes() == 1
@test Bus.ZscRefresh() == 1
@test Bus.Coorddefined() == true
@test Bus.GetUniqueNodeNumber(0) == 0
@test Bus.N_Customers() == 0
@test Bus.SectionID() == 0
@test Bus.kVBase() ≋ 7.199557856794634
@test Bus.X() == 1.67080628884553e6
@test Bus.X(Bus.X()) == nothing
@test Bus.Y() ≋ 1.22880000004359e7
@test Bus.Y(Bus.Y()) == nothing
@test Bus.Distance() == 0.0
@test Bus.Lambda() == 0.0
@test Bus.N_interrupts() == 0.0
@test Bus.Int_Duration() == 0.0
@test Bus.Cust_Interrupts() == 0.0
@test Bus.Cust_Duration() == 0.0
@test Bus.TotalMiles() == 0.0
@test Bus.Name() == "m1047751"
@test Bus.Voltages() ≋ [9.037209332903377 + 8.118316247127675im]
@test Bus.SeqVoltages() ≋ [-1.0,-1.0,-1.0]
@test Bus.Nodes() == [1]
@test Bus.Voc() ≋ [0.0im]
@test Bus.Isc() ≋ [0.0im]
@test Bus.PuVoltage() ≋ [0.0012552450459682668 + 0.0011276131685595049im]
@test Bus.ZscMatrix() ≋ [9.037209332903377 + 8.118316247127675im]
@test Bus.Zsc1() ≋ 9.037209332903377 + 8.118316247127675im
@test Bus.Zsc0() ≋ 9.037209332903377 + 8.118316247127675im
@test Bus.YscMatrix() ≋ [0.06123674530606539 - 0.05501026323794743im]
@test Bus.CplxSeqVoltages() ≋ [-1.0 - 1.0im,-1.0 - 1.0im,-1.0 - 1.0im]
@test Bus.VLL() ≋ [-99999.0 + 0.0im]
@test Bus.puVLL() ≋ [-99999.0 + 0.0im]
@test Bus.VMagAngle() ≋ [12.148177279538402, 41.934023780152195]''
@test Bus.puVmagAngle() ≋ [0.0016873504625111767, 41.934023780152195]''

end # testset
