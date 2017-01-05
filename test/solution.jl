
init8500()


@testset "Solution" begin 

@test Solution.Solve() == 0
@test Solution.Mode() == 0
@test Solution.Mode(Solution.Mode()) == 0
@test Solution.Hour() == 0
@test Solution.Hour(Solution.Hour()) == 0
@test Solution.Year() == 0
@test Solution.Year(Solution.Year()) == 0
@test Solution.Iterations() == 45
@test Solution.MaxIterations() == 15
@test Solution.MaxIterations(Solution.MaxIterations()) == 0
@test Solution.Number() == 1
@test Solution.Number(Solution.Number()) == 0
@test Solution.Random() == 1
@test Solution.Random(Solution.Random()) == 0
@test Solution.LoadModel() == 1
@test Solution.LoadModel(Solution.LoadModel()) == 0
@test Solution.AddType() == 1
@test Solution.AddType(Solution.AddType()) == 0
@test Solution.Algorithm() == 0
@test Solution.Algorithm(Solution.Algorithm()) == 0
@test Solution.ControlMode() == 0
@test Solution.ControlMode(Solution.ControlMode()) == 0
@test Solution.ControlIterations() == 5
@test Solution.ControlIterations(Solution.ControlIterations()) == 0
@test Solution.MaxControlIterations() == 10
@test Solution.MaxControlIterations(Solution.MaxControlIterations()) == 0
@test Solution.SampleDoControlActions() == 0
@test Solution.CheckFaultStatus() == 0
@test Solution.SolveDirect() == 0
@test Solution.SolvePFlow() == 0
@test Solution.SolveNoControl() == 0
@test Solution.SolvePlusControl() == 0
@test Solution.InitSnap() == 0
@test Solution.CheckControls() == 0
@test Solution.SampleControlDevices() == 0
@test Solution.DoControlActions() == 0
@test Solution.BuildYMatrix() == 0
@test Solution.SystemYChanged() == 0
@test Solution.Converged() == 1
@test Solution.Converged(Solution.Converged()) == 0
@test Solution.TotalIterations() == 2
@test Solution.MostIterationsDone() == 0
@test Solution.ControlActionsDone() == 1
@test Solution.ControlActionsDone(Solution.ControlActionsDone()) == 0
@test Solution.FinishTimeStep() == 0
@test Solution.Cleanup() == 0
@test Solution.Frequency() ≋ 60.0
@test Solution.Frequency(Solution.Frequency()) ≋ 0.0
@test Solution.Seconds() ≋ 0.001
@test Solution.Seconds(Solution.Seconds()) ≋ 0.0
@test Solution.StepSize() ≋ 0.001
@test Solution.StepSize(Solution.StepSize()) ≋ 0.0
@test Solution.LoadMult() ≋ 1.0
@test Solution.LoadMult(Solution.LoadMult()) ≋ 0.0
@test Solution.Convergence() ≋ 0.0001
@test Solution.Convergence(Solution.Convergence()) ≋ 0.0
@test Solution.PctGrowth() ≋ 2.499999999999991
@test Solution.PctGrowth(Solution.PctGrowth()) ≋ 0.0
@test Solution.GenkW() ≋ 1000.0
@test Solution.GenkW(Solution.GenkW()) ≋ 0.0
@test Solution.GenPF() ≋ 1.0
@test Solution.GenPF(Solution.GenPF()) ≋ 0.0
@test Solution.Capkvar() ≋ 600.0
@test Solution.Capkvar(Solution.Capkvar()) ≋ 0.0
@test Solution.GenMult() ≋ 1.0
@test Solution.GenMult(Solution.GenMult()) ≋ 0.0
@test Solution.DblHour() ≋ 2.7777777777777776e-7
@test Solution.DblHour(Solution.DblHour()) ≋ 0.0
@test Solution.StepSizeMin() ≋ 0.0
@test Solution.StepSizeHr() ≋ 0.0
@test Solution.ProcessTime() > 0.0
Solution.TotalTime(0.0)
@test Solution.TotalTime() ≋ 0.0
@test Solution.TimeTimeStep() > 0.0
@test Solution.ModeID() == "Snap"
@test Solution.LDCurve() == ""
# @test Solution.LDCurve(Solution.LDCurve()) == ""
@test Solution.DefaultDaily() == "default"
@test Solution.DefaultDaily(Solution.DefaultDaily()) == ""
@test Solution.DefaultYearly() == "default"
@test Solution.DefaultYearly(Solution.DefaultYearly()) == ""
@test Solution.EventLog()[1][1:6] == "Hour=0"

end # testset

