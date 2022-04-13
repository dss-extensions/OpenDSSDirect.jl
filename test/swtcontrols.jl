
init8500()

OpenDSSDirect.Text.Command("""
New SwtControl.ctrl_LN3693186_sw SwitchedObj=line.LN3693186_sw SwitchedTerm=1 Action=open
""")

@testset "SwtControls" begin

@test SwtControls.First() == 1
#TODO: @test SwtControls.Idx() == 1
@test SwtControls.Next() == 0
@test_throws OpenDSSDirect.OpenDSSDirectException SwtControls.Idx(0)
@test_throws OpenDSSDirect.OpenDSSDirectException SwtControls.Idx(7)
#TODO: @test SwtControls.Idx() == 1
@test_broken OpenDSSDirect.Lib.SwtControls_Get_idx() == 1
@test SwtControls.Action() == OpenDSSDirect.Lib.ActionCodes_Open
@test SwtControls.Action(OpenDSSDirect.Lib.ActionCodes_none) == nothing
@test SwtControls.Action() == OpenDSSDirect.Lib.ActionCodes_Open
@test SwtControls.Action(OpenDSSDirect.Lib.ActionCodes_Close) == nothing
@test SwtControls.Action() == OpenDSSDirect.Lib.ActionCodes_Close
@test SwtControls.NormalState() == OpenDSSDirect.Lib.ActionCodes_Open
@test SwtControls.State() == OpenDSSDirect.Lib.ActionCodes_Close
@test SwtControls.IsLocked() == false
@test SwtControls.IsLocked(false) == nothing
@test SwtControls.SwitchedTerm() == 1
@test SwtControls.SwitchedTerm(2) == nothing
@test SwtControls.SwitchedTerm() == 2
@test SwtControls.Count() == 1
@test SwtControls.Delay() == 120.0
@test SwtControls.Delay(300.0) == nothing
@test SwtControls.Delay() == 300.0
@test SwtControls.Name() == "ctrl_ln3693186_sw"
@test SwtControls.Name(SwtControls.Name()) == nothing 
@test SwtControls.SwitchedObj() == "line.ln3693186_sw"
@test SwtControls.SwitchedObj("Line.A8611_48332_sw") == nothing
@test SwtControls.SwitchedObj() == "line.a8611_48332_sw"

arr = String[]
for i in OpenDSSDirect.EachMember(SwtControls); push!(arr, SwtControls.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(SwtControls, SwtControls.Name))
    @test n == arr[i]
end
@test arr == SwtControls.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(SwtControls))

end # testset

