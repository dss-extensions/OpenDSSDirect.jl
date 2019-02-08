
init8500()


@testset "CktElement" begin
Lines.First()
Lines.Next()

@test CktElement.NumTerminals() == 2
@test CktElement.NumConductors() == 1
@test CktElement.NumPhases() == 1
@test CktElement.Open(0, 0) == nothing
@test CktElement.Close(0, 0) == nothing
@test CktElement.IsOpen(0, 0) == false
@test CktElement.NumProperties() == 35
@test CktElement.HasSwitchControl() == false
@test CktElement.HasVoltControl() == false
@test CktElement.NumControls() == 0
@test CktElement.OCPDevIndex() == 0
@test CktElement.OCPDevType() == 0
@test CktElement.Enabled()
@test CktElement.Enabled(CktElement.Enabled()) == nothing
@test CktElement.NormalAmps() ≋ 400.0
@test CktElement.NormalAmps(CktElement.NormalAmps()) == nothing
@test CktElement.EmergAmps() ≋ 600.0
@test CktElement.EmergAmps(CktElement.EmergAmps()) == nothing
@test_broken CktElement.Variablei("0", 0) ≋ 0.0
@test CktElement.Variablei(0, 0) ≋ 0.0
@test CktElement.Name() == "Line.ln5502549-1"
@test CktElement.DisplayName() == "Line_ln5502549-1"
@test CktElement.DisplayName(CktElement.DisplayName()) == nothing
@test CktElement.GUID()[1] == '{'
@test CktElement.GUID()[end] == '}'
@test CktElement.EnergyMeter() == ""
@test CktElement.Controller(0) == ""
@test CktElement.BusNames() == ["m1009763.2","l2673322.2"]
@test CktElement.BusNames(CktElement.BusNames()) == nothing
@test CktElement.Voltages() ≋ [-7497.624369108318 - 1716.7400531450096im,-7497.520821355775 - 1716.6870938210561im]
@test CktElement.Currents() ≋ [-1.8835247914830688 + 0.06801433374494081im,1.8836564559605904 - 0.06858936508069746im]
@test CktElement.Powers() ≋ [14.005198445515209 + 3.7434683767653216im,-14.00500702103834 - 3.747898919956358im]
@test CktElement.Losses() ≋ [0.19142447686863306 - 4.430543191036577im]
@test CktElement.PhaseLosses() ≋ [0.00019142447686863306 - 0.004430543191036577im]
@test CktElement.SeqVoltages() ≋ [1.0,1.0,1.0,1.0,1.0,1.0]
@test CktElement.SeqCurrents() ≋ [1.0,1.0,1.0,1.0,1.0,1.0]
@test CktElement.SeqPowers() ≋ [-1.0 - 1.0im,-1.0 - 1.0im,-1.0 - 1.0im,-1.0 - 1.0im,-1.0 - 1.0im,-1.0 - 1.0im]
@test CktElement.AllPropertyNames()[1] == "bus1"
@test CktElement.Residuals() ≋ [1.8847523948057756 1.8849048106162245
                                177.9319402443363 -2.0853832620851183]
@test CktElement.YPrim() ≋ [14.151460302936526 - 7.897357479424346im -14.151460302936526 + 7.897357517772179im
                           -14.151460302936526 + 7.897357517772179im 14.151460302936526 - 7.897357479424346im]
@test CktElement.CplxSeqVoltages() ≋ [-1.0 + 0.0im,-1.0 + 0.0im,-1.0 + 0.0im,-1.0 + 0.0im,-1.0 + 0.0im,-1.0 + 0.0im]
@test CktElement.CplxSeqCurrents() ≋ [-1.0 + 0.0im,-1.0 + 0.0im,-1.0 + 0.0im,-1.0 + 0.0im,-1.0 + 0.0im,-1.0 + 0.0im]
@test CktElement.AllVariableNames() == []
@test CktElement.AllVariableValues() == [0.0]
@test CktElement.NodeOrder() == [2, 2]
@test CktElement.CurrentsMagAng() ≋ [1.8847523948057756 1.8849048106162245
                                     177.9319402443363 -2.0853832620851183]
@test CktElement.VoltagesMagAng() ≋ [7691.655711894497 7691.542956049531
                                    -167.10323234086837 -167.10344473228216]

end # testset
