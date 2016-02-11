include("init.jl")
init8500()


@testset "cktelement" begin 

lines(:First)
lines(:Next)

@test cktelement(:NumTerminals) == 2
@test cktelement(:NumConductors) == 1
@test cktelement(:NumPhases) == 1
@test cktelement(:Open) == 0
@test cktelement(:Close) == 0
@test cktelement(:IsOpen) == 0
@test cktelement(:NumProperties) == 35
@test cktelement(:HasSwitchControl) == false
@test cktelement(:HasVoltControl) == false
@test cktelement(:NumControls) == 0
# @show cktelement(:OCPDevIndex)     # ERROR
# @show cktelement(:OCPDevType)     # ERROR
@test cktelement(:Enabled)
@test cktelement(:Enabled, cktelement(:Enabled)) == 0
@test cktelement(:NormalAmps) ≈ 400.0
@test cktelement(:NormalAmps, cktelement(:NormalAmps)) ≈ 0.0
@test cktelement(:EmergAmps) ≈ 600.0
@test cktelement(:EmergAmps, cktelement(:EmergAmps)) ≈ 0.0
@test cktelement(:Variablei) ≈ 0.0
@test cktelement(:Name) == "Line.ln5502549-1"
@test cktelement(:DisplayName) == "Line_ln5502549-1"
@test cktelement(:DisplayName, cktelement(:DisplayName)) == ""
# @test cktelement(:GUID) == "{6607BF8C-6825-40AD-94F4-EE46DE4C8CD5}"
@test cktelement(:EnergyMeter) == ""
@test cktelement(:Controller) == ""
@test cktelement(:BusNames) == ["m1009763.2","l2673322.2"]
# @test cktelement(:BusNames, cktelement(:BusNames)) == ""
@test cktelement(:Voltages) ≈ [-7497.624369108318 - 1716.7400531450096im,-7497.520821355775 - 1716.6870938210561im]
@test cktelement(:Currents) ≈ [-1.8835247914830688 + 0.06801433374494081im,1.8836564559605904 - 0.06858936508069746im]
@test cktelement(:Powers) ≈ [14.005198445515209 + 3.7434683767653216im,-14.00500702103834 - 3.747898919956358im]
@test cktelement(:Losses) ≈ [0.19142447686863306 - 4.430543191036577im]
@test cktelement(:PhaseLosses) ≈ [0.00019142447686863306 - 0.004430543191036577im]
@test cktelement(:SeqVoltages) ≈ [1.0,1.0,1.0,1.0,1.0,1.0]
@test cktelement(:SeqCurrents) ≈ [1.0,1.0,1.0,1.0,1.0,1.0] 
@test cktelement(:SeqPowers) ≈ [-1.0 - 1.0im,-1.0 - 1.0im,-1.0 - 1.0im,-1.0 - 1.0im,-1.0 - 1.0im,-1.0 - 1.0im]
@test cktelement(:AllPropertyNames)[1] == "bus1"
@test cktelement(:Residuals) ≈ [1.8847523948057756 1.8849048106162245 
                                177.9319402443363 -2.0853832620851183]
@test cktelement(:YPrim) ≈ [14.151460302936526 - 7.897357479424346im -14.151460302936526 + 7.897357517772179im
                           -14.151460302936526 + 7.897357517772179im 14.151460302936526 - 7.897357479424346im]
@test cktelement(:CplxSeqVoltages) ≈ [-1.0 + 0.0im,-1.0 + 0.0im,-1.0 + 0.0im,-1.0 + 0.0im,-1.0 + 0.0im,-1.0 + 0.0im]
@test cktelement(:CplxSeqCurrents) ≈ [-1.0 + 0.0im,-1.0 + 0.0im,-1.0 + 0.0im,-1.0 + 0.0im,-1.0 + 0.0im,-1.0 + 0.0im]
@test cktelement(:AllVariableNames) == []
@test cktelement(:AllVariableValues) == [0.0]
@test cktelement(:NodeOrder) == [2, 2]
@test cktelement(:CurrentsMagAng) ≈ [1.8847523948057756 1.8849048106162245
                                     177.9319402443363 -2.0853832620851183]
@test cktelement(:VoltagesMagAng) ≈ [7691.655711894497 7691.542956049531
                                    -167.10323234086837 -167.10344473228216] 

end # testset

