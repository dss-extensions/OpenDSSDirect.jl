# Automatically generated using Clang.jl

@cenum MonitorModes::UInt32 begin
    MonitorModes_VI = 0
    MonitorModes_Power = 1
    MonitorModes_Taps = 2
    MonitorModes_States = 3
    MonitorModes_Sequence = 16
    MonitorModes_Magnitude = 32
    MonitorModes_PosOnly = 64
end

@cenum SolveModes::UInt32 begin
    SolveModes_SnapShot = 0
    SolveModes_Daily = 1
    SolveModes_Yearly = 2
    SolveModes_Monte1 = 3
    SolveModes_LD1 = 4
    SolveModes_PeakDay = 5
    SolveModes_DutyCycle = 6
    SolveModes_Direct = 7
    SolveModes_MonteFault = 8
    SolveModes_FaultStudy = 9
    SolveModes_Monte2 = 10
    SolveModes_Monte3 = 11
    SolveModes_LD2 = 12
    SolveModes_AutoAdd = 13
    SolveModes_Dynamic = 14
    SolveModes_Harmonic = 15
end

@cenum SolutionLoadModels::UInt32 begin
    SolutionLoadModels_PowerFlow = 1
    SolutionLoadModels_Admittance = 2
end

@cenum SolutionAlgorithms::UInt32 begin
    SolutionAlgorithms_NormalSolve = 0
    SolutionAlgorithms_NewtonSolve = 1
end

@cenum ControlModes::Int32 begin
    ControlModes_Static = 0
    ControlModes_Event = 1
    ControlModes_Time = 2
    ControlModes_Multirate = 3
    ControlModes_ControlOff = -1
end

@cenum CktModels::UInt32 begin
    CktModels_Multiphase = 0
    CktModels_PositiveSeq = 1
end

@cenum RandomModes::UInt32 begin
    RandomModes_Gaussian = 1
    RandomModes_Uniform = 2
    RandomModes_LogNormal = 3
end

@cenum AutoAddTypes::UInt32 begin
    AutoAddTypes_AddGen = 1
    AutoAddTypes_AddCap = 2
end

@cenum CapControlModes::UInt32 begin
    CapControlModes_Current = 0
    CapControlModes_Voltage = 1
    CapControlModes_KVAR = 2
    CapControlModes_Time = 3
    CapControlModes_PF = 4
end

@cenum ActionCodes::UInt32 begin
    ActionCodes_none = 0
    ActionCodes_Open = 1
    ActionCodes_Close = 2
    ActionCodes_Reset = 3
    ActionCodes_Lock = 4
    ActionCodes_Unlock = 5
    ActionCodes_TapUp = 6
    ActionCodes_TapDown = 7
end

@cenum GeneratorStatus::UInt32 begin
    GeneratorStatus_Variable = 0
    GeneratorStatus_Fixed = 1
end

@cenum LoadStatus::UInt32 begin
    LoadStatus_Variable = 0
    LoadStatus_Fixed = 1
    LoadStatus_Exempt = 2
end

@cenum LoadModels::UInt32 begin
    LoadModels_ConstPQ = 1
    LoadModels_ConstZ = 2
    LoadModels_Motor = 3
    LoadModels_CVR = 4
    LoadModels_ConstI = 5
    LoadModels_ConstPFixedQ = 6
    LoadModels_ConstPFixedX = 7
    LoadModels_ZIPV = 8
end

@cenum LineUnits::UInt32 begin
    LineUnits_none = 0
    LineUnits_Miles = 1
    LineUnits_kFt = 2
    LineUnits_km = 3
    LineUnits_meter = 4
    LineUnits_ft = 5
    LineUnits_inch = 6
    LineUnits_cm = 7
    LineUnits_mm = 8
    LineUnits_Maxnum = 9
end

@cenum YMatrixModes::UInt32 begin
    YMatrixModes_SeriesOnly = 1
    YMatrixModes_WholeMatrix = 2
end

@cenum StorageStates::Int32 begin
    StorageStates_Charging = -1
    StorageStates_Idling = 0
    StorageStates_Discharging = 1
end

@cenum DSSMessageType::Int32 begin
    DSSMessageType_Error = -1
    DSSMessageType_General = 0
    DSSMessageType_Info = 1
    DSSMessageType_Help = 2
    DSSMessageType_Progress = 3
    DSSMessageType_ProgressCaption = 4
    DSSMessageType_ProgressFormCaption = 5
    DSSMessageType_ProgressPercent = 6
    DSSMessageType_FireOffEditor = 7
end

@cenum DSSJSONFlags::UInt32 begin
    DSSJSONFlags_Full = 1
    DSSJSONFlags_SkipRedundant = 2
    DSSJSONFlags_EnumAsInt = 4
    DSSJSONFlags_FullNames = 8
    DSSJSONFlags_Pretty = 16
    DSSJSONFlags_ExcludeDisabled = 32
    DSSJSONFlags_SkipDSSClass = 64
    DSSJSONFlags_LowercaseKeys = 128
end

@cenum BatchOperation::UInt32 begin
    BatchOperation_Set = 0
    BatchOperation_Multiply = 1
    BatchOperation_Increment = 2
end

@cenum SolverOptions::UInt32 begin
    SolverOptions_ReuseNothing = 0
    SolverOptions_ReuseCompressedMatrix = 1
    SolverOptions_ReuseSymbolicFactorization = 2
    SolverOptions_ReuseNumericFactorization = 3
    SolverOptions_AlwaysResetYPrimInvalid = 268435456
end

@cenum DSSCompatFlags::UInt32 begin
    DSSCompatFlags_NoSolverFloatChecks = 1
    DSSCompatFlags_BadPrecision = 2
    DSSCompatFlags_InvControl9611 = 4
end
