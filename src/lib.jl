module Lib

    import ..OpenDSSDirect: LIBRARY
    using ..CEnum

    const DSS_CAPI_V7_VERSION = "0.10.0"

    @cenum(MonitorModes,
        MonitorModes_VI = 0,
        MonitorModes_Power = 1,
        MonitorModes_Sequence = 16,
        MonitorModes_Magnitude = 32,
        MonitorModes_PosOnly = 64,
        MonitorModes_Taps = 2,
        MonitorModes_States = 3,
    )
    @cenum(SolveModes,
        SolveModes_SnapShot = 0,
        SolveModes_DutyCycle = 6,
        SolveModes_Direct = 7,
        SolveModes_Daily = 1,
        SolveModes_Monte1 = 3,
        SolveModes_Monte2 = 10,
        SolveModes_Monte3 = 11,
        SolveModes_FaultStudy = 9,
        SolveModes_Yearly = 2,
        SolveModes_MonteFault = 8,
        SolveModes_PeakDay = 5,
        SolveModes_LD1 = 4,
        SolveModes_LD2 = 12,
        SolveModes_AutoAdd = 13,
        SolveModes_Harmonic = 15,
        SolveModes_Dynamic = 14,
    )
    @cenum(SolutionLoadModels,
        SolutionLoadModels_PowerFlow = 1,
        SolutionLoadModels_Admittance = 2,
    )
    @cenum(SolutionAlgorithms,
        SolutionAlgorithms_NormalSolve = 0,
        SolutionAlgorithms_NewtonSolve = 1,
    )
    @cenum(ControlModes{Int32},
        ControlModes_Static = 0,
        ControlModes_Event = 1,
        ControlModes_Time = 2,
        ControlModes_Multirate = 3,
        ControlModes_ControlOff = -1,
    )
    @cenum(CktModels,
        CktModels_Multiphase = 0,
        CktModels_PositiveSeq = 1,
    )
    @cenum(RandomModes,
        RandomModes_Gaussian = 1,
        RandomModes_Uniform = 2,
        RandomModes_LogNormal = 3
    )
    @cenum(AutoAddTypes,
        AutoAddTypes_AddGen = 1,
        AutoAddTypes_AddCap = 2,
    )
    @cenum(CapControlModes,
        CapControlModes_Voltage = 1,
        CapControlModes_KVAR = 2,
        CapControlModes_Current = 0,
        CapControlModes_PF = 4,
        CapControlModes_Time = 3,
    )
    @cenum(ActionCodes,
        ActionCodes_none = 0,
        ActionCodes_Open = 1,
        ActionCodes_Close = 2,
        ActionCodes_Reset = 3,
        ActionCodes_Lock = 4,
        ActionCodes_Unlock = 5,
        ActionCodes_TapUp = 6,
        ActionCodes_TapDown = 7,
    )
    @cenum(LoadStatus,
        LoadStatus_Variable = 0,
        LoadStatus_Fixed = 1,
        LoadStatus_Exempt = 2,
    )
    @cenum(LoadModels,
        LoadModels_ConstPQ = 1,
        LoadModels_ConstZ = 2,
        LoadModels_Motor = 3,
        LoadModels_CVR = 4,
        LoadModels_ConstI = 5,
        LoadModels_ConstPFixedQ = 6,
        LoadModels_ConstPFixedX = 7,
        LoadModels_ZIPV = 8,
    )
    @cenum(LineUnits,
        LineUnits_none = 0,
        LineUnits_Miles = 1,
        LineUnits_kFt = 2,
        LineUnits_km = 3,
        LineUnits_meter = 4,
        LineUnits_ft = 5,
        LineUnits_inch = 6,
        LineUnits_cm = 7,
        LineUnits_mm = 8,
        LineUnits_Maxnum = 9,
    )


    function DSS_ResetStringBuffer()
        ccall((:DSS_ResetStringBuffer, LIBRARY), Cvoid, ())
    end

    function DSS_Dispose_PByte(p)
        ccall((:DSS_Dispose_PByte, LIBRARY), Cvoid, (Ptr{Ptr{Int8}},), p)
    end

    function DSS_Dispose_PDouble(p)
        ccall((:DSS_Dispose_PDouble, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}},), p)
    end

    function DSS_Dispose_PInteger(p)
        ccall((:DSS_Dispose_PInteger, LIBRARY), Cvoid, (Ptr{Ptr{Int32}},), p)
    end

    function DSS_Dispose_PPAnsiChar(p, cnt)
        ccall((:DSS_Dispose_PPAnsiChar, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Int32), p, cnt)
    end

    function DSS_Get_PAnsiChar(p, index)
        ccall((:DSS_Get_PAnsiChar, LIBRARY), Cstring, (Ptr{Cvoid}, Int32), p, index)
    end

    function DSS_DisposeGRData()
        ccall((:DSS_DisposeGRData, LIBRARY), Cvoid, ())
    end

    function DSS_GetGRPointers(DataPtr_PPAnsiChar, DataPtr_PDouble, DataPtr_PInteger, DataPtr_PByte, CountPtr_PPAnsiChar, CountPtr_PDouble, CountPtr_PInteger, CountPtr_PByte)
        ccall((:DSS_GetGRPointers, LIBRARY), Cvoid, (Ptr{Ptr{Ptr{Cstring}}}, Ptr{Ptr{Ptr{Cdouble}}}, Ptr{Ptr{Ptr{Int32}}}, Ptr{Ptr{Ptr{Int8}}}, Ptr{Ptr{Int32}}, Ptr{Ptr{Int32}}, Ptr{Ptr{Int32}}, Ptr{Ptr{Int32}}), DataPtr_PPAnsiChar, DataPtr_PDouble, DataPtr_PInteger, DataPtr_PByte, CountPtr_PPAnsiChar, CountPtr_PDouble, CountPtr_PInteger, CountPtr_PByte)
    end

    function DSS_NewCircuit(Value)
        ccall((:DSS_NewCircuit, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function ActiveClass_Get_AllNames(ResultPtr, ResultCount)
        ccall((:ActiveClass_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function ActiveClass_Get_AllNames_GR()
        ccall((:ActiveClass_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function ActiveClass_Get_First()
        ccall((:ActiveClass_Get_First, LIBRARY), Int32, ())
    end

    function ActiveClass_Get_Next()
        ccall((:ActiveClass_Get_Next, LIBRARY), Int32, ())
    end

    function ActiveClass_Get_Name()
        ccall((:ActiveClass_Get_Name, LIBRARY), Cstring, ())
    end

    function ActiveClass_Set_Name(Value)
        ccall((:ActiveClass_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function ActiveClass_Get_NumElements()
        ccall((:ActiveClass_Get_NumElements, LIBRARY), Int32, ())
    end

    function ActiveClass_Get_ActiveClassName()
        ccall((:ActiveClass_Get_ActiveClassName, LIBRARY), Cstring, ())
    end

    function ActiveClass_Get_Count()
        ccall((:ActiveClass_Get_Count, LIBRARY), Int32, ())
    end

    function Bus_Get_Name()
        ccall((:Bus_Get_Name, LIBRARY), Cstring, ())
    end

    function Bus_Get_NumNodes()
        ccall((:Bus_Get_NumNodes, LIBRARY), Int32, ())
    end

    function Bus_Get_SeqVoltages(ResultPtr, ResultCount)
        ccall((:Bus_Get_SeqVoltages, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Bus_Get_SeqVoltages_GR()
        ccall((:Bus_Get_SeqVoltages_GR, LIBRARY), Cvoid, ())
    end

    function Bus_Get_Voltages(ResultPtr, ResultCount)
        ccall((:Bus_Get_Voltages, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Bus_Get_Voltages_GR()
        ccall((:Bus_Get_Voltages_GR, LIBRARY), Cvoid, ())
    end

    function Bus_Get_Nodes(ResultPtr, ResultCount)
        ccall((:Bus_Get_Nodes, LIBRARY), Cvoid, (Ptr{Ptr{Int32}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Bus_Get_Nodes_GR()
        ccall((:Bus_Get_Nodes_GR, LIBRARY), Cvoid, ())
    end

    function Bus_Get_Isc(ResultPtr, ResultCount)
        ccall((:Bus_Get_Isc, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Bus_Get_Isc_GR()
        ccall((:Bus_Get_Isc_GR, LIBRARY), Cvoid, ())
    end

    function Bus_Get_Voc(ResultPtr, ResultCount)
        ccall((:Bus_Get_Voc, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Bus_Get_Voc_GR()
        ccall((:Bus_Get_Voc_GR, LIBRARY), Cvoid, ())
    end

    function Bus_Get_kVBase()
        ccall((:Bus_Get_kVBase, LIBRARY), Cdouble, ())
    end

    function Bus_Get_puVoltages(ResultPtr, ResultCount)
        ccall((:Bus_Get_puVoltages, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Bus_Get_puVoltages_GR()
        ccall((:Bus_Get_puVoltages_GR, LIBRARY), Cvoid, ())
    end

    function Bus_Get_Zsc0(ResultPtr, ResultCount)
        ccall((:Bus_Get_Zsc0, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Bus_Get_Zsc0_GR()
        ccall((:Bus_Get_Zsc0_GR, LIBRARY), Cvoid, ())
    end

    function Bus_Get_Zsc1(ResultPtr, ResultCount)
        ccall((:Bus_Get_Zsc1, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Bus_Get_Zsc1_GR()
        ccall((:Bus_Get_Zsc1_GR, LIBRARY), Cvoid, ())
    end

    function Bus_Get_ZscMatrix(ResultPtr, ResultCount)
        ccall((:Bus_Get_ZscMatrix, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Bus_Get_ZscMatrix_GR()
        ccall((:Bus_Get_ZscMatrix_GR, LIBRARY), Cvoid, ())
    end

    function Bus_ZscRefresh()
        ccall((:Bus_ZscRefresh, LIBRARY), UInt16, ())
    end

    function Bus_Get_YscMatrix(ResultPtr, ResultCount)
        ccall((:Bus_Get_YscMatrix, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Bus_Get_YscMatrix_GR()
        ccall((:Bus_Get_YscMatrix_GR, LIBRARY), Cvoid, ())
    end

    function Bus_Get_Coorddefined()
        ccall((:Bus_Get_Coorddefined, LIBRARY), UInt16, ())
    end

    function Bus_Get_x()
        ccall((:Bus_Get_x, LIBRARY), Cdouble, ())
    end

    function Bus_Set_x(Value)
        ccall((:Bus_Set_x, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Bus_Get_y()
        ccall((:Bus_Get_y, LIBRARY), Cdouble, ())
    end

    function Bus_Set_y(Value)
        ccall((:Bus_Set_y, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Bus_Get_Distance()
        ccall((:Bus_Get_Distance, LIBRARY), Cdouble, ())
    end

    function Bus_GetUniqueNodeNumber(StartNumber)
        ccall((:Bus_GetUniqueNodeNumber, LIBRARY), Int32, (Int32,), StartNumber)
    end

    function Bus_Get_CplxSeqVoltages(ResultPtr, ResultCount)
        ccall((:Bus_Get_CplxSeqVoltages, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Bus_Get_CplxSeqVoltages_GR()
        ccall((:Bus_Get_CplxSeqVoltages_GR, LIBRARY), Cvoid, ())
    end

    function Bus_Get_Int_Duration()
        ccall((:Bus_Get_Int_Duration, LIBRARY), Cdouble, ())
    end

    function Bus_Get_Lambda()
        ccall((:Bus_Get_Lambda, LIBRARY), Cdouble, ())
    end

    function Bus_Get_Cust_Duration()
        ccall((:Bus_Get_Cust_Duration, LIBRARY), Cdouble, ())
    end

    function Bus_Get_Cust_Interrupts()
        ccall((:Bus_Get_Cust_Interrupts, LIBRARY), Cdouble, ())
    end

    function Bus_Get_N_Customers()
        ccall((:Bus_Get_N_Customers, LIBRARY), Int32, ())
    end

    function Bus_Get_N_interrupts()
        ccall((:Bus_Get_N_interrupts, LIBRARY), Cdouble, ())
    end

    function Bus_Get_puVLL(ResultPtr, ResultCount)
        ccall((:Bus_Get_puVLL, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Bus_Get_puVLL_GR()
        ccall((:Bus_Get_puVLL_GR, LIBRARY), Cvoid, ())
    end

    function Bus_Get_VLL(ResultPtr, ResultCount)
        ccall((:Bus_Get_VLL, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Bus_Get_VLL_GR()
        ccall((:Bus_Get_VLL_GR, LIBRARY), Cvoid, ())
    end

    function Bus_Get_puVmagAngle(ResultPtr, ResultCount)
        ccall((:Bus_Get_puVmagAngle, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Bus_Get_puVmagAngle_GR()
        ccall((:Bus_Get_puVmagAngle_GR, LIBRARY), Cvoid, ())
    end

    function Bus_Get_VMagAngle(ResultPtr, ResultCount)
        ccall((:Bus_Get_VMagAngle, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Bus_Get_VMagAngle_GR()
        ccall((:Bus_Get_VMagAngle_GR, LIBRARY), Cvoid, ())
    end

    function Bus_Get_TotalMiles()
        ccall((:Bus_Get_TotalMiles, LIBRARY), Cdouble, ())
    end

    function Bus_Get_SectionID()
        ccall((:Bus_Get_SectionID, LIBRARY), Int32, ())
    end

    function Capacitors_Get_AllNames(ResultPtr, ResultCount)
        ccall((:Capacitors_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Capacitors_Get_AllNames_GR()
        ccall((:Capacitors_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function Capacitors_Get_First()
        ccall((:Capacitors_Get_First, LIBRARY), Int32, ())
    end

    function Capacitors_Get_IsDelta()
        ccall((:Capacitors_Get_IsDelta, LIBRARY), UInt16, ())
    end

    function Capacitors_Get_kV()
        ccall((:Capacitors_Get_kV, LIBRARY), Cdouble, ())
    end

    function Capacitors_Get_kvar()
        ccall((:Capacitors_Get_kvar, LIBRARY), Cdouble, ())
    end

    function Capacitors_Get_Name()
        ccall((:Capacitors_Get_Name, LIBRARY), Cstring, ())
    end

    function Capacitors_Get_Next()
        ccall((:Capacitors_Get_Next, LIBRARY), Int32, ())
    end

    function Capacitors_Get_NumSteps()
        ccall((:Capacitors_Get_NumSteps, LIBRARY), Int32, ())
    end

    function Capacitors_Set_IsDelta(Value)
        ccall((:Capacitors_Set_IsDelta, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function Capacitors_Set_kV(Value)
        ccall((:Capacitors_Set_kV, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Capacitors_Set_kvar(Value)
        ccall((:Capacitors_Set_kvar, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Capacitors_Set_Name(Value)
        ccall((:Capacitors_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Capacitors_Set_NumSteps(Value)
        ccall((:Capacitors_Set_NumSteps, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Capacitors_Get_Count()
        ccall((:Capacitors_Get_Count, LIBRARY), Int32, ())
    end

    function Capacitors_AddStep()
        ccall((:Capacitors_AddStep, LIBRARY), UInt16, ())
    end

    function Capacitors_SubtractStep()
        ccall((:Capacitors_SubtractStep, LIBRARY), UInt16, ())
    end

    function Capacitors_Get_AvailableSteps()
        ccall((:Capacitors_Get_AvailableSteps, LIBRARY), Int32, ())
    end

    function Capacitors_Get_States(ResultPtr, ResultCount)
        ccall((:Capacitors_Get_States, LIBRARY), Cvoid, (Ptr{Ptr{Int32}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Capacitors_Get_States_GR()
        ccall((:Capacitors_Get_States_GR, LIBRARY), Cvoid, ())
    end

    function Capacitors_Set_States(ValuePtr, ValueCount)
        ccall((:Capacitors_Set_States, LIBRARY), Cvoid, (Ptr{Int32}, Int32), ValuePtr, ValueCount)
    end

    function Capacitors_Open()
        ccall((:Capacitors_Open, LIBRARY), Cvoid, ())
    end

    function Capacitors_Close()
        ccall((:Capacitors_Close, LIBRARY), Cvoid, ())
    end

    function CapControls_Get_AllNames(ResultPtr, ResultCount)
        ccall((:CapControls_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CapControls_Get_AllNames_GR()
        ccall((:CapControls_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function CapControls_Get_Capacitor()
        ccall((:CapControls_Get_Capacitor, LIBRARY), Cstring, ())
    end

    function CapControls_Get_CTratio()
        ccall((:CapControls_Get_CTratio, LIBRARY), Cdouble, ())
    end

    function CapControls_Get_DeadTime()
        ccall((:CapControls_Get_DeadTime, LIBRARY), Cdouble, ())
    end

    function CapControls_Get_Delay()
        ccall((:CapControls_Get_Delay, LIBRARY), Cdouble, ())
    end

    function CapControls_Get_DelayOff()
        ccall((:CapControls_Get_DelayOff, LIBRARY), Cdouble, ())
    end

    function CapControls_Get_First()
        ccall((:CapControls_Get_First, LIBRARY), Int32, ())
    end

    function CapControls_Get_Mode()
        ccall((:CapControls_Get_Mode, LIBRARY), Int32, ())
    end

    function CapControls_Get_MonitoredObj()
        ccall((:CapControls_Get_MonitoredObj, LIBRARY), Cstring, ())
    end

    function CapControls_Get_MonitoredTerm()
        ccall((:CapControls_Get_MonitoredTerm, LIBRARY), Int32, ())
    end

    function CapControls_Get_Name()
        ccall((:CapControls_Get_Name, LIBRARY), Cstring, ())
    end

    function CapControls_Get_Next()
        ccall((:CapControls_Get_Next, LIBRARY), Int32, ())
    end

    function CapControls_Get_OFFSetting()
        ccall((:CapControls_Get_OFFSetting, LIBRARY), Cdouble, ())
    end

    function CapControls_Get_ONSetting()
        ccall((:CapControls_Get_ONSetting, LIBRARY), Cdouble, ())
    end

    function CapControls_Get_PTratio()
        ccall((:CapControls_Get_PTratio, LIBRARY), Cdouble, ())
    end

    function CapControls_Get_UseVoltOverride()
        ccall((:CapControls_Get_UseVoltOverride, LIBRARY), UInt16, ())
    end

    function CapControls_Get_Vmax()
        ccall((:CapControls_Get_Vmax, LIBRARY), Cdouble, ())
    end

    function CapControls_Get_Vmin()
        ccall((:CapControls_Get_Vmin, LIBRARY), Cdouble, ())
    end

    function CapControls_Set_Capacitor(Value)
        ccall((:CapControls_Set_Capacitor, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function CapControls_Set_CTratio(Value)
        ccall((:CapControls_Set_CTratio, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CapControls_Set_DeadTime(Value)
        ccall((:CapControls_Set_DeadTime, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CapControls_Set_Delay(Value)
        ccall((:CapControls_Set_Delay, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CapControls_Set_DelayOff(Value)
        ccall((:CapControls_Set_DelayOff, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CapControls_Set_Mode(Value)
        ccall((:CapControls_Set_Mode, LIBRARY), Cvoid, (Int32,), Value)
    end

    function CapControls_Set_MonitoredObj(Value)
        ccall((:CapControls_Set_MonitoredObj, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function CapControls_Set_MonitoredTerm(Value)
        ccall((:CapControls_Set_MonitoredTerm, LIBRARY), Cvoid, (Int32,), Value)
    end

    function CapControls_Set_Name(Value)
        ccall((:CapControls_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function CapControls_Set_OFFSetting(Value)
        ccall((:CapControls_Set_OFFSetting, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CapControls_Set_ONSetting(Value)
        ccall((:CapControls_Set_ONSetting, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CapControls_Set_PTratio(Value)
        ccall((:CapControls_Set_PTratio, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CapControls_Set_UseVoltOverride(Value)
        ccall((:CapControls_Set_UseVoltOverride, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function CapControls_Set_Vmax(Value)
        ccall((:CapControls_Set_Vmax, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CapControls_Set_Vmin(Value)
        ccall((:CapControls_Set_Vmin, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CapControls_Get_Count()
        ccall((:CapControls_Get_Count, LIBRARY), Int32, ())
    end

    function CapControls_Reset()
        ccall((:CapControls_Reset, LIBRARY), Cvoid, ())
    end

    function Circuit_Get_Name()
        ccall((:Circuit_Get_Name, LIBRARY), Cstring, ())
    end

    function Circuit_Get_NumBuses()
        ccall((:Circuit_Get_NumBuses, LIBRARY), Int32, ())
    end

    function Circuit_Get_NumCktElements()
        ccall((:Circuit_Get_NumCktElements, LIBRARY), Int32, ())
    end

    function Circuit_Get_NumNodes()
        ccall((:Circuit_Get_NumNodes, LIBRARY), Int32, ())
    end

    function Circuit_Get_LineLosses(ResultPtr, ResultCount)
        ccall((:Circuit_Get_LineLosses, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_LineLosses_GR()
        ccall((:Circuit_Get_LineLosses_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_Get_Losses(ResultPtr, ResultCount)
        ccall((:Circuit_Get_Losses, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_Losses_GR()
        ccall((:Circuit_Get_Losses_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_Get_AllBusVmag(ResultPtr, ResultCount)
        ccall((:Circuit_Get_AllBusVmag, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_AllBusVmag_GR()
        ccall((:Circuit_Get_AllBusVmag_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_Get_AllBusVolts(ResultPtr, ResultCount)
        ccall((:Circuit_Get_AllBusVolts, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_AllBusVolts_GR()
        ccall((:Circuit_Get_AllBusVolts_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_Get_AllElementNames(ResultPtr, ResultCount)
        ccall((:Circuit_Get_AllElementNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_AllElementNames_GR()
        ccall((:Circuit_Get_AllElementNames_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_Get_SubstationLosses(ResultPtr, ResultCount)
        ccall((:Circuit_Get_SubstationLosses, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_SubstationLosses_GR()
        ccall((:Circuit_Get_SubstationLosses_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_Get_TotalPower(ResultPtr, ResultCount)
        ccall((:Circuit_Get_TotalPower, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_TotalPower_GR()
        ccall((:Circuit_Get_TotalPower_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_Disable(Name)
        ccall((:Circuit_Disable, LIBRARY), Cvoid, (Cstring,), Name)
    end

    function Circuit_Enable(Name)
        ccall((:Circuit_Enable, LIBRARY), Cvoid, (Cstring,), Name)
    end

    function Circuit_FirstPCElement()
        ccall((:Circuit_FirstPCElement, LIBRARY), Int32, ())
    end

    function Circuit_FirstPDElement()
        ccall((:Circuit_FirstPDElement, LIBRARY), Int32, ())
    end

    function Circuit_NextPCElement()
        ccall((:Circuit_NextPCElement, LIBRARY), Int32, ())
    end

    function Circuit_NextPDElement()
        ccall((:Circuit_NextPDElement, LIBRARY), Int32, ())
    end

    function Circuit_Get_AllBusNames(ResultPtr, ResultCount)
        ccall((:Circuit_Get_AllBusNames, LIBRARY), Cvoid, (Ref{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_AllBusNames_GR()
        ccall((:Circuit_Get_AllBusNames_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_Get_AllElementLosses(ResultPtr, ResultCount)
        ccall((:Circuit_Get_AllElementLosses, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_AllElementLosses_GR()
        ccall((:Circuit_Get_AllElementLosses_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_Sample()
        ccall((:Circuit_Sample, LIBRARY), Cvoid, ())
    end

    function Circuit_SaveSample()
        ccall((:Circuit_SaveSample, LIBRARY), Cvoid, ())
    end

    function Circuit_SetActiveElement(FullName)
        ccall((:Circuit_SetActiveElement, LIBRARY), Int32, (Cstring,), FullName)
    end

    function Circuit_Capacity(Start, Increment)
        ccall((:Circuit_Capacity, LIBRARY), Cdouble, (Cdouble, Cdouble), Start, Increment)
    end

    function Circuit_Get_AllBusVmagPu(ResultPtr, ResultCount)
        ccall((:Circuit_Get_AllBusVmagPu, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_AllBusVmagPu_GR()
        ccall((:Circuit_Get_AllBusVmagPu_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_SetActiveBus(BusName)
        ccall((:Circuit_SetActiveBus, LIBRARY), Int32, (Cstring,), BusName)
    end

    function Circuit_SetActiveBusi(BusIndex)
        ccall((:Circuit_SetActiveBusi, LIBRARY), Int32, (Int32,), BusIndex)
    end

    function Circuit_Get_AllNodeNames(ResultPtr, ResultCount)
        ccall((:Circuit_Get_AllNodeNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_AllNodeNames_GR()
        ccall((:Circuit_Get_AllNodeNames_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_Get_SystemY(ResultPtr, ResultCount)
        ccall((:Circuit_Get_SystemY, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_SystemY_GR()
        ccall((:Circuit_Get_SystemY_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_Get_AllBusDistances(ResultPtr, ResultCount)
        ccall((:Circuit_Get_AllBusDistances, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_AllBusDistances_GR()
        ccall((:Circuit_Get_AllBusDistances_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_Get_AllNodeDistances(ResultPtr, ResultCount)
        ccall((:Circuit_Get_AllNodeDistances, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_AllNodeDistances_GR()
        ccall((:Circuit_Get_AllNodeDistances_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_Get_AllNodeDistancesByPhase(ResultPtr, ResultCount, Phase)
        ccall((:Circuit_Get_AllNodeDistancesByPhase, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ResultPtr, ResultCount, Phase)
    end

    function Circuit_Get_AllNodeDistancesByPhase_GR(Phase)
        ccall((:Circuit_Get_AllNodeDistancesByPhase_GR, LIBRARY), Cvoid, (Int32,), Phase)
    end

    function Circuit_Get_AllNodeVmagByPhase(ResultPtr, ResultCount, Phase)
        ccall((:Circuit_Get_AllNodeVmagByPhase, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ResultPtr, ResultCount, Phase)
    end

    function Circuit_Get_AllNodeVmagByPhase_GR(Phase)
        ccall((:Circuit_Get_AllNodeVmagByPhase_GR, LIBRARY), Cvoid, (Int32,), Phase)
    end

    function Circuit_Get_AllNodeVmagPUByPhase(ResultPtr, ResultCount, Phase)
        ccall((:Circuit_Get_AllNodeVmagPUByPhase, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ResultPtr, ResultCount, Phase)
    end

    function Circuit_Get_AllNodeVmagPUByPhase_GR(Phase)
        ccall((:Circuit_Get_AllNodeVmagPUByPhase_GR, LIBRARY), Cvoid, (Int32,), Phase)
    end

    function Circuit_Get_AllNodeNamesByPhase(ResultPtr, ResultCount, Phase)
        ccall((:Circuit_Get_AllNodeNamesByPhase, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}, Int32), ResultPtr, ResultCount, Phase)
    end

    function Circuit_Get_AllNodeNamesByPhase_GR(Phase)
        ccall((:Circuit_Get_AllNodeNamesByPhase_GR, LIBRARY), Cvoid, (Int32,), Phase)
    end

    function Circuit_SetActiveClass(ClassName)
        ccall((:Circuit_SetActiveClass, LIBRARY), Int32, (Cstring,), ClassName)
    end

    function Circuit_FirstElement()
        ccall((:Circuit_FirstElement, LIBRARY), Int32, ())
    end

    function Circuit_NextElement()
        ccall((:Circuit_NextElement, LIBRARY), Int32, ())
    end

    function Circuit_UpdateStorage()
        ccall((:Circuit_UpdateStorage, LIBRARY), Cvoid, ())
    end

    function Circuit_Get_ParentPDElement()
        ccall((:Circuit_Get_ParentPDElement, LIBRARY), Int32, ())
    end

    function Circuit_EndOfTimeStepUpdate()
        ccall((:Circuit_EndOfTimeStepUpdate, LIBRARY), Cvoid, ())
    end

    function Circuit_Get_YNodeOrder(ResultPtr, ResultCount)
        ccall((:Circuit_Get_YNodeOrder, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_YNodeOrder_GR()
        ccall((:Circuit_Get_YNodeOrder_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_Get_YCurrents(ResultPtr, ResultCount)
        ccall((:Circuit_Get_YCurrents, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_YCurrents_GR()
        ccall((:Circuit_Get_YCurrents_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_Get_YNodeVarray(ResultPtr, ResultCount)
        ccall((:Circuit_Get_YNodeVarray, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Circuit_Get_YNodeVarray_GR()
        ccall((:Circuit_Get_YNodeVarray_GR, LIBRARY), Cvoid, ())
    end

    function Circuit_SetCktElementName(Value)
        ccall((:Circuit_SetCktElementName, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Circuit_SetCktElementIndex(Value)
        ccall((:Circuit_SetCktElementIndex, LIBRARY), Cvoid, (Int32,), Value)
    end

    function CktElement_Get_BusNames(ResultPtr, ResultCount)
        ccall((:CktElement_Get_BusNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_BusNames_GR()
        ccall((:CktElement_Get_BusNames_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_Name()
        ccall((:CktElement_Get_Name, LIBRARY), Cstring, ())
    end

    function CktElement_Get_NumConductors()
        ccall((:CktElement_Get_NumConductors, LIBRARY), Int32, ())
    end

    function CktElement_Get_NumPhases()
        ccall((:CktElement_Get_NumPhases, LIBRARY), Int32, ())
    end

    function CktElement_Get_NumTerminals()
        ccall((:CktElement_Get_NumTerminals, LIBRARY), Int32, ())
    end

    function CktElement_Set_BusNames(ValuePtr, ValueCount)
        ccall((:CktElement_Set_BusNames, LIBRARY), Cvoid, (Ptr{Cstring}, Int32), ValuePtr, ValueCount)
    end

    function CktElement_Get_Currents(ResultPtr, ResultCount)
        ccall((:CktElement_Get_Currents, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_Currents_GR()
        ccall((:CktElement_Get_Currents_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_Voltages(ResultPtr, ResultCount)
        ccall((:CktElement_Get_Voltages, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_Voltages_GR()
        ccall((:CktElement_Get_Voltages_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_EmergAmps()
        ccall((:CktElement_Get_EmergAmps, LIBRARY), Cdouble, ())
    end

    function CktElement_Get_Enabled()
        ccall((:CktElement_Get_Enabled, LIBRARY), UInt16, ())
    end

    function CktElement_Get_Losses(ResultPtr, ResultCount)
        ccall((:CktElement_Get_Losses, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_Losses_GR()
        ccall((:CktElement_Get_Losses_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_NormalAmps()
        ccall((:CktElement_Get_NormalAmps, LIBRARY), Cdouble, ())
    end

    function CktElement_Get_PhaseLosses(ResultPtr, ResultCount)
        ccall((:CktElement_Get_PhaseLosses, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_PhaseLosses_GR()
        ccall((:CktElement_Get_PhaseLosses_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_Powers(ResultPtr, ResultCount)
        ccall((:CktElement_Get_Powers, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_Powers_GR()
        ccall((:CktElement_Get_Powers_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_SeqCurrents(ResultPtr, ResultCount)
        ccall((:CktElement_Get_SeqCurrents, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_SeqCurrents_GR()
        ccall((:CktElement_Get_SeqCurrents_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_SeqPowers(ResultPtr, ResultCount)
        ccall((:CktElement_Get_SeqPowers, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_SeqPowers_GR()
        ccall((:CktElement_Get_SeqPowers_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_SeqVoltages(ResultPtr, ResultCount)
        ccall((:CktElement_Get_SeqVoltages, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_SeqVoltages_GR()
        ccall((:CktElement_Get_SeqVoltages_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Close(Term, Phs)
        ccall((:CktElement_Close, LIBRARY), Cvoid, (Int32, Int32), Term, Phs)
    end

    function CktElement_Open(Term, Phs)
        ccall((:CktElement_Open, LIBRARY), Cvoid, (Int32, Int32), Term, Phs)
    end

    function CktElement_Set_EmergAmps(Value)
        ccall((:CktElement_Set_EmergAmps, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CktElement_Set_Enabled(Value)
        ccall((:CktElement_Set_Enabled, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function CktElement_Set_NormalAmps(Value)
        ccall((:CktElement_Set_NormalAmps, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CktElement_IsOpen(Term, Phs)
        ccall((:CktElement_IsOpen, LIBRARY), UInt16, (Int32, Int32), Term, Phs)
    end

    function CktElement_Get_AllPropertyNames(ResultPtr, ResultCount)
        ccall((:CktElement_Get_AllPropertyNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_AllPropertyNames_GR()
        ccall((:CktElement_Get_AllPropertyNames_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_NumProperties()
        ccall((:CktElement_Get_NumProperties, LIBRARY), Int32, ())
    end

    function CktElement_Get_Residuals(ResultPtr, ResultCount)
        ccall((:CktElement_Get_Residuals, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_Residuals_GR()
        ccall((:CktElement_Get_Residuals_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_Yprim(ResultPtr, ResultCount)
        ccall((:CktElement_Get_Yprim, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_Yprim_GR()
        ccall((:CktElement_Get_Yprim_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_DisplayName()
        ccall((:CktElement_Get_DisplayName, LIBRARY), Cstring, ())
    end

    function CktElement_Get_GUID()
        ccall((:CktElement_Get_GUID, LIBRARY), Cstring, ())
    end

    function CktElement_Get_Handle()
        ccall((:CktElement_Get_Handle, LIBRARY), Int32, ())
    end

    function CktElement_Set_DisplayName(Value)
        ccall((:CktElement_Set_DisplayName, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function CktElement_Get_Controller(idx)
        ccall((:CktElement_Get_Controller, LIBRARY), Cstring, (Int32,), idx)
    end

    function CktElement_Get_EnergyMeter()
        ccall((:CktElement_Get_EnergyMeter, LIBRARY), Cstring, ())
    end

    function CktElement_Get_HasVoltControl()
        ccall((:CktElement_Get_HasVoltControl, LIBRARY), UInt16, ())
    end

    function CktElement_Get_HasSwitchControl()
        ccall((:CktElement_Get_HasSwitchControl, LIBRARY), UInt16, ())
    end

    function CktElement_Get_CplxSeqVoltages(ResultPtr, ResultCount)
        ccall((:CktElement_Get_CplxSeqVoltages, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_CplxSeqVoltages_GR()
        ccall((:CktElement_Get_CplxSeqVoltages_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_CplxSeqCurrents(ResultPtr, ResultCount)
        ccall((:CktElement_Get_CplxSeqCurrents, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_CplxSeqCurrents_GR()
        ccall((:CktElement_Get_CplxSeqCurrents_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_AllVariableNames(ResultPtr, ResultCount)
        ccall((:CktElement_Get_AllVariableNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_AllVariableNames_GR()
        ccall((:CktElement_Get_AllVariableNames_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_AllVariableValues(ResultPtr, ResultCount)
        ccall((:CktElement_Get_AllVariableValues, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_AllVariableValues_GR()
        ccall((:CktElement_Get_AllVariableValues_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_Variable(MyVarName, Code)
        ccall((:CktElement_Get_Variable, LIBRARY), Cdouble, (Cstring, Ptr{Int32}), MyVarName, Code)
    end

    function CktElement_Get_Variablei(Idx, Code)
        ccall((:CktElement_Get_Variablei, LIBRARY), Cdouble, (Int32, Ptr{Int32}), Idx, Code)
    end

    function CktElement_Get_NodeOrder(ResultPtr, ResultCount)
        ccall((:CktElement_Get_NodeOrder, LIBRARY), Cvoid, (Ptr{Ptr{Int32}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_NodeOrder_GR()
        ccall((:CktElement_Get_NodeOrder_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_HasOCPDevice()
        ccall((:CktElement_Get_HasOCPDevice, LIBRARY), UInt16, ())
    end

    function CktElement_Get_NumControls()
        ccall((:CktElement_Get_NumControls, LIBRARY), Int32, ())
    end

    function CktElement_Get_OCPDevIndex()
        ccall((:CktElement_Get_OCPDevIndex, LIBRARY), Int32, ())
    end

    function CktElement_Get_OCPDevType()
        ccall((:CktElement_Get_OCPDevType, LIBRARY), Int32, ())
    end

    function CktElement_Get_CurrentsMagAng(ResultPtr, ResultCount)
        ccall((:CktElement_Get_CurrentsMagAng, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_CurrentsMagAng_GR()
        ccall((:CktElement_Get_CurrentsMagAng_GR, LIBRARY), Cvoid, ())
    end

    function CktElement_Get_VoltagesMagAng(ResultPtr, ResultCount)
        ccall((:CktElement_Get_VoltagesMagAng, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CktElement_Get_VoltagesMagAng_GR()
        ccall((:CktElement_Get_VoltagesMagAng_GR, LIBRARY), Cvoid, ())
    end

    function CmathLib_Get_cmplx(ResultPtr, ResultCount, RealPart, ImagPart)
        ccall((:CmathLib_Get_cmplx, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble), ResultPtr, ResultCount, RealPart, ImagPart)
    end

    function CmathLib_Get_cmplx_GR(RealPart, ImagPart)
        ccall((:CmathLib_Get_cmplx_GR, LIBRARY), Cvoid, (Cdouble, Cdouble), RealPart, ImagPart)
    end

    function CmathLib_Get_cabs(realpart, imagpart)
        ccall((:CmathLib_Get_cabs, LIBRARY), Cdouble, (Cdouble, Cdouble), realpart, imagpart)
    end

    function CmathLib_Get_cdang(RealPart, ImagPart)
        ccall((:CmathLib_Get_cdang, LIBRARY), Cdouble, (Cdouble, Cdouble), RealPart, ImagPart)
    end

    function CmathLib_Get_ctopolardeg(ResultPtr, ResultCount, RealPart, ImagPart)
        ccall((:CmathLib_Get_ctopolardeg, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble), ResultPtr, ResultCount, RealPart, ImagPart)
    end

    function CmathLib_Get_ctopolardeg_GR(RealPart, ImagPart)
        ccall((:CmathLib_Get_ctopolardeg_GR, LIBRARY), Cvoid, (Cdouble, Cdouble), RealPart, ImagPart)
    end

    function CmathLib_Get_pdegtocomplex(ResultPtr, ResultCount, magnitude, angle)
        ccall((:CmathLib_Get_pdegtocomplex, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble), ResultPtr, ResultCount, magnitude, angle)
    end

    function CmathLib_Get_pdegtocomplex_GR(magnitude, angle)
        ccall((:CmathLib_Get_pdegtocomplex_GR, LIBRARY), Cvoid, (Cdouble, Cdouble), magnitude, angle)
    end

    function CmathLib_Get_cmul(ResultPtr, ResultCount, a1, b1, a2, b2)
        ccall((:CmathLib_Get_cmul, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Cdouble, Cdouble), ResultPtr, ResultCount, a1, b1, a2, b2)
    end

    function CmathLib_Get_cmul_GR(a1, b1, a2, b2)
        ccall((:CmathLib_Get_cmul_GR, LIBRARY), Cvoid, (Cdouble, Cdouble, Cdouble, Cdouble), a1, b1, a2, b2)
    end

    function CmathLib_Get_cdiv(ResultPtr, ResultCount, a1, b1, a2, b2)
        ccall((:CmathLib_Get_cdiv, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Cdouble, Cdouble), ResultPtr, ResultCount, a1, b1, a2, b2)
    end

    function CmathLib_Get_cdiv_GR(a1, b1, a2, b2)
        ccall((:CmathLib_Get_cdiv_GR, LIBRARY), Cvoid, (Cdouble, Cdouble, Cdouble, Cdouble), a1, b1, a2, b2)
    end

    function CtrlQueue_ClearQueue()
        ccall((:CtrlQueue_ClearQueue, LIBRARY), Cvoid, ())
    end

    function CtrlQueue_Delete(ActionHandle)
        ccall((:CtrlQueue_Delete, LIBRARY), Cvoid, (Int32,), ActionHandle)
    end

    function CtrlQueue_Get_ActionCode()
        ccall((:CtrlQueue_Get_ActionCode, LIBRARY), Int32, ())
    end

    function CtrlQueue_Get_DeviceHandle()
        ccall((:CtrlQueue_Get_DeviceHandle, LIBRARY), Int32, ())
    end

    function CtrlQueue_Get_NumActions()
        ccall((:CtrlQueue_Get_NumActions, LIBRARY), Int32, ())
    end

    function CtrlQueue_Show()
        ccall((:CtrlQueue_Show, LIBRARY), Cvoid, ())
    end

    function CtrlQueue_ClearActions()
        ccall((:CtrlQueue_ClearActions, LIBRARY), Cvoid, ())
    end

    function CtrlQueue_Get_PopAction()
        ccall((:CtrlQueue_Get_PopAction, LIBRARY), Int32, ())
    end

    function CtrlQueue_Set_Action(Param1)
        ccall((:CtrlQueue_Set_Action, LIBRARY), Cvoid, (Int32,), Param1)
    end

    function CtrlQueue_Get_QueueSize()
        ccall((:CtrlQueue_Get_QueueSize, LIBRARY), Int32, ())
    end

    function CtrlQueue_DoAllQueue()
        ccall((:CtrlQueue_DoAllQueue, LIBRARY), Cvoid, ())
    end

    function CtrlQueue_Get_Queue(ResultPtr, ResultCount)
        ccall((:CtrlQueue_Get_Queue, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CtrlQueue_Get_Queue_GR()
        ccall((:CtrlQueue_Get_Queue_GR, LIBRARY), Cvoid, ())
    end

    function DSS_Get_NumCircuits()
        ccall((:DSS_Get_NumCircuits, LIBRARY), Int32, ())
    end

    function DSS_ClearAll()
        ccall((:DSS_ClearAll, LIBRARY), Cvoid, ())
    end

    function DSS_Get_Version()
        ccall((:DSS_Get_Version, LIBRARY), Cstring, ())
    end

    function DSS_Start(code)
        ccall((:DSS_Start, LIBRARY), UInt16, (Int32,), code)
    end

    function DSS_Get_Classes(ResultPtr, ResultCount)
        ccall((:DSS_Get_Classes, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function DSS_Get_Classes_GR()
        ccall((:DSS_Get_Classes_GR, LIBRARY), Cvoid, ())
    end

    function DSS_Get_UserClasses(ResultPtr, ResultCount)
        ccall((:DSS_Get_UserClasses, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function DSS_Get_UserClasses_GR()
        ccall((:DSS_Get_UserClasses_GR, LIBRARY), Cvoid, ())
    end

    function DSS_Get_NumClasses()
        ccall((:DSS_Get_NumClasses, LIBRARY), Int32, ())
    end

    function DSS_Get_NumUserClasses()
        ccall((:DSS_Get_NumUserClasses, LIBRARY), Int32, ())
    end

    function DSS_Get_DataPath()
        ccall((:DSS_Get_DataPath, LIBRARY), Cstring, ())
    end

    function DSS_Set_DataPath(Value)
        ccall((:DSS_Set_DataPath, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function DSS_Reset()
        ccall((:DSS_Reset, LIBRARY), Cvoid, ())
    end

    function DSS_Get_DefaultEditor()
        ccall((:DSS_Get_DefaultEditor, LIBRARY), Cstring, ())
    end

    function DSS_SetActiveClass(ClassName)
        ccall((:DSS_SetActiveClass, LIBRARY), Int32, (Cstring,), ClassName)
    end

    function DSS_Get_AllowForms()
        ccall((:DSS_Get_AllowForms, LIBRARY), UInt16, ())
    end

    function DSS_Set_AllowForms(Value)
        ccall((:DSS_Set_AllowForms, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function DSSElement_Get_AllPropertyNames(ResultPtr, ResultCount)
        ccall((:DSSElement_Get_AllPropertyNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function DSSElement_Get_AllPropertyNames_GR()
        ccall((:DSSElement_Get_AllPropertyNames_GR, LIBRARY), Cvoid, ())
    end

    function DSSElement_Get_Name()
        ccall((:DSSElement_Get_Name, LIBRARY), Cstring, ())
    end

    function DSSElement_Get_NumProperties()
        ccall((:DSSElement_Get_NumProperties, LIBRARY), Int32, ())
    end

    function DSSimComs_BusVoltagepu(ResultPtr, ResultCount, Index)
        ccall((:DSSimComs_BusVoltagepu, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cint), ResultPtr, ResultCount, Index)
    end

    function DSSimComs_BusVoltagepu_GR(Index)
        ccall((:DSSimComs_BusVoltagepu_GR, LIBRARY), Cvoid, (Cint,), Index)
    end

    function DSSimComs_BusVoltage(ResultPtr, ResultCount, Index)
        ccall((:DSSimComs_BusVoltage, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cint), ResultPtr, ResultCount, Index)
    end

    function DSSimComs_BusVoltage_GR(Index)
        ccall((:DSSimComs_BusVoltage_GR, LIBRARY), Cvoid, (Cint,), Index)
    end

    function DSSProgress_Close()
        ccall((:DSSProgress_Close, LIBRARY), Cvoid, ())
    end

    function DSSProgress_Set_Caption(Value)
        ccall((:DSSProgress_Set_Caption, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function DSSProgress_Set_PctProgress(Value)
        ccall((:DSSProgress_Set_PctProgress, LIBRARY), Cvoid, (Int32,), Value)
    end

    function DSSProgress_Show()
        ccall((:DSSProgress_Show, LIBRARY), Cvoid, ())
    end

    function DSSProperty_Get_Description()
        ccall((:DSSProperty_Get_Description, LIBRARY), Cstring, ())
    end

    function DSSProperty_Get_Name()
        ccall((:DSSProperty_Get_Name, LIBRARY), Cstring, ())
    end

    function DSSProperty_Get_Val()
        ccall((:DSSProperty_Get_Val, LIBRARY), Cstring, ())
    end

    function DSSProperty_Set_Val(Value)
        ccall((:DSSProperty_Set_Val, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function DSSProperty_Set_Name(Value)
        ccall((:DSSProperty_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function DSSProperty_Set_Index(Value)
        ccall((:DSSProperty_Set_Index, LIBRARY), Cvoid, (Int32,), Value)
    end

    function DSS_Executive_Get_Command(i)
        ccall((:DSS_Executive_Get_Command, LIBRARY), Cstring, (Int32,), i)
    end

    function DSS_Executive_Get_NumCommands()
        ccall((:DSS_Executive_Get_NumCommands, LIBRARY), Int32, ())
    end

    function DSS_Executive_Get_NumOptions()
        ccall((:DSS_Executive_Get_NumOptions, LIBRARY), Int32, ())
    end

    function DSS_Executive_Get_Option(i)
        ccall((:DSS_Executive_Get_Option, LIBRARY), Cstring, (Int32,), i)
    end

    function DSS_Executive_Get_CommandHelp(i)
        ccall((:DSS_Executive_Get_CommandHelp, LIBRARY), Cstring, (Int32,), i)
    end

    function DSS_Executive_Get_OptionHelp(i)
        ccall((:DSS_Executive_Get_OptionHelp, LIBRARY), Cstring, (Int32,), i)
    end

    function DSS_Executive_Get_OptionValue(i)
        ccall((:DSS_Executive_Get_OptionValue, LIBRARY), Cstring, (Int32,), i)
    end

    function Error_Get_Description()
        ccall((:Error_Get_Description, LIBRARY), Cstring, ())
    end

    function Error_Get_Number()
        ccall((:Error_Get_Number, LIBRARY), Int32, ())
    end

    function Error_Get_NumberPtr()
        ccall((:Error_Get_NumberPtr, LIBRARY), Ptr{Int32}, ())
    end

    function Fuses_Get_AllNames(ResultPtr, ResultCount)
        ccall((:Fuses_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Fuses_Get_AllNames_GR()
        ccall((:Fuses_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function Fuses_Get_Count()
        ccall((:Fuses_Get_Count, LIBRARY), Int32, ())
    end

    function Fuses_Get_First()
        ccall((:Fuses_Get_First, LIBRARY), Int32, ())
    end

    function Fuses_Get_Name()
        ccall((:Fuses_Get_Name, LIBRARY), Cstring, ())
    end

    function Fuses_Get_Next()
        ccall((:Fuses_Get_Next, LIBRARY), Int32, ())
    end

    function Fuses_Set_Name(Value)
        ccall((:Fuses_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Fuses_Get_MonitoredObj()
        ccall((:Fuses_Get_MonitoredObj, LIBRARY), Cstring, ())
    end

    function Fuses_Get_MonitoredTerm()
        ccall((:Fuses_Get_MonitoredTerm, LIBRARY), Int32, ())
    end

    function Fuses_Get_SwitchedObj()
        ccall((:Fuses_Get_SwitchedObj, LIBRARY), Cstring, ())
    end

    function Fuses_Set_MonitoredObj(Value)
        ccall((:Fuses_Set_MonitoredObj, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Fuses_Set_MonitoredTerm(Value)
        ccall((:Fuses_Set_MonitoredTerm, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Fuses_Set_SwitchedObj(Value)
        ccall((:Fuses_Set_SwitchedObj, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Fuses_Get_SwitchedTerm()
        ccall((:Fuses_Get_SwitchedTerm, LIBRARY), Int32, ())
    end

    function Fuses_Set_SwitchedTerm(Value)
        ccall((:Fuses_Set_SwitchedTerm, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Fuses_Get_TCCcurve()
        ccall((:Fuses_Get_TCCcurve, LIBRARY), Cstring, ())
    end

    function Fuses_Set_TCCcurve(Value)
        ccall((:Fuses_Set_TCCcurve, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Fuses_Get_RatedCurrent()
        ccall((:Fuses_Get_RatedCurrent, LIBRARY), Cdouble, ())
    end

    function Fuses_Set_RatedCurrent(Value)
        ccall((:Fuses_Set_RatedCurrent, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Fuses_Get_Delay()
        ccall((:Fuses_Get_Delay, LIBRARY), Cdouble, ())
    end

    function Fuses_Open()
        ccall((:Fuses_Open, LIBRARY), Cvoid, ())
    end

    function Fuses_Close()
        ccall((:Fuses_Close, LIBRARY), Cvoid, ())
    end

    function Fuses_Set_Delay(Value)
        ccall((:Fuses_Set_Delay, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Fuses_IsBlown()
        ccall((:Fuses_IsBlown, LIBRARY), UInt16, ())
    end

    function Fuses_Get_idx()
        ccall((:Fuses_Get_idx, LIBRARY), Int32, ())
    end

    function Fuses_Set_idx(Value)
        ccall((:Fuses_Set_idx, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Fuses_Get_NumPhases()
        ccall((:Fuses_Get_NumPhases, LIBRARY), Int32, ())
    end

    function Generators_Get_AllNames(ResultPtr, ResultCount)
        ccall((:Generators_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Generators_Get_AllNames_GR()
        ccall((:Generators_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function Generators_Get_First()
        ccall((:Generators_Get_First, LIBRARY), Int32, ())
    end

    function Generators_Get_Name()
        ccall((:Generators_Get_Name, LIBRARY), Cstring, ())
    end

    function Generators_Get_Next()
        ccall((:Generators_Get_Next, LIBRARY), Int32, ())
    end

    function Generators_Get_RegisterNames(ResultPtr, ResultCount)
        ccall((:Generators_Get_RegisterNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Generators_Get_RegisterNames_GR()
        ccall((:Generators_Get_RegisterNames_GR, LIBRARY), Cvoid, ())
    end

    function Generators_Get_RegisterValues(ResultPtr, ResultCount)
        ccall((:Generators_Get_RegisterValues, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Generators_Get_RegisterValues_GR()
        ccall((:Generators_Get_RegisterValues_GR, LIBRARY), Cvoid, ())
    end

    function Generators_Get_ForcedON()
        ccall((:Generators_Get_ForcedON, LIBRARY), UInt16, ())
    end

    function Generators_Set_ForcedON(Value)
        ccall((:Generators_Set_ForcedON, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function Generators_Set_Name(Value)
        ccall((:Generators_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Generators_Get_kV()
        ccall((:Generators_Get_kV, LIBRARY), Cdouble, ())
    end

    function Generators_Get_kvar()
        ccall((:Generators_Get_kvar, LIBRARY), Cdouble, ())
    end

    function Generators_Get_kW()
        ccall((:Generators_Get_kW, LIBRARY), Cdouble, ())
    end

    function Generators_Get_PF()
        ccall((:Generators_Get_PF, LIBRARY), Cdouble, ())
    end

    function Generators_Get_Phases()
        ccall((:Generators_Get_Phases, LIBRARY), Int32, ())
    end

    function Generators_Set_kV(Value)
        ccall((:Generators_Set_kV, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Generators_Set_kvar(Value)
        ccall((:Generators_Set_kvar, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Generators_Set_kW(Value)
        ccall((:Generators_Set_kW, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Generators_Set_PF(Value)
        ccall((:Generators_Set_PF, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Generators_Set_Phases(Value)
        ccall((:Generators_Set_Phases, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Generators_Get_Count()
        ccall((:Generators_Get_Count, LIBRARY), Int32, ())
    end

    function Generators_Get_idx()
        ccall((:Generators_Get_idx, LIBRARY), Int32, ())
    end

    function Generators_Set_idx(Value)
        ccall((:Generators_Set_idx, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Generators_Get_Model()
        ccall((:Generators_Get_Model, LIBRARY), Int32, ())
    end

    function Generators_Set_Model(Value)
        ccall((:Generators_Set_Model, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Generators_Get_kVArated()
        ccall((:Generators_Get_kVArated, LIBRARY), Cdouble, ())
    end

    function Generators_Set_kVArated(Value)
        ccall((:Generators_Set_kVArated, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Generators_Get_Vmaxpu()
        ccall((:Generators_Get_Vmaxpu, LIBRARY), Cdouble, ())
    end

    function Generators_Get_Vminpu()
        ccall((:Generators_Get_Vminpu, LIBRARY), Cdouble, ())
    end

    function Generators_Set_Vmaxpu(Value)
        ccall((:Generators_Set_Vmaxpu, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Generators_Set_Vminpu(Value)
        ccall((:Generators_Set_Vminpu, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function ISources_Get_AllNames(ResultPtr, ResultCount)
        ccall((:ISources_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function ISources_Get_AllNames_GR()
        ccall((:ISources_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function ISources_Get_Count()
        ccall((:ISources_Get_Count, LIBRARY), Int32, ())
    end

    function ISources_Get_First()
        ccall((:ISources_Get_First, LIBRARY), Int32, ())
    end

    function ISources_Get_Next()
        ccall((:ISources_Get_Next, LIBRARY), Int32, ())
    end

    function ISources_Get_Name()
        ccall((:ISources_Get_Name, LIBRARY), Cstring, ())
    end

    function ISources_Set_Name(Value)
        ccall((:ISources_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function ISources_Get_Amps()
        ccall((:ISources_Get_Amps, LIBRARY), Cdouble, ())
    end

    function ISources_Set_Amps(Value)
        ccall((:ISources_Set_Amps, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function ISources_Get_AngleDeg()
        ccall((:ISources_Get_AngleDeg, LIBRARY), Cdouble, ())
    end

    function ISources_Get_Frequency()
        ccall((:ISources_Get_Frequency, LIBRARY), Cdouble, ())
    end

    function ISources_Set_AngleDeg(Value)
        ccall((:ISources_Set_AngleDeg, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function ISources_Set_Frequency(Value)
        ccall((:ISources_Set_Frequency, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LineCodes_Get_Count()
        ccall((:LineCodes_Get_Count, LIBRARY), Int32, ())
    end

    function LineCodes_Get_First()
        ccall((:LineCodes_Get_First, LIBRARY), Int32, ())
    end

    function LineCodes_Get_Next()
        ccall((:LineCodes_Get_Next, LIBRARY), Int32, ())
    end

    function LineCodes_Get_Name()
        ccall((:LineCodes_Get_Name, LIBRARY), Cstring, ())
    end

    function LineCodes_Set_Name(Value)
        ccall((:LineCodes_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function LineCodes_Get_IsZ1Z0()
        ccall((:LineCodes_Get_IsZ1Z0, LIBRARY), UInt16, ())
    end

    function LineCodes_Get_Units()
        ccall((:LineCodes_Get_Units, LIBRARY), Int32, ())
    end

    function LineCodes_Set_Units(Value)
        ccall((:LineCodes_Set_Units, LIBRARY), Cvoid, (Int32,), Value)
    end

    function LineCodes_Get_Phases()
        ccall((:LineCodes_Get_Phases, LIBRARY), Int32, ())
    end

    function LineCodes_Set_Phases(Value)
        ccall((:LineCodes_Set_Phases, LIBRARY), Cvoid, (Int32,), Value)
    end

    function LineCodes_Get_R1()
        ccall((:LineCodes_Get_R1, LIBRARY), Cdouble, ())
    end

    function LineCodes_Set_R1(Value)
        ccall((:LineCodes_Set_R1, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LineCodes_Get_X1()
        ccall((:LineCodes_Get_X1, LIBRARY), Cdouble, ())
    end

    function LineCodes_Set_X1(Value)
        ccall((:LineCodes_Set_X1, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LineCodes_Get_R0()
        ccall((:LineCodes_Get_R0, LIBRARY), Cdouble, ())
    end

    function LineCodes_Get_X0()
        ccall((:LineCodes_Get_X0, LIBRARY), Cdouble, ())
    end

    function LineCodes_Set_R0(Value)
        ccall((:LineCodes_Set_R0, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LineCodes_Set_X0(Value)
        ccall((:LineCodes_Set_X0, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LineCodes_Get_C0()
        ccall((:LineCodes_Get_C0, LIBRARY), Cdouble, ())
    end

    function LineCodes_Get_C1()
        ccall((:LineCodes_Get_C1, LIBRARY), Cdouble, ())
    end

    function LineCodes_Set_C0(Value)
        ccall((:LineCodes_Set_C0, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LineCodes_Set_C1(Value)
        ccall((:LineCodes_Set_C1, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LineCodes_Get_Cmatrix(ResultPtr, ResultCount)
        ccall((:LineCodes_Get_Cmatrix, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function LineCodes_Get_Cmatrix_GR()
        ccall((:LineCodes_Get_Cmatrix_GR, LIBRARY), Cvoid, ())
    end

    function LineCodes_Get_Rmatrix(ResultPtr, ResultCount)
        ccall((:LineCodes_Get_Rmatrix, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function LineCodes_Get_Rmatrix_GR()
        ccall((:LineCodes_Get_Rmatrix_GR, LIBRARY), Cvoid, ())
    end

    function LineCodes_Get_Xmatrix(ResultPtr, ResultCount)
        ccall((:LineCodes_Get_Xmatrix, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function LineCodes_Get_Xmatrix_GR()
        ccall((:LineCodes_Get_Xmatrix_GR, LIBRARY), Cvoid, ())
    end

    function LineCodes_Set_Cmatrix(ValuePtr, ValueCount)
        ccall((:LineCodes_Set_Cmatrix, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function LineCodes_Set_Rmatrix(ValuePtr, ValueCount)
        ccall((:LineCodes_Set_Rmatrix, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function LineCodes_Set_Xmatrix(ValuePtr, ValueCount)
        ccall((:LineCodes_Set_Xmatrix, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function LineCodes_Get_NormAmps()
        ccall((:LineCodes_Get_NormAmps, LIBRARY), Cdouble, ())
    end

    function LineCodes_Set_NormAmps(Value)
        ccall((:LineCodes_Set_NormAmps, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LineCodes_Get_EmergAmps()
        ccall((:LineCodes_Get_EmergAmps, LIBRARY), Cdouble, ())
    end

    function LineCodes_Set_EmergAmps(Value)
        ccall((:LineCodes_Set_EmergAmps, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LineCodes_Get_AllNames(ResultPtr, ResultCount)
        ccall((:LineCodes_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function LineCodes_Get_AllNames_GR()
        ccall((:LineCodes_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function Lines_Get_AllNames(ResultPtr, ResultCount)
        ccall((:Lines_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Lines_Get_AllNames_GR()
        ccall((:Lines_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function Lines_Get_Bus1()
        ccall((:Lines_Get_Bus1, LIBRARY), Cstring, ())
    end

    function Lines_Get_Bus2()
        ccall((:Lines_Get_Bus2, LIBRARY), Cstring, ())
    end

    function Lines_Get_First()
        ccall((:Lines_Get_First, LIBRARY), Int32, ())
    end

    function Lines_Get_Length()
        ccall((:Lines_Get_Length, LIBRARY), Cdouble, ())
    end

    function Lines_Get_LineCode()
        ccall((:Lines_Get_LineCode, LIBRARY), Cstring, ())
    end

    function Lines_Get_Name()
        ccall((:Lines_Get_Name, LIBRARY), Cstring, ())
    end

    function Lines_Get_Next()
        ccall((:Lines_Get_Next, LIBRARY), Int32, ())
    end

    function Lines_Get_Phases()
        ccall((:Lines_Get_Phases, LIBRARY), Int32, ())
    end

    function Lines_Get_R1()
        ccall((:Lines_Get_R1, LIBRARY), Cdouble, ())
    end

    function Lines_Get_X1()
        ccall((:Lines_Get_X1, LIBRARY), Cdouble, ())
    end

    function Lines_New(Name)
        ccall((:Lines_New, LIBRARY), Int32, (Cstring,), Name)
    end

    function Lines_Set_Bus1(Value)
        ccall((:Lines_Set_Bus1, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Lines_Set_Bus2(Value)
        ccall((:Lines_Set_Bus2, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Lines_Set_Length(Value)
        ccall((:Lines_Set_Length, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Lines_Set_LineCode(Value)
        ccall((:Lines_Set_LineCode, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Lines_Set_Name(Value)
        ccall((:Lines_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Lines_Set_Phases(Value)
        ccall((:Lines_Set_Phases, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Lines_Set_R1(Value)
        ccall((:Lines_Set_R1, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Lines_Set_X1(Value)
        ccall((:Lines_Set_X1, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Lines_Get_C0()
        ccall((:Lines_Get_C0, LIBRARY), Cdouble, ())
    end

    function Lines_Get_C1()
        ccall((:Lines_Get_C1, LIBRARY), Cdouble, ())
    end

    function Lines_Get_Cmatrix(ResultPtr, ResultCount)
        ccall((:Lines_Get_Cmatrix, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Lines_Get_Cmatrix_GR()
        ccall((:Lines_Get_Cmatrix_GR, LIBRARY), Cvoid, ())
    end

    function Lines_Get_R0()
        ccall((:Lines_Get_R0, LIBRARY), Cdouble, ())
    end

    function Lines_Get_Rmatrix(ResultPtr, ResultCount)
        ccall((:Lines_Get_Rmatrix, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Lines_Get_Rmatrix_GR()
        ccall((:Lines_Get_Rmatrix_GR, LIBRARY), Cvoid, ())
    end

    function Lines_Get_X0()
        ccall((:Lines_Get_X0, LIBRARY), Cdouble, ())
    end

    function Lines_Get_Xmatrix(ResultPtr, ResultCount)
        ccall((:Lines_Get_Xmatrix, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Lines_Get_Xmatrix_GR()
        ccall((:Lines_Get_Xmatrix_GR, LIBRARY), Cvoid, ())
    end

    function Lines_Set_C0(Value)
        ccall((:Lines_Set_C0, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Lines_Set_C1(Value)
        ccall((:Lines_Set_C1, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Lines_Set_Cmatrix(ValuePtr, ValueCount)
        ccall((:Lines_Set_Cmatrix, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Lines_Set_R0(Value)
        ccall((:Lines_Set_R0, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Lines_Set_Rmatrix(ValuePtr, ValueCount)
        ccall((:Lines_Set_Rmatrix, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Lines_Set_X0(Value)
        ccall((:Lines_Set_X0, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Lines_Set_Xmatrix(ValuePtr, ValueCount)
        ccall((:Lines_Set_Xmatrix, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Lines_Get_EmergAmps()
        ccall((:Lines_Get_EmergAmps, LIBRARY), Cdouble, ())
    end

    function Lines_Get_NormAmps()
        ccall((:Lines_Get_NormAmps, LIBRARY), Cdouble, ())
    end

    function Lines_Set_EmergAmps(Value)
        ccall((:Lines_Set_EmergAmps, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Lines_Set_NormAmps(Value)
        ccall((:Lines_Set_NormAmps, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Lines_Get_Geometry()
        ccall((:Lines_Get_Geometry, LIBRARY), Cstring, ())
    end

    function Lines_Set_Geometry(Value)
        ccall((:Lines_Set_Geometry, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Lines_Get_Rg()
        ccall((:Lines_Get_Rg, LIBRARY), Cdouble, ())
    end

    function Lines_Get_Rho()
        ccall((:Lines_Get_Rho, LIBRARY), Cdouble, ())
    end

    function Lines_Get_Xg()
        ccall((:Lines_Get_Xg, LIBRARY), Cdouble, ())
    end

    function Lines_Set_Rg(Value)
        ccall((:Lines_Set_Rg, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Lines_Set_Rho(Value)
        ccall((:Lines_Set_Rho, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Lines_Set_Xg(Value)
        ccall((:Lines_Set_Xg, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Lines_Get_Yprim(ResultPtr, ResultCount)
        ccall((:Lines_Get_Yprim, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Lines_Get_Yprim_GR()
        ccall((:Lines_Get_Yprim_GR, LIBRARY), Cvoid, ())
    end

    function Lines_Set_Yprim(ValuePtr, ValueCount)
        ccall((:Lines_Set_Yprim, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Lines_Get_NumCust()
        ccall((:Lines_Get_NumCust, LIBRARY), Int32, ())
    end

    function Lines_Get_TotalCust()
        ccall((:Lines_Get_TotalCust, LIBRARY), Int32, ())
    end

    function Lines_Get_Parent()
        ccall((:Lines_Get_Parent, LIBRARY), Int32, ())
    end

    function Lines_Get_Count()
        ccall((:Lines_Get_Count, LIBRARY), Int32, ())
    end

    function Lines_Get_Spacing()
        ccall((:Lines_Get_Spacing, LIBRARY), Cstring, ())
    end

    function Lines_Set_Spacing(Value)
        ccall((:Lines_Set_Spacing, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Lines_Get_Units()
        ccall((:Lines_Get_Units, LIBRARY), Int32, ())
    end

    function Lines_Set_Units(Value)
        ccall((:Lines_Set_Units, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Loads_Get_AllNames(ResultPtr, ResultCount)
        ccall((:Loads_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Loads_Get_AllNames_GR()
        ccall((:Loads_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function Loads_Get_First()
        ccall((:Loads_Get_First, LIBRARY), Int32, ())
    end

    function Loads_Get_idx()
        ccall((:Loads_Get_idx, LIBRARY), Int32, ())
    end

    function Loads_Get_Name()
        ccall((:Loads_Get_Name, LIBRARY), Cstring, ())
    end

    function Loads_Get_Next()
        ccall((:Loads_Get_Next, LIBRARY), Int32, ())
    end

    function Loads_Set_idx(Value)
        ccall((:Loads_Set_idx, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Loads_Set_Name(Value)
        ccall((:Loads_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Loads_Get_kV()
        ccall((:Loads_Get_kV, LIBRARY), Cdouble, ())
    end

    function Loads_Get_kvar()
        ccall((:Loads_Get_kvar, LIBRARY), Cdouble, ())
    end

    function Loads_Get_kW()
        ccall((:Loads_Get_kW, LIBRARY), Cdouble, ())
    end

    function Loads_Get_PF()
        ccall((:Loads_Get_PF, LIBRARY), Cdouble, ())
    end

    function Loads_Set_kV(Value)
        ccall((:Loads_Set_kV, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_kvar(Value)
        ccall((:Loads_Set_kvar, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_kW(Value)
        ccall((:Loads_Set_kW, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_PF(Value)
        ccall((:Loads_Set_PF, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Get_Count()
        ccall((:Loads_Get_Count, LIBRARY), Int32, ())
    end

    function Loads_Get_AllocationFactor()
        ccall((:Loads_Get_AllocationFactor, LIBRARY), Cdouble, ())
    end

    function Loads_Get_Cfactor()
        ccall((:Loads_Get_Cfactor, LIBRARY), Cdouble, ())
    end

    function Loads_Get_Class_()
        ccall((:Loads_Get_Class_, LIBRARY), Int32, ())
    end

    function Loads_Get_CVRcurve()
        ccall((:Loads_Get_CVRcurve, LIBRARY), Cstring, ())
    end

    function Loads_Get_CVRvars()
        ccall((:Loads_Get_CVRvars, LIBRARY), Cdouble, ())
    end

    function Loads_Get_CVRwatts()
        ccall((:Loads_Get_CVRwatts, LIBRARY), Cdouble, ())
    end

    function Loads_Get_daily()
        ccall((:Loads_Get_daily, LIBRARY), Cstring, ())
    end

    function Loads_Get_duty()
        ccall((:Loads_Get_duty, LIBRARY), Cstring, ())
    end

    function Loads_Get_Growth()
        ccall((:Loads_Get_Growth, LIBRARY), Cstring, ())
    end

    function Loads_Get_IsDelta()
        ccall((:Loads_Get_IsDelta, LIBRARY), UInt16, ())
    end

    function Loads_Get_kva()
        ccall((:Loads_Get_kva, LIBRARY), Cdouble, ())
    end

    function Loads_Get_kwh()
        ccall((:Loads_Get_kwh, LIBRARY), Cdouble, ())
    end

    function Loads_Get_kwhdays()
        ccall((:Loads_Get_kwhdays, LIBRARY), Cdouble, ())
    end

    function Loads_Get_Model()
        ccall((:Loads_Get_Model, LIBRARY), Int32, ())
    end

    function Loads_Get_NumCust()
        ccall((:Loads_Get_NumCust, LIBRARY), Int32, ())
    end

    function Loads_Get_PctMean()
        ccall((:Loads_Get_PctMean, LIBRARY), Cdouble, ())
    end

    function Loads_Get_PctStdDev()
        ccall((:Loads_Get_PctStdDev, LIBRARY), Cdouble, ())
    end

    function Loads_Get_Rneut()
        ccall((:Loads_Get_Rneut, LIBRARY), Cdouble, ())
    end

    function Loads_Get_Spectrum()
        ccall((:Loads_Get_Spectrum, LIBRARY), Cstring, ())
    end

    function Loads_Get_Status()
        ccall((:Loads_Get_Status, LIBRARY), Int32, ())
    end

    function Loads_Get_Vmaxpu()
        ccall((:Loads_Get_Vmaxpu, LIBRARY), Cdouble, ())
    end

    function Loads_Get_Vminemerg()
        ccall((:Loads_Get_Vminemerg, LIBRARY), Cdouble, ())
    end

    function Loads_Get_Vminnorm()
        ccall((:Loads_Get_Vminnorm, LIBRARY), Cdouble, ())
    end

    function Loads_Get_Vminpu()
        ccall((:Loads_Get_Vminpu, LIBRARY), Cdouble, ())
    end

    function Loads_Get_xfkVA()
        ccall((:Loads_Get_xfkVA, LIBRARY), Cdouble, ())
    end

    function Loads_Get_Xneut()
        ccall((:Loads_Get_Xneut, LIBRARY), Cdouble, ())
    end

    function Loads_Get_Yearly()
        ccall((:Loads_Get_Yearly, LIBRARY), Cstring, ())
    end

    function Loads_Set_AllocationFactor(Value)
        ccall((:Loads_Set_AllocationFactor, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_Cfactor(Value)
        ccall((:Loads_Set_Cfactor, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_Class_(Value)
        ccall((:Loads_Set_Class_, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Loads_Set_CVRcurve(Value)
        ccall((:Loads_Set_CVRcurve, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Loads_Set_CVRvars(Value)
        ccall((:Loads_Set_CVRvars, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_CVRwatts(Value)
        ccall((:Loads_Set_CVRwatts, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_daily(Value)
        ccall((:Loads_Set_daily, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Loads_Set_duty(Value)
        ccall((:Loads_Set_duty, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Loads_Set_Growth(Value)
        ccall((:Loads_Set_Growth, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Loads_Set_IsDelta(Value)
        ccall((:Loads_Set_IsDelta, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function Loads_Set_kva(Value)
        ccall((:Loads_Set_kva, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_kwh(Value)
        ccall((:Loads_Set_kwh, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_kwhdays(Value)
        ccall((:Loads_Set_kwhdays, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_Model(Value)
        ccall((:Loads_Set_Model, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Loads_Set_NumCust(Value)
        ccall((:Loads_Set_NumCust, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Loads_Set_PctMean(Value)
        ccall((:Loads_Set_PctMean, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_PctStdDev(Value)
        ccall((:Loads_Set_PctStdDev, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_Rneut(Value)
        ccall((:Loads_Set_Rneut, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_Spectrum(Value)
        ccall((:Loads_Set_Spectrum, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Loads_Set_Status(Value)
        ccall((:Loads_Set_Status, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Loads_Set_Vmaxpu(Value)
        ccall((:Loads_Set_Vmaxpu, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_Vminemerg(Value)
        ccall((:Loads_Set_Vminemerg, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_Vminnorm(Value)
        ccall((:Loads_Set_Vminnorm, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_Vminpu(Value)
        ccall((:Loads_Set_Vminpu, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_xfkVA(Value)
        ccall((:Loads_Set_xfkVA, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_Xneut(Value)
        ccall((:Loads_Set_Xneut, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Set_Yearly(Value)
        ccall((:Loads_Set_Yearly, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Loads_Get_ZIPV(ResultPtr, ResultCount)
        ccall((:Loads_Get_ZIPV, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Loads_Get_ZIPV_GR()
        ccall((:Loads_Get_ZIPV_GR, LIBRARY), Cvoid, ())
    end

    function Loads_Set_ZIPV(ValuePtr, ValueCount)
        ccall((:Loads_Set_ZIPV, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Loads_Get_pctSeriesRL()
        ccall((:Loads_Get_pctSeriesRL, LIBRARY), Cdouble, ())
    end

    function Loads_Set_pctSeriesRL(Value)
        ccall((:Loads_Set_pctSeriesRL, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Loads_Get_RelWeight()
        ccall((:Loads_Get_RelWeight, LIBRARY), Cdouble, ())
    end

    function Loads_Set_RelWeight(Value)
        ccall((:Loads_Set_RelWeight, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LoadShapes_Get_Name()
        ccall((:LoadShapes_Get_Name, LIBRARY), Cstring, ())
    end

    function LoadShapes_Set_Name(Value)
        ccall((:LoadShapes_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function LoadShapes_Get_Count()
        ccall((:LoadShapes_Get_Count, LIBRARY), Int32, ())
    end

    function LoadShapes_Get_First()
        ccall((:LoadShapes_Get_First, LIBRARY), Int32, ())
    end

    function LoadShapes_Get_Next()
        ccall((:LoadShapes_Get_Next, LIBRARY), Int32, ())
    end

    function LoadShapes_Get_AllNames(ResultPtr, ResultCount)
        ccall((:LoadShapes_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function LoadShapes_Get_AllNames_GR()
        ccall((:LoadShapes_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function LoadShapes_Get_Npts()
        ccall((:LoadShapes_Get_Npts, LIBRARY), Int32, ())
    end

    function LoadShapes_Get_Pmult(ResultPtr, ResultCount)
        ccall((:LoadShapes_Get_Pmult, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function LoadShapes_Get_Pmult_GR()
        ccall((:LoadShapes_Get_Pmult_GR, LIBRARY), Cvoid, ())
    end

    function LoadShapes_Get_Qmult(ResultPtr, ResultCount)
        ccall((:LoadShapes_Get_Qmult, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function LoadShapes_Get_Qmult_GR()
        ccall((:LoadShapes_Get_Qmult_GR, LIBRARY), Cvoid, ())
    end

    function LoadShapes_Set_Npts(Value)
        ccall((:LoadShapes_Set_Npts, LIBRARY), Cvoid, (Int32,), Value)
    end

    function LoadShapes_Set_Pmult(ValuePtr, ValueCount)
        ccall((:LoadShapes_Set_Pmult, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function LoadShapes_Set_Qmult(ValuePtr, ValueCount)
        ccall((:LoadShapes_Set_Qmult, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function LoadShapes_Normalize()
        ccall((:LoadShapes_Normalize, LIBRARY), Cvoid, ())
    end

    function LoadShapes_Get_TimeArray(ResultPtr, ResultCount)
        ccall((:LoadShapes_Get_TimeArray, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function LoadShapes_Get_TimeArray_GR()
        ccall((:LoadShapes_Get_TimeArray_GR, LIBRARY), Cvoid, ())
    end

    function LoadShapes_Set_TimeArray(ValuePtr, ValueCount)
        ccall((:LoadShapes_Set_TimeArray, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function LoadShapes_Get_HrInterval()
        ccall((:LoadShapes_Get_HrInterval, LIBRARY), Cdouble, ())
    end

    function LoadShapes_Get_MinInterval()
        ccall((:LoadShapes_Get_MinInterval, LIBRARY), Cdouble, ())
    end

    function LoadShapes_Get_sInterval()
        ccall((:LoadShapes_Get_sInterval, LIBRARY), Cdouble, ())
    end

    function LoadShapes_Set_HrInterval(Value)
        ccall((:LoadShapes_Set_HrInterval, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LoadShapes_Set_MinInterval(Value)
        ccall((:LoadShapes_Set_MinInterval, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LoadShapes_Set_Sinterval(Value)
        ccall((:LoadShapes_Set_Sinterval, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LoadShapes_New(Name)
        ccall((:LoadShapes_New, LIBRARY), Int32, (Cstring,), Name)
    end

    function LoadShapes_Get_PBase()
        ccall((:LoadShapes_Get_PBase, LIBRARY), Cdouble, ())
    end

    function LoadShapes_Get_Qbase()
        ccall((:LoadShapes_Get_Qbase, LIBRARY), Cdouble, ())
    end

    function LoadShapes_Set_PBase(Value)
        ccall((:LoadShapes_Set_PBase, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LoadShapes_Set_Qbase(Value)
        ccall((:LoadShapes_Set_Qbase, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LoadShapes_Get_UseActual()
        ccall((:LoadShapes_Get_UseActual, LIBRARY), UInt16, ())
    end

    function LoadShapes_Set_UseActual(Value)
        ccall((:LoadShapes_Set_UseActual, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function Meters_Get_AllNames(ResultPtr, ResultCount)
        ccall((:Meters_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Meters_Get_AllNames_GR()
        ccall((:Meters_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function Meters_Get_First()
        ccall((:Meters_Get_First, LIBRARY), Int32, ())
    end

    function Meters_Get_Name()
        ccall((:Meters_Get_Name, LIBRARY), Cstring, ())
    end

    function Meters_Get_Next()
        ccall((:Meters_Get_Next, LIBRARY), Int32, ())
    end

    function Meters_Get_RegisterNames(ResultPtr, ResultCount)
        ccall((:Meters_Get_RegisterNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Meters_Get_RegisterNames_GR()
        ccall((:Meters_Get_RegisterNames_GR, LIBRARY), Cvoid, ())
    end

    function Meters_Get_RegisterValues(ResultPtr, ResultCount)
        ccall((:Meters_Get_RegisterValues, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Meters_Get_RegisterValues_GR()
        ccall((:Meters_Get_RegisterValues_GR, LIBRARY), Cvoid, ())
    end

    function Meters_Reset()
        ccall((:Meters_Reset, LIBRARY), Cvoid, ())
    end

    function Meters_ResetAll()
        ccall((:Meters_ResetAll, LIBRARY), Cvoid, ())
    end

    function Meters_Sample()
        ccall((:Meters_Sample, LIBRARY), Cvoid, ())
    end

    function Meters_Save()
        ccall((:Meters_Save, LIBRARY), Cvoid, ())
    end

    function Meters_Set_Name(Value)
        ccall((:Meters_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Meters_Get_Totals(ResultPtr, ResultCount)
        ccall((:Meters_Get_Totals, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Meters_Get_Totals_GR()
        ccall((:Meters_Get_Totals_GR, LIBRARY), Cvoid, ())
    end

    function Meters_Get_Peakcurrent(ResultPtr, ResultCount)
        ccall((:Meters_Get_Peakcurrent, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Meters_Get_Peakcurrent_GR()
        ccall((:Meters_Get_Peakcurrent_GR, LIBRARY), Cvoid, ())
    end

    function Meters_Set_Peakcurrent(ValuePtr, ValueCount)
        ccall((:Meters_Set_Peakcurrent, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Meters_Get_CalcCurrent(ResultPtr, ResultCount)
        ccall((:Meters_Get_CalcCurrent, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Meters_Get_CalcCurrent_GR()
        ccall((:Meters_Get_CalcCurrent_GR, LIBRARY), Cvoid, ())
    end

    function Meters_Set_CalcCurrent(ValuePtr, ValueCount)
        ccall((:Meters_Set_CalcCurrent, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Meters_Get_AllocFactors(ResultPtr, ResultCount)
        ccall((:Meters_Get_AllocFactors, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Meters_Get_AllocFactors_GR()
        ccall((:Meters_Get_AllocFactors_GR, LIBRARY), Cvoid, ())
    end

    function Meters_Set_AllocFactors(ValuePtr, ValueCount)
        ccall((:Meters_Set_AllocFactors, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Meters_Get_MeteredElement()
        ccall((:Meters_Get_MeteredElement, LIBRARY), Cstring, ())
    end

    function Meters_Get_MeteredTerminal()
        ccall((:Meters_Get_MeteredTerminal, LIBRARY), Int32, ())
    end

    function Meters_Set_MeteredElement(Value)
        ccall((:Meters_Set_MeteredElement, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Meters_Set_MeteredTerminal(Value)
        ccall((:Meters_Set_MeteredTerminal, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Meters_Get_DIFilesAreOpen()
        ccall((:Meters_Get_DIFilesAreOpen, LIBRARY), UInt16, ())
    end

    function Meters_CloseAllDIFiles()
        ccall((:Meters_CloseAllDIFiles, LIBRARY), Cvoid, ())
    end

    function Meters_OpenAllDIFiles()
        ccall((:Meters_OpenAllDIFiles, LIBRARY), Cvoid, ())
    end

    function Meters_SampleAll()
        ccall((:Meters_SampleAll, LIBRARY), Cvoid, ())
    end

    function Meters_SaveAll()
        ccall((:Meters_SaveAll, LIBRARY), Cvoid, ())
    end

    function Meters_Get_AllEndElements(ResultPtr, ResultCount)
        ccall((:Meters_Get_AllEndElements, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Meters_Get_AllEndElements_GR()
        ccall((:Meters_Get_AllEndElements_GR, LIBRARY), Cvoid, ())
    end

    function Meters_Get_CountEndElements()
        ccall((:Meters_Get_CountEndElements, LIBRARY), Int32, ())
    end

    function Meters_Get_Count()
        ccall((:Meters_Get_Count, LIBRARY), Int32, ())
    end

    function Meters_Get_AllBranchesInZone(ResultPtr, ResultCount)
        ccall((:Meters_Get_AllBranchesInZone, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Meters_Get_AllBranchesInZone_GR()
        ccall((:Meters_Get_AllBranchesInZone_GR, LIBRARY), Cvoid, ())
    end

    function Meters_Get_CountBranches()
        ccall((:Meters_Get_CountBranches, LIBRARY), Int32, ())
    end

    function Meters_Get_SAIFI()
        ccall((:Meters_Get_SAIFI, LIBRARY), Cdouble, ())
    end

    function Meters_Get_SequenceIndex()
        ccall((:Meters_Get_SequenceIndex, LIBRARY), Int32, ())
    end

    function Meters_Set_SequenceIndex(Value)
        ccall((:Meters_Set_SequenceIndex, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Meters_Get_SAIFIKW()
        ccall((:Meters_Get_SAIFIKW, LIBRARY), Cdouble, ())
    end

    function Meters_DoReliabilityCalc(AssumeRestoration)
        ccall((:Meters_DoReliabilityCalc, LIBRARY), Cvoid, (UInt16,), AssumeRestoration)
    end

    function Meters_Get_SeqListSize()
        ccall((:Meters_Get_SeqListSize, LIBRARY), Int32, ())
    end

    function Meters_Get_TotalCustomers()
        ccall((:Meters_Get_TotalCustomers, LIBRARY), Int32, ())
    end

    function Meters_Get_SAIDI()
        ccall((:Meters_Get_SAIDI, LIBRARY), Cdouble, ())
    end

    function Meters_Get_CustInterrupts()
        ccall((:Meters_Get_CustInterrupts, LIBRARY), Cdouble, ())
    end

    function Meters_Get_NumSections()
        ccall((:Meters_Get_NumSections, LIBRARY), Int32, ())
    end

    function Meters_SetActiveSection(SectIdx)
        ccall((:Meters_SetActiveSection, LIBRARY), Cvoid, (Int32,), SectIdx)
    end

    function Meters_Get_AvgRepairTime()
        ccall((:Meters_Get_AvgRepairTime, LIBRARY), Cdouble, ())
    end

    function Meters_Get_FaultRateXRepairHrs()
        ccall((:Meters_Get_FaultRateXRepairHrs, LIBRARY), Cdouble, ())
    end

    function Meters_Get_NumSectionBranches()
        ccall((:Meters_Get_NumSectionBranches, LIBRARY), Int32, ())
    end

    function Meters_Get_NumSectionCustomers()
        ccall((:Meters_Get_NumSectionCustomers, LIBRARY), Int32, ())
    end

    function Meters_Get_OCPDeviceType()
        ccall((:Meters_Get_OCPDeviceType, LIBRARY), Int32, ())
    end

    function Meters_Get_SumBranchFltRates()
        ccall((:Meters_Get_SumBranchFltRates, LIBRARY), Cdouble, ())
    end

    function Meters_Get_SectSeqIdx()
        ccall((:Meters_Get_SectSeqIdx, LIBRARY), Int32, ())
    end

    function Meters_Get_SectTotalCust()
        ccall((:Meters_Get_SectTotalCust, LIBRARY), Int32, ())
    end

    function Monitors_Get_AllNames(ResultPtr, ResultCount)
        ccall((:Monitors_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Monitors_Get_AllNames_GR()
        ccall((:Monitors_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function Monitors_Get_FileName()
        ccall((:Monitors_Get_FileName, LIBRARY), Cstring, ())
    end

    function Monitors_Get_First()
        ccall((:Monitors_Get_First, LIBRARY), Int32, ())
    end

    function Monitors_Get_Mode()
        ccall((:Monitors_Get_Mode, LIBRARY), Int32, ())
    end

    function Monitors_Get_Name()
        ccall((:Monitors_Get_Name, LIBRARY), Cstring, ())
    end

    function Monitors_Get_Next()
        ccall((:Monitors_Get_Next, LIBRARY), Int32, ())
    end

    function Monitors_Reset()
        ccall((:Monitors_Reset, LIBRARY), Cvoid, ())
    end

    function Monitors_ResetAll()
        ccall((:Monitors_ResetAll, LIBRARY), Cvoid, ())
    end

    function Monitors_Sample()
        ccall((:Monitors_Sample, LIBRARY), Cvoid, ())
    end

    function Monitors_Save()
        ccall((:Monitors_Save, LIBRARY), Cvoid, ())
    end

    function Monitors_Set_Mode(Value)
        ccall((:Monitors_Set_Mode, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Monitors_Show()
        ccall((:Monitors_Show, LIBRARY), Cvoid, ())
    end

    function Monitors_Set_Name(Value)
        ccall((:Monitors_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Monitors_Get_ByteStream(ResultPtr, ResultCount)
        ccall((:Monitors_Get_ByteStream, LIBRARY), Cvoid, (Ptr{Ptr{Int8}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Monitors_Get_ByteStream_GR()
        ccall((:Monitors_Get_ByteStream_GR, LIBRARY), Cvoid, ())
    end

    function Monitors_Get_SampleCount()
        ccall((:Monitors_Get_SampleCount, LIBRARY), Int32, ())
    end

    function Monitors_SampleAll()
        ccall((:Monitors_SampleAll, LIBRARY), Cvoid, ())
    end

    function Monitors_SaveAll()
        ccall((:Monitors_SaveAll, LIBRARY), Cvoid, ())
    end

    function Monitors_Get_Count()
        ccall((:Monitors_Get_Count, LIBRARY), Int32, ())
    end

    function Monitors_Process()
        ccall((:Monitors_Process, LIBRARY), Cvoid, ())
    end

    function Monitors_ProcessAll()
        ccall((:Monitors_ProcessAll, LIBRARY), Cvoid, ())
    end

    function Monitors_Get_Channel(ResultPtr, ResultCount, Index)
        ccall((:Monitors_Get_Channel, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ResultPtr, ResultCount, Index)
    end

    function Monitors_Get_Channel_GR(Index)
        ccall((:Monitors_Get_Channel_GR, LIBRARY), Cvoid, (Int32,), Index)
    end

    function Monitors_Get_dblFreq(ResultPtr, ResultCount)
        ccall((:Monitors_Get_dblFreq, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Monitors_Get_dblFreq_GR()
        ccall((:Monitors_Get_dblFreq_GR, LIBRARY), Cvoid, ())
    end

    function Monitors_Get_dblHour(ResultPtr, ResultCount)
        ccall((:Monitors_Get_dblHour, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Monitors_Get_dblHour_GR()
        ccall((:Monitors_Get_dblHour_GR, LIBRARY), Cvoid, ())
    end

    function Monitors_Get_FileVersion()
        ccall((:Monitors_Get_FileVersion, LIBRARY), Int32, ())
    end

    function Monitors_Get_Header(ResultPtr, ResultCount)
        ccall((:Monitors_Get_Header, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Monitors_Get_Header_GR()
        ccall((:Monitors_Get_Header_GR, LIBRARY), Cvoid, ())
    end

    function Monitors_Get_NumChannels()
        ccall((:Monitors_Get_NumChannels, LIBRARY), Int32, ())
    end

    function Monitors_Get_RecordSize()
        ccall((:Monitors_Get_RecordSize, LIBRARY), Int32, ())
    end

    function Monitors_Get_Element()
        ccall((:Monitors_Get_Element, LIBRARY), Cstring, ())
    end

    function Monitors_Set_Element(Value)
        ccall((:Monitors_Set_Element, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Monitors_Get_Terminal()
        ccall((:Monitors_Get_Terminal, LIBRARY), Int32, ())
    end

    function Monitors_Set_Terminal(Value)
        ccall((:Monitors_Set_Terminal, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Parser_Get_CmdString()
        ccall((:Parser_Get_CmdString, LIBRARY), Cstring, ())
    end

    function Parser_Set_CmdString(Value)
        ccall((:Parser_Set_CmdString, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Parser_Get_NextParam()
        ccall((:Parser_Get_NextParam, LIBRARY), Cstring, ())
    end

    function Parser_Get_AutoIncrement()
        ccall((:Parser_Get_AutoIncrement, LIBRARY), UInt16, ())
    end

    function Parser_Set_AutoIncrement(Value)
        ccall((:Parser_Set_AutoIncrement, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function Parser_Get_DblValue()
        ccall((:Parser_Get_DblValue, LIBRARY), Cdouble, ())
    end

    function Parser_Get_IntValue()
        ccall((:Parser_Get_IntValue, LIBRARY), Int32, ())
    end

    function Parser_Get_StrValue()
        ccall((:Parser_Get_StrValue, LIBRARY), Cstring, ())
    end

    function Parser_Get_WhiteSpace()
        ccall((:Parser_Get_WhiteSpace, LIBRARY), Cstring, ())
    end

    function Parser_Set_WhiteSpace(Value)
        ccall((:Parser_Set_WhiteSpace, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Parser_Get_BeginQuote()
        ccall((:Parser_Get_BeginQuote, LIBRARY), Cstring, ())
    end

    function Parser_Get_EndQuote()
        ccall((:Parser_Get_EndQuote, LIBRARY), Cstring, ())
    end

    function Parser_Set_BeginQuote(Value)
        ccall((:Parser_Set_BeginQuote, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Parser_Set_EndQuote(Value)
        ccall((:Parser_Set_EndQuote, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Parser_Get_Delimiters()
        ccall((:Parser_Get_Delimiters, LIBRARY), Cstring, ())
    end

    function Parser_Set_Delimiters(Value)
        ccall((:Parser_Set_Delimiters, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Parser_ResetDelimiters()
        ccall((:Parser_ResetDelimiters, LIBRARY), Cvoid, ())
    end

    function Parser_Get_Vector(ResultPtr, ResultCount, ExpectedSize)
        ccall((:Parser_Get_Vector, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ResultPtr, ResultCount, ExpectedSize)
    end

    function Parser_Get_Vector_GR(ExpectedSize)
        ccall((:Parser_Get_Vector_GR, LIBRARY), Cvoid, (Int32,), ExpectedSize)
    end

    function Parser_Get_Matrix(ResultPtr, ResultCount, ExpectedOrder)
        ccall((:Parser_Get_Matrix, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ResultPtr, ResultCount, ExpectedOrder)
    end

    function Parser_Get_Matrix_GR(ExpectedOrder)
        ccall((:Parser_Get_Matrix_GR, LIBRARY), Cvoid, (Int32,), ExpectedOrder)
    end

    function Parser_Get_SymMatrix(ResultPtr, ResultCount, ExpectedOrder)
        ccall((:Parser_Get_SymMatrix, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ResultPtr, ResultCount, ExpectedOrder)
    end

    function Parser_Get_SymMatrix_GR(ExpectedOrder)
        ccall((:Parser_Get_SymMatrix_GR, LIBRARY), Cvoid, (Int32,), ExpectedOrder)
    end

    function PDElements_Get_Count()
        ccall((:PDElements_Get_Count, LIBRARY), Int32, ())
    end

    function PDElements_Get_FaultRate()
        ccall((:PDElements_Get_FaultRate, LIBRARY), Cdouble, ())
    end

    function PDElements_Get_First()
        ccall((:PDElements_Get_First, LIBRARY), Int32, ())
    end

    function PDElements_Get_IsShunt()
        ccall((:PDElements_Get_IsShunt, LIBRARY), UInt16, ())
    end

    function PDElements_Get_Next()
        ccall((:PDElements_Get_Next, LIBRARY), Int32, ())
    end

    function PDElements_Get_pctPermanent()
        ccall((:PDElements_Get_pctPermanent, LIBRARY), Cdouble, ())
    end

    function PDElements_Set_FaultRate(Value)
        ccall((:PDElements_Set_FaultRate, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function PDElements_Set_pctPermanent(Value)
        ccall((:PDElements_Set_pctPermanent, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function PDElements_Get_Name()
        ccall((:PDElements_Get_Name, LIBRARY), Cstring, ())
    end

    function PDElements_Set_Name(Value)
        ccall((:PDElements_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function PDElements_Get_AccumulatedL()
        ccall((:PDElements_Get_AccumulatedL, LIBRARY), Cdouble, ())
    end

    function PDElements_Get_Lambda()
        ccall((:PDElements_Get_Lambda, LIBRARY), Cdouble, ())
    end

    function PDElements_Get_Numcustomers()
        ccall((:PDElements_Get_Numcustomers, LIBRARY), Int32, ())
    end

    function PDElements_Get_ParentPDElement()
        ccall((:PDElements_Get_ParentPDElement, LIBRARY), Int32, ())
    end

    function PDElements_Get_RepairTime()
        ccall((:PDElements_Get_RepairTime, LIBRARY), Cdouble, ())
    end

    function PDElements_Get_Totalcustomers()
        ccall((:PDElements_Get_Totalcustomers, LIBRARY), Int32, ())
    end

    function PDElements_Get_FromTerminal()
        ccall((:PDElements_Get_FromTerminal, LIBRARY), Int32, ())
    end

    function PDElements_Get_TotalMiles()
        ccall((:PDElements_Get_TotalMiles, LIBRARY), Cdouble, ())
    end

    function PDElements_Get_SectionID()
        ccall((:PDElements_Get_SectionID, LIBRARY), Int32, ())
    end

    function PDElements_Set_RepairTime(Value)
        ccall((:PDElements_Set_RepairTime, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function PVSystems_Get_AllNames(ResultPtr, ResultCount)
        ccall((:PVSystems_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function PVSystems_Get_AllNames_GR()
        ccall((:PVSystems_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function PVSystems_Get_RegisterNames(ResultPtr, ResultCount)
        ccall((:PVSystems_Get_RegisterNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function PVSystems_Get_RegisterNames_GR()
        ccall((:PVSystems_Get_RegisterNames_GR, LIBRARY), Cvoid, ())
    end

    function PVSystems_Get_RegisterValues(ResultPtr, ResultCount)
        ccall((:PVSystems_Get_RegisterValues, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function PVSystems_Get_RegisterValues_GR()
        ccall((:PVSystems_Get_RegisterValues_GR, LIBRARY), Cvoid, ())
    end

    function PVSystems_Get_First()
        ccall((:PVSystems_Get_First, LIBRARY), Int32, ())
    end

    function PVSystems_Get_Next()
        ccall((:PVSystems_Get_Next, LIBRARY), Int32, ())
    end

    function PVSystems_Get_Count()
        ccall((:PVSystems_Get_Count, LIBRARY), Int32, ())
    end

    function PVSystems_Get_idx()
        ccall((:PVSystems_Get_idx, LIBRARY), Int32, ())
    end

    function PVSystems_Set_idx(Value)
        ccall((:PVSystems_Set_idx, LIBRARY), Cvoid, (Int32,), Value)
    end

    function PVSystems_Get_Name()
        ccall((:PVSystems_Get_Name, LIBRARY), Cstring, ())
    end

    function PVSystems_Set_Name(Value)
        ccall((:PVSystems_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function PVSystems_Get_Irradiance()
        ccall((:PVSystems_Get_Irradiance, LIBRARY), Cdouble, ())
    end

    function PVSystems_Set_Irradiance(Value)
        ccall((:PVSystems_Set_Irradiance, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function PVSystems_Get_kvar()
        ccall((:PVSystems_Get_kvar, LIBRARY), Cdouble, ())
    end

    function PVSystems_Get_kVArated()
        ccall((:PVSystems_Get_kVArated, LIBRARY), Cdouble, ())
    end

    function PVSystems_Get_kW()
        ccall((:PVSystems_Get_kW, LIBRARY), Cdouble, ())
    end

    function PVSystems_Get_PF()
        ccall((:PVSystems_Get_PF, LIBRARY), Cdouble, ())
    end

    function PVSystems_Set_kVArated(Value)
        ccall((:PVSystems_Set_kVArated, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function PVSystems_Set_PF(Value)
        ccall((:PVSystems_Set_PF, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function PVSystems_Set_kvar(Value)
        ccall((:PVSystems_Set_kvar, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Reclosers_Get_AllNames(ResultPtr, ResultCount)
        ccall((:Reclosers_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Reclosers_Get_AllNames_GR()
        ccall((:Reclosers_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function Reclosers_Get_Count()
        ccall((:Reclosers_Get_Count, LIBRARY), Int32, ())
    end

    function Reclosers_Get_First()
        ccall((:Reclosers_Get_First, LIBRARY), Int32, ())
    end

    function Reclosers_Get_Name()
        ccall((:Reclosers_Get_Name, LIBRARY), Cstring, ())
    end

    function Reclosers_Get_Next()
        ccall((:Reclosers_Get_Next, LIBRARY), Int32, ())
    end

    function Reclosers_Set_Name(Value)
        ccall((:Reclosers_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Reclosers_Get_MonitoredTerm()
        ccall((:Reclosers_Get_MonitoredTerm, LIBRARY), Int32, ())
    end

    function Reclosers_Set_MonitoredTerm(Value)
        ccall((:Reclosers_Set_MonitoredTerm, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Reclosers_Get_SwitchedObj()
        ccall((:Reclosers_Get_SwitchedObj, LIBRARY), Cstring, ())
    end

    function Reclosers_Set_SwitchedObj(Value)
        ccall((:Reclosers_Set_SwitchedObj, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Reclosers_Get_MonitoredObj()
        ccall((:Reclosers_Get_MonitoredObj, LIBRARY), Cstring, ())
    end

    function Reclosers_Get_SwitchedTerm()
        ccall((:Reclosers_Get_SwitchedTerm, LIBRARY), Int32, ())
    end

    function Reclosers_Set_MonitoredObj(Value)
        ccall((:Reclosers_Set_MonitoredObj, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Reclosers_Set_SwitchedTerm(Value)
        ccall((:Reclosers_Set_SwitchedTerm, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Reclosers_Get_NumFast()
        ccall((:Reclosers_Get_NumFast, LIBRARY), Int32, ())
    end

    function Reclosers_Get_RecloseIntervals(ResultPtr, ResultCount)
        ccall((:Reclosers_Get_RecloseIntervals, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Reclosers_Get_RecloseIntervals_GR()
        ccall((:Reclosers_Get_RecloseIntervals_GR, LIBRARY), Cvoid, ())
    end

    function Reclosers_Get_Shots()
        ccall((:Reclosers_Get_Shots, LIBRARY), Int32, ())
    end

    function Reclosers_Set_NumFast(Value)
        ccall((:Reclosers_Set_NumFast, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Reclosers_Set_Shots(Value)
        ccall((:Reclosers_Set_Shots, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Reclosers_Get_PhaseTrip()
        ccall((:Reclosers_Get_PhaseTrip, LIBRARY), Cdouble, ())
    end

    function Reclosers_Set_PhaseTrip(Value)
        ccall((:Reclosers_Set_PhaseTrip, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Reclosers_Get_GroundInst()
        ccall((:Reclosers_Get_GroundInst, LIBRARY), Cdouble, ())
    end

    function Reclosers_Get_GroundTrip()
        ccall((:Reclosers_Get_GroundTrip, LIBRARY), Cdouble, ())
    end

    function Reclosers_Get_PhaseInst()
        ccall((:Reclosers_Get_PhaseInst, LIBRARY), Cdouble, ())
    end

    function Reclosers_Set_GroundInst(Value)
        ccall((:Reclosers_Set_GroundInst, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Reclosers_Set_GroundTrip(Value)
        ccall((:Reclosers_Set_GroundTrip, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Reclosers_Set_PhaseInst(Value)
        ccall((:Reclosers_Set_PhaseInst, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Reclosers_Close()
        ccall((:Reclosers_Close, LIBRARY), Cvoid, ())
    end

    function Reclosers_Open()
        ccall((:Reclosers_Open, LIBRARY), Cvoid, ())
    end

    function Reclosers_Get_idx()
        ccall((:Reclosers_Get_idx, LIBRARY), Int32, ())
    end

    function Reclosers_Set_idx(Value)
        ccall((:Reclosers_Set_idx, LIBRARY), Cvoid, (Int32,), Value)
    end

    function RegControls_Get_AllNames(ResultPtr, ResultCount)
        ccall((:RegControls_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function RegControls_Get_AllNames_GR()
        ccall((:RegControls_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function RegControls_Get_CTPrimary()
        ccall((:RegControls_Get_CTPrimary, LIBRARY), Cdouble, ())
    end

    function RegControls_Get_Delay()
        ccall((:RegControls_Get_Delay, LIBRARY), Cdouble, ())
    end

    function RegControls_Get_First()
        ccall((:RegControls_Get_First, LIBRARY), Int32, ())
    end

    function RegControls_Get_ForwardBand()
        ccall((:RegControls_Get_ForwardBand, LIBRARY), Cdouble, ())
    end

    function RegControls_Get_ForwardR()
        ccall((:RegControls_Get_ForwardR, LIBRARY), Cdouble, ())
    end

    function RegControls_Get_ForwardVreg()
        ccall((:RegControls_Get_ForwardVreg, LIBRARY), Cdouble, ())
    end

    function RegControls_Get_ForwardX()
        ccall((:RegControls_Get_ForwardX, LIBRARY), Cdouble, ())
    end

    function RegControls_Get_IsInverseTime()
        ccall((:RegControls_Get_IsInverseTime, LIBRARY), UInt16, ())
    end

    function RegControls_Get_IsReversible()
        ccall((:RegControls_Get_IsReversible, LIBRARY), UInt16, ())
    end

    function RegControls_Get_MaxTapChange()
        ccall((:RegControls_Get_MaxTapChange, LIBRARY), Int32, ())
    end

    function RegControls_Get_MonitoredBus()
        ccall((:RegControls_Get_MonitoredBus, LIBRARY), Cstring, ())
    end

    function RegControls_Get_Name()
        ccall((:RegControls_Get_Name, LIBRARY), Cstring, ())
    end

    function RegControls_Get_Next()
        ccall((:RegControls_Get_Next, LIBRARY), Int32, ())
    end

    function RegControls_Get_PTratio()
        ccall((:RegControls_Get_PTratio, LIBRARY), Cdouble, ())
    end

    function RegControls_Get_ReverseBand()
        ccall((:RegControls_Get_ReverseBand, LIBRARY), Cdouble, ())
    end

    function RegControls_Get_ReverseR()
        ccall((:RegControls_Get_ReverseR, LIBRARY), Cdouble, ())
    end

    function RegControls_Get_ReverseVreg()
        ccall((:RegControls_Get_ReverseVreg, LIBRARY), Cdouble, ())
    end

    function RegControls_Get_ReverseX()
        ccall((:RegControls_Get_ReverseX, LIBRARY), Cdouble, ())
    end

    function RegControls_Get_TapDelay()
        ccall((:RegControls_Get_TapDelay, LIBRARY), Cdouble, ())
    end

    function RegControls_Get_TapWinding()
        ccall((:RegControls_Get_TapWinding, LIBRARY), Int32, ())
    end

    function RegControls_Get_Transformer()
        ccall((:RegControls_Get_Transformer, LIBRARY), Cstring, ())
    end

    function RegControls_Get_VoltageLimit()
        ccall((:RegControls_Get_VoltageLimit, LIBRARY), Cdouble, ())
    end

    function RegControls_Get_Winding()
        ccall((:RegControls_Get_Winding, LIBRARY), Int32, ())
    end

    function RegControls_Get_TapNumber()
        ccall((:RegControls_Get_TapNumber, LIBRARY), Int32, ())
    end

    function RegControls_Set_CTPrimary(Value)
        ccall((:RegControls_Set_CTPrimary, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function RegControls_Set_Delay(Value)
        ccall((:RegControls_Set_Delay, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function RegControls_Set_ForwardBand(Value)
        ccall((:RegControls_Set_ForwardBand, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function RegControls_Set_ForwardR(Value)
        ccall((:RegControls_Set_ForwardR, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function RegControls_Set_ForwardVreg(Value)
        ccall((:RegControls_Set_ForwardVreg, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function RegControls_Set_ForwardX(Value)
        ccall((:RegControls_Set_ForwardX, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function RegControls_Set_IsInverseTime(Value)
        ccall((:RegControls_Set_IsInverseTime, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function RegControls_Set_IsReversible(Value)
        ccall((:RegControls_Set_IsReversible, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function RegControls_Set_MaxTapChange(Value)
        ccall((:RegControls_Set_MaxTapChange, LIBRARY), Cvoid, (Int32,), Value)
    end

    function RegControls_Set_MonitoredBus(Value)
        ccall((:RegControls_Set_MonitoredBus, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function RegControls_Set_Name(Value)
        ccall((:RegControls_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function RegControls_Set_PTratio(Value)
        ccall((:RegControls_Set_PTratio, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function RegControls_Set_ReverseBand(Value)
        ccall((:RegControls_Set_ReverseBand, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function RegControls_Set_ReverseR(Value)
        ccall((:RegControls_Set_ReverseR, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function RegControls_Set_ReverseVreg(Value)
        ccall((:RegControls_Set_ReverseVreg, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function RegControls_Set_ReverseX(Value)
        ccall((:RegControls_Set_ReverseX, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function RegControls_Set_TapDelay(Value)
        ccall((:RegControls_Set_TapDelay, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function RegControls_Set_TapWinding(Value)
        ccall((:RegControls_Set_TapWinding, LIBRARY), Cvoid, (Int32,), Value)
    end

    function RegControls_Set_Transformer(Value)
        ccall((:RegControls_Set_Transformer, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function RegControls_Set_VoltageLimit(Value)
        ccall((:RegControls_Set_VoltageLimit, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function RegControls_Set_Winding(Value)
        ccall((:RegControls_Set_Winding, LIBRARY), Cvoid, (Int32,), Value)
    end

    function RegControls_Set_TapNumber(Value)
        ccall((:RegControls_Set_TapNumber, LIBRARY), Cvoid, (Int32,), Value)
    end

    function RegControls_Get_Count()
        ccall((:RegControls_Get_Count, LIBRARY), Int32, ())
    end

    function RegControls_Reset()
        ccall((:RegControls_Reset, LIBRARY), Cvoid, ())
    end

    function Relays_Get_AllNames(ResultPtr, ResultCount)
        ccall((:Relays_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Relays_Get_AllNames_GR()
        ccall((:Relays_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function Relays_Get_Count()
        ccall((:Relays_Get_Count, LIBRARY), Int32, ())
    end

    function Relays_Get_First()
        ccall((:Relays_Get_First, LIBRARY), Int32, ())
    end

    function Relays_Get_Name()
        ccall((:Relays_Get_Name, LIBRARY), Cstring, ())
    end

    function Relays_Get_Next()
        ccall((:Relays_Get_Next, LIBRARY), Int32, ())
    end

    function Relays_Set_Name(Value)
        ccall((:Relays_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Relays_Get_MonitoredObj()
        ccall((:Relays_Get_MonitoredObj, LIBRARY), Cstring, ())
    end

    function Relays_Set_MonitoredObj(Value)
        ccall((:Relays_Set_MonitoredObj, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Relays_Get_MonitoredTerm()
        ccall((:Relays_Get_MonitoredTerm, LIBRARY), Int32, ())
    end

    function Relays_Get_SwitchedObj()
        ccall((:Relays_Get_SwitchedObj, LIBRARY), Cstring, ())
    end

    function Relays_Set_MonitoredTerm(Value)
        ccall((:Relays_Set_MonitoredTerm, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Relays_Set_SwitchedObj(Value)
        ccall((:Relays_Set_SwitchedObj, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Relays_Get_SwitchedTerm()
        ccall((:Relays_Get_SwitchedTerm, LIBRARY), Int32, ())
    end

    function Relays_Set_SwitchedTerm(Value)
        ccall((:Relays_Set_SwitchedTerm, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Relays_Get_idx()
        ccall((:Relays_Get_idx, LIBRARY), Int32, ())
    end

    function Relays_Set_idx(Value)
        ccall((:Relays_Set_idx, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Sensors_Get_AllNames(ResultPtr, ResultCount)
        ccall((:Sensors_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Sensors_Get_AllNames_GR()
        ccall((:Sensors_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function Sensors_Get_Count()
        ccall((:Sensors_Get_Count, LIBRARY), Int32, ())
    end

    function Sensors_Get_Currents(ResultPtr, ResultCount)
        ccall((:Sensors_Get_Currents, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Sensors_Get_Currents_GR()
        ccall((:Sensors_Get_Currents_GR, LIBRARY), Cvoid, ())
    end

    function Sensors_Get_First()
        ccall((:Sensors_Get_First, LIBRARY), Int32, ())
    end

    function Sensors_Get_IsDelta()
        ccall((:Sensors_Get_IsDelta, LIBRARY), UInt16, ())
    end

    function Sensors_Get_kVARS(ResultPtr, ResultCount)
        ccall((:Sensors_Get_kVARS, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Sensors_Get_kVARS_GR()
        ccall((:Sensors_Get_kVARS_GR, LIBRARY), Cvoid, ())
    end

    function Sensors_Get_kVS(ResultPtr, ResultCount)
        ccall((:Sensors_Get_kVS, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Sensors_Get_kVS_GR()
        ccall((:Sensors_Get_kVS_GR, LIBRARY), Cvoid, ())
    end

    function Sensors_Get_kWS(ResultPtr, ResultCount)
        ccall((:Sensors_Get_kWS, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Sensors_Get_kWS_GR()
        ccall((:Sensors_Get_kWS_GR, LIBRARY), Cvoid, ())
    end

    function Sensors_Get_MeteredElement()
        ccall((:Sensors_Get_MeteredElement, LIBRARY), Cstring, ())
    end

    function Sensors_Get_MeteredTerminal()
        ccall((:Sensors_Get_MeteredTerminal, LIBRARY), Int32, ())
    end

    function Sensors_Get_Name()
        ccall((:Sensors_Get_Name, LIBRARY), Cstring, ())
    end

    function Sensors_Get_Next()
        ccall((:Sensors_Get_Next, LIBRARY), Int32, ())
    end

    function Sensors_Get_PctError()
        ccall((:Sensors_Get_PctError, LIBRARY), Cdouble, ())
    end

    function Sensors_Get_ReverseDelta()
        ccall((:Sensors_Get_ReverseDelta, LIBRARY), UInt16, ())
    end

    function Sensors_Get_Weight()
        ccall((:Sensors_Get_Weight, LIBRARY), Cdouble, ())
    end

    function Sensors_Reset()
        ccall((:Sensors_Reset, LIBRARY), Cvoid, ())
    end

    function Sensors_ResetAll()
        ccall((:Sensors_ResetAll, LIBRARY), Cvoid, ())
    end

    function Sensors_Set_Currents(ValuePtr, ValueCount)
        ccall((:Sensors_Set_Currents, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Sensors_Set_IsDelta(Value)
        ccall((:Sensors_Set_IsDelta, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function Sensors_Set_kVARS(ValuePtr, ValueCount)
        ccall((:Sensors_Set_kVARS, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Sensors_Set_kVS(ValuePtr, ValueCount)
        ccall((:Sensors_Set_kVS, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Sensors_Set_kWS(ValuePtr, ValueCount)
        ccall((:Sensors_Set_kWS, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Sensors_Set_MeteredElement(Value)
        ccall((:Sensors_Set_MeteredElement, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Sensors_Set_MeteredTerminal(Value)
        ccall((:Sensors_Set_MeteredTerminal, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Sensors_Set_Name(Value)
        ccall((:Sensors_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Sensors_Set_PctError(Value)
        ccall((:Sensors_Set_PctError, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Sensors_Set_ReverseDelta(Value)
        ccall((:Sensors_Set_ReverseDelta, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function Sensors_Set_Weight(Value)
        ccall((:Sensors_Set_Weight, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Sensors_Get_kVbase()
        ccall((:Sensors_Get_kVbase, LIBRARY), Cdouble, ())
    end

    function Sensors_Set_kVbase(Value)
        ccall((:Sensors_Set_kVbase, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Settings_Get_AllowDuplicates()
        ccall((:Settings_Get_AllowDuplicates, LIBRARY), UInt16, ())
    end

    function Settings_Get_AutoBusList()
        ccall((:Settings_Get_AutoBusList, LIBRARY), Cstring, ())
    end

    function Settings_Get_CktModel()
        ccall((:Settings_Get_CktModel, LIBRARY), Int32, ())
    end

    function Settings_Get_EmergVmaxpu()
        ccall((:Settings_Get_EmergVmaxpu, LIBRARY), Cdouble, ())
    end

    function Settings_Get_EmergVminpu()
        ccall((:Settings_Get_EmergVminpu, LIBRARY), Cdouble, ())
    end

    function Settings_Get_NormVmaxpu()
        ccall((:Settings_Get_NormVmaxpu, LIBRARY), Cdouble, ())
    end

    function Settings_Get_NormVminpu()
        ccall((:Settings_Get_NormVminpu, LIBRARY), Cdouble, ())
    end

    function Settings_Get_ZoneLock()
        ccall((:Settings_Get_ZoneLock, LIBRARY), UInt16, ())
    end

    function Settings_Set_AllocationFactors(Value)
        ccall((:Settings_Set_AllocationFactors, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Settings_Set_AllowDuplicates(Value)
        ccall((:Settings_Set_AllowDuplicates, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function Settings_Set_AutoBusList(Value)
        ccall((:Settings_Set_AutoBusList, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Settings_Set_CktModel(Value)
        ccall((:Settings_Set_CktModel, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Settings_Set_EmergVmaxpu(Value)
        ccall((:Settings_Set_EmergVmaxpu, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Settings_Set_EmergVminpu(Value)
        ccall((:Settings_Set_EmergVminpu, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Settings_Set_NormVmaxpu(Value)
        ccall((:Settings_Set_NormVmaxpu, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Settings_Set_NormVminpu(Value)
        ccall((:Settings_Set_NormVminpu, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Settings_Set_ZoneLock(Value)
        ccall((:Settings_Set_ZoneLock, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function Settings_Get_LossRegs(ResultPtr, ResultCount)
        ccall((:Settings_Get_LossRegs, LIBRARY), Cvoid, (Ptr{Ptr{Int32}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Settings_Get_LossRegs_GR()
        ccall((:Settings_Get_LossRegs_GR, LIBRARY), Cvoid, ())
    end

    function Settings_Get_LossWeight()
        ccall((:Settings_Get_LossWeight, LIBRARY), Cdouble, ())
    end

    function Settings_Get_Trapezoidal()
        ccall((:Settings_Get_Trapezoidal, LIBRARY), UInt16, ())
    end

    function Settings_Get_UEregs(ResultPtr, ResultCount)
        ccall((:Settings_Get_UEregs, LIBRARY), Cvoid, (Ptr{Ptr{Int32}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Settings_Get_UEregs_GR()
        ccall((:Settings_Get_UEregs_GR, LIBRARY), Cvoid, ())
    end

    function Settings_Get_UEweight()
        ccall((:Settings_Get_UEweight, LIBRARY), Cdouble, ())
    end

    function Settings_Set_LossRegs(ValuePtr, ValueCount)
        ccall((:Settings_Set_LossRegs, LIBRARY), Cvoid, (Ptr{Int32}, Int32), ValuePtr, ValueCount)
    end

    function Settings_Set_LossWeight(Value)
        ccall((:Settings_Set_LossWeight, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Settings_Set_Trapezoidal(Value)
        ccall((:Settings_Set_Trapezoidal, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function Settings_Set_UEregs(ValuePtr, ValueCount)
        ccall((:Settings_Set_UEregs, LIBRARY), Cvoid, (Ptr{Int32}, Int32), ValuePtr, ValueCount)
    end

    function Settings_Set_UEweight(Value)
        ccall((:Settings_Set_UEweight, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Settings_Get_ControlTrace()
        ccall((:Settings_Get_ControlTrace, LIBRARY), UInt16, ())
    end

    function Settings_Get_VoltageBases(ResultPtr, ResultCount)
        ccall((:Settings_Get_VoltageBases, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Settings_Get_VoltageBases_GR()
        ccall((:Settings_Get_VoltageBases_GR, LIBRARY), Cvoid, ())
    end

    function Settings_Set_ControlTrace(Value)
        ccall((:Settings_Set_ControlTrace, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function Settings_Set_VoltageBases(ValuePtr, ValueCount)
        ccall((:Settings_Set_VoltageBases, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Settings_Get_PriceCurve()
        ccall((:Settings_Get_PriceCurve, LIBRARY), Cstring, ())
    end

    function Settings_Get_PriceSignal()
        ccall((:Settings_Get_PriceSignal, LIBRARY), Cdouble, ())
    end

    function Settings_Set_PriceCurve(Value)
        ccall((:Settings_Set_PriceCurve, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Settings_Set_PriceSignal(Value)
        ccall((:Settings_Set_PriceSignal, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Solution_Get_Frequency()
        ccall((:Solution_Get_Frequency, LIBRARY), Cdouble, ())
    end

    function Solution_Get_Hour()
        ccall((:Solution_Get_Hour, LIBRARY), Int32, ())
    end

    function Solution_Get_Iterations()
        ccall((:Solution_Get_Iterations, LIBRARY), Int32, ())
    end

    function Solution_Get_LoadMult()
        ccall((:Solution_Get_LoadMult, LIBRARY), Cdouble, ())
    end

    function Solution_Get_MaxIterations()
        ccall((:Solution_Get_MaxIterations, LIBRARY), Int32, ())
    end

    function Solution_Get_Mode()
        ccall((:Solution_Get_Mode, LIBRARY), Int32, ())
    end

    function Solution_Get_Number()
        ccall((:Solution_Get_Number, LIBRARY), Int32, ())
    end

    function Solution_Get_Random()
        ccall((:Solution_Get_Random, LIBRARY), Int32, ())
    end

    function Solution_Get_Seconds()
        ccall((:Solution_Get_Seconds, LIBRARY), Cdouble, ())
    end

    function Solution_Get_StepSize()
        ccall((:Solution_Get_StepSize, LIBRARY), Cdouble, ())
    end

    function Solution_Get_Tolerance()
        ccall((:Solution_Get_Tolerance, LIBRARY), Cdouble, ())
    end

    function Solution_Get_Year()
        ccall((:Solution_Get_Year, LIBRARY), Int32, ())
    end

    function Solution_Set_Frequency(Value)
        ccall((:Solution_Set_Frequency, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Solution_Set_Hour(Value)
        ccall((:Solution_Set_Hour, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Solution_Set_LoadMult(Value)
        ccall((:Solution_Set_LoadMult, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Solution_Set_MaxIterations(Value)
        ccall((:Solution_Set_MaxIterations, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Solution_Set_Mode(Mode)
        ccall((:Solution_Set_Mode, LIBRARY), Cvoid, (Int32,), Mode)
    end

    function Solution_Set_Number(Value)
        ccall((:Solution_Set_Number, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Solution_Set_Random(Random)
        ccall((:Solution_Set_Random, LIBRARY), Cvoid, (Int32,), Random)
    end

    function Solution_Set_Seconds(Value)
        ccall((:Solution_Set_Seconds, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Solution_Set_StepSize(Value)
        ccall((:Solution_Set_StepSize, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Solution_Set_Tolerance(Value)
        ccall((:Solution_Set_Tolerance, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Solution_Set_Year(Value)
        ccall((:Solution_Set_Year, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Solution_Solve()
        ccall((:Solution_Solve, LIBRARY), Cvoid, ())
    end

    function Solution_Get_ModeID()
        ccall((:Solution_Get_ModeID, LIBRARY), Cstring, ())
    end

    function Solution_Get_LoadModel()
        ccall((:Solution_Get_LoadModel, LIBRARY), Int32, ())
    end

    function Solution_Set_LoadModel(Value)
        ccall((:Solution_Set_LoadModel, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Solution_Get_LDCurve()
        ccall((:Solution_Get_LDCurve, LIBRARY), Cstring, ())
    end

    function Solution_Set_LDCurve(Value)
        ccall((:Solution_Set_LDCurve, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Solution_Get_pctGrowth()
        ccall((:Solution_Get_pctGrowth, LIBRARY), Cdouble, ())
    end

    function Solution_Set_pctGrowth(Value)
        ccall((:Solution_Set_pctGrowth, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Solution_Get_AddType()
        ccall((:Solution_Get_AddType, LIBRARY), Int32, ())
    end

    function Solution_Set_AddType(Value)
        ccall((:Solution_Set_AddType, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Solution_Get_GenkW()
        ccall((:Solution_Get_GenkW, LIBRARY), Cdouble, ())
    end

    function Solution_Set_GenkW(Value)
        ccall((:Solution_Set_GenkW, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Solution_Get_GenPF()
        ccall((:Solution_Get_GenPF, LIBRARY), Cdouble, ())
    end

    function Solution_Set_GenPF(Value)
        ccall((:Solution_Set_GenPF, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Solution_Get_Capkvar()
        ccall((:Solution_Get_Capkvar, LIBRARY), Cdouble, ())
    end

    function Solution_Set_Capkvar(Value)
        ccall((:Solution_Set_Capkvar, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Solution_Get_Algorithm()
        ccall((:Solution_Get_Algorithm, LIBRARY), Int32, ())
    end

    function Solution_Set_Algorithm(Value)
        ccall((:Solution_Set_Algorithm, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Solution_Get_ControlMode()
        ccall((:Solution_Get_ControlMode, LIBRARY), Int32, ())
    end

    function Solution_Set_ControlMode(Value)
        ccall((:Solution_Set_ControlMode, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Solution_Get_GenMult()
        ccall((:Solution_Get_GenMult, LIBRARY), Cdouble, ())
    end

    function Solution_Set_GenMult(Value)
        ccall((:Solution_Set_GenMult, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Solution_Get_DefaultDaily()
        ccall((:Solution_Get_DefaultDaily, LIBRARY), Cstring, ())
    end

    function Solution_Get_DefaultYearly()
        ccall((:Solution_Get_DefaultYearly, LIBRARY), Cstring, ())
    end

    function Solution_Set_DefaultDaily(Value)
        ccall((:Solution_Set_DefaultDaily, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Solution_Set_DefaultYearly(Value)
        ccall((:Solution_Set_DefaultYearly, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Solution_Get_EventLog(ResultPtr, ResultCount)
        ccall((:Solution_Get_EventLog, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Solution_Get_EventLog_GR()
        ccall((:Solution_Get_EventLog_GR, LIBRARY), Cvoid, ())
    end

    function Solution_Get_dblHour()
        ccall((:Solution_Get_dblHour, LIBRARY), Cdouble, ())
    end

    function Solution_Set_dblHour(Value)
        ccall((:Solution_Set_dblHour, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Solution_Set_StepsizeHr(Value)
        ccall((:Solution_Set_StepsizeHr, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Solution_Set_StepsizeMin(Value)
        ccall((:Solution_Set_StepsizeMin, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Solution_Get_ControlIterations()
        ccall((:Solution_Get_ControlIterations, LIBRARY), Int32, ())
    end

    function Solution_Get_MaxControlIterations()
        ccall((:Solution_Get_MaxControlIterations, LIBRARY), Int32, ())
    end

    function Solution_Sample_DoControlActions()
        ccall((:Solution_Sample_DoControlActions, LIBRARY), Cvoid, ())
    end

    function Solution_Set_ControlIterations(Value)
        ccall((:Solution_Set_ControlIterations, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Solution_Set_MaxControlIterations(Value)
        ccall((:Solution_Set_MaxControlIterations, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Solution_CheckFaultStatus()
        ccall((:Solution_CheckFaultStatus, LIBRARY), Cvoid, ())
    end

    function Solution_SolveDirect()
        ccall((:Solution_SolveDirect, LIBRARY), Cvoid, ())
    end

    function Solution_SolveNoControl()
        ccall((:Solution_SolveNoControl, LIBRARY), Cvoid, ())
    end

    function Solution_SolvePflow()
        ccall((:Solution_SolvePflow, LIBRARY), Cvoid, ())
    end

    function Solution_SolvePlusControl()
        ccall((:Solution_SolvePlusControl, LIBRARY), Cvoid, ())
    end

    function Solution_SolveSnap()
        ccall((:Solution_SolveSnap, LIBRARY), Cvoid, ())
    end

    function Solution_CheckControls()
        ccall((:Solution_CheckControls, LIBRARY), Cvoid, ())
    end

    function Solution_InitSnap()
        ccall((:Solution_InitSnap, LIBRARY), Cvoid, ())
    end

    function Solution_Get_SystemYChanged()
        ccall((:Solution_Get_SystemYChanged, LIBRARY), UInt16, ())
    end

    function Solution_BuildYMatrix(BuildOption, AllocateVI)
        ccall((:Solution_BuildYMatrix, LIBRARY), Cvoid, (Int32, Int32), BuildOption, AllocateVI)
    end

    function Solution_DoControlActions()
        ccall((:Solution_DoControlActions, LIBRARY), Cvoid, ())
    end

    function Solution_SampleControlDevices()
        ccall((:Solution_SampleControlDevices, LIBRARY), Cvoid, ())
    end

    function Solution_Get_Converged()
        ccall((:Solution_Get_Converged, LIBRARY), UInt16, ())
    end

    function Solution_Set_Converged(Value)
        ccall((:Solution_Set_Converged, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function Solution_Get_Totaliterations()
        ccall((:Solution_Get_Totaliterations, LIBRARY), Int32, ())
    end

    function Solution_Get_MostIterationsDone()
        ccall((:Solution_Get_MostIterationsDone, LIBRARY), Int32, ())
    end

    function Solution_Get_ControlActionsDone()
        ccall((:Solution_Get_ControlActionsDone, LIBRARY), UInt16, ())
    end

    function Solution_Set_ControlActionsDone(Value)
        ccall((:Solution_Set_ControlActionsDone, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function Solution_Cleanup()
        ccall((:Solution_Cleanup, LIBRARY), Cvoid, ())
    end

    function Solution_FinishTimeStep()
        ccall((:Solution_FinishTimeStep, LIBRARY), Cvoid, ())
    end

    function Solution_Get_Process_Time()
        ccall((:Solution_Get_Process_Time, LIBRARY), Cdouble, ())
    end

    function Solution_Get_Total_Time()
        ccall((:Solution_Get_Total_Time, LIBRARY), Cdouble, ())
    end

    function Solution_Set_Total_Time(Value)
        ccall((:Solution_Set_Total_Time, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Solution_Get_Time_of_Step()
        ccall((:Solution_Get_Time_of_Step, LIBRARY), Cdouble, ())
    end

    function Solution_Get_IntervalHrs()
        ccall((:Solution_Get_IntervalHrs, LIBRARY), Cdouble, ())
    end

    function Solution_Set_IntervalHrs(Value)
        ccall((:Solution_Set_IntervalHrs, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Solution_Get_MinIterations()
        ccall((:Solution_Get_MinIterations, LIBRARY), Int32, ())
    end

    function Solution_Set_MinIterations(Value)
        ccall((:Solution_Set_MinIterations, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Solution_Get_IncMatrix(ResultPtr, ResultCount)
        ccall((:Solution_Get_IncMatrix, LIBRARY), Cvoid, (Ptr{Ptr{Int32}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Solution_Get_IncMatrix_GR()
        ccall((:Solution_Get_IncMatrix_GR, LIBRARY), Cvoid, ())
    end

    function Solution_Get_Laplacian(ResultPtr, ResultCount)
        ccall((:Solution_Get_Laplacian, LIBRARY), Cvoid, (Ptr{Ptr{Int32}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Solution_Get_Laplacian_GR()
        ccall((:Solution_Get_Laplacian_GR, LIBRARY), Cvoid, ())
    end

    function Solution_Get_BusLevels(ResultPtr, ResultCount)
        ccall((:Solution_Get_BusLevels, LIBRARY), Cvoid, (Ptr{Ptr{Int32}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Solution_Get_BusLevels_GR()
        ccall((:Solution_Get_BusLevels_GR, LIBRARY), Cvoid, ())
    end

    function Solution_Get_IncMatrixRows(ResultPtr, ResultCount)
        ccall((:Solution_Get_IncMatrixRows, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Solution_Get_IncMatrixRows_GR()
        ccall((:Solution_Get_IncMatrixRows_GR, LIBRARY), Cvoid, ())
    end

    function Solution_Get_IncMatrixCols(ResultPtr, ResultCount)
        ccall((:Solution_Get_IncMatrixCols, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Solution_Get_IncMatrixCols_GR()
        ccall((:Solution_Get_IncMatrixCols_GR, LIBRARY), Cvoid, ())
    end

    function SwtControls_Get_Action()
        ccall((:SwtControls_Get_Action, LIBRARY), Int32, ())
    end

    function SwtControls_Get_AllNames(ResultPtr, ResultCount)
        ccall((:SwtControls_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function SwtControls_Get_AllNames_GR()
        ccall((:SwtControls_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function SwtControls_Get_Delay()
        ccall((:SwtControls_Get_Delay, LIBRARY), Cdouble, ())
    end

    function SwtControls_Get_First()
        ccall((:SwtControls_Get_First, LIBRARY), Int32, ())
    end

    function SwtControls_Get_IsLocked()
        ccall((:SwtControls_Get_IsLocked, LIBRARY), UInt16, ())
    end

    function SwtControls_Get_Name()
        ccall((:SwtControls_Get_Name, LIBRARY), Cstring, ())
    end

    function SwtControls_Get_Next()
        ccall((:SwtControls_Get_Next, LIBRARY), Int32, ())
    end

    function SwtControls_Get_SwitchedObj()
        ccall((:SwtControls_Get_SwitchedObj, LIBRARY), Cstring, ())
    end

    function SwtControls_Get_SwitchedTerm()
        ccall((:SwtControls_Get_SwitchedTerm, LIBRARY), Int32, ())
    end

    function SwtControls_Set_Action(Value)
        ccall((:SwtControls_Set_Action, LIBRARY), Cvoid, (Int32,), Value)
    end

    function SwtControls_Set_Delay(Value)
        ccall((:SwtControls_Set_Delay, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function SwtControls_Set_IsLocked(Value)
        ccall((:SwtControls_Set_IsLocked, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function SwtControls_Set_Name(Value)
        ccall((:SwtControls_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function SwtControls_Set_SwitchedObj(Value)
        ccall((:SwtControls_Set_SwitchedObj, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function SwtControls_Set_SwitchedTerm(Value)
        ccall((:SwtControls_Set_SwitchedTerm, LIBRARY), Cvoid, (Int32,), Value)
    end

    function SwtControls_Get_Count()
        ccall((:SwtControls_Get_Count, LIBRARY), Int32, ())
    end

    function SwtControls_Get_NormalState()
        ccall((:SwtControls_Get_NormalState, LIBRARY), Int32, ())
    end

    function SwtControls_Set_NormalState(Value)
        ccall((:SwtControls_Set_NormalState, LIBRARY), Cvoid, (Int32,), Value)
    end

    function SwtControls_Get_State()
        ccall((:SwtControls_Get_State, LIBRARY), Int32, ())
    end

    function SwtControls_Set_State(Value)
        ccall((:SwtControls_Set_State, LIBRARY), Cvoid, (Int32,), Value)
    end

    function SwtControls_Reset()
        ccall((:SwtControls_Reset, LIBRARY), Cvoid, ())
    end

    function Text_Get_Command()
        ccall((:Text_Get_Command, LIBRARY), Cstring, ())
    end

    function Text_Set_Command(Value)
        ccall((:Text_Set_Command, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Text_Get_Result()
        ccall((:Text_Get_Result, LIBRARY), Cstring, ())
    end

    function Topology_Get_NumLoops()
        ccall((:Topology_Get_NumLoops, LIBRARY), Int32, ())
    end

    function Topology_Get_ActiveBranch()
        ccall((:Topology_Get_ActiveBranch, LIBRARY), Int32, ())
    end

    function Topology_Get_AllIsolatedBranches(ResultPtr, ResultCount)
        ccall((:Topology_Get_AllIsolatedBranches, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Topology_Get_AllIsolatedBranches_GR()
        ccall((:Topology_Get_AllIsolatedBranches_GR, LIBRARY), Cvoid, ())
    end

    function Topology_Get_AllLoopedPairs(ResultPtr, ResultCount)
        ccall((:Topology_Get_AllLoopedPairs, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Topology_Get_AllLoopedPairs_GR()
        ccall((:Topology_Get_AllLoopedPairs_GR, LIBRARY), Cvoid, ())
    end

    function Topology_Get_BackwardBranch()
        ccall((:Topology_Get_BackwardBranch, LIBRARY), Int32, ())
    end

    function Topology_Get_BranchName()
        ccall((:Topology_Get_BranchName, LIBRARY), Cstring, ())
    end

    function Topology_Get_First()
        ccall((:Topology_Get_First, LIBRARY), Int32, ())
    end

    function Topology_Get_ForwardBranch()
        ccall((:Topology_Get_ForwardBranch, LIBRARY), Int32, ())
    end

    function Topology_Get_LoopedBranch()
        ccall((:Topology_Get_LoopedBranch, LIBRARY), Int32, ())
    end

    function Topology_Get_Next()
        ccall((:Topology_Get_Next, LIBRARY), Int32, ())
    end

    function Topology_Get_NumIsolatedBranches()
        ccall((:Topology_Get_NumIsolatedBranches, LIBRARY), Int32, ())
    end

    function Topology_Get_ParallelBranch()
        ccall((:Topology_Get_ParallelBranch, LIBRARY), Int32, ())
    end

    function Topology_Set_BranchName(Value)
        ccall((:Topology_Set_BranchName, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Topology_Get_AllIsolatedLoads(ResultPtr, ResultCount)
        ccall((:Topology_Get_AllIsolatedLoads, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Topology_Get_AllIsolatedLoads_GR()
        ccall((:Topology_Get_AllIsolatedLoads_GR, LIBRARY), Cvoid, ())
    end

    function Topology_Get_FirstLoad()
        ccall((:Topology_Get_FirstLoad, LIBRARY), Int32, ())
    end

    function Topology_Get_NextLoad()
        ccall((:Topology_Get_NextLoad, LIBRARY), Int32, ())
    end

    function Topology_Get_NumIsolatedLoads()
        ccall((:Topology_Get_NumIsolatedLoads, LIBRARY), Int32, ())
    end

    function Topology_Get_ActiveLevel()
        ccall((:Topology_Get_ActiveLevel, LIBRARY), Int32, ())
    end

    function Topology_Get_BusName()
        ccall((:Topology_Get_BusName, LIBRARY), Cstring, ())
    end

    function Topology_Set_BusName(Value)
        ccall((:Topology_Set_BusName, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Transformers_Get_AllNames(ResultPtr, ResultCount)
        ccall((:Transformers_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Transformers_Get_AllNames_GR()
        ccall((:Transformers_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function Transformers_Get_First()
        ccall((:Transformers_Get_First, LIBRARY), Int32, ())
    end

    function Transformers_Get_IsDelta()
        ccall((:Transformers_Get_IsDelta, LIBRARY), UInt16, ())
    end

    function Transformers_Get_kV()
        ccall((:Transformers_Get_kV, LIBRARY), Cdouble, ())
    end

    function Transformers_Get_kVA()
        ccall((:Transformers_Get_kVA, LIBRARY), Cdouble, ())
    end

    function Transformers_Get_MaxTap()
        ccall((:Transformers_Get_MaxTap, LIBRARY), Cdouble, ())
    end

    function Transformers_Get_MinTap()
        ccall((:Transformers_Get_MinTap, LIBRARY), Cdouble, ())
    end

    function Transformers_Get_Name()
        ccall((:Transformers_Get_Name, LIBRARY), Cstring, ())
    end

    function Transformers_Get_Next()
        ccall((:Transformers_Get_Next, LIBRARY), Int32, ())
    end

    function Transformers_Get_NumTaps()
        ccall((:Transformers_Get_NumTaps, LIBRARY), Int32, ())
    end

    function Transformers_Get_NumWindings()
        ccall((:Transformers_Get_NumWindings, LIBRARY), Int32, ())
    end

    function Transformers_Get_R()
        ccall((:Transformers_Get_R, LIBRARY), Cdouble, ())
    end

    function Transformers_Get_Rneut()
        ccall((:Transformers_Get_Rneut, LIBRARY), Cdouble, ())
    end

    function Transformers_Get_Tap()
        ccall((:Transformers_Get_Tap, LIBRARY), Cdouble, ())
    end

    function Transformers_Get_Wdg()
        ccall((:Transformers_Get_Wdg, LIBRARY), Int32, ())
    end

    function Transformers_Get_XfmrCode()
        ccall((:Transformers_Get_XfmrCode, LIBRARY), Cstring, ())
    end

    function Transformers_Get_Xhl()
        ccall((:Transformers_Get_Xhl, LIBRARY), Cdouble, ())
    end

    function Transformers_Get_Xht()
        ccall((:Transformers_Get_Xht, LIBRARY), Cdouble, ())
    end

    function Transformers_Get_Xlt()
        ccall((:Transformers_Get_Xlt, LIBRARY), Cdouble, ())
    end

    function Transformers_Get_Xneut()
        ccall((:Transformers_Get_Xneut, LIBRARY), Cdouble, ())
    end

    function Transformers_Set_IsDelta(Value)
        ccall((:Transformers_Set_IsDelta, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function Transformers_Set_kV(Value)
        ccall((:Transformers_Set_kV, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Transformers_Set_kVA(Value)
        ccall((:Transformers_Set_kVA, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Transformers_Set_MaxTap(Value)
        ccall((:Transformers_Set_MaxTap, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Transformers_Set_MinTap(Value)
        ccall((:Transformers_Set_MinTap, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Transformers_Set_Name(Value)
        ccall((:Transformers_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Transformers_Set_NumTaps(Value)
        ccall((:Transformers_Set_NumTaps, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Transformers_Set_NumWindings(Value)
        ccall((:Transformers_Set_NumWindings, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Transformers_Set_R(Value)
        ccall((:Transformers_Set_R, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Transformers_Set_Rneut(Value)
        ccall((:Transformers_Set_Rneut, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Transformers_Set_Tap(Value)
        ccall((:Transformers_Set_Tap, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Transformers_Set_Wdg(Value)
        ccall((:Transformers_Set_Wdg, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Transformers_Set_XfmrCode(Value)
        ccall((:Transformers_Set_XfmrCode, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Transformers_Set_Xhl(Value)
        ccall((:Transformers_Set_Xhl, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Transformers_Set_Xht(Value)
        ccall((:Transformers_Set_Xht, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Transformers_Set_Xlt(Value)
        ccall((:Transformers_Set_Xlt, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Transformers_Set_Xneut(Value)
        ccall((:Transformers_Set_Xneut, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Transformers_Get_Count()
        ccall((:Transformers_Get_Count, LIBRARY), Int32, ())
    end

    function Transformers_Get_WdgVoltages(ResultPtr, ResultCount)
        ccall((:Transformers_Get_WdgVoltages, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Transformers_Get_WdgVoltages_GR()
        ccall((:Transformers_Get_WdgVoltages_GR, LIBRARY), Cvoid, ())
    end

    function Transformers_Get_WdgCurrents(ResultPtr, ResultCount)
        ccall((:Transformers_Get_WdgCurrents, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Transformers_Get_WdgCurrents_GR()
        ccall((:Transformers_Get_WdgCurrents_GR, LIBRARY), Cvoid, ())
    end

    function Transformers_Get_strWdgCurrents()
        ccall((:Transformers_Get_strWdgCurrents, LIBRARY), Cstring, ())
    end

    function Transformers_Get_CoreType()
        ccall((:Transformers_Get_CoreType, LIBRARY), Int32, ())
    end

    function Transformers_Set_CoreType(Value)
        ccall((:Transformers_Set_CoreType, LIBRARY), Cvoid, (Int32,), Value)
    end

    function Transformers_Get_RdcOhms()
        ccall((:Transformers_Get_RdcOhms, LIBRARY), Cdouble, ())
    end

    function Transformers_Set_RdcOhms(Value)
        ccall((:Transformers_Set_RdcOhms, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Vsources_Get_AllNames(ResultPtr, ResultCount)
        ccall((:Vsources_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Vsources_Get_AllNames_GR()
        ccall((:Vsources_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function Vsources_Get_Count()
        ccall((:Vsources_Get_Count, LIBRARY), Int32, ())
    end

    function Vsources_Get_First()
        ccall((:Vsources_Get_First, LIBRARY), Int32, ())
    end

    function Vsources_Get_Next()
        ccall((:Vsources_Get_Next, LIBRARY), Int32, ())
    end

    function Vsources_Get_Name()
        ccall((:Vsources_Get_Name, LIBRARY), Cstring, ())
    end

    function Vsources_Set_Name(Value)
        ccall((:Vsources_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Vsources_Get_BasekV()
        ccall((:Vsources_Get_BasekV, LIBRARY), Cdouble, ())
    end

    function Vsources_Get_pu()
        ccall((:Vsources_Get_pu, LIBRARY), Cdouble, ())
    end

    function Vsources_Set_BasekV(Value)
        ccall((:Vsources_Set_BasekV, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Vsources_Set_pu(Value)
        ccall((:Vsources_Set_pu, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Vsources_Get_AngleDeg()
        ccall((:Vsources_Get_AngleDeg, LIBRARY), Cdouble, ())
    end

    function Vsources_Get_Frequency()
        ccall((:Vsources_Get_Frequency, LIBRARY), Cdouble, ())
    end

    function Vsources_Get_Phases()
        ccall((:Vsources_Get_Phases, LIBRARY), Int32, ())
    end

    function Vsources_Set_AngleDeg(Value)
        ccall((:Vsources_Set_AngleDeg, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Vsources_Set_Frequency(Value)
        ccall((:Vsources_Set_Frequency, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Vsources_Set_Phases(Value)
        ccall((:Vsources_Set_Phases, LIBRARY), Cvoid, (Int32,), Value)
    end

    function XYCurves_Get_Count()
        ccall((:XYCurves_Get_Count, LIBRARY), Int32, ())
    end

    function XYCurves_Get_First()
        ccall((:XYCurves_Get_First, LIBRARY), Int32, ())
    end

    function XYCurves_Get_Name()
        ccall((:XYCurves_Get_Name, LIBRARY), Cstring, ())
    end

    function XYCurves_Get_Next()
        ccall((:XYCurves_Get_Next, LIBRARY), Int32, ())
    end

    function XYCurves_Set_Name(Value)
        ccall((:XYCurves_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function XYCurves_Get_Npts()
        ccall((:XYCurves_Get_Npts, LIBRARY), Int32, ())
    end

    function XYCurves_Get_Xarray(ResultPtr, ResultCount)
        ccall((:XYCurves_Get_Xarray, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function XYCurves_Get_Xarray_GR()
        ccall((:XYCurves_Get_Xarray_GR, LIBRARY), Cvoid, ())
    end

    function XYCurves_Set_Npts(Value)
        ccall((:XYCurves_Set_Npts, LIBRARY), Cvoid, (Int32,), Value)
    end

    function XYCurves_Set_Xarray(ValuePtr, ValueCount)
        ccall((:XYCurves_Set_Xarray, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function XYCurves_Get_x()
        ccall((:XYCurves_Get_x, LIBRARY), Cdouble, ())
    end

    function XYCurves_Get_y()
        ccall((:XYCurves_Get_y, LIBRARY), Cdouble, ())
    end

    function XYCurves_Get_Yarray(ResultPtr, ResultCount)
        ccall((:XYCurves_Get_Yarray, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function XYCurves_Get_Yarray_GR()
        ccall((:XYCurves_Get_Yarray_GR, LIBRARY), Cvoid, ())
    end

    function XYCurves_Set_x(Value)
        ccall((:XYCurves_Set_x, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function XYCurves_Set_y(Value)
        ccall((:XYCurves_Set_y, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function XYCurves_Set_Yarray(ValuePtr, ValueCount)
        ccall((:XYCurves_Set_Yarray, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function XYCurves_Get_Xscale()
        ccall((:XYCurves_Get_Xscale, LIBRARY), Cdouble, ())
    end

    function XYCurves_Get_Xshift()
        ccall((:XYCurves_Get_Xshift, LIBRARY), Cdouble, ())
    end

    function XYCurves_Get_Yscale()
        ccall((:XYCurves_Get_Yscale, LIBRARY), Cdouble, ())
    end

    function XYCurves_Get_Yshift()
        ccall((:XYCurves_Get_Yshift, LIBRARY), Cdouble, ())
    end

    function XYCurves_Set_Xscale(Value)
        ccall((:XYCurves_Set_Xscale, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function XYCurves_Set_Xshift(Value)
        ccall((:XYCurves_Set_Xshift, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function XYCurves_Set_Yscale(Value)
        ccall((:XYCurves_Set_Yscale, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function XYCurves_Set_Yshift(Value)
        ccall((:XYCurves_Set_Yshift, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function YMatrix_GetCompressedYMatrix(factor, nBus, nNz, ColPtr, RowIdxPtr, cValsPtr)
        ccall((:YMatrix_GetCompressedYMatrix, LIBRARY), Cvoid, (UInt16, Ptr{UInt32}, Ptr{UInt32}, Ptr{Ptr{Int32}}, Ptr{Ptr{Int32}}, Ptr{Ptr{Cdouble}}), factor, nBus, nNz, ColPtr, RowIdxPtr, cValsPtr)
    end

    function YMatrix_ZeroInjCurr()
        ccall((:YMatrix_ZeroInjCurr, LIBRARY), Cvoid, ())
    end

    function YMatrix_GetSourceInjCurrents()
        ccall((:YMatrix_GetSourceInjCurrents, LIBRARY), Cvoid, ())
    end

    function YMatrix_GetPCInjCurr()
        ccall((:YMatrix_GetPCInjCurr, LIBRARY), Cvoid, ())
    end

    function YMatrix_BuildYMatrixD(BuildOps, AllocateVI)
        ccall((:YMatrix_BuildYMatrixD, LIBRARY), Cvoid, (Int32, Int32), BuildOps, AllocateVI)
    end

    function YMatrix_AddInAuxCurrents(SType)
        ccall((:YMatrix_AddInAuxCurrents, LIBRARY), Cvoid, (Int32,), SType)
    end

    function YMatrix_getIpointer(IvectorPtr)
        ccall((:YMatrix_getIpointer, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}},), IvectorPtr)
    end

    function YMatrix_getVpointer(VvectorPtr)
        ccall((:YMatrix_getVpointer, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}},), VvectorPtr)
    end

    function YMatrix_SolveSystem(NodeVPtr)
        ccall((:YMatrix_SolveSystem, LIBRARY), Int32, (Ptr{Ptr{Cdouble}},), NodeVPtr)
    end

    function YMatrix_Set_SystemYChanged(arg)
        ccall((:YMatrix_Set_SystemYChanged, LIBRARY), Cvoid, (UInt16,), arg)
    end

    function YMatrix_Get_SystemYChanged()
        ccall((:YMatrix_Get_SystemYChanged, LIBRARY), UInt16, ())
    end

    function YMatrix_Set_UseAuxCurrents(arg)
        ccall((:YMatrix_Set_UseAuxCurrents, LIBRARY), Cvoid, (UInt16,), arg)
    end

    function YMatrix_Get_UseAuxCurrents()
        ccall((:YMatrix_Get_UseAuxCurrents, LIBRARY), UInt16, ())
    end

    function CNData_Get_Count()
        ccall((:CNData_Get_Count, LIBRARY), Int32, ())
    end

    function CNData_Get_First()
        ccall((:CNData_Get_First, LIBRARY), Int32, ())
    end

    function CNData_Get_Next()
        ccall((:CNData_Get_Next, LIBRARY), Int32, ())
    end

    function CNData_Get_Name()
        ccall((:CNData_Get_Name, LIBRARY), Cstring, ())
    end

    function CNData_Set_Name(Value)
        ccall((:CNData_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function CNData_Get_AllNames(ResultPtr, ResultCount)
        ccall((:CNData_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function CNData_Get_AllNames_GR()
        ccall((:CNData_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function CNData_Get_Rdc()
        ccall((:CNData_Get_Rdc, LIBRARY), Cdouble, ())
    end

    function CNData_Set_Rdc(Value)
        ccall((:CNData_Set_Rdc, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CNData_Get_Rac()
        ccall((:CNData_Get_Rac, LIBRARY), Cdouble, ())
    end

    function CNData_Set_Rac(Value)
        ccall((:CNData_Set_Rac, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CNData_Get_GMRac()
        ccall((:CNData_Get_GMRac, LIBRARY), Cdouble, ())
    end

    function CNData_Set_GMRac(Value)
        ccall((:CNData_Set_GMRac, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CNData_Get_GMRUnits()
        ccall((:CNData_Get_GMRUnits, LIBRARY), Int32, ())
    end

    function CNData_Set_GMRUnits(Value)
        ccall((:CNData_Set_GMRUnits, LIBRARY), Cvoid, (Int32,), Value)
    end

    function CNData_Get_Radius()
        ccall((:CNData_Get_Radius, LIBRARY), Cdouble, ())
    end

    function CNData_Set_Radius(Value)
        ccall((:CNData_Set_Radius, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CNData_Get_RadiusUnits()
        ccall((:CNData_Get_RadiusUnits, LIBRARY), Int32, ())
    end

    function CNData_Set_RadiusUnits(Value)
        ccall((:CNData_Set_RadiusUnits, LIBRARY), Cvoid, (Int32,), Value)
    end

    function CNData_Get_ResistanceUnits()
        ccall((:CNData_Get_ResistanceUnits, LIBRARY), Int32, ())
    end

    function CNData_Set_ResistanceUnits(Value)
        ccall((:CNData_Set_ResistanceUnits, LIBRARY), Cvoid, (Int32,), Value)
    end

    function CNData_Get_Diameter()
        ccall((:CNData_Get_Diameter, LIBRARY), Cdouble, ())
    end

    function CNData_Set_Diameter(Value)
        ccall((:CNData_Set_Diameter, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CNData_Get_NormAmps()
        ccall((:CNData_Get_NormAmps, LIBRARY), Cdouble, ())
    end

    function CNData_Set_NormAmps(Value)
        ccall((:CNData_Set_NormAmps, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CNData_Get_EmergAmps()
        ccall((:CNData_Get_EmergAmps, LIBRARY), Cdouble, ())
    end

    function CNData_Set_EmergAmps(Value)
        ccall((:CNData_Set_EmergAmps, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CNData_Get_EpsR()
        ccall((:CNData_Get_EpsR, LIBRARY), Cdouble, ())
    end

    function CNData_Set_EpsR(Value)
        ccall((:CNData_Set_EpsR, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CNData_Get_InsLayer()
        ccall((:CNData_Get_InsLayer, LIBRARY), Cdouble, ())
    end

    function CNData_Set_InsLayer(Value)
        ccall((:CNData_Set_InsLayer, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CNData_Get_DiaIns()
        ccall((:CNData_Get_DiaIns, LIBRARY), Cdouble, ())
    end

    function CNData_Set_DiaIns(Value)
        ccall((:CNData_Set_DiaIns, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CNData_Get_DiaCable()
        ccall((:CNData_Get_DiaCable, LIBRARY), Cdouble, ())
    end

    function CNData_Set_DiaCable(Value)
        ccall((:CNData_Set_DiaCable, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CNData_Get_k()
        ccall((:CNData_Get_k, LIBRARY), Int32, ())
    end

    function CNData_Set_k(Value)
        ccall((:CNData_Set_k, LIBRARY), Cvoid, (Int32,), Value)
    end

    function CNData_Get_DiaStrand()
        ccall((:CNData_Get_DiaStrand, LIBRARY), Cdouble, ())
    end

    function CNData_Set_DiaStrand(Value)
        ccall((:CNData_Set_DiaStrand, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CNData_Get_GmrStrand()
        ccall((:CNData_Get_GmrStrand, LIBRARY), Cdouble, ())
    end

    function CNData_Set_GmrStrand(Value)
        ccall((:CNData_Set_GmrStrand, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function CNData_Get_RStrand()
        ccall((:CNData_Get_RStrand, LIBRARY), Cdouble, ())
    end

    function CNData_Set_RStrand(Value)
        ccall((:CNData_Set_RStrand, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LineGeometries_Get_Count()
        ccall((:LineGeometries_Get_Count, LIBRARY), Int32, ())
    end

    function LineGeometries_Get_First()
        ccall((:LineGeometries_Get_First, LIBRARY), Int32, ())
    end

    function LineGeometries_Get_Next()
        ccall((:LineGeometries_Get_Next, LIBRARY), Int32, ())
    end

    function LineGeometries_Get_Name()
        ccall((:LineGeometries_Get_Name, LIBRARY), Cstring, ())
    end

    function LineGeometries_Set_Name(Value)
        ccall((:LineGeometries_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function LineGeometries_Get_Nconds()
        ccall((:LineGeometries_Get_Nconds, LIBRARY), Int32, ())
    end

    function LineGeometries_Set_Nconds(Value)
        ccall((:LineGeometries_Set_Nconds, LIBRARY), Cvoid, (Int32,), Value)
    end

    function LineGeometries_Get_Phases()
        ccall((:LineGeometries_Get_Phases, LIBRARY), Int32, ())
    end

    function LineGeometries_Set_Phases(Value)
        ccall((:LineGeometries_Set_Phases, LIBRARY), Cvoid, (Int32,), Value)
    end

    function LineGeometries_Get_Cmatrix(ResultPtr, ResultCount, Frequency, Length, Units)
        ccall((:LineGeometries_Get_Cmatrix, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Int32), ResultPtr, ResultCount, Frequency, Length, Units)
    end

    function LineGeometries_Get_Cmatrix_GR(Frequency, Length, Units)
        ccall((:LineGeometries_Get_Cmatrix_GR, LIBRARY), Cvoid, (Cdouble, Cdouble, Int32), Frequency, Length, Units)
    end

    function LineGeometries_Get_Rmatrix(ResultPtr, ResultCount, Frequency, Length, Units)
        ccall((:LineGeometries_Get_Rmatrix, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Int32), ResultPtr, ResultCount, Frequency, Length, Units)
    end

    function LineGeometries_Get_Rmatrix_GR(Frequency, Length, Units)
        ccall((:LineGeometries_Get_Rmatrix_GR, LIBRARY), Cvoid, (Cdouble, Cdouble, Int32), Frequency, Length, Units)
    end

    function LineGeometries_Get_Xmatrix(ResultPtr, ResultCount, Frequency, Length, Units)
        ccall((:LineGeometries_Get_Xmatrix, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Int32), ResultPtr, ResultCount, Frequency, Length, Units)
    end

    function LineGeometries_Get_Xmatrix_GR(Frequency, Length, Units)
        ccall((:LineGeometries_Get_Xmatrix_GR, LIBRARY), Cvoid, (Cdouble, Cdouble, Int32), Frequency, Length, Units)
    end

    function LineGeometries_Get_Zmatrix(ResultPtr, ResultCount, Frequency, Length, Units)
        ccall((:LineGeometries_Get_Zmatrix, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Int32), ResultPtr, ResultCount, Frequency, Length, Units)
    end

    function LineGeometries_Get_Zmatrix_GR(Frequency, Length, Units)
        ccall((:LineGeometries_Get_Zmatrix_GR, LIBRARY), Cvoid, (Cdouble, Cdouble, Int32), Frequency, Length, Units)
    end

    function LineGeometries_Get_Units(ResultPtr, ResultCount)
        ccall((:LineGeometries_Get_Units, LIBRARY), Cvoid, (Ptr{Ptr{Int32}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function LineGeometries_Get_Units_GR()
        ccall((:LineGeometries_Get_Units_GR, LIBRARY), Cvoid, ())
    end

    function LineGeometries_Set_Units(ValuePtr, ValueCount)
        ccall((:LineGeometries_Set_Units, LIBRARY), Cvoid, (Ptr{Int32}, Int32), ValuePtr, ValueCount)
    end

    function LineGeometries_Get_Xcoords(ResultPtr, ResultCount)
        ccall((:LineGeometries_Get_Xcoords, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function LineGeometries_Get_Xcoords_GR()
        ccall((:LineGeometries_Get_Xcoords_GR, LIBRARY), Cvoid, ())
    end

    function LineGeometries_Set_Xcoords(ValuePtr, ValueCount)
        ccall((:LineGeometries_Set_Xcoords, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function LineGeometries_Get_Ycoords(ResultPtr, ResultCount)
        ccall((:LineGeometries_Get_Ycoords, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function LineGeometries_Get_Ycoords_GR()
        ccall((:LineGeometries_Get_Ycoords_GR, LIBRARY), Cvoid, ())
    end

    function LineGeometries_Set_Ycoords(ValuePtr, ValueCount)
        ccall((:LineGeometries_Set_Ycoords, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function LineGeometries_Get_Conductors(ResultPtr, ResultCount)
        ccall((:LineGeometries_Get_Conductors, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function LineGeometries_Get_Conductors_GR()
        ccall((:LineGeometries_Get_Conductors_GR, LIBRARY), Cvoid, ())
    end

    function LineGeometries_Get_Reduce()
        ccall((:LineGeometries_Get_Reduce, LIBRARY), UInt16, ())
    end

    function LineGeometries_Set_Reduce(Value)
        ccall((:LineGeometries_Set_Reduce, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function LineGeometries_Get_RhoEarth()
        ccall((:LineGeometries_Get_RhoEarth, LIBRARY), Cdouble, ())
    end

    function LineGeometries_Set_RhoEarth(Value)
        ccall((:LineGeometries_Set_RhoEarth, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LineGeometries_Get_NormAmps()
        ccall((:LineGeometries_Get_NormAmps, LIBRARY), Cdouble, ())
    end

    function LineGeometries_Set_NormAmps(Value)
        ccall((:LineGeometries_Set_NormAmps, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LineGeometries_Get_EmergAmps()
        ccall((:LineGeometries_Get_EmergAmps, LIBRARY), Cdouble, ())
    end

    function LineGeometries_Set_EmergAmps(Value)
        ccall((:LineGeometries_Set_EmergAmps, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function LineGeometries_Get_AllNames(ResultPtr, ResultCount)
        ccall((:LineGeometries_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function LineGeometries_Get_AllNames_GR()
        ccall((:LineGeometries_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function LineSpacings_Get_Count()
        ccall((:LineSpacings_Get_Count, LIBRARY), Int32, ())
    end

    function LineSpacings_Get_First()
        ccall((:LineSpacings_Get_First, LIBRARY), Int32, ())
    end

    function LineSpacings_Get_Next()
        ccall((:LineSpacings_Get_Next, LIBRARY), Int32, ())
    end

    function LineSpacings_Get_Name()
        ccall((:LineSpacings_Get_Name, LIBRARY), Cstring, ())
    end

    function LineSpacings_Set_Name(Value)
        ccall((:LineSpacings_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function LineSpacings_Get_Nconds()
        ccall((:LineSpacings_Get_Nconds, LIBRARY), Int32, ())
    end

    function LineSpacings_Set_Nconds(Value)
        ccall((:LineSpacings_Set_Nconds, LIBRARY), Cvoid, (Int32,), Value)
    end

    function LineSpacings_Get_Phases()
        ccall((:LineSpacings_Get_Phases, LIBRARY), Int32, ())
    end

    function LineSpacings_Set_Phases(Value)
        ccall((:LineSpacings_Set_Phases, LIBRARY), Cvoid, (Int32,), Value)
    end

    function LineSpacings_Get_Units()
        ccall((:LineSpacings_Get_Units, LIBRARY), Int32, ())
    end

    function LineSpacings_Set_Units(Value)
        ccall((:LineSpacings_Set_Units, LIBRARY), Cvoid, (Int32,), Value)
    end

    function LineSpacings_Get_Xcoords(ResultPtr, ResultCount)
        ccall((:LineSpacings_Get_Xcoords, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function LineSpacings_Get_Xcoords_GR()
        ccall((:LineSpacings_Get_Xcoords_GR, LIBRARY), Cvoid, ())
    end

    function LineSpacings_Set_Xcoords(ValuePtr, ValueCount)
        ccall((:LineSpacings_Set_Xcoords, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function LineSpacings_Get_Ycoords(ResultPtr, ResultCount)
        ccall((:LineSpacings_Get_Ycoords, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function LineSpacings_Get_Ycoords_GR()
        ccall((:LineSpacings_Get_Ycoords_GR, LIBRARY), Cvoid, ())
    end

    function LineSpacings_Set_Ycoords(ValuePtr, ValueCount)
        ccall((:LineSpacings_Set_Ycoords, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function LineSpacings_Get_AllNames(ResultPtr, ResultCount)
        ccall((:LineSpacings_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function LineSpacings_Get_AllNames_GR()
        ccall((:LineSpacings_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function Loads_Get_Phases()
        ccall((:Loads_Get_Phases, LIBRARY), Int32, ())
    end

    function Loads_Set_Phases(Integer)
        ccall((:Loads_Set_Phases, LIBRARY), Cvoid, (Int32,), Integer)
    end

    function Reactors_Get_AllNames(ResultPtr, ResultCount)
        ccall((:Reactors_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Reactors_Get_AllNames_GR()
        ccall((:Reactors_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function Reactors_Get_Name()
        ccall((:Reactors_Get_Name, LIBRARY), Cstring, ())
    end

    function Reactors_Set_Name(Value)
        ccall((:Reactors_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Reactors_Get_First()
        ccall((:Reactors_Get_First, LIBRARY), Int32, ())
    end

    function Reactors_Get_Next()
        ccall((:Reactors_Get_Next, LIBRARY), Int32, ())
    end

    function Reactors_Get_Count()
        ccall((:Reactors_Get_Count, LIBRARY), Int32, ())
    end

    function Reactors_Get_kV()
        ccall((:Reactors_Get_kV, LIBRARY), Cdouble, ())
    end

    function Reactors_Set_kV(Value)
        ccall((:Reactors_Set_kV, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Reactors_Get_kvar()
        ccall((:Reactors_Get_kvar, LIBRARY), Cdouble, ())
    end

    function Reactors_Set_kvar(Value)
        ccall((:Reactors_Set_kvar, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Reactors_Get_Phases()
        ccall((:Reactors_Get_Phases, LIBRARY), Int32, ())
    end

    function Reactors_Set_Phases(Integer)
        ccall((:Reactors_Set_Phases, LIBRARY), Cvoid, (Int32,), Integer)
    end

    function Reactors_Get_IsDelta()
        ccall((:Reactors_Get_IsDelta, LIBRARY), UInt16, ())
    end

    function Reactors_Set_IsDelta(Value)
        ccall((:Reactors_Set_IsDelta, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function Reactors_Get_Parallel()
        ccall((:Reactors_Get_Parallel, LIBRARY), UInt16, ())
    end

    function Reactors_Set_Parallel(Value)
        ccall((:Reactors_Set_Parallel, LIBRARY), Cvoid, (UInt16,), Value)
    end

    function Reactors_Get_LmH()
        ccall((:Reactors_Get_LmH, LIBRARY), Cdouble, ())
    end

    function Reactors_Set_LmH(Value)
        ccall((:Reactors_Set_LmH, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Reactors_Get_Bus1()
        ccall((:Reactors_Get_Bus1, LIBRARY), Cstring, ())
    end

    function Reactors_Get_Bus2()
        ccall((:Reactors_Get_Bus2, LIBRARY), Cstring, ())
    end

    function Reactors_Set_Bus1(Value)
        ccall((:Reactors_Set_Bus1, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Reactors_Set_Bus2(Value)
        ccall((:Reactors_Set_Bus2, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Reactors_Get_R()
        ccall((:Reactors_Get_R, LIBRARY), Cdouble, ())
    end

    function Reactors_Set_R(Value)
        ccall((:Reactors_Set_R, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Reactors_Get_X()
        ccall((:Reactors_Get_X, LIBRARY), Cdouble, ())
    end

    function Reactors_Set_X(Value)
        ccall((:Reactors_Set_X, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Reactors_Get_Rp()
        ccall((:Reactors_Get_Rp, LIBRARY), Cdouble, ())
    end

    function Reactors_Set_Rp(Value)
        ccall((:Reactors_Set_Rp, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Reactors_Get_RCurve()
        ccall((:Reactors_Get_RCurve, LIBRARY), Cstring, ())
    end

    function Reactors_Set_RCurve(Value)
        ccall((:Reactors_Set_RCurve, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Reactors_Get_LCurve()
        ccall((:Reactors_Get_LCurve, LIBRARY), Cstring, ())
    end

    function Reactors_Set_LCurve(Value)
        ccall((:Reactors_Set_LCurve, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function Reactors_Get_Rmatrix(ResultPtr, ResultCount)
        ccall((:Reactors_Get_Rmatrix, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Reactors_Get_Rmatrix_GR()
        ccall((:Reactors_Get_Rmatrix_GR, LIBRARY), Cvoid, ())
    end

    function Reactors_Set_Rmatrix(ValuePtr, ValueCount)
        ccall((:Reactors_Set_Rmatrix, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Reactors_Get_Xmatrix(ResultPtr, ResultCount)
        ccall((:Reactors_Get_Xmatrix, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Reactors_Get_Xmatrix_GR()
        ccall((:Reactors_Get_Xmatrix_GR, LIBRARY), Cvoid, ())
    end

    function Reactors_Set_Xmatrix(ValuePtr, ValueCount)
        ccall((:Reactors_Set_Xmatrix, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Reactors_Get_Z(ResultPtr, ResultCount)
        ccall((:Reactors_Get_Z, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Reactors_Get_Z_GR()
        ccall((:Reactors_Get_Z_GR, LIBRARY), Cvoid, ())
    end

    function Reactors_Set_Z(ValuePtr, ValueCount)
        ccall((:Reactors_Set_Z, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Reactors_Get_Z1(ResultPtr, ResultCount)
        ccall((:Reactors_Get_Z1, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Reactors_Get_Z1_GR()
        ccall((:Reactors_Get_Z1_GR, LIBRARY), Cvoid, ())
    end

    function Reactors_Set_Z1(ValuePtr, ValueCount)
        ccall((:Reactors_Set_Z1, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Reactors_Get_Z2(ResultPtr, ResultCount)
        ccall((:Reactors_Get_Z2, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Reactors_Get_Z2_GR()
        ccall((:Reactors_Get_Z2_GR, LIBRARY), Cvoid, ())
    end

    function Reactors_Set_Z2(ValuePtr, ValueCount)
        ccall((:Reactors_Set_Z2, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Reactors_Get_Z0(ResultPtr, ResultCount)
        ccall((:Reactors_Get_Z0, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function Reactors_Get_Z0_GR()
        ccall((:Reactors_Get_Z0_GR, LIBRARY), Cvoid, ())
    end

    function Reactors_Set_Z0(ValuePtr, ValueCount)
        ccall((:Reactors_Set_Z0, LIBRARY), Cvoid, (Ptr{Cdouble}, Int32), ValuePtr, ValueCount)
    end

    function Reactors_Get_SpecType()
        ccall((:Reactors_Get_SpecType, LIBRARY), Int32, ())
    end

    function TSData_Get_Count()
        ccall((:TSData_Get_Count, LIBRARY), Int32, ())
    end

    function TSData_Get_First()
        ccall((:TSData_Get_First, LIBRARY), Int32, ())
    end

    function TSData_Get_Next()
        ccall((:TSData_Get_Next, LIBRARY), Int32, ())
    end

    function TSData_Get_Name()
        ccall((:TSData_Get_Name, LIBRARY), Cstring, ())
    end

    function TSData_Set_Name(Value)
        ccall((:TSData_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function TSData_Get_AllNames(ResultPtr, ResultCount)
        ccall((:TSData_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function TSData_Get_AllNames_GR()
        ccall((:TSData_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function TSData_Get_Rdc()
        ccall((:TSData_Get_Rdc, LIBRARY), Cdouble, ())
    end

    function TSData_Set_Rdc(Value)
        ccall((:TSData_Set_Rdc, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function TSData_Get_Rac()
        ccall((:TSData_Get_Rac, LIBRARY), Cdouble, ())
    end

    function TSData_Set_Rac(Value)
        ccall((:TSData_Set_Rac, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function TSData_Get_GMRac()
        ccall((:TSData_Get_GMRac, LIBRARY), Cdouble, ())
    end

    function TSData_Set_GMRac(Value)
        ccall((:TSData_Set_GMRac, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function TSData_Get_GMRUnits()
        ccall((:TSData_Get_GMRUnits, LIBRARY), Int32, ())
    end

    function TSData_Set_GMRUnits(Value)
        ccall((:TSData_Set_GMRUnits, LIBRARY), Cvoid, (Int32,), Value)
    end

    function TSData_Get_Radius()
        ccall((:TSData_Get_Radius, LIBRARY), Cdouble, ())
    end

    function TSData_Set_Radius(Value)
        ccall((:TSData_Set_Radius, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function TSData_Get_RadiusUnits()
        ccall((:TSData_Get_RadiusUnits, LIBRARY), Int32, ())
    end

    function TSData_Set_RadiusUnits(Value)
        ccall((:TSData_Set_RadiusUnits, LIBRARY), Cvoid, (Int32,), Value)
    end

    function TSData_Get_ResistanceUnits()
        ccall((:TSData_Get_ResistanceUnits, LIBRARY), Int32, ())
    end

    function TSData_Set_ResistanceUnits(Value)
        ccall((:TSData_Set_ResistanceUnits, LIBRARY), Cvoid, (Int32,), Value)
    end

    function TSData_Get_Diameter()
        ccall((:TSData_Get_Diameter, LIBRARY), Cdouble, ())
    end

    function TSData_Set_Diameter(Value)
        ccall((:TSData_Set_Diameter, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function TSData_Get_NormAmps()
        ccall((:TSData_Get_NormAmps, LIBRARY), Cdouble, ())
    end

    function TSData_Set_NormAmps(Value)
        ccall((:TSData_Set_NormAmps, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function TSData_Get_EmergAmps()
        ccall((:TSData_Get_EmergAmps, LIBRARY), Cdouble, ())
    end

    function TSData_Set_EmergAmps(Value)
        ccall((:TSData_Set_EmergAmps, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function TSData_Get_EpsR()
        ccall((:TSData_Get_EpsR, LIBRARY), Cdouble, ())
    end

    function TSData_Set_EpsR(Value)
        ccall((:TSData_Set_EpsR, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function TSData_Get_InsLayer()
        ccall((:TSData_Get_InsLayer, LIBRARY), Cdouble, ())
    end

    function TSData_Set_InsLayer(Value)
        ccall((:TSData_Set_InsLayer, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function TSData_Get_DiaIns()
        ccall((:TSData_Get_DiaIns, LIBRARY), Cdouble, ())
    end

    function TSData_Set_DiaIns(Value)
        ccall((:TSData_Set_DiaIns, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function TSData_Get_DiaCable()
        ccall((:TSData_Get_DiaCable, LIBRARY), Cdouble, ())
    end

    function TSData_Set_DiaCable(Value)
        ccall((:TSData_Set_DiaCable, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function TSData_Get_DiaShield()
        ccall((:TSData_Get_DiaShield, LIBRARY), Cdouble, ())
    end

    function TSData_Set_DiaShield(Value)
        ccall((:TSData_Set_DiaShield, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function TSData_Get_TapeLayer()
        ccall((:TSData_Get_TapeLayer, LIBRARY), Cdouble, ())
    end

    function TSData_Set_TapeLayer(Value)
        ccall((:TSData_Set_TapeLayer, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function TSData_Get_TapeLap()
        ccall((:TSData_Get_TapeLap, LIBRARY), Cdouble, ())
    end

    function TSData_Set_TapeLap(Value)
        ccall((:TSData_Set_TapeLap, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function WireData_Get_Count()
        ccall((:WireData_Get_Count, LIBRARY), Int32, ())
    end

    function WireData_Get_First()
        ccall((:WireData_Get_First, LIBRARY), Int32, ())
    end

    function WireData_Get_Next()
        ccall((:WireData_Get_Next, LIBRARY), Int32, ())
    end

    function WireData_Get_Name()
        ccall((:WireData_Get_Name, LIBRARY), Cstring, ())
    end

    function WireData_Set_Name(Value)
        ccall((:WireData_Set_Name, LIBRARY), Cvoid, (Cstring,), Value)
    end

    function WireData_Get_AllNames(ResultPtr, ResultCount)
        ccall((:WireData_Get_AllNames, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}), ResultPtr, ResultCount)
    end

    function WireData_Get_AllNames_GR()
        ccall((:WireData_Get_AllNames_GR, LIBRARY), Cvoid, ())
    end

    function WireData_Get_Rdc()
        ccall((:WireData_Get_Rdc, LIBRARY), Cdouble, ())
    end

    function WireData_Set_Rdc(Value)
        ccall((:WireData_Set_Rdc, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function WireData_Get_Rac()
        ccall((:WireData_Get_Rac, LIBRARY), Cdouble, ())
    end

    function WireData_Set_Rac(Value)
        ccall((:WireData_Set_Rac, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function WireData_Get_GMRac()
        ccall((:WireData_Get_GMRac, LIBRARY), Cdouble, ())
    end

    function WireData_Set_GMRac(Value)
        ccall((:WireData_Set_GMRac, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function WireData_Get_GMRUnits()
        ccall((:WireData_Get_GMRUnits, LIBRARY), Int32, ())
    end

    function WireData_Set_GMRUnits(Value)
        ccall((:WireData_Set_GMRUnits, LIBRARY), Cvoid, (Int32,), Value)
    end

    function WireData_Get_Radius()
        ccall((:WireData_Get_Radius, LIBRARY), Cdouble, ())
    end

    function WireData_Set_Radius(Value)
        ccall((:WireData_Set_Radius, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function WireData_Get_RadiusUnits()
        ccall((:WireData_Get_RadiusUnits, LIBRARY), Int32, ())
    end

    function WireData_Set_RadiusUnits(Value)
        ccall((:WireData_Set_RadiusUnits, LIBRARY), Cvoid, (Int32,), Value)
    end

    function WireData_Get_ResistanceUnits()
        ccall((:WireData_Get_ResistanceUnits, LIBRARY), Int32, ())
    end

    function WireData_Set_ResistanceUnits(Value)
        ccall((:WireData_Set_ResistanceUnits, LIBRARY), Cvoid, (Int32,), Value)
    end

    function WireData_Get_Diameter()
        ccall((:WireData_Get_Diameter, LIBRARY), Cdouble, ())
    end

    function WireData_Set_Diameter(Value)
        ccall((:WireData_Set_Diameter, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function WireData_Get_NormAmps()
        ccall((:WireData_Get_NormAmps, LIBRARY), Cdouble, ())
    end

    function WireData_Set_NormAmps(Value)
        ccall((:WireData_Set_NormAmps, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function WireData_Get_EmergAmps()
        ccall((:WireData_Get_EmergAmps, LIBRARY), Cdouble, ())
    end

    function WireData_Set_EmergAmps(Value)
        ccall((:WireData_Set_EmergAmps, LIBRARY), Cvoid, (Cdouble,), Value)
    end

    function Bus_Get_Next()
        ccall((:Bus_Get_Next, LIBRARY), Int32, ())
    end

    function Error_Get_EarlyAbort()
        ccall((:Error_Get_EarlyAbort, LIBRARY), UInt16, ())
    end

    function Error_Set_EarlyAbort(Value)
        ccall((:Error_Set_EarlyAbort, LIBRARY), Cvoid, (UInt16,), Value)
    end

end
