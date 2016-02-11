include("init.jl")
init8500()


@testset "solution" begin 

@test solution(:Solve) == 0
@test solution(:Mode) == 0
@test solution(:Mode, solution(:Mode)) == 0
@test solution(:Hour) == 0
@test solution(:Hour, solution(:Hour)) == 0
@test solution(:Year) == 0
@test solution(:Year, solution(:Year)) == 0
@test solution(:Iterations) == 45
@test solution(:MaxIterations) == 15
@test solution(:MaxIterations, solution(:MaxIterations)) == 0
@test solution(:Number) == 1
@test solution(:Number, solution(:Number)) == 0
@test solution(:Random) == 1
@test solution(:Random, solution(:Random)) == 0
@test solution(:LoadModel) == 1
@test solution(:LoadModel, solution(:LoadModel)) == 0
@test solution(:AddType) == 1
@test solution(:AddType, solution(:AddType)) == 0
@test solution(:Algorithm) == 0
@test solution(:Algorithm, solution(:Algorithm)) == 0
@test solution(:ControlMode) == 0
@test solution(:ControlMode, solution(:ControlMode)) == 0
@test solution(:ControlIterations) == 5
@test solution(:ControlIterations, solution(:ControlIterations)) == 0
@test solution(:MaxControlIterations) == 10
@test solution(:MaxControlIterations, solution(:MaxControlIterations)) == 0
@test solution(:SampleDoControlActions) == 0
@test solution(:CheckFaultStatus) == 0
@test solution(:SolveDirect) == 0
@test solution(:SolvePFlow) == 0
@test solution(:SolveNoControl) == 0
@test solution(:SolvePlusControl) == 0
@test solution(:InitSnap) == 0
@test solution(:CheckControls) == 0
@test solution(:SampleControlDevices) == 0
@test solution(:DoControlActions) == 0
@test solution(:BuildYMatrix) == 0
@test solution(:SystemYChanged) == 0
@test solution(:Converged) == 1
@test solution(:Converged, solution(:Converged)) == 0
@test solution(:TotalIterations) == 2
@test solution(:MostIterationsDone) == 0
@test solution(:ControlActionsDone) == 1
@test solution(:ControlActionsDone, solution(:ControlActionsDone)) == 0
@test solution(:FinishTimeStep) == 0
@test solution(:Cleanup) == 0
@test solution(:Frequency) ≈ 60.0
@test solution(:Frequency, solution(:Frequency)) ≈ 0.0
@test solution(:Seconds) ≈ 0.001
@test solution(:Seconds, solution(:Seconds)) ≈ 0.0
@test solution(:StepSize) ≈ 0.001
@test solution(:StepSize, solution(:StepSize)) ≈ 0.0
@test solution(:LoadMult) ≈ 1.0
@test solution(:LoadMult, solution(:LoadMult)) ≈ 0.0
@test solution(:Convergence) ≈ 0.0001
@test solution(:Convergence, solution(:Convergence)) ≈ 0.0
@test solution(:PctGrowth) ≈ 2.499999999999991
@test solution(:PctGrowth, solution(:PctGrowth)) ≈ 0.0
@test solution(:GenkW) ≈ 1000.0
@test solution(:GenkW, solution(:GenkW)) ≈ 0.0
@test solution(:GenPF) ≈ 1.0
@test solution(:GenPF, solution(:GenPF)) ≈ 0.0
@test solution(:Capkvar) ≈ 600.0
@test solution(:Capkvar, solution(:Capkvar)) ≈ 0.0
@test solution(:GenMult) ≈ 1.0
@test solution(:GenMult, solution(:GenMult)) ≈ 0.0
@test solution(:DblHour) ≈ 2.7777777777777776e-7
@test solution(:DblHour, solution(:DblHour)) ≈ 0.0
@test solution(:StepSizeMin) ≈ 0.0
@test solution(:StepSizeHr) ≈ 0.0
@test solution(:ModeID) == "Snap"
@test solution(:LDCurve) == ""
# @test solution(:LDCurve, solution(:LDCurve)) == ""
@test solution(:DefaultDaily) == "default"
@test solution(:DefaultDaily, solution(:DefaultDaily)) == ""
@test solution(:DefaultYearly) == "default"
@test solution(:DefaultYearly, solution(:DefaultYearly)) == ""
@test solution(:EventLog)[1][1:6] == "Hour=0"

end # testset

