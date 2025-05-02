module Solution

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Build Y Matrix"""
function BuildYMatrix(dss::DSSContext, BuildOption::Int, AllocateVI::Int)
    @checked Lib.Solution_BuildYMatrix(dss.ctx, BuildOption, AllocateVI)
end
BuildYMatrix(BuildOption::Int, AllocateVI::Int) = BuildYMatrix(DSS_DEFAULT_CTX, BuildOption, AllocateVI)

"""Check Controls"""
function CheckControls(dss::DSSContext)
    @checked Lib.Solution_CheckControls(dss.ctx)
end
CheckControls() = CheckControls(DSS_DEFAULT_CTX)

"""Check Fault Status"""
function CheckFaultStatus(dss::DSSContext)
    @checked Lib.Solution_CheckFaultStatus(dss.ctx)
end
CheckFaultStatus() = CheckFaultStatus(DSS_DEFAULT_CTX)

"""Clean up Solution"""
function Cleanup(dss::DSSContext)
    @checked Lib.Solution_Cleanup(dss.ctx)
end
Cleanup() = Cleanup(DSS_DEFAULT_CTX)

"""Do Control Actions"""
function DoControlActions(dss::DSSContext)
    @checked Lib.Solution_DoControlActions(dss.ctx)
end
DoControlActions() = DoControlActions(DSS_DEFAULT_CTX)

"""Finish Time Step"""
function FinishTimeStep(dss::DSSContext)
    @checked Lib.Solution_FinishTimeStep(dss.ctx)
end
FinishTimeStep() = FinishTimeStep(DSS_DEFAULT_CTX)

"""Initialize Snapshot Solution"""
function InitSnap(dss::DSSContext)
    @checked Lib.Solution_InitSnap(dss.ctx)
end
InitSnap() = InitSnap(DSS_DEFAULT_CTX)

"""Sample Control Devices"""
function SampleControlDevices(dss::DSSContext)
    @checked Lib.Solution_SampleControlDevices(dss.ctx)
end
SampleControlDevices() = SampleControlDevices(DSS_DEFAULT_CTX)

"""Sample Control Devices and Do Control Actions"""
function SampleDoControlActions(dss::DSSContext)
    @checked Lib.Solution_Sample_DoControlActions(dss.ctx)
end
SampleDoControlActions() = SampleDoControlActions(DSS_DEFAULT_CTX)

"""Solve"""
function Solve(dss::DSSContext)
    @checked Lib.Solution_Solve(dss.ctx)
end
Solve() = Solve(DSS_DEFAULT_CTX)

"""Solve direct"""
function SolveDirect(dss::DSSContext)
    @checked Lib.Solution_SolveDirect(dss.ctx)
end
SolveDirect() = SolveDirect(DSS_DEFAULT_CTX)

"""Solve no control"""
function SolveNoControl(dss::DSSContext)
    @checked Lib.Solution_SolveNoControl(dss.ctx)
end
SolveNoControl() = SolveNoControl(DSS_DEFAULT_CTX)

"""Solve Power Flow"""
function SolvePFlow(dss::DSSContext)
    @checked Lib.Solution_SolvePflow(dss.ctx)
end
SolvePFlow() = SolvePFlow(DSS_DEFAULT_CTX)

"""Solve Plus Control"""
function SolvePlusControl(dss::DSSContext)
    @checked Lib.Solution_SolvePlusControl(dss.ctx)
end
SolvePlusControl() = SolvePlusControl(DSS_DEFAULT_CTX)

"""Solve Snap"""
function SolveSnap(dss::DSSContext)
    @checked Lib.Solution_SolveSnap(dss.ctx)
end
SolveSnap() = SolveSnap(DSS_DEFAULT_CTX)

"""
Type of device to add in AutoAdd Mode: {dssGen (Default) | dssCap}

Original COM help: https://opendss.epri.com/AddType.html

(Getter)
"""
function AddType(dss::DSSContext)::Lib.AutoAddTypes
    return @checked Lib.Solution_Get_AddType(dss.ctx)
end
AddType() = AddType(DSS_DEFAULT_CTX)

"""
Type of device to add in AutoAdd Mode: {dssGen (Default) | dssCap}

Original COM help: https://opendss.epri.com/AddType.html

(Setter)
"""
function AddType(dss::DSSContext, Value::Union{Int,Lib.AutoAddTypes})
    Value = convert(Lib.AutoAddTypes, Value)
    @checked Lib.Solution_Set_AddType(dss.ctx, Value)
end
AddType(Value::Union{Int,Lib.AutoAddTypes}) = AddType(DSS_DEFAULT_CTX, Value)

"""
Base Solution algorithm

Original COM help: https://opendss.epri.com/Algorithm.html

(Getter)
"""
function Algorithm(dss::DSSContext)::Lib.SolutionAlgorithms
    return @checked Lib.Solution_Get_Algorithm(dss.ctx)
end
Algorithm() = Algorithm(DSS_DEFAULT_CTX)

"""
Base Solution algorithm

Original COM help: https://opendss.epri.com/Algorithm.html

(Setter)
"""
function Algorithm(dss::DSSContext, Value::Union{Int,Lib.SolutionAlgorithms})
    Value = convert(Lib.SolutionAlgorithms, Value)
    @checked Lib.Solution_Set_Algorithm(dss.ctx, Value)
end
Algorithm(Value::Union{Int,Lib.SolutionAlgorithms}) = Algorithm(DSS_DEFAULT_CTX, Value)

"""
Capacitor kvar for adding capacitors in AutoAdd mode

Original COM help: https://opendss.epri.com/Capkvar.html

(Getter)
"""
function Capkvar(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_Capkvar(dss.ctx)
end
Capkvar() = Capkvar(DSS_DEFAULT_CTX)

"""
Capacitor kvar for adding capacitors in AutoAdd mode

Original COM help: https://opendss.epri.com/Capkvar.html

(Setter)
"""
function Capkvar(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_Capkvar(dss.ctx, Value)
end
Capkvar(Value::Float64) = Capkvar(DSS_DEFAULT_CTX, Value)

"""
Flag indicating the control actions are done.

Original COM help: https://opendss.epri.com/ControlActionsDone.html

(Getter)
"""
function ControlActionsDone(dss::DSSContext)::Bool
    return @checked(Lib.Solution_Get_ControlActionsDone(dss.ctx)) != 0
end
ControlActionsDone() = ControlActionsDone(DSS_DEFAULT_CTX)

"""
Flag indicating the control actions are done.

Original COM help: https://opendss.epri.com/ControlActionsDone.html

(Setter)
"""
function ControlActionsDone(dss::DSSContext, Value::Bool)
    @checked Lib.Solution_Set_ControlActionsDone(dss.ctx, Value ? 1 : 0)
end
ControlActionsDone(Value::Bool) = ControlActionsDone(DSS_DEFAULT_CTX, Value)

"""
Value of the control iteration counter

Original COM help: https://opendss.epri.com/ControlIterations.html

(Getter)
"""
function ControlIterations(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_ControlIterations(dss.ctx)
end
ControlIterations() = ControlIterations(DSS_DEFAULT_CTX)

"""
Value of the control iteration counter

Original COM help: https://opendss.epri.com/ControlIterations.html

(Setter)
"""
function ControlIterations(dss::DSSContext, Value::Int)
    @checked Lib.Solution_Set_ControlIterations(dss.ctx, Value)
end
ControlIterations(Value::Int) = ControlIterations(DSS_DEFAULT_CTX, Value)

"""
Modes for control devices

Original COM help: https://opendss.epri.com/ControlMode.html

(Getter)
"""
function ControlMode(dss::DSSContext)::Lib.ControlModes
    return @checked Lib.Solution_Get_ControlMode(dss.ctx)
end
ControlMode() = ControlMode(DSS_DEFAULT_CTX)

"""
Modes for control devices

Original COM help: https://opendss.epri.com/ControlMode.html

(Setter)
"""
function ControlMode(dss::DSSContext, Value::Union{Int,Lib.ControlModes})
    Value = convert(Lib.ControlModes, Value)
    @checked Lib.Solution_Set_ControlMode(dss.ctx, Value)
end
ControlMode(Value::Union{Int,Lib.ControlModes}) = ControlMode(DSS_DEFAULT_CTX, Value)

"""
Flag to indicate whether the circuit solution converged

Original COM help: https://opendss.epri.com/Converged.html

(Getter)
"""
function Converged(dss::DSSContext)::Bool
    return @checked(Lib.Solution_Get_Converged(dss.ctx)) != 0
end
Converged() = Converged(DSS_DEFAULT_CTX)

"""
Flag to indicate whether the circuit solution converged

Original COM help: https://opendss.epri.com/Converged.html

(Setter)
"""
function Converged(dss::DSSContext, Value::Bool)
    @checked Lib.Solution_Set_Converged(dss.ctx, Value ? 1 : 0)
end
Converged(Value::Bool) = Converged(DSS_DEFAULT_CTX, Value)

"""
Default daily load shape (defaults to "Default")

Original COM help: https://opendss.epri.com/DefaultDaily.html

(Getter)
"""
function DefaultDaily(dss::DSSContext)::String
    return get_string(@checked Lib.Solution_Get_DefaultDaily(dss.ctx))
end
DefaultDaily() = DefaultDaily(DSS_DEFAULT_CTX)

"""
Default daily load shape (defaults to "Default")

Original COM help: https://opendss.epri.com/DefaultDaily.html

(Setter)
"""
function DefaultDaily(dss::DSSContext, Value::String)
    @checked Lib.Solution_Set_DefaultDaily(dss.ctx, Value)
end
DefaultDaily(Value::String) = DefaultDaily(DSS_DEFAULT_CTX, Value)

"""
Default Yearly load shape (defaults to "Default")

Original COM help: https://opendss.epri.com/DefaultYearly.html

(Getter)
"""
function DefaultYearly(dss::DSSContext)::String
    return get_string(@checked Lib.Solution_Get_DefaultYearly(dss.ctx))
end
DefaultYearly() = DefaultYearly(DSS_DEFAULT_CTX)

"""
Default Yearly load shape (defaults to "Default")

Original COM help: https://opendss.epri.com/DefaultYearly.html

(Setter)
"""
function DefaultYearly(dss::DSSContext, Value::String)
    @checked Lib.Solution_Set_DefaultYearly(dss.ctx, Value)
end
DefaultYearly(Value::String) = DefaultYearly(DSS_DEFAULT_CTX, Value)

"""
Array of strings containing the Event Log

Original COM help: https://opendss.epri.com/EventLog.html
"""
function EventLog(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Solution_Get_EventLog, dss.ctx)
end
EventLog() = EventLog(DSS_DEFAULT_CTX)

"""
Set the Frequency for next solution

Original COM help: https://opendss.epri.com/Frequency1.html

(Getter)
"""
function Frequency(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_Frequency(dss.ctx)
end
Frequency() = Frequency(DSS_DEFAULT_CTX)

"""
Set the Frequency for next solution

Original COM help: https://opendss.epri.com/Frequency1.html

(Setter)
"""
function Frequency(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_Frequency(dss.ctx, Value)
end
Frequency(Value::Float64) = Frequency(DSS_DEFAULT_CTX, Value)

"""
Default Multiplier applied to generators (like LoadMult)

Original COM help: https://opendss.epri.com/GenMult.html

(Getter)
"""
function GenMult(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_GenMult(dss.ctx)
end
GenMult() = GenMult(DSS_DEFAULT_CTX)

"""
Default Multiplier applied to generators (like LoadMult)

Original COM help: https://opendss.epri.com/GenMult.html

(Setter)
"""
function GenMult(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_GenMult(dss.ctx, Value)
end
GenMult(Value::Float64) = GenMult(DSS_DEFAULT_CTX, Value)

"""
PF for generators in AutoAdd mode

Original COM help: https://opendss.epri.com/GenPF.html

(Getter)
"""
function GenPF(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_GenPF(dss.ctx)
end
GenPF() = GenPF(DSS_DEFAULT_CTX)

"""
PF for generators in AutoAdd mode

Original COM help: https://opendss.epri.com/GenPF.html

(Setter)
"""
function GenPF(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_GenPF(dss.ctx, Value)
end
GenPF(Value::Float64) = GenPF(DSS_DEFAULT_CTX, Value)

"""
Generator kW for AutoAdd mode

Original COM help: https://opendss.epri.com/GenkW.html

(Getter)
"""
function GenkW(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_GenkW(dss.ctx)
end
GenkW() = GenkW(DSS_DEFAULT_CTX)

"""
Generator kW for AutoAdd mode

Original COM help: https://opendss.epri.com/GenkW.html

(Setter)
"""
function GenkW(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_GenkW(dss.ctx, Value)
end
GenkW(Value::Float64) = GenkW(DSS_DEFAULT_CTX, Value)

"""
Set Hour for time series solutions.

Original COM help: https://opendss.epri.com/Hour.html

(Getter)
"""
function Hour(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_Hour(dss.ctx)
end
Hour() = Hour(DSS_DEFAULT_CTX)

"""
Set Hour for time series solutions.

Original COM help: https://opendss.epri.com/Hour.html

(Setter)
"""
function Hour(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_Hour(dss.ctx, Value)
end
Hour(Value::Float64) = Hour(DSS_DEFAULT_CTX, Value)

"""
Solution.IntervalHrs variable used for devices that integrate for custom solution algorithms

(Getter)
"""
function IntervalHrs(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_IntervalHrs(dss.ctx)
end
IntervalHrs() = IntervalHrs(DSS_DEFAULT_CTX)

"""
Solution.IntervalHrs variable used for devices that integrate for custom solution algorithms

(Setter)
"""
function IntervalHrs(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_IntervalHrs(dss.ctx, Value)
end
IntervalHrs(Value::Float64) = IntervalHrs(DSS_DEFAULT_CTX, Value)

"""
Number of iterations taken for last solution. (Same as Totaliterations)

Original COM help: https://opendss.epri.com/Iterations.html
"""
function Iterations(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_Iterations(dss.ctx)
end
Iterations() = Iterations(DSS_DEFAULT_CTX)

"""
Load-Duration Curve name for LD modes

Original COM help: https://opendss.epri.com/LDCurve.html

(Getter)
"""
function LDCurve(dss::DSSContext)::String
    return get_string(@checked Lib.Solution_Get_LDCurve(dss.ctx))
end
LDCurve() = LDCurve(DSS_DEFAULT_CTX)

"""
Load-Duration Curve name for LD modes

Original COM help: https://opendss.epri.com/LDCurve.html

(Setter)
"""
function LDCurve(dss::DSSContext, Value::String)
    @checked Lib.Solution_Set_LDCurve(dss.ctx, Value)
end
LDCurve(Value::String) = LDCurve(DSS_DEFAULT_CTX, Value)

"""
Load Model: {dssPowerFlow (default) | dssAdmittance}

Original COM help: https://opendss.epri.com/LoadModel.html

(Getter)
"""
function LoadModel(dss::DSSContext)::Lib.SolutionLoadModels
    return @checked Lib.Solution_Get_LoadModel(dss.ctx)
end
LoadModel() = LoadModel(DSS_DEFAULT_CTX)

"""
Load Model: {dssPowerFlow (default) | dssAdmittance}

Original COM help: https://opendss.epri.com/LoadModel.html

(Setter)
"""
function LoadModel(dss::DSSContext, Value::Union{Int,Lib.SolutionLoadModels})
    Value = convert(Lib.SolutionLoadModels, Value)
    @checked Lib.Solution_Set_LoadModel(dss.ctx, Value)
end
LoadModel(Value::Union{Int,Lib.SolutionLoadModels}) = LoadModel(DSS_DEFAULT_CTX, Value)

"""
Default load multiplier applied to all non-fixed loads

Original COM help: https://opendss.epri.com/LoadMult.html

(Getter)
"""
function LoadMult(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_LoadMult(dss.ctx)
end
LoadMult() = LoadMult(DSS_DEFAULT_CTX)

"""
Default load multiplier applied to all non-fixed loads

Original COM help: https://opendss.epri.com/LoadMult.html

(Setter)
"""
function LoadMult(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_LoadMult(dss.ctx, Value)
end
LoadMult(Value::Float64) = LoadMult(DSS_DEFAULT_CTX, Value)

"""
Maximum allowable control iterations

Original COM help: https://opendss.epri.com/MaxControlIterations.html

(Getter)
"""
function MaxControlIterations(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_MaxControlIterations(dss.ctx)
end
MaxControlIterations() = MaxControlIterations(DSS_DEFAULT_CTX)

"""
Maximum allowable control iterations

Original COM help: https://opendss.epri.com/MaxControlIterations.html

(Setter)
"""
function MaxControlIterations(dss::DSSContext, Value::Int)
    @checked Lib.Solution_Set_MaxControlIterations(dss.ctx, Value)
end
MaxControlIterations(Value::Int) = MaxControlIterations(DSS_DEFAULT_CTX, Value)

"""
Max allowable iterations.

Original COM help: https://opendss.epri.com/MaxIterations.html

(Getter)
"""
function MaxIterations(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_MaxIterations(dss.ctx)
end
MaxIterations() = MaxIterations(DSS_DEFAULT_CTX)

"""
Max allowable iterations.

Original COM help: https://opendss.epri.com/MaxIterations.html

(Setter)
"""
function MaxIterations(dss::DSSContext, Value::Int)
    @checked Lib.Solution_Set_MaxIterations(dss.ctx, Value)
end
MaxIterations(Value::Int) = MaxIterations(DSS_DEFAULT_CTX, Value)

"""
Minimum number of iterations required for a power flow solution.

Original COM help: https://opendss.epri.com/MinIterations.html

(Getter)
"""
function MinIterations(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_MinIterations(dss.ctx)
end
MinIterations() = MinIterations(DSS_DEFAULT_CTX)

"""
Minimum number of iterations required for a power flow solution.

Original COM help: https://opendss.epri.com/MinIterations.html

(Setter)
"""
function MinIterations(dss::DSSContext, Value::Int)
    @checked Lib.Solution_Set_MinIterations(dss.ctx, Value)
end
MinIterations(Value::Int) = MinIterations(DSS_DEFAULT_CTX, Value)

"""
Set present solution mode

Original COM help: https://opendss.epri.com/Mode2.html

(Getter)
"""
function Mode(dss::DSSContext)::Lib.SolveModes
    return @checked Lib.Solution_Get_Mode(dss.ctx)
end
Mode() = Mode(DSS_DEFAULT_CTX)

"""
Set present solution mode

Original COM help: https://opendss.epri.com/Mode2.html

(Setter)
"""
function Mode(dss::DSSContext, Value::Union{Int,Lib.SolveModes})
    Value = convert(Lib.SolveModes, Value)
    @checked Lib.Solution_Set_Mode(dss.ctx, Value)
end
Mode(Value::Union{Int,Lib.SolveModes}) = Mode(DSS_DEFAULT_CTX, Value)

"""
ID (text) of the present solution mode

Original COM help: https://opendss.epri.com/ModeID.html
"""
function ModeID(dss::DSSContext)::String
    return get_string(@checked Lib.Solution_Get_ModeID(dss.ctx))
end
ModeID() = ModeID(DSS_DEFAULT_CTX)

"""
Max number of iterations required to converge at any control iteration of the most recent solution.

Original COM help: https://opendss.epri.com/MostIterationsDone.html
"""
function MostIterationsDone(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_MostIterationsDone(dss.ctx)
end
MostIterationsDone() = MostIterationsDone(DSS_DEFAULT_CTX)

"""
Number of solutions to perform for Monte Carlo and time series simulations

Original COM help: https://opendss.epri.com/Number1.html

(Getter)
"""
function Number(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_Number(dss.ctx)
end
Number() = Number(DSS_DEFAULT_CTX)

"""
Number of solutions to perform for Monte Carlo and time series simulations

Original COM help: https://opendss.epri.com/Number1.html

(Setter)
"""
function Number(dss::DSSContext, Value::Int)
    @checked Lib.Solution_Set_Number(dss.ctx, Value)
end
Number(Value::Int) = Number(DSS_DEFAULT_CTX, Value)

"""Gets the time required to perform the latest solution (Read only)"""
function ProcessTime(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_Process_Time(dss.ctx)
end
ProcessTime() = ProcessTime(DSS_DEFAULT_CTX)

"""
Randomization mode for random variables "Gaussian" or "Uniform"

Original COM help: https://opendss.epri.com/Random.html

(Getter)
"""
function Random(dss::DSSContext)::Lib.RandomModes
    return @checked Lib.Solution_Get_Random(dss.ctx)
end
Random() = Random(DSS_DEFAULT_CTX)

"""
Randomization mode for random variables "Gaussian" or "Uniform"

Original COM help: https://opendss.epri.com/Random.html

(Setter)
"""
function Random(dss::DSSContext, Value::Union{Int,Lib.RandomModes})
    Value = convert(Lib.RandomModes, Value)
    @checked Lib.Solution_Set_Random(dss.ctx, Value)
end
Random(Value::Union{Int,Lib.RandomModes}) = Random(DSS_DEFAULT_CTX, Value)

"""
Seconds from top of the hour.

Original COM help: https://opendss.epri.com/Seconds.html

(Getter)
"""
function Seconds(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_Seconds(dss.ctx)
end
Seconds() = Seconds(DSS_DEFAULT_CTX)

"""
Seconds from top of the hour.

Original COM help: https://opendss.epri.com/Seconds.html

(Setter)
"""
function Seconds(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_Seconds(dss.ctx, Value)
end
Seconds(Value::Float64) = Seconds(DSS_DEFAULT_CTX, Value)

"""
Time step size in sec

Original COM help: https://opendss.epri.com/StepSize.html

(Getter)
"""
function StepSize(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_StepSize(dss.ctx)
end
StepSize() = StepSize(DSS_DEFAULT_CTX)

"""
Time step size in sec

Original COM help: https://opendss.epri.com/StepSize.html

(Setter)
"""
function StepSize(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_StepSize(dss.ctx, Value)
end
StepSize(Value::Float64) = StepSize(DSS_DEFAULT_CTX, Value)

"""
Flag that indicates if elements of the System Y have been changed by recent activity.

Original COM help: https://opendss.epri.com/SystemYChanged.html
"""
function SystemYChanged(dss::DSSContext)::Bool
    return @checked(Lib.Solution_Get_SystemYChanged(dss.ctx)) != 0
end
SystemYChanged() = SystemYChanged(DSS_DEFAULT_CTX)

"""Get the solution process time + sample time for time step"""
function TimeTimeStep(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_Time_of_Step(dss.ctx)
end
TimeTimeStep() = TimeTimeStep(DSS_DEFAULT_CTX)

"""
Solution convergence tolerance.

(Getter)
"""
function Tolerance(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_Tolerance(dss.ctx)
end
Tolerance() = Tolerance(DSS_DEFAULT_CTX)

"""
Solution convergence tolerance.

(Setter)
"""
function Tolerance(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_Tolerance(dss.ctx, Value)
end
Tolerance(Value::Float64) = Tolerance(DSS_DEFAULT_CTX, Value)

const Convergence = Tolerance
@deprecate Convergence Tolerance

"""
Accumulated time of the simulation

(Getter)
"""
function TotalTime(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_Total_Time(dss.ctx)
end
TotalTime() = TotalTime(DSS_DEFAULT_CTX)

"""
Accumulated time of the simulation

(Setter)
"""
function TotalTime(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_Total_Time(dss.ctx, Value)
end
TotalTime(Value::Float64) = TotalTime(DSS_DEFAULT_CTX, Value)

"""
Total iterations including control iterations for most recent solution.

Original COM help: https://opendss.epri.com/Totaliterations.html
"""
function TotalIterations(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_Totaliterations(dss.ctx)
end
TotalIterations() = TotalIterations(DSS_DEFAULT_CTX)

"""
Set year for planning studies

Original COM help: https://opendss.epri.com/Year.html

(Getter)
"""
function Year(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_Year(dss.ctx)
end
Year() = Year(DSS_DEFAULT_CTX)

"""
Set year for planning studies

Original COM help: https://opendss.epri.com/Year.html

(Setter)
"""
function Year(dss::DSSContext, Value::Int)
    @checked Lib.Solution_Set_Year(dss.ctx, Value)
end
Year(Value::Int) = Year(DSS_DEFAULT_CTX, Value)

"""
Hour as a double, including fractional part

Original COM help: https://opendss.epri.com/dblHour1.html

(Getter)
"""
function DblHour(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_dblHour(dss.ctx)
end
DblHour() = DblHour(DSS_DEFAULT_CTX)

"""
Hour as a double, including fractional part

Original COM help: https://opendss.epri.com/dblHour1.html

(Setter)
"""
function DblHour(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_dblHour(dss.ctx, Value)
end
DblHour(Value::Float64) = DblHour(DSS_DEFAULT_CTX, Value)

"""
Percent default  annual load growth rate

Original COM help: https://opendss.epri.com/pctGrowth.html

(Getter)
"""
function PctGrowth(dss::DSSContext)
    return @checked Lib.Solution_Get_pctGrowth(dss.ctx)
end
PctGrowth() = PctGrowth(DSS_DEFAULT_CTX)

"""
Percent default  annual load growth rate

Original COM help: https://opendss.epri.com/pctGrowth.html

(Setter)
"""
function PctGrowth(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_pctGrowth(dss.ctx, Value)
end
PctGrowth(Value::Float64) = PctGrowth(DSS_DEFAULT_CTX, Value)

"""
Set Stepsize in Hr

(Setter)
"""
function StepSizeHr(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_StepsizeHr(dss.ctx, Value)
end
StepSizeHr(Value::Float64) = StepSizeHr(DSS_DEFAULT_CTX, Value)

"""
Set Stepsize in minutes

(Setter)
"""
function StepSizeMin(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_StepsizeMin(dss.ctx, Value)
end
StepSizeMin(Value::Float64) = StepSizeMin(DSS_DEFAULT_CTX, Value)

"""Solves the circuits for all the Actors created"""
function SolveAll(dss::DSSContext)
    @checked Lib.Solution_SolveAll(dss.ctx)
end
SolveAll() = SolveAll(DSS_DEFAULT_CTX)

"""
Names of the rows of the branch-to-node (B2N) matrix.

Original COM help: https://opendss.epri.com/IncMatrixRows.html
"""
function IncMatrixRows(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Solution_Get_IncMatrixRows, dss.ctx)
end
IncMatrixRows() = IncMatrixRows(DSS_DEFAULT_CTX)

"""
Names of the columns of the branch-to-node (B2N) matrix.

Original COM help: https://opendss.epri.com/IncMatrixCols.html
"""
function IncMatrixCols(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Solution_Get_IncMatrixCols, dss.ctx)
end
IncMatrixCols() = IncMatrixCols(DSS_DEFAULT_CTX)

"""
Incidence branch-to-node (B2N) matrix calculated for the model as a vector of integers.

The vector represents a sparse matrix (non-zero values are the only ones delivered) and
can be interpreted as follows: The first element is the row number, the second one is
the column and the third is the value, this way, by dividing the number of elements
in the array by 3 the user can obtain the number of rows in case of wanting to sort
the vector values within a matrix.

Original COM help: https://opendss.epri.com/IncMatrix.html
"""
function IncMatrix(dss::DSSContext)::Vector{Int32}
    return get_int32_array(Lib.Solution_Get_IncMatrix, dss.ctx)
end
IncMatrix() = IncMatrix(DSS_DEFAULT_CTX)

"""
Bus levels for all the buses in the model.

The bus levels are calculated after calculating the incidence branch-to-node (B2N)
matrix and they represent the distance from the buses to a reference that goes from
the feeder head to the farthest bus in the model. The bus level index matches with
the bus list obtained with the circuit interface.

Original COM help: https://opendss.epri.com/BusLevels.html
"""
function BusLevels(dss::DSSContext)::Vector{Int32}
    return get_int32_array(Lib.Solution_Get_BusLevels, dss.ctx)
end
BusLevels() = BusLevels(DSS_DEFAULT_CTX)

"""
Laplacian matrix calculated in OpenDSS based on the latest branch-to-node (B2N) matrix.

The vector represents a sparse matrix (non-zero values are the only ones delivered) and
can be interpreted as follows: The first element is the row number, the second one is
the column and the third is the value, this way, by dividing the number of elements
in the array by 3 the user can obtain the number of rows in case of wanting to sort
the vector values within a matrix. The tables for the columns and rows are the same
as the columns for the B2N columns (square matrix).

Original COM help: https://opendss.epri.com/Laplacian.html
"""
function Laplacian(dss::DSSContext)::Vector{Int32}
    return get_int32_array(Lib.Solution_Get_Laplacian, dss.ctx)
end
Laplacian() = Laplacian(DSS_DEFAULT_CTX)

end
