module Solution

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """Build Y Matrix"""
    function BuildYMatrix(BuildOption::Int, AllocateVI::Int)
        Lib.Solution_BuildYMatrix(BuildOption, AllocateVI)
    end

    """Check Controls"""
    function CheckControls()
        Lib.Solution_CheckControls()
    end

    """Check Fault Status"""
    function CheckFaultStatus()
        Lib.Solution_CheckFaultStatus()
    end

    """Clean up Solution"""
    function Cleanup()
        Lib.Solution_Cleanup()
    end

    """Do Control Actions"""
    function DoControlActions()
        Lib.Solution_DoControlActions()
    end

    """Finish Time Step"""
    function FinishTimeStep()
        Lib.Solution_FinishTimeStep()
    end

    """Initialize Snapshot Solution"""
    function InitSnap()
        Lib.Solution_InitSnap()
    end

    """Sample Control Devices"""
    function SampleControlDevices()
        Lib.Solution_SampleControlDevices()
    end

    """Sample Do Control Actions"""
    function SampleDoControlActions()
        Lib.Solution_Sample_DoControlActions()
    end

    """Solve"""
    function Solve()
        Lib.Solution_Solve()
    end

    """Solve direct"""
    function SolveDirect()
        Lib.Solution_SolveDirect()
    end

    """Solve no control"""
    function SolveNoControl()
        Lib.Solution_SolveNoControl()
    end

    """Solve Power Flow"""
    function SolvePFlow()
        Lib.Solution_SolvePflow()
    end

    """Solve Plus Control"""
    function SolvePlusControl()
        Lib.Solution_SolvePlusControl()
    end

    """Solve Snap"""
    function SolveSnap()
        Lib.Solution_SolveSnap()
    end

    """Type of device to add in AutoAdd Mode: {dssGen (Default) | dssCap} (Getter)"""
    function AddType()::Lib.AutoAddTypes
        return Lib.Solution_Get_AddType()
    end

    """Type of device to add in AutoAdd Mode: {dssGen (Default) | dssCap} (Setter)"""
    function AddType(Value::Union{Int, Lib.AutoAddTypes})
        Value = convert(Lib.AutoAddTypes, Value)
        Lib.Solution_Set_AddType(Value)
    end

    """Base Solution algorithm: {dssNormalSolve | dssNewtonSolve} (Getter)"""
    function Algorithm()::Lib.SolutionAlgorithms
        return Lib.Solution_Get_Algorithm()
    end

    """Base Solution algorithm: {dssNormalSolve | dssNewtonSolve} (Setter)"""
    function Algorithm(Value::Union{Int, Lib.SolutionAlgorithms})
        Value = convert(Lib.SolutionAlgorithms, Value)
        Lib.Solution_Set_Algorithm(Value)
    end

    """Capacitor kvar for adding capacitors in AutoAdd mode (Getter)"""
    function Capkvar()::Float64
        return Lib.Solution_Get_Capkvar()
    end

    """Capacitor kvar for adding capacitors in AutoAdd mode (Setter)"""
    function Capkvar(Value::Float64)
        Lib.Solution_Set_Capkvar(Value)
    end

    """Flag indicating the control actions are done. (Getter)"""
    function ControlActionsDone()::Bool
        return Lib.Solution_Get_ControlActionsDone() != 0
    end

    """Flag indicating the control actions are done. (Setter)"""
    function ControlActionsDone(Value::Bool)
        Lib.Solution_Set_ControlActionsDone(Value ? 1 : 0)
    end

    """Value of the control iteration counter (Getter)"""
    function ControlIterations()::Int
        return Lib.Solution_Get_ControlIterations()
    end

    """Value of the control iteration counter (Setter)"""
    function ControlIterations(Value::Int)
        Lib.Solution_Set_ControlIterations(Value)
    end

    """{dssStatic* | dssEvent | dssTime}  Modes for control devices (Getter)"""
    function ControlMode()::Lib.ControlModes
        return Lib.Solution_Get_ControlMode()
    end

    """{dssStatic* | dssEvent | dssTime}  Modes for control devices (Setter)"""
    function ControlMode(Value::Union{Int, Lib.ControlModes})
        Value = convert(Lib.ControlModes, Value)
        Lib.Solution_Set_ControlMode(Value)
    end

    """Flag to indicate whether the circuit solution converged (Getter)"""
    function Converged()::Bool
        return Lib.Solution_Get_Converged() != 0
    end

    """Flag to indicate whether the circuit solution converged (Setter)"""
    function Converged(Value::Bool)
        Lib.Solution_Set_Converged(Value ? 1 : 0)
    end

    """Default daily load shape (defaults to "Default") (Getter)"""
    function DefaultDaily()::String
        return Utils.get_string(Lib.Solution_Get_DefaultDaily())
    end

    """Default daily load shape (defaults to "Default") (Setter)"""
    function DefaultDaily(Value::String)
        Lib.Solution_Set_DefaultDaily(Value)
    end

    """Default Yearly load shape (defaults to "Default") (Getter)"""
    function DefaultYearly()::String
        return Utils.get_string(Lib.Solution_Get_DefaultYearly())
    end

    """Default Yearly load shape (defaults to "Default") (Setter)"""
    function DefaultYearly(Value::String)
        Lib.Solution_Set_DefaultYearly(Value)
    end

    """Array of strings containing the Event Log"""
    function EventLog()::Vector{String}
        return Utils.get_string_array(Lib.Solution_Get_EventLog)
    end

    """Set the Frequency for next solution (Getter)"""
    function Frequency()::Float64
        return Lib.Solution_Get_Frequency()
    end

    """Set the Frequency for next solution (Setter)"""
    function Frequency(Value::Float64)
        Lib.Solution_Set_Frequency(Value)
    end

    """Default Multiplier applied to generators (like LoadMult) (Getter)"""
    function GenMult()::Float64
        return Lib.Solution_Get_GenMult()
    end

    """Default Multiplier applied to generators (like LoadMult) (Setter)"""
    function GenMult(Value::Float64)
        Lib.Solution_Set_GenMult(Value)
    end

    """PF for generators in AutoAdd mode (Getter)"""
    function GenPF()::Float64
        return Lib.Solution_Get_GenPF()
    end

    """PF for generators in AutoAdd mode (Setter)"""
    function GenPF(Value::Float64)
        Lib.Solution_Set_GenPF(Value)
    end

    """Generator kW for AutoAdd mode (Getter)"""
    function GenkW()::Float64
        return Lib.Solution_Get_GenkW()
    end

    """Generator kW for AutoAdd mode (Setter)"""
    function GenkW(Value::Float64)
        Lib.Solution_Set_GenkW(Value)
    end

    """Set Hour for time series solutions. (Getter)"""
    function Hour()::Float64
        return Lib.Solution_Get_Hour()
    end

    """Set Hour for time series solutions. (Setter)"""
    function Hour(Value::Float64)
        Lib.Solution_Set_Hour(Value)
    end

    """Solution.IntervalHrs variable used for devices that integrate for custom solution algorithms (Getter)"""
    function IntervalHrs()::Float64
        return Lib.Solution_Get_IntervalHrs()
    end

    """Solution.IntervalHrs variable used for devices that integrate for custom solution algorithms (Setter)"""
    function IntervalHrs(Value::Float64)
        Lib.Solution_Set_IntervalHrs(Value)
    end

    """Number of iterations taken for last solution. (Same as TotalIterations)"""
    function Iterations()::Int
        return Lib.Solution_Get_Iterations()
    end

    """Load-Duration Curve name for LD modes"""
    function LDCurve()::String
        return Utils.get_string(Lib.Solution_Get_LDCurve())
    end

    """Load-Duration Curve name for LD modes"""
    function LDCurve(Value::String)
        Lib.Solution_Set_LDCurve(Value)
    end

    """Load Model: {dssPowerFlow (default) | dssAdmittance}"""
    function LoadModel()::Lib.SolutionLoadModels
        return Lib.Solution_Get_LoadModel()
    end

    """Load Model: {dssPowerFlow (default) | dssAdmittance}"""
    function LoadModel(Value::Union{Int, Lib.SolutionLoadModels})
        Value = convert(Lib.SolutionLoadModels, Value)
        Lib.Solution_Set_LoadModel(Value)
    end

    """Default load multiplier applied to all non-fixed loads"""
    function LoadMult()::Float64
        return Lib.Solution_Get_LoadMult()
    end

    """Default load multiplier applied to all non-fixed loads"""
    function LoadMult(Value::Float64)
        Lib.Solution_Set_LoadMult(Value)
    end

    """Maximum allowable control iterations"""
    function MaxControlIterations()::Int
        return Lib.Solution_Get_MaxControlIterations()
    end

    """Maximum allowable control iterations"""
    function MaxControlIterations(Value::Int)
        Lib.Solution_Set_MaxControlIterations(Value)
    end

    """Max allowable iterations."""
    function MaxIterations()::Int
        return Lib.Solution_Get_MaxIterations()
    end

    """Max allowable iterations."""
    function MaxIterations(Value::Int)
        Lib.Solution_Set_MaxIterations(Value)
    end

    """
    (read) Minimum number of iterations required for a power flow solution.
    (write) Mininum number of iterations required for a power flow solution.
    """
    function MinIterations()::Int
        return Lib.Solution_Get_MinIterations()
    end

    """
    (read) Minimum number of iterations required for a power flow solution.
    (write) Mininum number of iterations required for a power flow solution.
    """
    function MinIterations(Value::Int)
        Lib.Solution_Set_MinIterations(Value)
    end

    """Get present solution mode (by a text code - see DSS Help)"""
    function Mode()::Lib.SolveModes
        return Lib.Solution_Get_Mode()
    end

    """Set present solution mode (by a text code - see DSS Help)"""
    function Mode(Value::Union{Int, Lib.SolveModes})
        Value = convert(Lib.SolveModes, Value)
        Lib.Solution_Set_Mode(Value)
    end

    """ID (text) of the present solution mode"""
    function ModeID()::String
        return Utils.get_string(Lib.Solution_Get_ModeID())
    end

    """Max number of iterations required to converge at any control iteration of the most recent solution."""
    function MostIterationsDone()::Int
        return Lib.Solution_Get_MostIterationsDone()
    end

    """Number of solutions to perform for Monte Carlo and time series simulations"""
    function Number()::Int
        return Lib.Solution_Get_Number()
    end

    """Number of solutions to perform for Monte Carlo and time series simulations"""
    function Number(Value::Int)
        Lib.Solution_Set_Number(Value)
    end

    """Gets the time required to perform the latest solution (Read only)"""
    function ProcessTime()::Float64
        return Lib.Solution_Get_Process_Time()
    end

    """Randomization mode for random variables "Gaussian" or "Uniform" (Getter)"""
    function Random()::Lib.RandomModes
        return Lib.Solution_Get_Random()
    end

    """Randomization mode for random variables "Gaussian" or "Uniform" (Setter)"""
    function Random(Value::Union{Int, Lib.RandomModes})
        Value = convert(Lib.RandomModes, Value)
        Lib.Solution_Set_Random(Value)
    end

    """Seconds from top of the hour."""
    function Seconds()::Float64
        return Lib.Solution_Get_Seconds()
    end

    """Seconds from top of the hour."""
    function Seconds(Value::Float64)
        Lib.Solution_Set_Seconds(Value)
    end

    """Time step size in sec"""
    function StepSize()::Float64
        return Lib.Solution_Get_StepSize()
    end

    """Time step size in sec"""
    function StepSize(Value::Float64)
        Lib.Solution_Set_StepSize(Value)
    end

    """Flag that indicates if elements of the System Y have been changed by recent activity."""
    function SystemYChanged()::Bool
        return Lib.Solution_Get_SystemYChanged() != 0
    end

    """Get the solution process time + sample time for time step"""
    function TimeTimeStep()::Float64
        return Lib.Solution_Get_Time_of_Step()
    end

    """Solution convergence tolerance."""
    function Convergence()::Float64
        return Lib.Solution_Get_Tolerance()
    end

    """Solution convergence tolerance."""
    function Convergence(Value::Float64)
        Lib.Solution_Set_Tolerance(Value)
    end

    """
    (read) Gets the accumulated time of the simulation
    (write) Sets the Accumulated time of the simulation
    """
    function TotalTime()::Float64
        return Lib.Solution_Get_Total_Time()
    end

    """
    (read) Gets the accumulated time of the simulation
    (write) Sets the Accumulated time of the simulation
    """
    function TotalTime(Value::Float64)
        Lib.Solution_Set_Total_Time(Value)
    end

    """Total iterations including control iterations for most recent solution."""
    function TotalIterations()::Int
        return Lib.Solution_Get_Totaliterations()
    end

    """Set year for planning studies (Getter)"""
    function Year()::Int
        return Lib.Solution_Get_Year()
    end

    """Set year for planning studies (Setter)"""
    function Year(Value::Int)
        Lib.Solution_Set_Year(Value)
    end

    """Hour as a double, including fractional part (Getter)"""
    function DblHour()::Float64
        return Lib.Solution_Get_dblHour()
    end

    """Hour as a double, including fractional part (Setter)"""
    function DblHour(Value::Float64)
        Lib.Solution_Set_dblHour(Value)
    end

    """Percent default  annual load growth rate (Getter)"""
    function PctGrowth()
        return Lib.Solution_Get_pctGrowth()
    end

    """Percent default  annual load growth rate (Setter)"""
    function PctGrowth(Value::Float64)
        Lib.Solution_Set_pctGrowth(Value)
    end

    """Set Stepsize in Hr (Setter)"""
    function StepSizeHr(Value::Float64)
        Lib.Solution_Set_StepsizeHr(Value)
    end

    """Set Stepsize in minutes (Setter)"""
    function StepSizeMin(Value::Float64)
        Lib.Solution_Set_StepsizeMin(Value)
    end

end

