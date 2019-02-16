
init8500()


@testset "Solution" begin

@test Solution.Solve() == nothing
@test Solution.Mode() == 0
@test Solution.Mode() == OpenDSSDirect.Lib.SolveModes_SnapShot
@test Solution.Mode(0) == nothing
@test Solution.Mode(OpenDSSDirect.Lib.SolveModes_SnapShot) == nothing
@test Solution.Hour() == 0
@test Solution.Hour(Solution.Hour()) == nothing
@test Solution.Year() == 0
@test Solution.Year(Solution.Year()) == nothing
@test Solution.Iterations() == 45
@test Solution.MaxIterations() == 15
@test Solution.MaxIterations(Solution.MaxIterations()) == nothing
@test Solution.Number() == 1
@test Solution.Number(Solution.Number()) == nothing
@test Solution.Random() == 1
@test Solution.Random() == OpenDSSDirect.Lib.RandomModes_Gaussian
@test Solution.Random(1) == nothing
@test Solution.Random(OpenDSSDirect.Lib.RandomModes_Gaussian) == nothing
@test Solution.LoadModel() == 1
@test Solution.LoadModel(Solution.LoadModel()) == nothing
@test Solution.AddType() == 1
@test Solution.AddType() == OpenDSSDirect.Lib.AutoAddTypes_AddGen
@test Solution.AddType(1) == nothing
@test Solution.AddType(OpenDSSDirect.Lib.AutoAddTypes_AddGen) == nothing
@test Solution.Algorithm() == 0
@test Solution.Algorithm() == OpenDSSDirect.Lib.SolutionAlgorithms_NormalSolve
@test Solution.Algorithm(0) == nothing
@test Solution.Algorithm(OpenDSSDirect.Lib.SolutionAlgorithms_NormalSolve) == nothing
@test Solution.ControlMode() == 0
@test Solution.ControlMode() == OpenDSSDirect.Lib.ControlModes_Static
@test Solution.ControlMode(0) == nothing
@test Solution.ControlMode(OpenDSSDirect.Lib.ControlModes_Static) == nothing
@test Solution.ControlIterations() == 5
@test Solution.ControlIterations(Solution.ControlIterations()) == nothing
@test Solution.MaxControlIterations() == 10
@test Solution.MaxControlIterations(Solution.MaxControlIterations()) == nothing
@test Solution.SampleDoControlActions() == nothing
@test Solution.CheckFaultStatus() == nothing
@test Solution.SolveDirect() == nothing
@test Solution.SolvePFlow() == nothing
@test Solution.SolveNoControl() == nothing
@test Solution.SolvePlusControl() == nothing
@test Solution.InitSnap() == nothing
@test Solution.CheckControls() == nothing
@test Solution.SampleControlDevices() == nothing
@test Solution.DoControlActions() == nothing
# @test Solution.BuildYMatrix() == 0
@test Solution.SystemYChanged() == 0
@test Solution.Converged() == 1
@test Solution.Converged(Solution.Converged()) == nothing
@test Solution.TotalIterations() == 2
@test Solution.MostIterationsDone() == 0
@test Solution.ControlActionsDone() == 1
@test Solution.ControlActionsDone(Solution.ControlActionsDone()) == nothing
@test Solution.FinishTimeStep() == nothing
@test Solution.Cleanup() == nothing
@test Solution.Frequency() ≋ 60.0
@test Solution.Frequency(Solution.Frequency()) == nothing
@test Solution.Seconds() ≋ 0.001
@test Solution.Seconds(Solution.Seconds()) == nothing
@test Solution.StepSize() ≋ 0.001
@test Solution.StepSize(Solution.StepSize()) == nothing
@test Solution.LoadMult() ≋ 1.0
@test Solution.LoadMult(Solution.LoadMult()) == nothing
@test Solution.Convergence() ≋ 0.0001
@test Solution.Convergence(Solution.Convergence()) == nothing
@test Solution.PctGrowth() ≋ 2.499999999999991
@test Solution.PctGrowth(Solution.PctGrowth()) == nothing
@test Solution.GenkW() ≋ 1000.0
@test Solution.GenkW(Solution.GenkW()) == nothing
@test Solution.GenPF() ≋ 1.0
@test Solution.GenPF(Solution.GenPF()) == nothing
@test Solution.Capkvar() ≋ 600.0
@test Solution.Capkvar(Solution.Capkvar()) == nothing
@test Solution.GenMult() ≋ 1.0
@test Solution.GenMult(Solution.GenMult()) == nothing
@test Solution.DblHour() ≋ 2.7777777777777776e-7
@test Solution.DblHour(Solution.DblHour()) == nothing
# @test Solution.StepSizeMin() ≋ 0.0
# @test Solution.StepSizeHr() ≋ 0.0
Solution.ProcessTime()
Solution.TotalTime(0.0)
Solution.TotalTime()
Solution.TimeTimeStep()
@test Solution.ModeID() == "Snap"
@test Solution.LDCurve() == ""
# @test Solution.LDCurve(Solution.LDCurve()) == nothing
@test Solution.DefaultDaily() == "default"
@test Solution.DefaultDaily(Solution.DefaultDaily()) == nothing
@test Solution.DefaultYearly() == "default"
@test Solution.DefaultYearly(Solution.DefaultYearly()) == nothing
@test Solution.EventLog()[1][1:6] == "Hour=0"

end # testset
