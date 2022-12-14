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

"""Sample Do Control Actions"""
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

"""Type of device to add in AutoAdd Mode: {dssGen (Default) | dssCap} (Getter)"""
function AddType(dss::DSSContext)::Lib.AutoAddTypes
    return @checked Lib.Solution_Get_AddType(dss.ctx)
end
AddType() = AddType(DSS_DEFAULT_CTX)

"""Type of device to add in AutoAdd Mode: {dssGen (Default) | dssCap} (Setter)"""
function AddType(dss::DSSContext, Value::Union{Int,Lib.AutoAddTypes})
    Value = convert(Lib.AutoAddTypes, Value)
    @checked Lib.Solution_Set_AddType(dss.ctx, Value)
end
AddType(Value::Union{Int,Lib.AutoAddTypes}) = AddType(DSS_DEFAULT_CTX, Value)

"""Base Solution algorithm: {dssNormalSolve | dssNewtonSolve} (Getter)"""
function Algorithm(dss::DSSContext)::Lib.SolutionAlgorithms
    return @checked Lib.Solution_Get_Algorithm(dss.ctx)
end
Algorithm() = Algorithm(DSS_DEFAULT_CTX)

"""Base Solution algorithm: {dssNormalSolve | dssNewtonSolve} (Setter)"""
function Algorithm(dss::DSSContext, Value::Union{Int,Lib.SolutionAlgorithms})
    Value = convert(Lib.SolutionAlgorithms, Value)
    @checked Lib.Solution_Set_Algorithm(dss.ctx, Value)
end
Algorithm(Value::Union{Int,Lib.SolutionAlgorithms}) = Algorithm(DSS_DEFAULT_CTX, Value)

"""Capacitor kvar for adding capacitors in AutoAdd mode (Getter)"""
function Capkvar(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_Capkvar(dss.ctx)
end
Capkvar() = Capkvar(DSS_DEFAULT_CTX)

"""Capacitor kvar for adding capacitors in AutoAdd mode (Setter)"""
function Capkvar(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_Capkvar(dss.ctx, Value)
end
Capkvar(Value::Float64) = Capkvar(DSS_DEFAULT_CTX, Value)

"""Flag indicating the control actions are done. (Getter)"""
function ControlActionsDone(dss::DSSContext)::Bool
    return @checked(Lib.Solution_Get_ControlActionsDone(dss.ctx)) != 0
end
ControlActionsDone() = ControlActionsDone(DSS_DEFAULT_CTX)

"""Flag indicating the control actions are done. (Setter)"""
function ControlActionsDone(dss::DSSContext, Value::Bool)
    @checked Lib.Solution_Set_ControlActionsDone(dss.ctx, Value ? 1 : 0)
end
ControlActionsDone(Value::Bool) = ControlActionsDone(DSS_DEFAULT_CTX, Value)

"""Value of the control iteration counter (Getter)"""
function ControlIterations(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_ControlIterations(dss.ctx)
end
ControlIterations() = ControlIterations(DSS_DEFAULT_CTX)

"""Value of the control iteration counter (Setter)"""
function ControlIterations(dss::DSSContext, Value::Int)
    @checked Lib.Solution_Set_ControlIterations(dss.ctx, Value)
end
ControlIterations(Value::Int) = ControlIterations(DSS_DEFAULT_CTX, Value)

"""{dssStatic* | dssEvent | dssTime}  Modes for control devices (Getter)"""
function ControlMode(dss::DSSContext)::Lib.ControlModes
    return @checked Lib.Solution_Get_ControlMode(dss.ctx)
end
ControlMode() = ControlMode(DSS_DEFAULT_CTX)

"""{dssStatic* | dssEvent | dssTime}  Modes for control devices (Setter)"""
function ControlMode(dss::DSSContext, Value::Union{Int,Lib.ControlModes})
    Value = convert(Lib.ControlModes, Value)
    @checked Lib.Solution_Set_ControlMode(dss.ctx, Value)
end
ControlMode(Value::Union{Int,Lib.ControlModes}) = ControlMode(DSS_DEFAULT_CTX, Value)

"""Flag to indicate whether the circuit solution converged (Getter)"""
function Converged(dss::DSSContext)::Bool
    return @checked(Lib.Solution_Get_Converged(dss.ctx)) != 0
end
Converged() = Converged(DSS_DEFAULT_CTX)

"""Flag to indicate whether the circuit solution converged (Setter)"""
function Converged(dss::DSSContext, Value::Bool)
    @checked Lib.Solution_Set_Converged(dss.ctx, Value ? 1 : 0)
end
Converged(Value::Bool) = Converged(DSS_DEFAULT_CTX, Value)

"""Default daily load shape (defaults to "Default") (Getter)"""
function DefaultDaily(dss::DSSContext)::String
    return get_string(@checked Lib.Solution_Get_DefaultDaily(dss.ctx))
end
DefaultDaily() = DefaultDaily(DSS_DEFAULT_CTX)

"""Default daily load shape (defaults to "Default") (Setter)"""
function DefaultDaily(dss::DSSContext, Value::String)
    @checked Lib.Solution_Set_DefaultDaily(dss.ctx, Value)
end
DefaultDaily(Value::String) = DefaultDaily(DSS_DEFAULT_CTX, Value)

"""Default Yearly load shape (defaults to "Default") (Getter)"""
function DefaultYearly(dss::DSSContext)::String
    return get_string(@checked Lib.Solution_Get_DefaultYearly(dss.ctx))
end
DefaultYearly() = DefaultYearly(DSS_DEFAULT_CTX)

"""Default Yearly load shape (defaults to "Default") (Setter)"""
function DefaultYearly(dss::DSSContext, Value::String)
    @checked Lib.Solution_Set_DefaultYearly(dss.ctx, Value)
end
DefaultYearly(Value::String) = DefaultYearly(DSS_DEFAULT_CTX, Value)

"""Array of strings containing the Event Log"""
function EventLog(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Solution_Get_EventLog, dss.ctx)
end
EventLog() = EventLog(DSS_DEFAULT_CTX)

"""Set the Frequency for next solution (Getter)"""
function Frequency(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_Frequency(dss.ctx)
end
Frequency() = Frequency(DSS_DEFAULT_CTX)

"""Set the Frequency for next solution (Setter)"""
function Frequency(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_Frequency(dss.ctx, Value)
end
Frequency(Value::Float64) = Frequency(DSS_DEFAULT_CTX, Value)

"""Default Multiplier applied to generators (like LoadMult) (Getter)"""
function GenMult(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_GenMult(dss.ctx)
end
GenMult() = GenMult(DSS_DEFAULT_CTX)

"""Default Multiplier applied to generators (like LoadMult) (Setter)"""
function GenMult(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_GenMult(dss.ctx, Value)
end
GenMult(Value::Float64) = GenMult(DSS_DEFAULT_CTX, Value)

"""PF for generators in AutoAdd mode (Getter)"""
function GenPF(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_GenPF(dss.ctx)
end
GenPF() = GenPF(DSS_DEFAULT_CTX)

"""PF for generators in AutoAdd mode (Setter)"""
function GenPF(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_GenPF(dss.ctx, Value)
end
GenPF(Value::Float64) = GenPF(DSS_DEFAULT_CTX, Value)

"""Generator kW for AutoAdd mode (Getter)"""
function GenkW(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_GenkW(dss.ctx)
end
GenkW() = GenkW(DSS_DEFAULT_CTX)

"""Generator kW for AutoAdd mode (Setter)"""
function GenkW(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_GenkW(dss.ctx, Value)
end
GenkW(Value::Float64) = GenkW(DSS_DEFAULT_CTX, Value)

"""Set Hour for time series solutions. (Getter)"""
function Hour(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_Hour(dss.ctx)
end
Hour() = Hour(DSS_DEFAULT_CTX)

"""Set Hour for time series solutions. (Setter)"""
function Hour(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_Hour(dss.ctx, Value)
end
Hour(Value::Float64) = Hour(DSS_DEFAULT_CTX, Value)

"""Solution.IntervalHrs variable used for devices that integrate for custom solution algorithms (Getter)"""
function IntervalHrs(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_IntervalHrs(dss.ctx)
end
IntervalHrs() = IntervalHrs(DSS_DEFAULT_CTX)

"""Solution.IntervalHrs variable used for devices that integrate for custom solution algorithms (Setter)"""
function IntervalHrs(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_IntervalHrs(dss.ctx, Value)
end
IntervalHrs(Value::Float64) = IntervalHrs(DSS_DEFAULT_CTX, Value)

"""Number of iterations taken for last solution. (Same as TotalIterations)"""
function Iterations(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_Iterations(dss.ctx)
end
Iterations() = Iterations(DSS_DEFAULT_CTX)

"""Load-Duration Curve name for LD modes"""
function LDCurve(dss::DSSContext)::String
    return get_string(@checked Lib.Solution_Get_LDCurve(dss.ctx))
end
LDCurve() = LDCurve(DSS_DEFAULT_CTX)

"""Load-Duration Curve name for LD modes"""
function LDCurve(dss::DSSContext, Value::String)
    @checked Lib.Solution_Set_LDCurve(dss.ctx, Value)
end
LDCurve(Value::String) = LDCurve(DSS_DEFAULT_CTX, Value)

"""Load Model: {dssPowerFlow (default) | dssAdmittance}"""
function LoadModel(dss::DSSContext)::Lib.SolutionLoadModels
    return @checked Lib.Solution_Get_LoadModel(dss.ctx)
end
LoadModel() = LoadModel(DSS_DEFAULT_CTX)

"""Load Model: {dssPowerFlow (default) | dssAdmittance}"""
function LoadModel(dss::DSSContext, Value::Union{Int,Lib.SolutionLoadModels})
    Value = convert(Lib.SolutionLoadModels, Value)
    @checked Lib.Solution_Set_LoadModel(dss.ctx, Value)
end
LoadModel(Value::Union{Int,Lib.SolutionLoadModels}) = LoadModel(DSS_DEFAULT_CTX, Value)

"""Default load multiplier applied to all non-fixed loads"""
function LoadMult(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_LoadMult(dss.ctx)
end
LoadMult() = LoadMult(DSS_DEFAULT_CTX)

"""Default load multiplier applied to all non-fixed loads"""
function LoadMult(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_LoadMult(dss.ctx, Value)
end
LoadMult(Value::Float64) = LoadMult(DSS_DEFAULT_CTX, Value)

"""Maximum allowable control iterations"""
function MaxControlIterations(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_MaxControlIterations(dss.ctx)
end
MaxControlIterations() = MaxControlIterations(DSS_DEFAULT_CTX)

"""Maximum allowable control iterations"""
function MaxControlIterations(dss::DSSContext, Value::Int)
    @checked Lib.Solution_Set_MaxControlIterations(dss.ctx, Value)
end
MaxControlIterations(Value::Int) = MaxControlIterations(DSS_DEFAULT_CTX, Value)

"""Max allowable iterations."""
function MaxIterations(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_MaxIterations(dss.ctx)
end
MaxIterations() = MaxIterations(DSS_DEFAULT_CTX)

"""Max allowable iterations."""
function MaxIterations(dss::DSSContext, Value::Int)
    @checked Lib.Solution_Set_MaxIterations(dss.ctx, Value)
end
MaxIterations(Value::Int) = MaxIterations(DSS_DEFAULT_CTX, Value)

"""
(read) Minimum number of iterations required for a power flow solution.
(write) Mininum number of iterations required for a power flow solution.
"""
function MinIterations(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_MinIterations(dss.ctx)
end
MinIterations() = MinIterations(DSS_DEFAULT_CTX)

"""
(read) Minimum number of iterations required for a power flow solution.
(write) Mininum number of iterations required for a power flow solution.
"""
function MinIterations(dss::DSSContext, Value::Int)
    @checked Lib.Solution_Set_MinIterations(dss.ctx, Value)
end
MinIterations(Value::Int) = MinIterations(DSS_DEFAULT_CTX, Value)

"""Get present solution mode (by a text code - see DSS Help)"""
function Mode(dss::DSSContext)::Lib.SolveModes
    return @checked Lib.Solution_Get_Mode(dss.ctx)
end
Mode() = Mode(DSS_DEFAULT_CTX)

"""Set present solution mode (by a text code - see DSS Help)"""
function Mode(dss::DSSContext, Value::Union{Int,Lib.SolveModes})
    Value = convert(Lib.SolveModes, Value)
    @checked Lib.Solution_Set_Mode(dss.ctx, Value)
end
Mode(Value::Union{Int,Lib.SolveModes}) = Mode(DSS_DEFAULT_CTX, Value)

"""ID (text) of the present solution mode"""
function ModeID(dss::DSSContext)::String
    return get_string(@checked Lib.Solution_Get_ModeID(dss.ctx))
end
ModeID() = ModeID(DSS_DEFAULT_CTX)

"""Max number of iterations required to converge at any control iteration of the most recent solution."""
function MostIterationsDone(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_MostIterationsDone(dss.ctx)
end
MostIterationsDone() = MostIterationsDone(DSS_DEFAULT_CTX)

"""Number of solutions to perform for Monte Carlo and time series simulations"""
function Number(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_Number(dss.ctx)
end
Number() = Number(DSS_DEFAULT_CTX)

"""Number of solutions to perform for Monte Carlo and time series simulations"""
function Number(dss::DSSContext, Value::Int)
    @checked Lib.Solution_Set_Number(dss.ctx, Value)
end
Number(Value::Int) = Number(DSS_DEFAULT_CTX, Value)

"""Gets the time required to perform the latest solution (Read only)"""
function ProcessTime(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_Process_Time(dss.ctx)
end
ProcessTime() = ProcessTime(DSS_DEFAULT_CTX)

"""Randomization mode for random variables "Gaussian" or "Uniform" (Getter)"""
function Random(dss::DSSContext)::Lib.RandomModes
    return @checked Lib.Solution_Get_Random(dss.ctx)
end
Random() = Random(DSS_DEFAULT_CTX)

"""Randomization mode for random variables "Gaussian" or "Uniform" (Setter)"""
function Random(dss::DSSContext, Value::Union{Int,Lib.RandomModes})
    Value = convert(Lib.RandomModes, Value)
    @checked Lib.Solution_Set_Random(dss.ctx, Value)
end
Random(Value::Union{Int,Lib.RandomModes}) = Random(DSS_DEFAULT_CTX, Value)

"""Seconds from top of the hour."""
function Seconds(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_Seconds(dss.ctx)
end
Seconds() = Seconds(DSS_DEFAULT_CTX)

"""Seconds from top of the hour."""
function Seconds(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_Seconds(dss.ctx, Value)
end
Seconds(Value::Float64) = Seconds(DSS_DEFAULT_CTX, Value)

"""Time step size in sec"""
function StepSize(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_StepSize(dss.ctx)
end
StepSize() = StepSize(DSS_DEFAULT_CTX)

"""Time step size in sec"""
function StepSize(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_StepSize(dss.ctx, Value)
end
StepSize(Value::Float64) = StepSize(DSS_DEFAULT_CTX, Value)

"""Flag that indicates if elements of the System Y have been changed by recent activity."""
function SystemYChanged(dss::DSSContext)::Bool
    return @checked(Lib.Solution_Get_SystemYChanged(dss.ctx)) != 0
end
SystemYChanged() = SystemYChanged(DSS_DEFAULT_CTX)

"""Get the solution process time + sample time for time step"""
function TimeTimeStep(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_Time_of_Step(dss.ctx)
end
TimeTimeStep() = TimeTimeStep(DSS_DEFAULT_CTX)

"""Solution convergence tolerance."""
function Convergence(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_Tolerance(dss.ctx)
end
Convergence() = Convergence(DSS_DEFAULT_CTX)

"""Solution convergence tolerance."""
function Convergence(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_Tolerance(dss.ctx, Value)
end
Convergence(Value::Float64) = Convergence(DSS_DEFAULT_CTX, Value)

"""
(read) Gets the accumulated time of the simulation
(write) Sets the Accumulated time of the simulation
"""
function TotalTime(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_Total_Time(dss.ctx)
end
TotalTime() = TotalTime(DSS_DEFAULT_CTX)

"""
(read) Gets the accumulated time of the simulation
(write) Sets the Accumulated time of the simulation
"""
function TotalTime(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_Total_Time(dss.ctx, Value)
end
TotalTime(Value::Float64) = TotalTime(DSS_DEFAULT_CTX, Value)

"""Total iterations including control iterations for most recent solution."""
function TotalIterations(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_Totaliterations(dss.ctx)
end
TotalIterations() = TotalIterations(DSS_DEFAULT_CTX)

"""Set year for planning studies (Getter)"""
function Year(dss::DSSContext)::Int
    return @checked Lib.Solution_Get_Year(dss.ctx)
end
Year() = Year(DSS_DEFAULT_CTX)

"""Set year for planning studies (Setter)"""
function Year(dss::DSSContext, Value::Int)
    @checked Lib.Solution_Set_Year(dss.ctx, Value)
end
Year(Value::Int) = Year(DSS_DEFAULT_CTX, Value)

"""Hour as a double, including fractional part (Getter)"""
function DblHour(dss::DSSContext)::Float64
    return @checked Lib.Solution_Get_dblHour(dss.ctx)
end
DblHour() = DblHour(DSS_DEFAULT_CTX)

"""Hour as a double, including fractional part (Setter)"""
function DblHour(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_dblHour(dss.ctx, Value)
end
DblHour(Value::Float64) = DblHour(DSS_DEFAULT_CTX, Value)

"""Percent default  annual load growth rate (Getter)"""
function PctGrowth(dss::DSSContext)
    return @checked Lib.Solution_Get_pctGrowth(dss.ctx)
end
PctGrowth() = PctGrowth(DSS_DEFAULT_CTX)

"""Percent default  annual load growth rate (Setter)"""
function PctGrowth(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_pctGrowth(dss.ctx, Value)
end
PctGrowth(Value::Float64) = PctGrowth(DSS_DEFAULT_CTX, Value)

"""Set Stepsize in Hr (Setter)"""
function StepSizeHr(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_StepsizeHr(dss.ctx, Value)
end
StepSizeHr(Value::Float64) = StepSizeHr(DSS_DEFAULT_CTX, Value)

"""Set Stepsize in minutes (Setter)"""
function StepSizeMin(dss::DSSContext, Value::Float64)
    @checked Lib.Solution_Set_StepsizeMin(dss.ctx, Value)
end
StepSizeMin(Value::Float64) = StepSizeMin(DSS_DEFAULT_CTX, Value)

"""Solves the circuits for all the Actors created"""
function SolveAll(dss::DSSContext)
    @checked Lib.Solution_SolveAll(dss.ctx)
end
SolveAll() = SolveAll(DSS_DEFAULT_CTX)

"""Element names for the rows of the incidence matrix, if calculated"""
function IncMatrixRows(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Solution_Get_IncMatrixRows, dss.ctx)
end
IncMatrixRows() = IncMatrixRows(DSS_DEFAULT_CTX)

"""Element names for the columns of the incidence matrix, if calculated"""
function IncMatrixCols(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Solution_Get_IncMatrixCols, dss.ctx)
end
IncMatrixCols() = IncMatrixCols(DSS_DEFAULT_CTX)

"""Returns the data from the incidence matrix, if calculated"""
function IncMatrix(dss::DSSContext)::Vector{Int32}
    return get_int32_array(Lib.Solution_Get_IncMatrix, dss.ctx)
end
IncMatrix() = IncMatrix(DSS_DEFAULT_CTX)

"""BusLevels"""
function BusLevels(dss::DSSContext)::Vector{Int32}
    return get_int32_array(Lib.Solution_Get_BusLevels, dss.ctx)
end
BusLevels() = BusLevels(DSS_DEFAULT_CTX)

"""Returns the data from the Laplacian, if calculated"""
function Laplacian(dss::DSSContext)::Vector{Int32}
    return get_int32_array(Lib.Solution_Get_Laplacian, dss.ctx)
end
Laplacian() = Laplacian(DSS_DEFAULT_CTX)

end
