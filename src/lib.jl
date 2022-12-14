# Julia wrapper for header: dss_capi.h
# ORIGINALLY, automatically generated using Clang.jl
#
# This temporary version is modified for DSS C-API 0.12.x to use the 
# ctx_* functions. We should regenerate after DSS C-API 0.13.0 is
# released.


# typedef int32_t ( * dss_callback_plot_t ) ( void * ctx , char * jsonParams )
const dss_callback_plot_t = Ptr{Cvoid}

# typedef int32_t ( * dss_callback_message_t ) ( void * ctx , char * messageStr , int32_t messageType )
const dss_callback_message_t = Ptr{Cvoid}

function DSS_ResetStringBuffer(ctx)
    ccall((:ctx_DSS_ResetStringBuffer, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
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

function DSS_DisposeGRData(ctx)
    ccall((:ctx_DSS_DisposeGRData, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSS_GetGRPointers(ctx, DataPtr_PPAnsiChar, DataPtr_PDouble, DataPtr_PInteger, DataPtr_PByte, CountPtr_PPAnsiChar, CountPtr_PDouble, CountPtr_PInteger, CountPtr_PByte)
    ccall((:ctx_DSS_GetGRPointers, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Ptr{Cstring}}}, Ptr{Ptr{Ptr{Cdouble}}}, Ptr{Ptr{Ptr{Int32}}}, Ptr{Ptr{Ptr{Int8}}}, Ptr{Ptr{Int32}}, Ptr{Ptr{Int32}}, Ptr{Ptr{Int32}}, Ptr{Ptr{Int32}}), ctx, DataPtr_PPAnsiChar, DataPtr_PDouble, DataPtr_PInteger, DataPtr_PByte, CountPtr_PPAnsiChar, CountPtr_PDouble, CountPtr_PInteger, CountPtr_PByte)
end

function DSS_GR_DataPtr_PDouble(ctx)
    ccall((:ctx_DSS_GR_DataPtr_PDouble, LIBRARY), Ptr{Cdouble}, (Ptr{Cvoid},), ctx)
end

function DSS_GR_DataPtr_PInteger(ctx)
    ccall((:ctx_DSS_GR_DataPtr_PInteger, LIBRARY), Ptr{Int32}, (Ptr{Cvoid},), ctx)
end

function DSS_GR_DataPtr_PByte(ctx)
    ccall((:ctx_DSS_GR_DataPtr_PByte, LIBRARY), Ptr{Int8}, (Ptr{Cvoid},), ctx)
end

function DSS_GR_CountPtr_PDouble(ctx)
    ccall((:ctx_DSS_GR_CountPtr_PDouble, LIBRARY), Ptr{Int32}, (Ptr{Cvoid},), ctx)
end

function DSS_GR_CountPtr_PInteger(ctx)
    ccall((:ctx_DSS_GR_CountPtr_PInteger, LIBRARY), Ptr{Int32}, (Ptr{Cvoid},), ctx)
end

function DSS_GR_CountPtr_PByte(ctx)
    ccall((:ctx_DSS_GR_CountPtr_PByte, LIBRARY), Ptr{Int32}, (Ptr{Cvoid},), ctx)
end

function DSS_RegisterPlotCallback(ctx, cb)
    ccall((:ctx_DSS_RegisterPlotCallback, LIBRARY), Cvoid, (Ptr{Cvoid}, dss_callback_plot_t,), ctx, cb)
end

function DSS_RegisterMessageCallback(ctx, cb)
    ccall((:ctx_DSS_RegisterMessageCallback, LIBRARY), Cvoid, (Ptr{Cvoid}, dss_callback_message_t,), ctx, cb)
end

function DSS_NewCircuit(ctx, Value)
    ccall((:ctx_DSS_NewCircuit, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function ActiveClass_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_ActiveClass_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function ActiveClass_Get_AllNames_GR(ctx)
    ccall((:ctx_ActiveClass_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ActiveClass_Get_First(ctx)
    ccall((:ctx_ActiveClass_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function ActiveClass_Get_Next(ctx)
    ccall((:ctx_ActiveClass_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function ActiveClass_Get_Name(ctx)
    ccall((:ctx_ActiveClass_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function ActiveClass_Set_Name(ctx, Value)
    ccall((:ctx_ActiveClass_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function ActiveClass_Get_NumElements(ctx)
    ccall((:ctx_ActiveClass_Get_NumElements, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function ActiveClass_Get_ActiveClassName(ctx)
    ccall((:ctx_ActiveClass_Get_ActiveClassName, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function ActiveClass_Get_Count(ctx)
    ccall((:ctx_ActiveClass_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function ActiveClass_Get_ActiveClassParent(ctx)
    ccall((:ctx_ActiveClass_Get_ActiveClassParent, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function ActiveClass_ToJSON(ctx, options)
    ccall((:ctx_ActiveClass_ToJSON, LIBRARY), Cstring, (Ptr{Cvoid}, Int32,), ctx, options)
end

function Bus_Get_AllPCEatBus(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_AllPCEatBus, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_AllPDEatBus(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_AllPDEatBus, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_Name(ctx)
    ccall((:ctx_Bus_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Bus_Get_NumNodes(ctx)
    ccall((:ctx_Bus_Get_NumNodes, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Bus_Get_SeqVoltages(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_SeqVoltages, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_SeqVoltages_GR(ctx)
    ccall((:ctx_Bus_Get_SeqVoltages_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Voltages(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_Voltages, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_Voltages_GR(ctx)
    ccall((:ctx_Bus_Get_Voltages_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Nodes(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_Nodes, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_Nodes_GR(ctx)
    ccall((:ctx_Bus_Get_Nodes_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Isc(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_Isc, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_Isc_GR(ctx)
    ccall((:ctx_Bus_Get_Isc_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Voc(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_Voc, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_Voc_GR(ctx)
    ccall((:ctx_Bus_Get_Voc_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_kVBase(ctx)
    ccall((:ctx_Bus_Get_kVBase, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Get_puVoltages(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_puVoltages, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_puVoltages_GR(ctx)
    ccall((:ctx_Bus_Get_puVoltages_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Zsc0(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_Zsc0, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_Zsc0_GR(ctx)
    ccall((:ctx_Bus_Get_Zsc0_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Zsc1(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_Zsc1, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_Zsc1_GR(ctx)
    ccall((:ctx_Bus_Get_Zsc1_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_ZscMatrix(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_ZscMatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_ZscMatrix_GR(ctx)
    ccall((:ctx_Bus_Get_ZscMatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_ZscRefresh(ctx)
    ccall((:ctx_Bus_ZscRefresh, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Bus_Get_YscMatrix(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_YscMatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_YscMatrix_GR(ctx)
    ccall((:ctx_Bus_Get_YscMatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Coorddefined(ctx)
    ccall((:ctx_Bus_Get_Coorddefined, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Bus_Get_x(ctx)
    ccall((:ctx_Bus_Get_x, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Set_x(ctx, Value)
    ccall((:ctx_Bus_Set_x, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Bus_Get_y(ctx)
    ccall((:ctx_Bus_Get_y, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Set_y(ctx, Value)
    ccall((:ctx_Bus_Set_y, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Bus_Get_Distance(ctx)
    ccall((:ctx_Bus_Get_Distance, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_GetUniqueNodeNumber(ctx, StartNumber)
    ccall((:ctx_Bus_GetUniqueNodeNumber, LIBRARY), Int32, (Ptr{Cvoid}, Int32,), ctx, StartNumber)
end

function Bus_Get_CplxSeqVoltages(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_CplxSeqVoltages, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_CplxSeqVoltages_GR(ctx)
    ccall((:ctx_Bus_Get_CplxSeqVoltages_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Int_Duration(ctx)
    ccall((:ctx_Bus_Get_Int_Duration, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Lambda(ctx)
    ccall((:ctx_Bus_Get_Lambda, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Cust_Duration(ctx)
    ccall((:ctx_Bus_Get_Cust_Duration, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Cust_Interrupts(ctx)
    ccall((:ctx_Bus_Get_Cust_Interrupts, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Get_N_Customers(ctx)
    ccall((:ctx_Bus_Get_N_Customers, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Bus_Get_N_interrupts(ctx)
    ccall((:ctx_Bus_Get_N_interrupts, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Get_puVLL(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_puVLL, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_puVLL_GR(ctx)
    ccall((:ctx_Bus_Get_puVLL_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_VLL(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_VLL, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_VLL_GR(ctx)
    ccall((:ctx_Bus_Get_VLL_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_puVmagAngle(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_puVmagAngle, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_puVmagAngle_GR(ctx)
    ccall((:ctx_Bus_Get_puVmagAngle_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_VMagAngle(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_VMagAngle, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_VMagAngle_GR(ctx)
    ccall((:ctx_Bus_Get_VMagAngle_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_TotalMiles(ctx)
    ccall((:ctx_Bus_Get_TotalMiles, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Get_SectionID(ctx)
    ccall((:ctx_Bus_Get_SectionID, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Bus_Get_LineList(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_LineList, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_LineList_GR(ctx)
    ccall((:ctx_Bus_Get_LineList_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_LoadList(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_LoadList, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_LoadList_GR(ctx)
    ccall((:ctx_Bus_Get_LoadList_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_ZSC012Matrix(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_ZSC012Matrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_ZSC012Matrix_GR(ctx)
    ccall((:ctx_Bus_Get_ZSC012Matrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Capacitors_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Capacitors_Get_AllNames_GR(ctx)
    ccall((:ctx_Capacitors_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_First(ctx)
    ccall((:ctx_Capacitors_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_IsDelta(ctx)
    ccall((:ctx_Capacitors_Get_IsDelta, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_kV(ctx)
    ccall((:ctx_Capacitors_Get_kV, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_kvar(ctx)
    ccall((:ctx_Capacitors_Get_kvar, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_Name(ctx)
    ccall((:ctx_Capacitors_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_Next(ctx)
    ccall((:ctx_Capacitors_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_NumSteps(ctx)
    ccall((:ctx_Capacitors_Get_NumSteps, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Capacitors_Set_IsDelta(ctx, Value)
    ccall((:ctx_Capacitors_Set_IsDelta, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Capacitors_Set_kV(ctx, Value)
    ccall((:ctx_Capacitors_Set_kV, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Capacitors_Set_kvar(ctx, Value)
    ccall((:ctx_Capacitors_Set_kvar, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Capacitors_Set_Name(ctx, Value)
    ccall((:ctx_Capacitors_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Capacitors_Set_NumSteps(ctx, Value)
    ccall((:ctx_Capacitors_Set_NumSteps, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Capacitors_Get_Count(ctx)
    ccall((:ctx_Capacitors_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Capacitors_AddStep(ctx)
    ccall((:ctx_Capacitors_AddStep, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Capacitors_SubtractStep(ctx)
    ccall((:ctx_Capacitors_SubtractStep, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_AvailableSteps(ctx)
    ccall((:ctx_Capacitors_Get_AvailableSteps, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_States(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Capacitors_Get_States, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Capacitors_Get_States_GR(ctx)
    ccall((:ctx_Capacitors_Get_States_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Capacitors_Set_States(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Capacitors_Set_States, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Int32}, Int32), ctx, ValuePtr, ValueCount)
end

function Capacitors_Open(ctx)
    ccall((:ctx_Capacitors_Open, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Capacitors_Close(ctx)
    ccall((:ctx_Capacitors_Close, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CapControls_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CapControls_Get_AllNames_GR(ctx)
    ccall((:ctx_CapControls_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_Capacitor(ctx)
    ccall((:ctx_CapControls_Get_Capacitor, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_CTratio(ctx)
    ccall((:ctx_CapControls_Get_CTratio, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_DeadTime(ctx)
    ccall((:ctx_CapControls_Get_DeadTime, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_Delay(ctx)
    ccall((:ctx_CapControls_Get_Delay, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_DelayOff(ctx)
    ccall((:ctx_CapControls_Get_DelayOff, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_First(ctx)
    ccall((:ctx_CapControls_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_Mode(ctx)
    ccall((:ctx_CapControls_Get_Mode, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_MonitoredObj(ctx)
    ccall((:ctx_CapControls_Get_MonitoredObj, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_MonitoredTerm(ctx)
    ccall((:ctx_CapControls_Get_MonitoredTerm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_Name(ctx)
    ccall((:ctx_CapControls_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_Next(ctx)
    ccall((:ctx_CapControls_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_OFFSetting(ctx)
    ccall((:ctx_CapControls_Get_OFFSetting, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_ONSetting(ctx)
    ccall((:ctx_CapControls_Get_ONSetting, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_PTratio(ctx)
    ccall((:ctx_CapControls_Get_PTratio, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_UseVoltOverride(ctx)
    ccall((:ctx_CapControls_Get_UseVoltOverride, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_Vmax(ctx)
    ccall((:ctx_CapControls_Get_Vmax, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_Vmin(ctx)
    ccall((:ctx_CapControls_Get_Vmin, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Set_Capacitor(ctx, Value)
    ccall((:ctx_CapControls_Set_Capacitor, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function CapControls_Set_CTratio(ctx, Value)
    ccall((:ctx_CapControls_Set_CTratio, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Set_DeadTime(ctx, Value)
    ccall((:ctx_CapControls_Set_DeadTime, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Set_Delay(ctx, Value)
    ccall((:ctx_CapControls_Set_Delay, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Set_DelayOff(ctx, Value)
    ccall((:ctx_CapControls_Set_DelayOff, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Set_Mode(ctx, Value)
    ccall((:ctx_CapControls_Set_Mode, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CapControls_Set_MonitoredObj(ctx, Value)
    ccall((:ctx_CapControls_Set_MonitoredObj, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function CapControls_Set_MonitoredTerm(ctx, Value)
    ccall((:ctx_CapControls_Set_MonitoredTerm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CapControls_Set_Name(ctx, Value)
    ccall((:ctx_CapControls_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function CapControls_Set_OFFSetting(ctx, Value)
    ccall((:ctx_CapControls_Set_OFFSetting, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Set_ONSetting(ctx, Value)
    ccall((:ctx_CapControls_Set_ONSetting, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Set_PTratio(ctx, Value)
    ccall((:ctx_CapControls_Set_PTratio, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Set_UseVoltOverride(ctx, Value)
    ccall((:ctx_CapControls_Set_UseVoltOverride, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function CapControls_Set_Vmax(ctx, Value)
    ccall((:ctx_CapControls_Set_Vmax, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Set_Vmin(ctx, Value)
    ccall((:ctx_CapControls_Set_Vmin, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Get_Count(ctx)
    ccall((:ctx_CapControls_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CapControls_Reset(ctx)
    ccall((:ctx_CapControls_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_Name(ctx)
    ccall((:ctx_Circuit_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_NumBuses(ctx)
    ccall((:ctx_Circuit_Get_NumBuses, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_NumCktElements(ctx)
    ccall((:ctx_Circuit_Get_NumCktElements, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_NumNodes(ctx)
    ccall((:ctx_Circuit_Get_NumNodes, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_LineLosses(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_LineLosses, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_LineLosses_GR(ctx)
    ccall((:ctx_Circuit_Get_LineLosses_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_Losses(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_Losses, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_Losses_GR(ctx)
    ccall((:ctx_Circuit_Get_Losses_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_AllBusVmag(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllBusVmag, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllBusVmag_GR(ctx)
    ccall((:ctx_Circuit_Get_AllBusVmag_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_AllBusVolts(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllBusVolts, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllBusVolts_GR(ctx)
    ccall((:ctx_Circuit_Get_AllBusVolts_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_AllElementNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllElementNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllElementNames_GR(ctx)
    ccall((:ctx_Circuit_Get_AllElementNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_SubstationLosses(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_SubstationLosses, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_SubstationLosses_GR(ctx)
    ccall((:ctx_Circuit_Get_SubstationLosses_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_TotalPower(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_TotalPower, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_TotalPower_GR(ctx)
    ccall((:ctx_Circuit_Get_TotalPower_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Disable(ctx, Name)
    ccall((:ctx_Circuit_Disable, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Name)
end

function Circuit_Enable(ctx, Name)
    ccall((:ctx_Circuit_Enable, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Name)
end

function Circuit_FirstPCElement(ctx)
    ccall((:ctx_Circuit_FirstPCElement, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_FirstPDElement(ctx)
    ccall((:ctx_Circuit_FirstPDElement, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_NextPCElement(ctx)
    ccall((:ctx_Circuit_NextPCElement, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_NextPDElement(ctx)
    ccall((:ctx_Circuit_NextPDElement, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_AllBusNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllBusNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllBusNames_GR(ctx)
    ccall((:ctx_Circuit_Get_AllBusNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_AllElementLosses(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllElementLosses, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllElementLosses_GR(ctx)
    ccall((:ctx_Circuit_Get_AllElementLosses_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Sample(ctx)
    ccall((:ctx_Circuit_Sample, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_SaveSample(ctx)
    ccall((:ctx_Circuit_SaveSample, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_SetActiveElement(ctx, FullName)
    ccall((:ctx_Circuit_SetActiveElement, LIBRARY), Int32, (Ptr{Cvoid}, Cstring,), ctx, FullName)
end

function Circuit_Capacity(ctx, Start, Increment)
    ccall((:ctx_Circuit_Capacity, LIBRARY), Cdouble, (Ptr{Cvoid}, Cdouble, Cdouble), ctx, Start, Increment)
end

function Circuit_Get_AllBusVmagPu(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllBusVmagPu, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllBusVmagPu_GR(ctx)
    ccall((:ctx_Circuit_Get_AllBusVmagPu_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_SetActiveBus(ctx, BusName)
    ccall((:ctx_Circuit_SetActiveBus, LIBRARY), Int32, (Ptr{Cvoid}, Cstring,), ctx, BusName)
end

function Circuit_SetActiveBusi(ctx, BusIndex)
    ccall((:ctx_Circuit_SetActiveBusi, LIBRARY), Int32, (Ptr{Cvoid}, Int32,), ctx, BusIndex)
end

function Circuit_Get_AllNodeNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllNodeNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllNodeNames_GR(ctx)
    ccall((:ctx_Circuit_Get_AllNodeNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_SystemY(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_SystemY, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_SystemY_GR(ctx)
    ccall((:ctx_Circuit_Get_SystemY_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_AllBusDistances(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllBusDistances, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllBusDistances_GR(ctx)
    ccall((:ctx_Circuit_Get_AllBusDistances_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_AllNodeDistances(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllNodeDistances, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllNodeDistances_GR(ctx)
    ccall((:ctx_Circuit_Get_AllNodeDistances_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_AllNodeDistancesByPhase(ctx, ResultPtr, ResultCount, Phase)
    ccall((:ctx_Circuit_Get_AllNodeDistancesByPhase, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, Phase)
end

function Circuit_Get_AllNodeDistancesByPhase_GR(ctx, Phase)
    ccall((:ctx_Circuit_Get_AllNodeDistancesByPhase_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Phase)
end

function Circuit_Get_AllNodeVmagByPhase(ctx, ResultPtr, ResultCount, Phase)
    ccall((:ctx_Circuit_Get_AllNodeVmagByPhase, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, Phase)
end

function Circuit_Get_AllNodeVmagByPhase_GR(ctx, Phase)
    ccall((:ctx_Circuit_Get_AllNodeVmagByPhase_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Phase)
end

function Circuit_Get_AllNodeVmagPUByPhase(ctx, ResultPtr, ResultCount, Phase)
    ccall((:ctx_Circuit_Get_AllNodeVmagPUByPhase, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, Phase)
end

function Circuit_Get_AllNodeVmagPUByPhase_GR(ctx, Phase)
    ccall((:ctx_Circuit_Get_AllNodeVmagPUByPhase_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Phase)
end

function Circuit_Get_AllNodeNamesByPhase(ctx, ResultPtr, ResultCount, Phase)
    ccall((:ctx_Circuit_Get_AllNodeNamesByPhase, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, Phase)
end

function Circuit_Get_AllNodeNamesByPhase_GR(ctx, Phase)
    ccall((:ctx_Circuit_Get_AllNodeNamesByPhase_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Phase)
end

function Circuit_SetActiveClass(ctx, ClassName)
    ccall((:ctx_Circuit_SetActiveClass, LIBRARY), Int32, (Ptr{Cvoid}, Cstring,), ctx, ClassName)
end

function Circuit_FirstElement(ctx)
    ccall((:ctx_Circuit_FirstElement, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_NextElement(ctx)
    ccall((:ctx_Circuit_NextElement, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_UpdateStorage(ctx)
    ccall((:ctx_Circuit_UpdateStorage, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_ParentPDElement(ctx)
    ccall((:ctx_Circuit_Get_ParentPDElement, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_EndOfTimeStepUpdate(ctx)
    ccall((:ctx_Circuit_EndOfTimeStepUpdate, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_YNodeOrder(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_YNodeOrder, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_YNodeOrder_GR(ctx)
    ccall((:ctx_Circuit_Get_YNodeOrder_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_YCurrents(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_YCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_YCurrents_GR(ctx)
    ccall((:ctx_Circuit_Get_YCurrents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_YNodeVarray(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_YNodeVarray, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_YNodeVarray_GR(ctx)
    ccall((:ctx_Circuit_Get_YNodeVarray_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_SetCktElementName(ctx, Value)
    ccall((:ctx_Circuit_SetCktElementName, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Circuit_SetCktElementIndex(ctx, Value)
    ccall((:ctx_Circuit_SetCktElementIndex, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CktElement_Get_BusNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_BusNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_BusNames_GR(ctx)
    ccall((:ctx_CktElement_Get_BusNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Name(ctx)
    ccall((:ctx_CktElement_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_NumConductors(ctx)
    ccall((:ctx_CktElement_Get_NumConductors, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_NumPhases(ctx)
    ccall((:ctx_CktElement_Get_NumPhases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_NumTerminals(ctx)
    ccall((:ctx_CktElement_Get_NumTerminals, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CktElement_Set_BusNames(ctx, ValuePtr, ValueCount)
    ccall((:ctx_CktElement_Set_BusNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cstring}, Int32), ctx, ValuePtr, ValueCount)
end

function CktElement_Get_Currents(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_Currents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_Currents_GR(ctx)
    ccall((:ctx_CktElement_Get_Currents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Voltages(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_Voltages, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_Voltages_GR(ctx)
    ccall((:ctx_CktElement_Get_Voltages_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_EmergAmps(ctx)
    ccall((:ctx_CktElement_Get_EmergAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Enabled(ctx)
    ccall((:ctx_CktElement_Get_Enabled, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Losses(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_Losses, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_Losses_GR(ctx)
    ccall((:ctx_CktElement_Get_Losses_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_NormalAmps(ctx)
    ccall((:ctx_CktElement_Get_NormalAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_PhaseLosses(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_PhaseLosses, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_PhaseLosses_GR(ctx)
    ccall((:ctx_CktElement_Get_PhaseLosses_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Powers(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_Powers, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_Powers_GR(ctx)
    ccall((:ctx_CktElement_Get_Powers_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_SeqCurrents(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_SeqCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_SeqCurrents_GR(ctx)
    ccall((:ctx_CktElement_Get_SeqCurrents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_SeqPowers(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_SeqPowers, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_SeqPowers_GR(ctx)
    ccall((:ctx_CktElement_Get_SeqPowers_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_SeqVoltages(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_SeqVoltages, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_SeqVoltages_GR(ctx)
    ccall((:ctx_CktElement_Get_SeqVoltages_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Close(ctx, Term, Phs)
    ccall((:ctx_CktElement_Close, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Int32), ctx, Term, Phs)
end

function CktElement_Open(ctx, Term, Phs)
    ccall((:ctx_CktElement_Open, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Int32), ctx, Term, Phs)
end

function CktElement_Set_EmergAmps(ctx, Value)
    ccall((:ctx_CktElement_Set_EmergAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CktElement_Set_Enabled(ctx, Value)
    ccall((:ctx_CktElement_Set_Enabled, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function CktElement_Set_NormalAmps(ctx, Value)
    ccall((:ctx_CktElement_Set_NormalAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CktElement_IsOpen(ctx, Term, Phs)
    ccall((:ctx_CktElement_IsOpen, LIBRARY), UInt16, (Ptr{Cvoid}, Int32, Int32), ctx, Term, Phs)
end

function CktElement_Get_AllPropertyNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_AllPropertyNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_AllPropertyNames_GR(ctx)
    ccall((:ctx_CktElement_Get_AllPropertyNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_NumProperties(ctx)
    ccall((:ctx_CktElement_Get_NumProperties, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Residuals(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_Residuals, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_Residuals_GR(ctx)
    ccall((:ctx_CktElement_Get_Residuals_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Yprim(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_Yprim, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_Yprim_GR(ctx)
    ccall((:ctx_CktElement_Get_Yprim_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_DisplayName(ctx)
    ccall((:ctx_CktElement_Get_DisplayName, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_GUID(ctx)
    ccall((:ctx_CktElement_Get_GUID, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Handle(ctx)
    ccall((:ctx_CktElement_Get_Handle, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CktElement_Set_DisplayName(ctx, Value)
    ccall((:ctx_CktElement_Set_DisplayName, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function CktElement_Get_Controller(ctx, idx)
    ccall((:ctx_CktElement_Get_Controller, LIBRARY), Cstring, (Ptr{Cvoid}, Int32,), ctx, idx)
end

function CktElement_Get_EnergyMeter(ctx)
    ccall((:ctx_CktElement_Get_EnergyMeter, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_HasVoltControl(ctx)
    ccall((:ctx_CktElement_Get_HasVoltControl, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_HasSwitchControl(ctx)
    ccall((:ctx_CktElement_Get_HasSwitchControl, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_CplxSeqVoltages(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_CplxSeqVoltages, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_CplxSeqVoltages_GR(ctx)
    ccall((:ctx_CktElement_Get_CplxSeqVoltages_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_CplxSeqCurrents(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_CplxSeqCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_CplxSeqCurrents_GR(ctx)
    ccall((:ctx_CktElement_Get_CplxSeqCurrents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_AllVariableNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_AllVariableNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_AllVariableNames_GR(ctx)
    ccall((:ctx_CktElement_Get_AllVariableNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_AllVariableValues(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_AllVariableValues, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_AllVariableValues_GR(ctx)
    ccall((:ctx_CktElement_Get_AllVariableValues_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Variable(ctx, MyVarName, Code)
    ccall((:ctx_CktElement_Get_Variable, LIBRARY), Cdouble, (Ptr{Cvoid}, Cstring, Ptr{Int32}), ctx, MyVarName, Code)
end

function CktElement_Set_Variable(ctx, MyVarName, Code, Value)
    ccall((:ctx_CktElement_Set_Variable, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring, Ptr{Int32}, Cdouble), ctx, MyVarName, Code, Value)
end

function CktElement_Get_Variablei(ctx, Idx, Code)
    ccall((:ctx_CktElement_Get_Variablei, LIBRARY), Cdouble, (Ptr{Cvoid}, Int32, Ptr{Int32}), ctx, Idx, Code)
end

function CktElement_Set_Variablei(ctx, Idx, Code, Value)
    ccall((:ctx_CktElement_Set_Variablei, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Ptr{Int32}, Cdouble), ctx, Idx, Code, Value)
end

function CktElement_Get_NodeOrder(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_NodeOrder, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_NodeOrder_GR(ctx)
    ccall((:ctx_CktElement_Get_NodeOrder_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_HasOCPDevice(ctx)
    ccall((:ctx_CktElement_Get_HasOCPDevice, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_NumControls(ctx)
    ccall((:ctx_CktElement_Get_NumControls, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_OCPDevIndex(ctx)
    ccall((:ctx_CktElement_Get_OCPDevIndex, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_OCPDevType(ctx)
    ccall((:ctx_CktElement_Get_OCPDevType, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_CurrentsMagAng(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_CurrentsMagAng, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_CurrentsMagAng_GR(ctx)
    ccall((:ctx_CktElement_Get_CurrentsMagAng_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_VoltagesMagAng(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_VoltagesMagAng, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_VoltagesMagAng_GR(ctx)
    ccall((:ctx_CktElement_Get_VoltagesMagAng_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_IsIsolated(ctx)
    ccall((:ctx_CktElement_Get_IsIsolated, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_TotalPowers(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_TotalPowers, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_TotalPowers_GR(ctx)
    ccall((:ctx_CktElement_Get_TotalPowers_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CmathLib_Get_cmplx(ctx, ResultPtr, ResultCount, RealPart, ImagPart)
    ccall((:ctx_CmathLib_Get_cmplx, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble), ctx, ResultPtr, ResultCount, RealPart, ImagPart)
end

function CmathLib_Get_cmplx_GR(ctx, RealPart, ImagPart)
    ccall((:ctx_CmathLib_Get_cmplx_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble), ctx, RealPart, ImagPart)
end

function CmathLib_Get_cabs(ctx, realpart, imagpart)
    ccall((:ctx_CmathLib_Get_cabs, LIBRARY), Cdouble, (Ptr{Cvoid}, Cdouble, Cdouble), ctx, realpart, imagpart)
end

function CmathLib_Get_cdang(ctx, RealPart, ImagPart)
    ccall((:ctx_CmathLib_Get_cdang, LIBRARY), Cdouble, (Ptr{Cvoid}, Cdouble, Cdouble), ctx, RealPart, ImagPart)
end

function CmathLib_Get_ctopolardeg(ctx, ResultPtr, ResultCount, RealPart, ImagPart)
    ccall((:ctx_CmathLib_Get_ctopolardeg, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble), ctx, ResultPtr, ResultCount, RealPart, ImagPart)
end

function CmathLib_Get_ctopolardeg_GR(ctx, RealPart, ImagPart)
    ccall((:ctx_CmathLib_Get_ctopolardeg_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble), ctx, RealPart, ImagPart)
end

function CmathLib_Get_pdegtocomplex(ctx, ResultPtr, ResultCount, magnitude, angle)
    ccall((:ctx_CmathLib_Get_pdegtocomplex, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble), ctx, ResultPtr, ResultCount, magnitude, angle)
end

function CmathLib_Get_pdegtocomplex_GR(ctx, magnitude, angle)
    ccall((:ctx_CmathLib_Get_pdegtocomplex_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble), ctx, magnitude, angle)
end

function CmathLib_Get_cmul(ctx, ResultPtr, ResultCount, a1, b1, a2, b2)
    ccall((:ctx_CmathLib_Get_cmul, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Cdouble, Cdouble), ctx, ResultPtr, ResultCount, a1, b1, a2, b2)
end

function CmathLib_Get_cmul_GR(ctx, a1, b1, a2, b2)
    ccall((:ctx_CmathLib_Get_cmul_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), ctx, a1, b1, a2, b2)
end

function CmathLib_Get_cdiv(ctx, ResultPtr, ResultCount, a1, b1, a2, b2)
    ccall((:ctx_CmathLib_Get_cdiv, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Cdouble, Cdouble), ctx, ResultPtr, ResultCount, a1, b1, a2, b2)
end

function CmathLib_Get_cdiv_GR(ctx, a1, b1, a2, b2)
    ccall((:ctx_CmathLib_Get_cdiv_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), ctx, a1, b1, a2, b2)
end

function CtrlQueue_ClearQueue(ctx)
    ccall((:ctx_CtrlQueue_ClearQueue, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_Delete(ctx, ActionHandle)
    ccall((:ctx_CtrlQueue_Delete, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, ActionHandle)
end

function CtrlQueue_Get_ActionCode(ctx)
    ccall((:ctx_CtrlQueue_Get_ActionCode, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_Get_DeviceHandle(ctx)
    ccall((:ctx_CtrlQueue_Get_DeviceHandle, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_Get_NumActions(ctx)
    ccall((:ctx_CtrlQueue_Get_NumActions, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_Push(ctx, Hour, Seconds, ActionCode, DeviceHandle)
    ccall((:ctx_CtrlQueue_Push, LIBRARY), Int32, (Ptr{Cvoid}, Int32, Cdouble, Int32, Int32), ctx, Hour, Seconds, ActionCode, DeviceHandle)
end

function CtrlQueue_Show(ctx)
    ccall((:ctx_CtrlQueue_Show, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_ClearActions(ctx)
    ccall((:ctx_CtrlQueue_ClearActions, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_Get_PopAction(ctx)
    ccall((:ctx_CtrlQueue_Get_PopAction, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_Set_Action(ctx, Param1)
    ccall((:ctx_CtrlQueue_Set_Action, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Param1)
end

function CtrlQueue_Get_QueueSize(ctx)
    ccall((:ctx_CtrlQueue_Get_QueueSize, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_DoAllQueue(ctx)
    ccall((:ctx_CtrlQueue_DoAllQueue, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_Get_Queue(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CtrlQueue_Get_Queue, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CtrlQueue_Get_Queue_GR(ctx)
    ccall((:ctx_CtrlQueue_Get_Queue_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSS_Get_NumCircuits(ctx)
    ccall((:ctx_DSS_Get_NumCircuits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function DSS_ClearAll(ctx)
    ccall((:ctx_DSS_ClearAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSS_Get_Version(ctx)
    ccall((:ctx_DSS_Get_Version, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function DSS_Start(ctx, code)
    ccall((:ctx_DSS_Start, LIBRARY), UInt16, (Ptr{Cvoid}, Int32,), ctx, code)
end

function DSS_Get_Classes(ctx, ResultPtr, ResultCount)
    ccall((:ctx_DSS_Get_Classes, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function DSS_Get_Classes_GR(ctx)
    ccall((:ctx_DSS_Get_Classes_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSS_Get_UserClasses(ctx, ResultPtr, ResultCount)
    ccall((:ctx_DSS_Get_UserClasses, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function DSS_Get_UserClasses_GR(ctx)
    ccall((:ctx_DSS_Get_UserClasses_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSS_Get_NumClasses(ctx)
    ccall((:ctx_DSS_Get_NumClasses, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function DSS_Get_NumUserClasses(ctx)
    ccall((:ctx_DSS_Get_NumUserClasses, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function DSS_Get_DataPath(ctx)
    ccall((:ctx_DSS_Get_DataPath, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function DSS_Set_DataPath(ctx, Value)
    ccall((:ctx_DSS_Set_DataPath, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function DSS_Reset(ctx)
    ccall((:ctx_DSS_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSS_Get_DefaultEditor(ctx)
    ccall((:ctx_DSS_Get_DefaultEditor, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function DSS_SetActiveClass(ctx, ClassName)
    ccall((:ctx_DSS_SetActiveClass, LIBRARY), Int32, (Ptr{Cvoid}, Cstring,), ctx, ClassName)
end

function DSS_Get_AllowForms(ctx)
    ccall((:ctx_DSS_Get_AllowForms, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function DSS_Set_AllowForms(ctx, Value)
    ccall((:ctx_DSS_Set_AllowForms, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function DSS_Get_AllowEditor(ctx)
    ccall((:ctx_DSS_Get_AllowEditor, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function DSS_Set_AllowEditor(ctx, Value)
    ccall((:ctx_DSS_Set_AllowEditor, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function DSS_Get_LegacyModels(ctx)
    ccall((:ctx_DSS_Get_LegacyModels, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function DSS_Set_LegacyModels(ctx, Value)
    ccall((:ctx_DSS_Set_LegacyModels, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function DSS_Get_AllowDOScmd(ctx)
    ccall((:ctx_DSS_Get_AllowDOScmd, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function DSS_Set_AllowDOScmd(ctx, Value)
    ccall((:ctx_DSS_Set_AllowDOScmd, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function DSS_Get_AllowChangeDir(ctx)
    ccall((:ctx_DSS_Get_AllowChangeDir, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function DSS_Set_AllowChangeDir(ctx, Value)
    ccall((:ctx_DSS_Set_AllowChangeDir, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function DSS_Get_COMErrorResults(ctx)
    ccall((:ctx_DSS_Get_COMErrorResults, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function DSS_Set_COMErrorResults(ctx, Value)
    ccall((:ctx_DSS_Set_COMErrorResults, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function DSSElement_Get_AllPropertyNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_DSSElement_Get_AllPropertyNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function DSSElement_Get_AllPropertyNames_GR(ctx)
    ccall((:ctx_DSSElement_Get_AllPropertyNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSSElement_Get_Name(ctx)
    ccall((:ctx_DSSElement_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function DSSElement_Get_NumProperties(ctx)
    ccall((:ctx_DSSElement_Get_NumProperties, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function DSSElement_ToJSON(ctx, options)
    ccall((:ctx_DSSElement_ToJSON, LIBRARY), Cstring, (Ptr{Cvoid}, Int32,), ctx, options)
end

function DSSimComs_BusVoltagepu(ctx, ResultPtr, ResultCount, Index)
    ccall((:ctx_DSSimComs_BusVoltagepu, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Csize_t), ctx, ResultPtr, ResultCount, Index)
end

function DSSimComs_BusVoltagepu_GR(ctx, Index)
    ccall((:ctx_DSSimComs_BusVoltagepu_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Csize_t,), ctx, Index)
end

function DSSimComs_BusVoltage(ctx, ResultPtr, ResultCount, Index)
    ccall((:ctx_DSSimComs_BusVoltage, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Csize_t), ctx, ResultPtr, ResultCount, Index)
end

function DSSimComs_BusVoltage_GR(ctx, Index)
    ccall((:ctx_DSSimComs_BusVoltage_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Csize_t,), ctx, Index)
end

function DSSProgress_Close(ctx)
    ccall((:ctx_DSSProgress_Close, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSSProgress_Set_Caption(ctx, Value)
    ccall((:ctx_DSSProgress_Set_Caption, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function DSSProgress_Set_PctProgress(ctx, Value)
    ccall((:ctx_DSSProgress_Set_PctProgress, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function DSSProgress_Show(ctx)
    ccall((:ctx_DSSProgress_Show, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSSProperty_Get_Description(ctx)
    ccall((:ctx_DSSProperty_Get_Description, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function DSSProperty_Get_Name(ctx)
    ccall((:ctx_DSSProperty_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function DSSProperty_Get_Val(ctx)
    ccall((:ctx_DSSProperty_Get_Val, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function DSSProperty_Set_Val(ctx, Value)
    ccall((:ctx_DSSProperty_Set_Val, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function DSSProperty_Set_Name(ctx, Value)
    ccall((:ctx_DSSProperty_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function DSSProperty_Set_Index(ctx, Value)
    ccall((:ctx_DSSProperty_Set_Index, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function DSS_Executive_Get_Command(ctx, i)
    ccall((:ctx_DSS_Executive_Get_Command, LIBRARY), Cstring, (Ptr{Cvoid}, Int32,), ctx, i)
end

function DSS_Executive_Get_NumCommands(ctx)
    ccall((:ctx_DSS_Executive_Get_NumCommands, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function DSS_Executive_Get_NumOptions(ctx)
    ccall((:ctx_DSS_Executive_Get_NumOptions, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function DSS_Executive_Get_Option(ctx, i)
    ccall((:ctx_DSS_Executive_Get_Option, LIBRARY), Cstring, (Ptr{Cvoid}, Int32,), ctx, i)
end

function DSS_Executive_Get_CommandHelp(ctx, i)
    ccall((:ctx_DSS_Executive_Get_CommandHelp, LIBRARY), Cstring, (Ptr{Cvoid}, Int32,), ctx, i)
end

function DSS_Executive_Get_OptionHelp(ctx, i)
    ccall((:ctx_DSS_Executive_Get_OptionHelp, LIBRARY), Cstring, (Ptr{Cvoid}, Int32,), ctx, i)
end

function DSS_Executive_Get_OptionValue(ctx, i)
    ccall((:ctx_DSS_Executive_Get_OptionValue, LIBRARY), Cstring, (Ptr{Cvoid}, Int32,), ctx, i)
end

function Error_Get_Description(ctx)
    ccall((:ctx_Error_Get_Description, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Error_Get_Number(ctx)
    ccall((:ctx_Error_Get_Number, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Error_Get_NumberPtr(ctx)
    ccall((:ctx_Error_Get_NumberPtr, LIBRARY), Ptr{Int32}, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Fuses_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Fuses_Get_AllNames_GR(ctx)
    ccall((:ctx_Fuses_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_Count(ctx)
    ccall((:ctx_Fuses_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_First(ctx)
    ccall((:ctx_Fuses_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_Name(ctx)
    ccall((:ctx_Fuses_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_Next(ctx)
    ccall((:ctx_Fuses_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Fuses_Set_Name(ctx, Value)
    ccall((:ctx_Fuses_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Fuses_Get_MonitoredObj(ctx)
    ccall((:ctx_Fuses_Get_MonitoredObj, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_MonitoredTerm(ctx)
    ccall((:ctx_Fuses_Get_MonitoredTerm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_SwitchedObj(ctx)
    ccall((:ctx_Fuses_Get_SwitchedObj, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Fuses_Set_MonitoredObj(ctx, Value)
    ccall((:ctx_Fuses_Set_MonitoredObj, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Fuses_Set_MonitoredTerm(ctx, Value)
    ccall((:ctx_Fuses_Set_MonitoredTerm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Fuses_Set_SwitchedObj(ctx, Value)
    ccall((:ctx_Fuses_Set_SwitchedObj, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Fuses_Get_SwitchedTerm(ctx)
    ccall((:ctx_Fuses_Get_SwitchedTerm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Fuses_Set_SwitchedTerm(ctx, Value)
    ccall((:ctx_Fuses_Set_SwitchedTerm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Fuses_Get_TCCcurve(ctx)
    ccall((:ctx_Fuses_Get_TCCcurve, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Fuses_Set_TCCcurve(ctx, Value)
    ccall((:ctx_Fuses_Set_TCCcurve, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Fuses_Get_RatedCurrent(ctx)
    ccall((:ctx_Fuses_Get_RatedCurrent, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Fuses_Set_RatedCurrent(ctx, Value)
    ccall((:ctx_Fuses_Set_RatedCurrent, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Fuses_Get_Delay(ctx)
    ccall((:ctx_Fuses_Get_Delay, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Fuses_Open(ctx)
    ccall((:ctx_Fuses_Open, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Fuses_Close(ctx)
    ccall((:ctx_Fuses_Close, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Fuses_Set_Delay(ctx, Value)
    ccall((:ctx_Fuses_Set_Delay, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Fuses_IsBlown(ctx)
    ccall((:ctx_Fuses_IsBlown, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_idx(ctx)
    ccall((:ctx_Fuses_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Fuses_Set_idx(ctx, Value)
    ccall((:ctx_Fuses_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Fuses_Reset(ctx)
    ccall((:ctx_Fuses_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_State(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Fuses_Get_State, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Fuses_Set_State(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Fuses_Set_State, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cstring}, Int32), ctx, ValuePtr, ValueCount)
end

function Fuses_Get_NormalState(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Fuses_Get_NormalState, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Fuses_Set_NormalState(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Fuses_Set_NormalState, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cstring}, Int32), ctx, ValuePtr, ValueCount)
end

function Fuses_Get_NumPhases(ctx)
    ccall((:ctx_Fuses_Get_NumPhases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Generators_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Generators_Get_AllNames_GR(ctx)
    ccall((:ctx_Generators_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Generators_Get_First(ctx)
    ccall((:ctx_Generators_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Get_Name(ctx)
    ccall((:ctx_Generators_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Generators_Get_Next(ctx)
    ccall((:ctx_Generators_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Get_RegisterNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Generators_Get_RegisterNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Generators_Get_RegisterNames_GR(ctx)
    ccall((:ctx_Generators_Get_RegisterNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Generators_Get_RegisterValues(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Generators_Get_RegisterValues, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Generators_Get_RegisterValues_GR(ctx)
    ccall((:ctx_Generators_Get_RegisterValues_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Generators_Get_ForcedON(ctx)
    ccall((:ctx_Generators_Get_ForcedON, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Generators_Set_ForcedON(ctx, Value)
    ccall((:ctx_Generators_Set_ForcedON, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Generators_Set_Name(ctx, Value)
    ccall((:ctx_Generators_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Generators_Get_kV(ctx)
    ccall((:ctx_Generators_Get_kV, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Generators_Get_kvar(ctx)
    ccall((:ctx_Generators_Get_kvar, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Generators_Get_kW(ctx)
    ccall((:ctx_Generators_Get_kW, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Generators_Get_PF(ctx)
    ccall((:ctx_Generators_Get_PF, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Generators_Get_Phases(ctx)
    ccall((:ctx_Generators_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Set_kV(ctx, Value)
    ccall((:ctx_Generators_Set_kV, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Generators_Set_kvar(ctx, Value)
    ccall((:ctx_Generators_Set_kvar, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Generators_Set_kW(ctx, Value)
    ccall((:ctx_Generators_Set_kW, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Generators_Set_PF(ctx, Value)
    ccall((:ctx_Generators_Set_PF, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Generators_Set_Phases(ctx, Value)
    ccall((:ctx_Generators_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Generators_Get_Count(ctx)
    ccall((:ctx_Generators_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Get_idx(ctx)
    ccall((:ctx_Generators_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Set_idx(ctx, Value)
    ccall((:ctx_Generators_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Generators_Get_Model(ctx)
    ccall((:ctx_Generators_Get_Model, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Set_Model(ctx, Value)
    ccall((:ctx_Generators_Set_Model, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Generators_Get_kVArated(ctx)
    ccall((:ctx_Generators_Get_kVArated, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Generators_Set_kVArated(ctx, Value)
    ccall((:ctx_Generators_Set_kVArated, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Generators_Get_Vmaxpu(ctx)
    ccall((:ctx_Generators_Get_Vmaxpu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Generators_Get_Vminpu(ctx)
    ccall((:ctx_Generators_Get_Vminpu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Generators_Set_Vmaxpu(ctx, Value)
    ccall((:ctx_Generators_Set_Vmaxpu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Generators_Set_Vminpu(ctx, Value)
    ccall((:ctx_Generators_Set_Vminpu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Generators_Get_daily(ctx)
    ccall((:ctx_Generators_Get_daily, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Generators_Set_daily(ctx, Value)
    ccall((:ctx_Generators_Set_daily, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Generators_Get_duty(ctx)
    ccall((:ctx_Generators_Get_duty, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Generators_Set_duty(ctx, Value)
    ccall((:ctx_Generators_Set_duty, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Generators_Get_Yearly(ctx)
    ccall((:ctx_Generators_Get_Yearly, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Generators_Set_Yearly(ctx, Value)
    ccall((:ctx_Generators_Set_Yearly, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Generators_Get_Status(ctx)
    ccall((:ctx_Generators_Get_Status, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Set_Status(ctx, Value)
    ccall((:ctx_Generators_Set_Status, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Generators_Get_IsDelta(ctx)
    ccall((:ctx_Generators_Get_IsDelta, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Generators_Set_IsDelta(ctx, Value)
    ccall((:ctx_Generators_Set_IsDelta, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Generators_Get_kva(ctx)
    ccall((:ctx_Generators_Get_kva, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Generators_Set_kva(ctx, Value)
    ccall((:ctx_Generators_Set_kva, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Generators_Get_Class_(ctx)
    ccall((:ctx_Generators_Get_Class_, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Set_Class_(ctx, Value)
    ccall((:ctx_Generators_Set_Class_, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Generators_Get_Bus1(ctx)
    ccall((:ctx_Generators_Get_Bus1, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Generators_Set_Bus1(ctx, Value)
    ccall((:ctx_Generators_Set_Bus1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function GICSources_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_GICSources_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function GICSources_Get_AllNames_GR(ctx)
    ccall((:ctx_GICSources_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function GICSources_Get_Count(ctx)
    ccall((:ctx_GICSources_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function GICSources_Get_First(ctx)
    ccall((:ctx_GICSources_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function GICSources_Get_Next(ctx)
    ccall((:ctx_GICSources_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function GICSources_Get_Name(ctx)
    ccall((:ctx_GICSources_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_Name(ctx, Value)
    ccall((:ctx_GICSources_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function GICSources_Get_Phases(ctx)
    ccall((:ctx_GICSources_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_Phases(ctx, Value)
    ccall((:ctx_GICSources_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function GICSources_Get_Bus1(ctx)
    ccall((:ctx_GICSources_Get_Bus1, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function GICSources_Get_Bus2(ctx)
    ccall((:ctx_GICSources_Get_Bus2, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function GICSources_Get_EN(ctx)
    ccall((:ctx_GICSources_Get_EN, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_EN(ctx, Value)
    ccall((:ctx_GICSources_Set_EN, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function GICSources_Get_EE(ctx)
    ccall((:ctx_GICSources_Get_EE, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_EE(ctx, Value)
    ccall((:ctx_GICSources_Set_EE, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function GICSources_Get_Lat1(ctx)
    ccall((:ctx_GICSources_Get_Lat1, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_Lat1(ctx, Value)
    ccall((:ctx_GICSources_Set_Lat1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function GICSources_Get_Lat2(ctx)
    ccall((:ctx_GICSources_Get_Lat2, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_Lat2(ctx, Value)
    ccall((:ctx_GICSources_Set_Lat2, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function GICSources_Get_Lon1(ctx)
    ccall((:ctx_GICSources_Get_Lon1, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_Lon1(ctx, Value)
    ccall((:ctx_GICSources_Set_Lon1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function GICSources_Get_Lon2(ctx)
    ccall((:ctx_GICSources_Get_Lon2, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_Lon2(ctx, Value)
    ccall((:ctx_GICSources_Set_Lon2, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function GICSources_Get_Volts(ctx)
    ccall((:ctx_GICSources_Get_Volts, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_Volts(ctx, Value)
    ccall((:ctx_GICSources_Set_Volts, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function ISources_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_ISources_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function ISources_Get_AllNames_GR(ctx)
    ccall((:ctx_ISources_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ISources_Get_Count(ctx)
    ccall((:ctx_ISources_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function ISources_Get_First(ctx)
    ccall((:ctx_ISources_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function ISources_Get_Next(ctx)
    ccall((:ctx_ISources_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function ISources_Get_Name(ctx)
    ccall((:ctx_ISources_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function ISources_Set_Name(ctx, Value)
    ccall((:ctx_ISources_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function ISources_Get_Amps(ctx)
    ccall((:ctx_ISources_Get_Amps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function ISources_Set_Amps(ctx, Value)
    ccall((:ctx_ISources_Set_Amps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function ISources_Get_AngleDeg(ctx)
    ccall((:ctx_ISources_Get_AngleDeg, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function ISources_Get_Frequency(ctx)
    ccall((:ctx_ISources_Get_Frequency, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function ISources_Set_AngleDeg(ctx, Value)
    ccall((:ctx_ISources_Set_AngleDeg, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function ISources_Set_Frequency(ctx, Value)
    ccall((:ctx_ISources_Set_Frequency, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Get_Count(ctx)
    ccall((:ctx_LineCodes_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineCodes_Get_First(ctx)
    ccall((:ctx_LineCodes_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineCodes_Get_Next(ctx)
    ccall((:ctx_LineCodes_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineCodes_Get_Name(ctx)
    ccall((:ctx_LineCodes_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_Name(ctx, Value)
    ccall((:ctx_LineCodes_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function LineCodes_Get_IsZ1Z0(ctx)
    ccall((:ctx_LineCodes_Get_IsZ1Z0, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function LineCodes_Get_Units(ctx)
    ccall((:ctx_LineCodes_Get_Units, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_Units(ctx, Value)
    ccall((:ctx_LineCodes_Set_Units, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineCodes_Get_Phases(ctx)
    ccall((:ctx_LineCodes_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_Phases(ctx, Value)
    ccall((:ctx_LineCodes_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineCodes_Get_R1(ctx)
    ccall((:ctx_LineCodes_Get_R1, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_R1(ctx, Value)
    ccall((:ctx_LineCodes_Set_R1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Get_X1(ctx)
    ccall((:ctx_LineCodes_Get_X1, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_X1(ctx, Value)
    ccall((:ctx_LineCodes_Set_X1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Get_R0(ctx)
    ccall((:ctx_LineCodes_Get_R0, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineCodes_Get_X0(ctx)
    ccall((:ctx_LineCodes_Get_X0, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_R0(ctx, Value)
    ccall((:ctx_LineCodes_Set_R0, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Set_X0(ctx, Value)
    ccall((:ctx_LineCodes_Set_X0, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Get_C0(ctx)
    ccall((:ctx_LineCodes_Get_C0, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineCodes_Get_C1(ctx)
    ccall((:ctx_LineCodes_Get_C1, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_C0(ctx, Value)
    ccall((:ctx_LineCodes_Set_C0, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Set_C1(ctx, Value)
    ccall((:ctx_LineCodes_Set_C1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Get_Cmatrix(ctx, ResultPtr, ResultCount)
    ccall((:ctx_LineCodes_Get_Cmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineCodes_Get_Cmatrix_GR(ctx)
    ccall((:ctx_LineCodes_Get_Cmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineCodes_Get_Rmatrix(ctx, ResultPtr, ResultCount)
    ccall((:ctx_LineCodes_Get_Rmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineCodes_Get_Rmatrix_GR(ctx)
    ccall((:ctx_LineCodes_Get_Rmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineCodes_Get_Xmatrix(ctx, ResultPtr, ResultCount)
    ccall((:ctx_LineCodes_Get_Xmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineCodes_Get_Xmatrix_GR(ctx)
    ccall((:ctx_LineCodes_Get_Xmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_Cmatrix(ctx, ValuePtr, ValueCount)
    ccall((:ctx_LineCodes_Set_Cmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LineCodes_Set_Rmatrix(ctx, ValuePtr, ValueCount)
    ccall((:ctx_LineCodes_Set_Rmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LineCodes_Set_Xmatrix(ctx, ValuePtr, ValueCount)
    ccall((:ctx_LineCodes_Set_Xmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LineCodes_Get_NormAmps(ctx)
    ccall((:ctx_LineCodes_Get_NormAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_NormAmps(ctx, Value)
    ccall((:ctx_LineCodes_Set_NormAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Get_EmergAmps(ctx)
    ccall((:ctx_LineCodes_Get_EmergAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_EmergAmps(ctx, Value)
    ccall((:ctx_LineCodes_Set_EmergAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_LineCodes_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineCodes_Get_AllNames_GR(ctx)
    ccall((:ctx_LineCodes_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Lines_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Lines_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Lines_Get_AllNames_GR(ctx)
    ccall((:ctx_Lines_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Bus1(ctx)
    ccall((:ctx_Lines_Get_Bus1, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Bus2(ctx)
    ccall((:ctx_Lines_Get_Bus2, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Lines_Get_First(ctx)
    ccall((:ctx_Lines_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Length(ctx)
    ccall((:ctx_Lines_Get_Length, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_LineCode(ctx)
    ccall((:ctx_Lines_Get_LineCode, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Name(ctx)
    ccall((:ctx_Lines_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Next(ctx)
    ccall((:ctx_Lines_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Phases(ctx)
    ccall((:ctx_Lines_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Get_R1(ctx)
    ccall((:ctx_Lines_Get_R1, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_X1(ctx)
    ccall((:ctx_Lines_Get_X1, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_New(ctx, Name)
    ccall((:ctx_Lines_New, LIBRARY), Int32, (Ptr{Cvoid}, Cstring,), ctx, Name)
end

function Lines_Set_Bus1(ctx, Value)
    ccall((:ctx_Lines_Set_Bus1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Lines_Set_Bus2(ctx, Value)
    ccall((:ctx_Lines_Set_Bus2, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Lines_Set_Length(ctx, Value)
    ccall((:ctx_Lines_Set_Length, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_LineCode(ctx, Value)
    ccall((:ctx_Lines_Set_LineCode, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Lines_Set_Name(ctx, Value)
    ccall((:ctx_Lines_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Lines_Set_Phases(ctx, Value)
    ccall((:ctx_Lines_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Lines_Set_R1(ctx, Value)
    ccall((:ctx_Lines_Set_R1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_X1(ctx, Value)
    ccall((:ctx_Lines_Set_X1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Get_C0(ctx)
    ccall((:ctx_Lines_Get_C0, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_C1(ctx)
    ccall((:ctx_Lines_Get_C1, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Cmatrix(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Lines_Get_Cmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Lines_Get_Cmatrix_GR(ctx)
    ccall((:ctx_Lines_Get_Cmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Lines_Get_R0(ctx)
    ccall((:ctx_Lines_Get_R0, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Rmatrix(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Lines_Get_Rmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Lines_Get_Rmatrix_GR(ctx)
    ccall((:ctx_Lines_Get_Rmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Lines_Get_X0(ctx)
    ccall((:ctx_Lines_Get_X0, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Xmatrix(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Lines_Get_Xmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Lines_Get_Xmatrix_GR(ctx)
    ccall((:ctx_Lines_Get_Xmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Lines_Set_C0(ctx, Value)
    ccall((:ctx_Lines_Set_C0, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_C1(ctx, Value)
    ccall((:ctx_Lines_Set_C1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_Cmatrix(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Lines_Set_Cmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Lines_Set_R0(ctx, Value)
    ccall((:ctx_Lines_Set_R0, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_Rmatrix(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Lines_Set_Rmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Lines_Set_X0(ctx, Value)
    ccall((:ctx_Lines_Set_X0, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_Xmatrix(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Lines_Set_Xmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Lines_Get_EmergAmps(ctx)
    ccall((:ctx_Lines_Get_EmergAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_NormAmps(ctx)
    ccall((:ctx_Lines_Get_NormAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Set_EmergAmps(ctx, Value)
    ccall((:ctx_Lines_Set_EmergAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_NormAmps(ctx, Value)
    ccall((:ctx_Lines_Set_NormAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Get_Geometry(ctx)
    ccall((:ctx_Lines_Get_Geometry, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Lines_Set_Geometry(ctx, Value)
    ccall((:ctx_Lines_Set_Geometry, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Lines_Get_Rg(ctx)
    ccall((:ctx_Lines_Get_Rg, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Rho(ctx)
    ccall((:ctx_Lines_Get_Rho, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Xg(ctx)
    ccall((:ctx_Lines_Get_Xg, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Set_Rg(ctx, Value)
    ccall((:ctx_Lines_Set_Rg, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_Rho(ctx, Value)
    ccall((:ctx_Lines_Set_Rho, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_Xg(ctx, Value)
    ccall((:ctx_Lines_Set_Xg, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Get_Yprim(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Lines_Get_Yprim, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Lines_Get_Yprim_GR(ctx)
    ccall((:ctx_Lines_Get_Yprim_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Lines_Set_Yprim(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Lines_Set_Yprim, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Lines_Get_NumCust(ctx)
    ccall((:ctx_Lines_Get_NumCust, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Get_TotalCust(ctx)
    ccall((:ctx_Lines_Get_TotalCust, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Parent(ctx)
    ccall((:ctx_Lines_Get_Parent, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Count(ctx)
    ccall((:ctx_Lines_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Spacing(ctx)
    ccall((:ctx_Lines_Get_Spacing, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Lines_Set_Spacing(ctx, Value)
    ccall((:ctx_Lines_Set_Spacing, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Lines_Get_Units(ctx)
    ccall((:ctx_Lines_Get_Units, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Set_Units(ctx, Value)
    ccall((:ctx_Lines_Set_Units, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Lines_Get_SeasonRating(ctx)
    ccall((:ctx_Lines_Get_SeasonRating, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_IsSwitch(ctx)
    ccall((:ctx_Lines_Get_IsSwitch, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Lines_Set_IsSwitch(ctx, Value)
    ccall((:ctx_Lines_Set_IsSwitch, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Loads_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Loads_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Loads_Get_AllNames_GR(ctx)
    ccall((:ctx_Loads_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Loads_Get_First(ctx)
    ccall((:ctx_Loads_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Get_idx(ctx)
    ccall((:ctx_Loads_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Name(ctx)
    ccall((:ctx_Loads_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Next(ctx)
    ccall((:ctx_Loads_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Set_idx(ctx, Value)
    ccall((:ctx_Loads_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Loads_Set_Name(ctx, Value)
    ccall((:ctx_Loads_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Loads_Get_kV(ctx)
    ccall((:ctx_Loads_Get_kV, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_kvar(ctx)
    ccall((:ctx_Loads_Get_kvar, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_kW(ctx)
    ccall((:ctx_Loads_Get_kW, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_PF(ctx)
    ccall((:ctx_Loads_Get_PF, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Set_kV(ctx, Value)
    ccall((:ctx_Loads_Set_kV, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_kvar(ctx, Value)
    ccall((:ctx_Loads_Set_kvar, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_kW(ctx, Value)
    ccall((:ctx_Loads_Set_kW, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_PF(ctx, Value)
    ccall((:ctx_Loads_Set_PF, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Get_Count(ctx)
    ccall((:ctx_Loads_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Get_AllocationFactor(ctx)
    ccall((:ctx_Loads_Get_AllocationFactor, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Cfactor(ctx)
    ccall((:ctx_Loads_Get_Cfactor, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Class_(ctx)
    ccall((:ctx_Loads_Get_Class_, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Get_CVRcurve(ctx)
    ccall((:ctx_Loads_Get_CVRcurve, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Loads_Get_CVRvars(ctx)
    ccall((:ctx_Loads_Get_CVRvars, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_CVRwatts(ctx)
    ccall((:ctx_Loads_Get_CVRwatts, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_daily(ctx)
    ccall((:ctx_Loads_Get_daily, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Loads_Get_duty(ctx)
    ccall((:ctx_Loads_Get_duty, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Growth(ctx)
    ccall((:ctx_Loads_Get_Growth, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Loads_Get_IsDelta(ctx)
    ccall((:ctx_Loads_Get_IsDelta, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Loads_Get_kva(ctx)
    ccall((:ctx_Loads_Get_kva, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_kwh(ctx)
    ccall((:ctx_Loads_Get_kwh, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_kwhdays(ctx)
    ccall((:ctx_Loads_Get_kwhdays, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Model(ctx)
    ccall((:ctx_Loads_Get_Model, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Get_NumCust(ctx)
    ccall((:ctx_Loads_Get_NumCust, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Get_PctMean(ctx)
    ccall((:ctx_Loads_Get_PctMean, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_PctStdDev(ctx)
    ccall((:ctx_Loads_Get_PctStdDev, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Rneut(ctx)
    ccall((:ctx_Loads_Get_Rneut, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Spectrum(ctx)
    ccall((:ctx_Loads_Get_Spectrum, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Status(ctx)
    ccall((:ctx_Loads_Get_Status, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Vmaxpu(ctx)
    ccall((:ctx_Loads_Get_Vmaxpu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Vminemerg(ctx)
    ccall((:ctx_Loads_Get_Vminemerg, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Vminnorm(ctx)
    ccall((:ctx_Loads_Get_Vminnorm, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Vminpu(ctx)
    ccall((:ctx_Loads_Get_Vminpu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_xfkVA(ctx)
    ccall((:ctx_Loads_Get_xfkVA, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Xneut(ctx)
    ccall((:ctx_Loads_Get_Xneut, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Yearly(ctx)
    ccall((:ctx_Loads_Get_Yearly, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Loads_Set_AllocationFactor(ctx, Value)
    ccall((:ctx_Loads_Set_AllocationFactor, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Cfactor(ctx, Value)
    ccall((:ctx_Loads_Set_Cfactor, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Class_(ctx, Value)
    ccall((:ctx_Loads_Set_Class_, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Loads_Set_CVRcurve(ctx, Value)
    ccall((:ctx_Loads_Set_CVRcurve, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Loads_Set_CVRvars(ctx, Value)
    ccall((:ctx_Loads_Set_CVRvars, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_CVRwatts(ctx, Value)
    ccall((:ctx_Loads_Set_CVRwatts, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_daily(ctx, Value)
    ccall((:ctx_Loads_Set_daily, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Loads_Set_duty(ctx, Value)
    ccall((:ctx_Loads_Set_duty, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Loads_Set_Growth(ctx, Value)
    ccall((:ctx_Loads_Set_Growth, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Loads_Set_IsDelta(ctx, Value)
    ccall((:ctx_Loads_Set_IsDelta, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Loads_Set_kva(ctx, Value)
    ccall((:ctx_Loads_Set_kva, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_kwh(ctx, Value)
    ccall((:ctx_Loads_Set_kwh, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_kwhdays(ctx, Value)
    ccall((:ctx_Loads_Set_kwhdays, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Model(ctx, Value)
    ccall((:ctx_Loads_Set_Model, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Loads_Set_NumCust(ctx, Value)
    ccall((:ctx_Loads_Set_NumCust, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Loads_Set_PctMean(ctx, Value)
    ccall((:ctx_Loads_Set_PctMean, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_PctStdDev(ctx, Value)
    ccall((:ctx_Loads_Set_PctStdDev, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Rneut(ctx, Value)
    ccall((:ctx_Loads_Set_Rneut, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Spectrum(ctx, Value)
    ccall((:ctx_Loads_Set_Spectrum, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Loads_Set_Status(ctx, Value)
    ccall((:ctx_Loads_Set_Status, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Loads_Set_Vmaxpu(ctx, Value)
    ccall((:ctx_Loads_Set_Vmaxpu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Vminemerg(ctx, Value)
    ccall((:ctx_Loads_Set_Vminemerg, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Vminnorm(ctx, Value)
    ccall((:ctx_Loads_Set_Vminnorm, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Vminpu(ctx, Value)
    ccall((:ctx_Loads_Set_Vminpu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_xfkVA(ctx, Value)
    ccall((:ctx_Loads_Set_xfkVA, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Xneut(ctx, Value)
    ccall((:ctx_Loads_Set_Xneut, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Yearly(ctx, Value)
    ccall((:ctx_Loads_Set_Yearly, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Loads_Get_ZIPV(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Loads_Get_ZIPV, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Loads_Get_ZIPV_GR(ctx)
    ccall((:ctx_Loads_Get_ZIPV_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Loads_Set_ZIPV(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Loads_Set_ZIPV, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Loads_Get_pctSeriesRL(ctx)
    ccall((:ctx_Loads_Get_pctSeriesRL, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Set_pctSeriesRL(ctx, Value)
    ccall((:ctx_Loads_Set_pctSeriesRL, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Get_RelWeight(ctx)
    ccall((:ctx_Loads_Get_RelWeight, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Set_RelWeight(ctx, Value)
    ccall((:ctx_Loads_Set_RelWeight, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Get_Sensor(ctx)
    ccall((:ctx_Loads_Get_Sensor, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_Name(ctx)
    ccall((:ctx_LoadShapes_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_Name(ctx, Value)
    ccall((:ctx_LoadShapes_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function LoadShapes_Get_Count(ctx)
    ccall((:ctx_LoadShapes_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_First(ctx)
    ccall((:ctx_LoadShapes_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_Next(ctx)
    ccall((:ctx_LoadShapes_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_LoadShapes_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LoadShapes_Get_AllNames_GR(ctx)
    ccall((:ctx_LoadShapes_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_Npts(ctx)
    ccall((:ctx_LoadShapes_Get_Npts, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_Pmult(ctx, ResultPtr, ResultCount)
    ccall((:ctx_LoadShapes_Get_Pmult, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LoadShapes_Get_Pmult_GR(ctx)
    ccall((:ctx_LoadShapes_Get_Pmult_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_Qmult(ctx, ResultPtr, ResultCount)
    ccall((:ctx_LoadShapes_Get_Qmult, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LoadShapes_Get_Qmult_GR(ctx)
    ccall((:ctx_LoadShapes_Get_Qmult_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_Npts(ctx, Value)
    ccall((:ctx_LoadShapes_Set_Npts, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LoadShapes_Set_Pmult(ctx, ValuePtr, ValueCount)
    ccall((:ctx_LoadShapes_Set_Pmult, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LoadShapes_Set_Qmult(ctx, ValuePtr, ValueCount)
    ccall((:ctx_LoadShapes_Set_Qmult, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LoadShapes_Normalize(ctx)
    ccall((:ctx_LoadShapes_Normalize, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_TimeArray(ctx, ResultPtr, ResultCount)
    ccall((:ctx_LoadShapes_Get_TimeArray, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LoadShapes_Get_TimeArray_GR(ctx)
    ccall((:ctx_LoadShapes_Get_TimeArray_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_TimeArray(ctx, ValuePtr, ValueCount)
    ccall((:ctx_LoadShapes_Set_TimeArray, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LoadShapes_Get_HrInterval(ctx)
    ccall((:ctx_LoadShapes_Get_HrInterval, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_MinInterval(ctx)
    ccall((:ctx_LoadShapes_Get_MinInterval, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_SInterval(ctx)
    ccall((:ctx_LoadShapes_Get_SInterval, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_SInterval(ctx, Value)
    ccall((:ctx_LoadShapes_Set_SInterval, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LoadShapes_Set_HrInterval(ctx, Value)
    ccall((:ctx_LoadShapes_Set_HrInterval, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LoadShapes_Set_MinInterval(ctx, Value)
    ccall((:ctx_LoadShapes_Set_MinInterval, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LoadShapes_New(ctx, Name)
    ccall((:ctx_LoadShapes_New, LIBRARY), Int32, (Ptr{Cvoid}, Cstring,), ctx, Name)
end

function LoadShapes_Get_PBase(ctx)
    ccall((:ctx_LoadShapes_Get_PBase, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_Qbase(ctx)
    ccall((:ctx_LoadShapes_Get_Qbase, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_PBase(ctx, Value)
    ccall((:ctx_LoadShapes_Set_PBase, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LoadShapes_Set_Qbase(ctx, Value)
    ccall((:ctx_LoadShapes_Set_Qbase, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LoadShapes_Get_UseActual(ctx)
    ccall((:ctx_LoadShapes_Get_UseActual, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_UseActual(ctx, Value)
    ccall((:ctx_LoadShapes_Set_UseActual, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Meters_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_AllNames_GR(ctx)
    ccall((:ctx_Meters_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Get_First(ctx)
    ccall((:ctx_Meters_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_Name(ctx)
    ccall((:ctx_Meters_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Meters_Get_Next(ctx)
    ccall((:ctx_Meters_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_RegisterNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_RegisterNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_RegisterNames_GR(ctx)
    ccall((:ctx_Meters_Get_RegisterNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Get_RegisterValues(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_RegisterValues, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_RegisterValues_GR(ctx)
    ccall((:ctx_Meters_Get_RegisterValues_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Reset(ctx)
    ccall((:ctx_Meters_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_ResetAll(ctx)
    ccall((:ctx_Meters_ResetAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Sample(ctx)
    ccall((:ctx_Meters_Sample, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Save(ctx)
    ccall((:ctx_Meters_Save, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Set_Name(ctx, Value)
    ccall((:ctx_Meters_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Meters_Get_Totals(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_Totals, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_Totals_GR(ctx)
    ccall((:ctx_Meters_Get_Totals_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Get_Peakcurrent(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_Peakcurrent, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_Peakcurrent_GR(ctx)
    ccall((:ctx_Meters_Get_Peakcurrent_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Set_Peakcurrent(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Meters_Set_Peakcurrent, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Meters_Get_CalcCurrent(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_CalcCurrent, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_CalcCurrent_GR(ctx)
    ccall((:ctx_Meters_Get_CalcCurrent_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Set_CalcCurrent(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Meters_Set_CalcCurrent, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Meters_Get_AllocFactors(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_AllocFactors, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_AllocFactors_GR(ctx)
    ccall((:ctx_Meters_Get_AllocFactors_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Set_AllocFactors(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Meters_Set_AllocFactors, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Meters_Get_MeteredElement(ctx)
    ccall((:ctx_Meters_Get_MeteredElement, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Meters_Get_MeteredTerminal(ctx)
    ccall((:ctx_Meters_Get_MeteredTerminal, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Set_MeteredElement(ctx, Value)
    ccall((:ctx_Meters_Set_MeteredElement, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Meters_Set_MeteredTerminal(ctx, Value)
    ccall((:ctx_Meters_Set_MeteredTerminal, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Meters_Get_DIFilesAreOpen(ctx)
    ccall((:ctx_Meters_Get_DIFilesAreOpen, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Meters_CloseAllDIFiles(ctx)
    ccall((:ctx_Meters_CloseAllDIFiles, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_OpenAllDIFiles(ctx)
    ccall((:ctx_Meters_OpenAllDIFiles, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_SampleAll(ctx)
    ccall((:ctx_Meters_SampleAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_SaveAll(ctx)
    ccall((:ctx_Meters_SaveAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Get_AllEndElements(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_AllEndElements, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_AllEndElements_GR(ctx)
    ccall((:ctx_Meters_Get_AllEndElements_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Get_CountEndElements(ctx)
    ccall((:ctx_Meters_Get_CountEndElements, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_Count(ctx)
    ccall((:ctx_Meters_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_AllBranchesInZone(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_AllBranchesInZone, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_AllBranchesInZone_GR(ctx)
    ccall((:ctx_Meters_Get_AllBranchesInZone_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Get_CountBranches(ctx)
    ccall((:ctx_Meters_Get_CountBranches, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_SAIFI(ctx)
    ccall((:ctx_Meters_Get_SAIFI, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Meters_Get_SequenceIndex(ctx)
    ccall((:ctx_Meters_Get_SequenceIndex, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Set_SequenceIndex(ctx, Value)
    ccall((:ctx_Meters_Set_SequenceIndex, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Meters_Get_SAIFIKW(ctx)
    ccall((:ctx_Meters_Get_SAIFIKW, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Meters_DoReliabilityCalc(ctx, AssumeRestoration)
    ccall((:ctx_Meters_DoReliabilityCalc, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, AssumeRestoration)
end

function Meters_Get_SeqListSize(ctx)
    ccall((:ctx_Meters_Get_SeqListSize, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_TotalCustomers(ctx)
    ccall((:ctx_Meters_Get_TotalCustomers, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_SAIDI(ctx)
    ccall((:ctx_Meters_Get_SAIDI, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Meters_Get_CustInterrupts(ctx)
    ccall((:ctx_Meters_Get_CustInterrupts, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Meters_Get_NumSections(ctx)
    ccall((:ctx_Meters_Get_NumSections, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_SetActiveSection(ctx, SectIdx)
    ccall((:ctx_Meters_SetActiveSection, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, SectIdx)
end

function Meters_Get_AvgRepairTime(ctx)
    ccall((:ctx_Meters_Get_AvgRepairTime, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Meters_Get_FaultRateXRepairHrs(ctx)
    ccall((:ctx_Meters_Get_FaultRateXRepairHrs, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Meters_Get_NumSectionBranches(ctx)
    ccall((:ctx_Meters_Get_NumSectionBranches, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_NumSectionCustomers(ctx)
    ccall((:ctx_Meters_Get_NumSectionCustomers, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_OCPDeviceType(ctx)
    ccall((:ctx_Meters_Get_OCPDeviceType, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_SumBranchFltRates(ctx)
    ccall((:ctx_Meters_Get_SumBranchFltRates, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Meters_Get_SectSeqIdx(ctx)
    ccall((:ctx_Meters_Get_SectSeqIdx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_SectTotalCust(ctx)
    ccall((:ctx_Meters_Get_SectTotalCust, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_ZonePCE(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_ZonePCE, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Monitors_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Monitors_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Monitors_Get_AllNames_GR(ctx)
    ccall((:ctx_Monitors_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_FileName(ctx)
    ccall((:ctx_Monitors_Get_FileName, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_First(ctx)
    ccall((:ctx_Monitors_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_Mode(ctx)
    ccall((:ctx_Monitors_Get_Mode, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_Name(ctx)
    ccall((:ctx_Monitors_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_Next(ctx)
    ccall((:ctx_Monitors_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Reset(ctx)
    ccall((:ctx_Monitors_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_ResetAll(ctx)
    ccall((:ctx_Monitors_ResetAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Sample(ctx)
    ccall((:ctx_Monitors_Sample, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Save(ctx)
    ccall((:ctx_Monitors_Save, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Set_Mode(ctx, Value)
    ccall((:ctx_Monitors_Set_Mode, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Monitors_Show(ctx)
    ccall((:ctx_Monitors_Show, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Set_Name(ctx, Value)
    ccall((:ctx_Monitors_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Monitors_Get_ByteStream(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Monitors_Get_ByteStream, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int8}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Monitors_Get_ByteStream_GR(ctx)
    ccall((:ctx_Monitors_Get_ByteStream_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_SampleCount(ctx)
    ccall((:ctx_Monitors_Get_SampleCount, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_SampleAll(ctx)
    ccall((:ctx_Monitors_SampleAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_SaveAll(ctx)
    ccall((:ctx_Monitors_SaveAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_Count(ctx)
    ccall((:ctx_Monitors_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Process(ctx)
    ccall((:ctx_Monitors_Process, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_ProcessAll(ctx)
    ccall((:ctx_Monitors_ProcessAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_Channel(ctx, ResultPtr, ResultCount, Index)
    ccall((:ctx_Monitors_Get_Channel, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, Index)
end

function Monitors_Get_Channel_GR(ctx, Index)
    ccall((:ctx_Monitors_Get_Channel_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Index)
end

function Monitors_Get_dblFreq(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Monitors_Get_dblFreq, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Monitors_Get_dblFreq_GR(ctx)
    ccall((:ctx_Monitors_Get_dblFreq_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_dblHour(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Monitors_Get_dblHour, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Monitors_Get_dblHour_GR(ctx)
    ccall((:ctx_Monitors_Get_dblHour_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_FileVersion(ctx)
    ccall((:ctx_Monitors_Get_FileVersion, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_Header(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Monitors_Get_Header, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Monitors_Get_Header_GR(ctx)
    ccall((:ctx_Monitors_Get_Header_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_NumChannels(ctx)
    ccall((:ctx_Monitors_Get_NumChannels, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_RecordSize(ctx)
    ccall((:ctx_Monitors_Get_RecordSize, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_Element(ctx)
    ccall((:ctx_Monitors_Get_Element, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Monitors_Set_Element(ctx, Value)
    ccall((:ctx_Monitors_Set_Element, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Monitors_Get_Terminal(ctx)
    ccall((:ctx_Monitors_Get_Terminal, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Set_Terminal(ctx, Value)
    ccall((:ctx_Monitors_Set_Terminal, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Parallel_Get_NumCPUs(ctx)
    ccall((:ctx_Parallel_Get_NumCPUs, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Parallel_Get_NumCores(ctx)
    ccall((:ctx_Parallel_Get_NumCores, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Parallel_Get_ActiveActor(ctx)
    ccall((:ctx_Parallel_Get_ActiveActor, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Parallel_Set_ActiveActor(ctx, Value)
    ccall((:ctx_Parallel_Set_ActiveActor, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Parallel_CreateActor(ctx)
    ccall((:ctx_Parallel_CreateActor, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Parallel_Get_ActorCPU(ctx)
    ccall((:ctx_Parallel_Get_ActorCPU, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Parallel_Set_ActorCPU(ctx, Value)
    ccall((:ctx_Parallel_Set_ActorCPU, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Parallel_Get_NumOfActors(ctx)
    ccall((:ctx_Parallel_Get_NumOfActors, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Parallel_Wait(ctx)
    ccall((:ctx_Parallel_Wait, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Parallel_Get_ActorProgress(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Parallel_Get_ActorProgress, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Parallel_Get_ActorProgress_GR(ctx)
    ccall((:ctx_Parallel_Get_ActorProgress_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Parallel_Get_ActorStatus(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Parallel_Get_ActorStatus, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Parallel_Get_ActorStatus_GR(ctx)
    ccall((:ctx_Parallel_Get_ActorStatus_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Parallel_Get_ActiveParallel(ctx)
    ccall((:ctx_Parallel_Get_ActiveParallel, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Parallel_Set_ActiveParallel(ctx, Value)
    ccall((:ctx_Parallel_Set_ActiveParallel, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Parallel_Get_ConcatenateReports(ctx)
    ccall((:ctx_Parallel_Get_ConcatenateReports, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Parallel_Set_ConcatenateReports(ctx, Value)
    ccall((:ctx_Parallel_Set_ConcatenateReports, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Parser_Get_CmdString(ctx)
    ccall((:ctx_Parser_Get_CmdString, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Parser_Set_CmdString(ctx, Value)
    ccall((:ctx_Parser_Set_CmdString, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Parser_Get_NextParam(ctx)
    ccall((:ctx_Parser_Get_NextParam, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Parser_Get_AutoIncrement(ctx)
    ccall((:ctx_Parser_Get_AutoIncrement, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Parser_Set_AutoIncrement(ctx, Value)
    ccall((:ctx_Parser_Set_AutoIncrement, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Parser_Get_DblValue(ctx)
    ccall((:ctx_Parser_Get_DblValue, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Parser_Get_IntValue(ctx)
    ccall((:ctx_Parser_Get_IntValue, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Parser_Get_StrValue(ctx)
    ccall((:ctx_Parser_Get_StrValue, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Parser_Get_WhiteSpace(ctx)
    ccall((:ctx_Parser_Get_WhiteSpace, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Parser_Set_WhiteSpace(ctx, Value)
    ccall((:ctx_Parser_Set_WhiteSpace, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Parser_Get_BeginQuote(ctx)
    ccall((:ctx_Parser_Get_BeginQuote, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Parser_Get_EndQuote(ctx)
    ccall((:ctx_Parser_Get_EndQuote, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Parser_Set_BeginQuote(ctx, Value)
    ccall((:ctx_Parser_Set_BeginQuote, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Parser_Set_EndQuote(ctx, Value)
    ccall((:ctx_Parser_Set_EndQuote, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Parser_Get_Delimiters(ctx)
    ccall((:ctx_Parser_Get_Delimiters, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Parser_Set_Delimiters(ctx, Value)
    ccall((:ctx_Parser_Set_Delimiters, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Parser_ResetDelimiters(ctx)
    ccall((:ctx_Parser_ResetDelimiters, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Parser_Get_Vector(ctx, ResultPtr, ResultCount, ExpectedSize)
    ccall((:ctx_Parser_Get_Vector, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, ExpectedSize)
end

function Parser_Get_Vector_GR(ctx, ExpectedSize)
    ccall((:ctx_Parser_Get_Vector_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, ExpectedSize)
end

function Parser_Get_Matrix(ctx, ResultPtr, ResultCount, ExpectedOrder)
    ccall((:ctx_Parser_Get_Matrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, ExpectedOrder)
end

function Parser_Get_Matrix_GR(ctx, ExpectedOrder)
    ccall((:ctx_Parser_Get_Matrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, ExpectedOrder)
end

function Parser_Get_SymMatrix(ctx, ResultPtr, ResultCount, ExpectedOrder)
    ccall((:ctx_Parser_Get_SymMatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, ExpectedOrder)
end

function Parser_Get_SymMatrix_GR(ctx, ExpectedOrder)
    ccall((:ctx_Parser_Get_SymMatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, ExpectedOrder)
end

function PDElements_Get_Count(ctx)
    ccall((:ctx_PDElements_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_FaultRate(ctx)
    ccall((:ctx_PDElements_Get_FaultRate, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_First(ctx)
    ccall((:ctx_PDElements_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_IsShunt(ctx)
    ccall((:ctx_PDElements_Get_IsShunt, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_Next(ctx)
    ccall((:ctx_PDElements_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_pctPermanent(ctx)
    ccall((:ctx_PDElements_Get_pctPermanent, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PDElements_Set_FaultRate(ctx, Value)
    ccall((:ctx_PDElements_Set_FaultRate, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function PDElements_Set_pctPermanent(ctx, Value)
    ccall((:ctx_PDElements_Set_pctPermanent, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function PDElements_Get_Name(ctx)
    ccall((:ctx_PDElements_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function PDElements_Set_Name(ctx, Value)
    ccall((:ctx_PDElements_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function PDElements_Get_AccumulatedL(ctx)
    ccall((:ctx_PDElements_Get_AccumulatedL, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_Lambda(ctx)
    ccall((:ctx_PDElements_Get_Lambda, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_Numcustomers(ctx)
    ccall((:ctx_PDElements_Get_Numcustomers, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_ParentPDElement(ctx)
    ccall((:ctx_PDElements_Get_ParentPDElement, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_RepairTime(ctx)
    ccall((:ctx_PDElements_Get_RepairTime, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_Totalcustomers(ctx)
    ccall((:ctx_PDElements_Get_Totalcustomers, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_FromTerminal(ctx)
    ccall((:ctx_PDElements_Get_FromTerminal, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_TotalMiles(ctx)
    ccall((:ctx_PDElements_Get_TotalMiles, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_SectionID(ctx)
    ccall((:ctx_PDElements_Get_SectionID, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PDElements_Set_RepairTime(ctx, Value)
    ccall((:ctx_PDElements_Set_RepairTime, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function PDElements_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllNames_GR(ctx)
    ccall((:ctx_PDElements_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllMaxCurrents(ctx, ResultPtr, ResultCount, AllNodes)
    ccall((:ctx_PDElements_Get_AllMaxCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, UInt16), ctx, ResultPtr, ResultCount, AllNodes)
end

function PDElements_Get_AllMaxCurrents_GR(ctx, AllNodes)
    ccall((:ctx_PDElements_Get_AllMaxCurrents_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, AllNodes)
end

function PDElements_Get_AllPctNorm(ctx, ResultPtr, ResultCount, AllNodes)
    ccall((:ctx_PDElements_Get_AllPctNorm, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, UInt16), ctx, ResultPtr, ResultCount, AllNodes)
end

function PDElements_Get_AllPctNorm_GR(ctx, AllNodes)
    ccall((:ctx_PDElements_Get_AllPctNorm_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, AllNodes)
end

function PDElements_Get_AllPctEmerg(ctx, ResultPtr, ResultCount, AllNodes)
    ccall((:ctx_PDElements_Get_AllPctEmerg, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, UInt16), ctx, ResultPtr, ResultCount, AllNodes)
end

function PDElements_Get_AllPctEmerg_GR(ctx, AllNodes)
    ccall((:ctx_PDElements_Get_AllPctEmerg_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, AllNodes)
end

function PDElements_Get_AllCurrents(ctx, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllCurrents_GR(ctx)
    ccall((:ctx_PDElements_Get_AllCurrents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllCurrentsMagAng(ctx, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllCurrentsMagAng, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllCurrentsMagAng_GR(ctx)
    ccall((:ctx_PDElements_Get_AllCurrentsMagAng_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllCplxSeqCurrents(ctx, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllCplxSeqCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllCplxSeqCurrents_GR(ctx)
    ccall((:ctx_PDElements_Get_AllCplxSeqCurrents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllSeqCurrents(ctx, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllSeqCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllSeqCurrents_GR(ctx)
    ccall((:ctx_PDElements_Get_AllSeqCurrents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllPowers(ctx, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllPowers, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllPowers_GR(ctx)
    ccall((:ctx_PDElements_Get_AllPowers_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllSeqPowers(ctx, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllSeqPowers, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllSeqPowers_GR(ctx)
    ccall((:ctx_PDElements_Get_AllSeqPowers_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllNumPhases(ctx, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllNumPhases, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllNumPhases_GR(ctx)
    ccall((:ctx_PDElements_Get_AllNumPhases_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllNumConductors(ctx, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllNumConductors, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllNumConductors_GR(ctx)
    ccall((:ctx_PDElements_Get_AllNumConductors_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllNumTerminals(ctx, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllNumTerminals, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllNumTerminals_GR(ctx)
    ccall((:ctx_PDElements_Get_AllNumTerminals_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_PVSystems_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PVSystems_Get_AllNames_GR(ctx)
    ccall((:ctx_PVSystems_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_RegisterNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_PVSystems_Get_RegisterNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PVSystems_Get_RegisterNames_GR(ctx)
    ccall((:ctx_PVSystems_Get_RegisterNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_RegisterValues(ctx, ResultPtr, ResultCount)
    ccall((:ctx_PVSystems_Get_RegisterValues, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PVSystems_Get_RegisterValues_GR(ctx)
    ccall((:ctx_PVSystems_Get_RegisterValues_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_First(ctx)
    ccall((:ctx_PVSystems_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_Next(ctx)
    ccall((:ctx_PVSystems_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_Count(ctx)
    ccall((:ctx_PVSystems_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_idx(ctx)
    ccall((:ctx_PVSystems_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_idx(ctx, Value)
    ccall((:ctx_PVSystems_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function PVSystems_Get_Name(ctx)
    ccall((:ctx_PVSystems_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_Name(ctx, Value)
    ccall((:ctx_PVSystems_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function PVSystems_Get_Irradiance(ctx)
    ccall((:ctx_PVSystems_Get_Irradiance, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_Irradiance(ctx, Value)
    ccall((:ctx_PVSystems_Set_Irradiance, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function PVSystems_Get_kvar(ctx)
    ccall((:ctx_PVSystems_Get_kvar, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_kVArated(ctx)
    ccall((:ctx_PVSystems_Get_kVArated, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_kW(ctx)
    ccall((:ctx_PVSystems_Get_kW, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_PF(ctx)
    ccall((:ctx_PVSystems_Get_PF, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_kVArated(ctx, Value)
    ccall((:ctx_PVSystems_Set_kVArated, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function PVSystems_Set_PF(ctx, Value)
    ccall((:ctx_PVSystems_Set_PF, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function PVSystems_Set_kvar(ctx, Value)
    ccall((:ctx_PVSystems_Set_kvar, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function PVSystems_Get_daily(ctx)
    ccall((:ctx_PVSystems_Get_daily, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_daily(ctx, Value)
    ccall((:ctx_PVSystems_Set_daily, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function PVSystems_Get_duty(ctx)
    ccall((:ctx_PVSystems_Get_duty, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_duty(ctx, Value)
    ccall((:ctx_PVSystems_Set_duty, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function PVSystems_Get_yearly(ctx)
    ccall((:ctx_PVSystems_Get_yearly, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_yearly(ctx, Value)
    ccall((:ctx_PVSystems_Set_yearly, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function PVSystems_Get_Tdaily(ctx)
    ccall((:ctx_PVSystems_Get_Tdaily, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_Tdaily(ctx, Value)
    ccall((:ctx_PVSystems_Set_Tdaily, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function PVSystems_Get_Tduty(ctx)
    ccall((:ctx_PVSystems_Get_Tduty, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_Tduty(ctx, Value)
    ccall((:ctx_PVSystems_Set_Tduty, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function PVSystems_Get_Tyearly(ctx)
    ccall((:ctx_PVSystems_Get_Tyearly, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_Tyearly(ctx, Value)
    ccall((:ctx_PVSystems_Set_Tyearly, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function PVSystems_Get_Pmpp(ctx)
    ccall((:ctx_PVSystems_Get_Pmpp, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_Pmpp(ctx, Value)
    ccall((:ctx_PVSystems_Set_Pmpp, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function PVSystems_Get_IrradianceNow(ctx)
    ccall((:ctx_PVSystems_Get_IrradianceNow, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_Sensor(ctx)
    ccall((:ctx_PVSystems_Get_Sensor, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Reclosers_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reclosers_Get_AllNames_GR(ctx)
    ccall((:ctx_Reclosers_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_Count(ctx)
    ccall((:ctx_Reclosers_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_First(ctx)
    ccall((:ctx_Reclosers_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_Name(ctx)
    ccall((:ctx_Reclosers_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_Next(ctx)
    ccall((:ctx_Reclosers_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_Name(ctx, Value)
    ccall((:ctx_Reclosers_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Reclosers_Get_MonitoredTerm(ctx)
    ccall((:ctx_Reclosers_Get_MonitoredTerm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_MonitoredTerm(ctx, Value)
    ccall((:ctx_Reclosers_Set_MonitoredTerm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Reclosers_Get_SwitchedObj(ctx)
    ccall((:ctx_Reclosers_Get_SwitchedObj, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_SwitchedObj(ctx, Value)
    ccall((:ctx_Reclosers_Set_SwitchedObj, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Reclosers_Get_MonitoredObj(ctx)
    ccall((:ctx_Reclosers_Get_MonitoredObj, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_SwitchedTerm(ctx)
    ccall((:ctx_Reclosers_Get_SwitchedTerm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_MonitoredObj(ctx, Value)
    ccall((:ctx_Reclosers_Set_MonitoredObj, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Reclosers_Set_SwitchedTerm(ctx, Value)
    ccall((:ctx_Reclosers_Set_SwitchedTerm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Reclosers_Get_NumFast(ctx)
    ccall((:ctx_Reclosers_Get_NumFast, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_RecloseIntervals(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Reclosers_Get_RecloseIntervals, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reclosers_Get_RecloseIntervals_GR(ctx)
    ccall((:ctx_Reclosers_Get_RecloseIntervals_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_Shots(ctx)
    ccall((:ctx_Reclosers_Get_Shots, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_NumFast(ctx, Value)
    ccall((:ctx_Reclosers_Set_NumFast, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Reclosers_Set_Shots(ctx, Value)
    ccall((:ctx_Reclosers_Set_Shots, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Reclosers_Get_PhaseTrip(ctx)
    ccall((:ctx_Reclosers_Get_PhaseTrip, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_PhaseTrip(ctx, Value)
    ccall((:ctx_Reclosers_Set_PhaseTrip, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reclosers_Get_GroundInst(ctx)
    ccall((:ctx_Reclosers_Get_GroundInst, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_GroundTrip(ctx)
    ccall((:ctx_Reclosers_Get_GroundTrip, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_PhaseInst(ctx)
    ccall((:ctx_Reclosers_Get_PhaseInst, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_GroundInst(ctx, Value)
    ccall((:ctx_Reclosers_Set_GroundInst, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reclosers_Set_GroundTrip(ctx, Value)
    ccall((:ctx_Reclosers_Set_GroundTrip, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reclosers_Set_PhaseInst(ctx, Value)
    ccall((:ctx_Reclosers_Set_PhaseInst, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reclosers_Close(ctx)
    ccall((:ctx_Reclosers_Close, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reclosers_Open(ctx)
    ccall((:ctx_Reclosers_Open, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reclosers_Reset(ctx)
    ccall((:ctx_Reclosers_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_idx(ctx)
    ccall((:ctx_Reclosers_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_idx(ctx, Value)
    ccall((:ctx_Reclosers_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Reclosers_Get_State(ctx)
    ccall((:ctx_Reclosers_Get_State, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_State(ctx, Value)
    ccall((:ctx_Reclosers_Set_State, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Reclosers_Get_NormalState(ctx)
    ccall((:ctx_Reclosers_Get_NormalState, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_NormalState(ctx, Value)
    ccall((:ctx_Reclosers_Set_NormalState, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function RegControls_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_RegControls_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function RegControls_Get_AllNames_GR(ctx)
    ccall((:ctx_RegControls_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_CTPrimary(ctx)
    ccall((:ctx_RegControls_Get_CTPrimary, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_Delay(ctx)
    ccall((:ctx_RegControls_Get_Delay, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_First(ctx)
    ccall((:ctx_RegControls_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_ForwardBand(ctx)
    ccall((:ctx_RegControls_Get_ForwardBand, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_ForwardR(ctx)
    ccall((:ctx_RegControls_Get_ForwardR, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_ForwardVreg(ctx)
    ccall((:ctx_RegControls_Get_ForwardVreg, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_ForwardX(ctx)
    ccall((:ctx_RegControls_Get_ForwardX, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_IsInverseTime(ctx)
    ccall((:ctx_RegControls_Get_IsInverseTime, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_IsReversible(ctx)
    ccall((:ctx_RegControls_Get_IsReversible, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_MaxTapChange(ctx)
    ccall((:ctx_RegControls_Get_MaxTapChange, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_MonitoredBus(ctx)
    ccall((:ctx_RegControls_Get_MonitoredBus, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_Name(ctx)
    ccall((:ctx_RegControls_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_Next(ctx)
    ccall((:ctx_RegControls_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_PTratio(ctx)
    ccall((:ctx_RegControls_Get_PTratio, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_ReverseBand(ctx)
    ccall((:ctx_RegControls_Get_ReverseBand, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_ReverseR(ctx)
    ccall((:ctx_RegControls_Get_ReverseR, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_ReverseVreg(ctx)
    ccall((:ctx_RegControls_Get_ReverseVreg, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_ReverseX(ctx)
    ccall((:ctx_RegControls_Get_ReverseX, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_TapDelay(ctx)
    ccall((:ctx_RegControls_Get_TapDelay, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_TapWinding(ctx)
    ccall((:ctx_RegControls_Get_TapWinding, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_Transformer(ctx)
    ccall((:ctx_RegControls_Get_Transformer, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_VoltageLimit(ctx)
    ccall((:ctx_RegControls_Get_VoltageLimit, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_Winding(ctx)
    ccall((:ctx_RegControls_Get_Winding, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_TapNumber(ctx)
    ccall((:ctx_RegControls_Get_TapNumber, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function RegControls_Set_CTPrimary(ctx, Value)
    ccall((:ctx_RegControls_Set_CTPrimary, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_Delay(ctx, Value)
    ccall((:ctx_RegControls_Set_Delay, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_ForwardBand(ctx, Value)
    ccall((:ctx_RegControls_Set_ForwardBand, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_ForwardR(ctx, Value)
    ccall((:ctx_RegControls_Set_ForwardR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_ForwardVreg(ctx, Value)
    ccall((:ctx_RegControls_Set_ForwardVreg, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_ForwardX(ctx, Value)
    ccall((:ctx_RegControls_Set_ForwardX, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_IsInverseTime(ctx, Value)
    ccall((:ctx_RegControls_Set_IsInverseTime, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function RegControls_Set_IsReversible(ctx, Value)
    ccall((:ctx_RegControls_Set_IsReversible, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function RegControls_Set_MaxTapChange(ctx, Value)
    ccall((:ctx_RegControls_Set_MaxTapChange, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function RegControls_Set_MonitoredBus(ctx, Value)
    ccall((:ctx_RegControls_Set_MonitoredBus, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function RegControls_Set_Name(ctx, Value)
    ccall((:ctx_RegControls_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function RegControls_Set_PTratio(ctx, Value)
    ccall((:ctx_RegControls_Set_PTratio, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_ReverseBand(ctx, Value)
    ccall((:ctx_RegControls_Set_ReverseBand, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_ReverseR(ctx, Value)
    ccall((:ctx_RegControls_Set_ReverseR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_ReverseVreg(ctx, Value)
    ccall((:ctx_RegControls_Set_ReverseVreg, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_ReverseX(ctx, Value)
    ccall((:ctx_RegControls_Set_ReverseX, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_TapDelay(ctx, Value)
    ccall((:ctx_RegControls_Set_TapDelay, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_TapWinding(ctx, Value)
    ccall((:ctx_RegControls_Set_TapWinding, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function RegControls_Set_Transformer(ctx, Value)
    ccall((:ctx_RegControls_Set_Transformer, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function RegControls_Set_VoltageLimit(ctx, Value)
    ccall((:ctx_RegControls_Set_VoltageLimit, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_Winding(ctx, Value)
    ccall((:ctx_RegControls_Set_Winding, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function RegControls_Set_TapNumber(ctx, Value)
    ccall((:ctx_RegControls_Set_TapNumber, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function RegControls_Get_Count(ctx)
    ccall((:ctx_RegControls_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function RegControls_Reset(ctx)
    ccall((:ctx_RegControls_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Relays_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Relays_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Relays_Get_AllNames_GR(ctx)
    ccall((:ctx_Relays_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Relays_Get_Count(ctx)
    ccall((:ctx_Relays_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Relays_Get_First(ctx)
    ccall((:ctx_Relays_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Relays_Get_Name(ctx)
    ccall((:ctx_Relays_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Relays_Get_Next(ctx)
    ccall((:ctx_Relays_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Relays_Set_Name(ctx, Value)
    ccall((:ctx_Relays_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Relays_Get_MonitoredObj(ctx)
    ccall((:ctx_Relays_Get_MonitoredObj, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Relays_Set_MonitoredObj(ctx, Value)
    ccall((:ctx_Relays_Set_MonitoredObj, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Relays_Get_MonitoredTerm(ctx)
    ccall((:ctx_Relays_Get_MonitoredTerm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Relays_Get_SwitchedObj(ctx)
    ccall((:ctx_Relays_Get_SwitchedObj, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Relays_Set_MonitoredTerm(ctx, Value)
    ccall((:ctx_Relays_Set_MonitoredTerm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Relays_Set_SwitchedObj(ctx, Value)
    ccall((:ctx_Relays_Set_SwitchedObj, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Relays_Get_SwitchedTerm(ctx)
    ccall((:ctx_Relays_Get_SwitchedTerm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Relays_Set_SwitchedTerm(ctx, Value)
    ccall((:ctx_Relays_Set_SwitchedTerm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Relays_Get_idx(ctx)
    ccall((:ctx_Relays_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Relays_Set_idx(ctx, Value)
    ccall((:ctx_Relays_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Relays_Open(ctx)
    ccall((:ctx_Relays_Open, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Relays_Close(ctx)
    ccall((:ctx_Relays_Close, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Relays_Reset(ctx)
    ccall((:ctx_Relays_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Relays_Get_State(ctx)
    ccall((:ctx_Relays_Get_State, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Relays_Set_State(ctx, Value)
    ccall((:ctx_Relays_Set_State, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Relays_Get_NormalState(ctx)
    ccall((:ctx_Relays_Get_NormalState, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Relays_Set_NormalState(ctx, Value)
    ccall((:ctx_Relays_Set_NormalState, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Sensors_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Sensors_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Sensors_Get_AllNames_GR(ctx)
    ccall((:ctx_Sensors_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_Count(ctx)
    ccall((:ctx_Sensors_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_Currents(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Sensors_Get_Currents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Sensors_Get_Currents_GR(ctx)
    ccall((:ctx_Sensors_Get_Currents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_First(ctx)
    ccall((:ctx_Sensors_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_IsDelta(ctx)
    ccall((:ctx_Sensors_Get_IsDelta, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_kVARS(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Sensors_Get_kVARS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Sensors_Get_kVARS_GR(ctx)
    ccall((:ctx_Sensors_Get_kVARS_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_kVS(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Sensors_Get_kVS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Sensors_Get_kVS_GR(ctx)
    ccall((:ctx_Sensors_Get_kVS_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_kWS(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Sensors_Get_kWS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Sensors_Get_kWS_GR(ctx)
    ccall((:ctx_Sensors_Get_kWS_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_MeteredElement(ctx)
    ccall((:ctx_Sensors_Get_MeteredElement, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_MeteredTerminal(ctx)
    ccall((:ctx_Sensors_Get_MeteredTerminal, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_Name(ctx)
    ccall((:ctx_Sensors_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_Next(ctx)
    ccall((:ctx_Sensors_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_PctError(ctx)
    ccall((:ctx_Sensors_Get_PctError, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_ReverseDelta(ctx)
    ccall((:ctx_Sensors_Get_ReverseDelta, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_Weight(ctx)
    ccall((:ctx_Sensors_Get_Weight, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Sensors_Reset(ctx)
    ccall((:ctx_Sensors_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Sensors_ResetAll(ctx)
    ccall((:ctx_Sensors_ResetAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Sensors_Set_Currents(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Sensors_Set_Currents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Sensors_Set_IsDelta(ctx, Value)
    ccall((:ctx_Sensors_Set_IsDelta, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Sensors_Set_kVARS(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Sensors_Set_kVARS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Sensors_Set_kVS(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Sensors_Set_kVS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Sensors_Set_kWS(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Sensors_Set_kWS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Sensors_Set_MeteredElement(ctx, Value)
    ccall((:ctx_Sensors_Set_MeteredElement, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Sensors_Set_MeteredTerminal(ctx, Value)
    ccall((:ctx_Sensors_Set_MeteredTerminal, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Sensors_Set_Name(ctx, Value)
    ccall((:ctx_Sensors_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Sensors_Set_PctError(ctx, Value)
    ccall((:ctx_Sensors_Set_PctError, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Sensors_Set_ReverseDelta(ctx, Value)
    ccall((:ctx_Sensors_Set_ReverseDelta, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Sensors_Set_Weight(ctx, Value)
    ccall((:ctx_Sensors_Set_Weight, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Sensors_Get_kVbase(ctx)
    ccall((:ctx_Sensors_Get_kVbase, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Sensors_Set_kVbase(ctx, Value)
    ccall((:ctx_Sensors_Set_kVbase, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Sensors_Get_AllocationFactor(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Sensors_Get_AllocationFactor, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Sensors_Get_AllocationFactor_GR(ctx)
    ccall((:ctx_Sensors_Get_AllocationFactor_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Settings_Get_AllowDuplicates(ctx)
    ccall((:ctx_Settings_Get_AllowDuplicates, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Settings_Get_AutoBusList(ctx)
    ccall((:ctx_Settings_Get_AutoBusList, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Settings_Get_CktModel(ctx)
    ccall((:ctx_Settings_Get_CktModel, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Settings_Set_CktModel(ctx, Value)
    ccall((:ctx_Settings_Set_CktModel, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Settings_Get_EmergVmaxpu(ctx)
    ccall((:ctx_Settings_Get_EmergVmaxpu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Settings_Get_EmergVminpu(ctx)
    ccall((:ctx_Settings_Get_EmergVminpu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Settings_Get_NormVmaxpu(ctx)
    ccall((:ctx_Settings_Get_NormVmaxpu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Settings_Get_NormVminpu(ctx)
    ccall((:ctx_Settings_Get_NormVminpu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Settings_Get_ZoneLock(ctx)
    ccall((:ctx_Settings_Get_ZoneLock, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Settings_Set_AllocationFactors(ctx, Value)
    ccall((:ctx_Settings_Set_AllocationFactors, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Settings_Set_AllowDuplicates(ctx, Value)
    ccall((:ctx_Settings_Set_AllowDuplicates, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Settings_Set_AutoBusList(ctx, Value)
    ccall((:ctx_Settings_Set_AutoBusList, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Settings_Set_EmergVmaxpu(ctx, Value)
    ccall((:ctx_Settings_Set_EmergVmaxpu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Settings_Set_EmergVminpu(ctx, Value)
    ccall((:ctx_Settings_Set_EmergVminpu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Settings_Set_NormVmaxpu(ctx, Value)
    ccall((:ctx_Settings_Set_NormVmaxpu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Settings_Set_NormVminpu(ctx, Value)
    ccall((:ctx_Settings_Set_NormVminpu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Settings_Set_ZoneLock(ctx, Value)
    ccall((:ctx_Settings_Set_ZoneLock, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Settings_Get_LossRegs(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Settings_Get_LossRegs, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Settings_Get_LossRegs_GR(ctx)
    ccall((:ctx_Settings_Get_LossRegs_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Settings_Get_LossWeight(ctx)
    ccall((:ctx_Settings_Get_LossWeight, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Settings_Get_Trapezoidal(ctx)
    ccall((:ctx_Settings_Get_Trapezoidal, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Settings_Get_UEregs(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Settings_Get_UEregs, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Settings_Get_UEregs_GR(ctx)
    ccall((:ctx_Settings_Get_UEregs_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Settings_Get_UEweight(ctx)
    ccall((:ctx_Settings_Get_UEweight, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Settings_Set_LossRegs(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Settings_Set_LossRegs, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Int32}, Int32), ctx, ValuePtr, ValueCount)
end

function Settings_Set_LossWeight(ctx, Value)
    ccall((:ctx_Settings_Set_LossWeight, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Settings_Set_Trapezoidal(ctx, Value)
    ccall((:ctx_Settings_Set_Trapezoidal, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Settings_Set_UEregs(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Settings_Set_UEregs, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Int32}, Int32), ctx, ValuePtr, ValueCount)
end

function Settings_Set_UEweight(ctx, Value)
    ccall((:ctx_Settings_Set_UEweight, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Settings_Get_ControlTrace(ctx)
    ccall((:ctx_Settings_Get_ControlTrace, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Settings_Get_VoltageBases(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Settings_Get_VoltageBases, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Settings_Get_VoltageBases_GR(ctx)
    ccall((:ctx_Settings_Get_VoltageBases_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Settings_Set_ControlTrace(ctx, Value)
    ccall((:ctx_Settings_Set_ControlTrace, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Settings_Set_VoltageBases(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Settings_Set_VoltageBases, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Settings_Get_PriceCurve(ctx)
    ccall((:ctx_Settings_Get_PriceCurve, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Settings_Get_PriceSignal(ctx)
    ccall((:ctx_Settings_Get_PriceSignal, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Settings_Set_PriceCurve(ctx, Value)
    ccall((:ctx_Settings_Set_PriceCurve, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Settings_Set_PriceSignal(ctx, Value)
    ccall((:ctx_Settings_Set_PriceSignal, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Settings_Get_LoadsTerminalCheck(ctx)
    ccall((:ctx_Settings_Get_LoadsTerminalCheck, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Settings_Set_LoadsTerminalCheck(ctx, Value)
    ccall((:ctx_Settings_Set_LoadsTerminalCheck, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Settings_Get_IterateDisabled(ctx)
    ccall((:ctx_Settings_Get_IterateDisabled, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Settings_Set_IterateDisabled(ctx, Value)
    ccall((:ctx_Settings_Set_IterateDisabled, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Get_Frequency(ctx)
    ccall((:ctx_Solution_Get_Frequency, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Hour(ctx)
    ccall((:ctx_Solution_Get_Hour, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Iterations(ctx)
    ccall((:ctx_Solution_Get_Iterations, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Get_LoadMult(ctx)
    ccall((:ctx_Solution_Get_LoadMult, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Get_MaxIterations(ctx)
    ccall((:ctx_Solution_Get_MaxIterations, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Mode(ctx)
    ccall((:ctx_Solution_Get_Mode, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Number(ctx)
    ccall((:ctx_Solution_Get_Number, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Set_Random(ctx, Random)
    ccall((:ctx_Solution_Set_Random, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Random)
end

function Solution_Get_Random(ctx)
    ccall((:ctx_Solution_Get_Random, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Seconds(ctx)
    ccall((:ctx_Solution_Get_Seconds, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Get_StepSize(ctx)
    ccall((:ctx_Solution_Get_StepSize, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Tolerance(ctx)
    ccall((:ctx_Solution_Get_Tolerance, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Year(ctx)
    ccall((:ctx_Solution_Get_Year, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Set_Frequency(ctx, Value)
    ccall((:ctx_Solution_Set_Frequency, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Set_Hour(ctx, Value)
    ccall((:ctx_Solution_Set_Hour, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Set_LoadMult(ctx, Value)
    ccall((:ctx_Solution_Set_LoadMult, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Set_MaxIterations(ctx, Value)
    ccall((:ctx_Solution_Set_MaxIterations, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Set_Mode(ctx, Mode)
    ccall((:ctx_Solution_Set_Mode, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Mode)
end

function Solution_Set_Number(ctx, Value)
    ccall((:ctx_Solution_Set_Number, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Set_Seconds(ctx, Value)
    ccall((:ctx_Solution_Set_Seconds, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Set_StepSize(ctx, Value)
    ccall((:ctx_Solution_Set_StepSize, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Set_Tolerance(ctx, Value)
    ccall((:ctx_Solution_Set_Tolerance, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Set_Year(ctx, Value)
    ccall((:ctx_Solution_Set_Year, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Solve(ctx)
    ccall((:ctx_Solution_Solve, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_ModeID(ctx)
    ccall((:ctx_Solution_Get_ModeID, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Solution_Get_LoadModel(ctx)
    ccall((:ctx_Solution_Get_LoadModel, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Set_LoadModel(ctx, Value)
    ccall((:ctx_Solution_Set_LoadModel, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Get_LDCurve(ctx)
    ccall((:ctx_Solution_Get_LDCurve, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Solution_Set_LDCurve(ctx, Value)
    ccall((:ctx_Solution_Set_LDCurve, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Solution_Get_pctGrowth(ctx)
    ccall((:ctx_Solution_Get_pctGrowth, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Set_pctGrowth(ctx, Value)
    ccall((:ctx_Solution_Set_pctGrowth, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Get_AddType(ctx)
    ccall((:ctx_Solution_Get_AddType, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Set_AddType(ctx, Value)
    ccall((:ctx_Solution_Set_AddType, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Get_GenkW(ctx)
    ccall((:ctx_Solution_Get_GenkW, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Set_GenkW(ctx, Value)
    ccall((:ctx_Solution_Set_GenkW, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Get_GenPF(ctx)
    ccall((:ctx_Solution_Get_GenPF, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Set_GenPF(ctx, Value)
    ccall((:ctx_Solution_Set_GenPF, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Get_Capkvar(ctx)
    ccall((:ctx_Solution_Get_Capkvar, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Set_Capkvar(ctx, Value)
    ccall((:ctx_Solution_Set_Capkvar, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Get_Algorithm(ctx)
    ccall((:ctx_Solution_Get_Algorithm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Set_Algorithm(ctx, Value)
    ccall((:ctx_Solution_Set_Algorithm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Get_ControlMode(ctx)
    ccall((:ctx_Solution_Get_ControlMode, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Set_ControlMode(ctx, Value)
    ccall((:ctx_Solution_Set_ControlMode, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Get_GenMult(ctx)
    ccall((:ctx_Solution_Get_GenMult, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Set_GenMult(ctx, Value)
    ccall((:ctx_Solution_Set_GenMult, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Get_DefaultDaily(ctx)
    ccall((:ctx_Solution_Get_DefaultDaily, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Solution_Get_DefaultYearly(ctx)
    ccall((:ctx_Solution_Get_DefaultYearly, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Solution_Set_DefaultDaily(ctx, Value)
    ccall((:ctx_Solution_Set_DefaultDaily, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Solution_Set_DefaultYearly(ctx, Value)
    ccall((:ctx_Solution_Set_DefaultYearly, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Solution_Get_EventLog(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Solution_Get_EventLog, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Solution_Get_EventLog_GR(ctx)
    ccall((:ctx_Solution_Get_EventLog_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_dblHour(ctx)
    ccall((:ctx_Solution_Get_dblHour, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Set_dblHour(ctx, Value)
    ccall((:ctx_Solution_Set_dblHour, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Set_StepsizeHr(ctx, Value)
    ccall((:ctx_Solution_Set_StepsizeHr, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Set_StepsizeMin(ctx, Value)
    ccall((:ctx_Solution_Set_StepsizeMin, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Get_ControlIterations(ctx)
    ccall((:ctx_Solution_Get_ControlIterations, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Get_MaxControlIterations(ctx)
    ccall((:ctx_Solution_Get_MaxControlIterations, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Sample_DoControlActions(ctx)
    ccall((:ctx_Solution_Sample_DoControlActions, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Set_ControlIterations(ctx, Value)
    ccall((:ctx_Solution_Set_ControlIterations, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Set_MaxControlIterations(ctx, Value)
    ccall((:ctx_Solution_Set_MaxControlIterations, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_CheckFaultStatus(ctx)
    ccall((:ctx_Solution_CheckFaultStatus, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_SolveDirect(ctx)
    ccall((:ctx_Solution_SolveDirect, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_SolveNoControl(ctx)
    ccall((:ctx_Solution_SolveNoControl, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_SolvePflow(ctx)
    ccall((:ctx_Solution_SolvePflow, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_SolvePlusControl(ctx)
    ccall((:ctx_Solution_SolvePlusControl, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_SolveSnap(ctx)
    ccall((:ctx_Solution_SolveSnap, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_CheckControls(ctx)
    ccall((:ctx_Solution_CheckControls, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_InitSnap(ctx)
    ccall((:ctx_Solution_InitSnap, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_SystemYChanged(ctx)
    ccall((:ctx_Solution_Get_SystemYChanged, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Solution_BuildYMatrix(ctx, BuildOption, AllocateVI)
    ccall((:ctx_Solution_BuildYMatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Int32), ctx, BuildOption, AllocateVI)
end

function Solution_DoControlActions(ctx)
    ccall((:ctx_Solution_DoControlActions, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_SampleControlDevices(ctx)
    ccall((:ctx_Solution_SampleControlDevices, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Converged(ctx)
    ccall((:ctx_Solution_Get_Converged, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Solution_Set_Converged(ctx, Value)
    ccall((:ctx_Solution_Set_Converged, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Solution_Get_Totaliterations(ctx)
    ccall((:ctx_Solution_Get_Totaliterations, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Get_MostIterationsDone(ctx)
    ccall((:ctx_Solution_Get_MostIterationsDone, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Get_ControlActionsDone(ctx)
    ccall((:ctx_Solution_Get_ControlActionsDone, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Solution_Set_ControlActionsDone(ctx, Value)
    ccall((:ctx_Solution_Set_ControlActionsDone, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Solution_Cleanup(ctx)
    ccall((:ctx_Solution_Cleanup, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_FinishTimeStep(ctx)
    ccall((:ctx_Solution_FinishTimeStep, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Process_Time(ctx)
    ccall((:ctx_Solution_Get_Process_Time, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Total_Time(ctx)
    ccall((:ctx_Solution_Get_Total_Time, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Set_Total_Time(ctx, Value)
    ccall((:ctx_Solution_Set_Total_Time, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Get_Time_of_Step(ctx)
    ccall((:ctx_Solution_Get_Time_of_Step, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Get_IntervalHrs(ctx)
    ccall((:ctx_Solution_Get_IntervalHrs, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Set_IntervalHrs(ctx, Value)
    ccall((:ctx_Solution_Set_IntervalHrs, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Get_MinIterations(ctx)
    ccall((:ctx_Solution_Get_MinIterations, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Set_MinIterations(ctx, Value)
    ccall((:ctx_Solution_Set_MinIterations, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_SolveAll(ctx)
    ccall((:ctx_Solution_SolveAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_IncMatrix(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Solution_Get_IncMatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Solution_Get_IncMatrix_GR(ctx)
    ccall((:ctx_Solution_Get_IncMatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Laplacian(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Solution_Get_Laplacian, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Solution_Get_Laplacian_GR(ctx)
    ccall((:ctx_Solution_Get_Laplacian_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_BusLevels(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Solution_Get_BusLevels, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Solution_Get_BusLevels_GR(ctx)
    ccall((:ctx_Solution_Get_BusLevels_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_IncMatrixRows(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Solution_Get_IncMatrixRows, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Solution_Get_IncMatrixRows_GR(ctx)
    ccall((:ctx_Solution_Get_IncMatrixRows_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_IncMatrixCols(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Solution_Get_IncMatrixCols, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Solution_Get_IncMatrixCols_GR(ctx)
    ccall((:ctx_Solution_Get_IncMatrixCols_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_Action(ctx)
    ccall((:ctx_SwtControls_Get_Action, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_SwtControls_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function SwtControls_Get_AllNames_GR(ctx)
    ccall((:ctx_SwtControls_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_Delay(ctx)
    ccall((:ctx_SwtControls_Get_Delay, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_First(ctx)
    ccall((:ctx_SwtControls_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_IsLocked(ctx)
    ccall((:ctx_SwtControls_Get_IsLocked, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_Name(ctx)
    ccall((:ctx_SwtControls_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_Next(ctx)
    ccall((:ctx_SwtControls_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_SwitchedObj(ctx)
    ccall((:ctx_SwtControls_Get_SwitchedObj, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_SwitchedTerm(ctx)
    ccall((:ctx_SwtControls_Get_SwitchedTerm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function SwtControls_Set_Action(ctx, Value)
    ccall((:ctx_SwtControls_Set_Action, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function SwtControls_Set_Delay(ctx, Value)
    ccall((:ctx_SwtControls_Set_Delay, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function SwtControls_Set_IsLocked(ctx, Value)
    ccall((:ctx_SwtControls_Set_IsLocked, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function SwtControls_Set_Name(ctx, Value)
    ccall((:ctx_SwtControls_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function SwtControls_Set_SwitchedObj(ctx, Value)
    ccall((:ctx_SwtControls_Set_SwitchedObj, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function SwtControls_Set_SwitchedTerm(ctx, Value)
    ccall((:ctx_SwtControls_Set_SwitchedTerm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function SwtControls_Get_Count(ctx)
    ccall((:ctx_SwtControls_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_NormalState(ctx)
    ccall((:ctx_SwtControls_Get_NormalState, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function SwtControls_Set_NormalState(ctx, Value)
    ccall((:ctx_SwtControls_Set_NormalState, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function SwtControls_Get_State(ctx)
    ccall((:ctx_SwtControls_Get_State, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function SwtControls_Set_State(ctx, Value)
    ccall((:ctx_SwtControls_Set_State, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function SwtControls_Reset(ctx)
    ccall((:ctx_SwtControls_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Text_Get_Command(ctx)
    ccall((:ctx_Text_Get_Command, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Text_Set_Command(ctx, Value)
    ccall((:ctx_Text_Set_Command, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Text_Get_Result(ctx)
    ccall((:ctx_Text_Get_Result, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Topology_Get_NumLoops(ctx)
    ccall((:ctx_Topology_Get_NumLoops, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_ActiveBranch(ctx)
    ccall((:ctx_Topology_Get_ActiveBranch, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_AllIsolatedBranches(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Topology_Get_AllIsolatedBranches, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Topology_Get_AllIsolatedBranches_GR(ctx)
    ccall((:ctx_Topology_Get_AllIsolatedBranches_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Topology_Get_AllLoopedPairs(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Topology_Get_AllLoopedPairs, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Topology_Get_AllLoopedPairs_GR(ctx)
    ccall((:ctx_Topology_Get_AllLoopedPairs_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Topology_Get_BackwardBranch(ctx)
    ccall((:ctx_Topology_Get_BackwardBranch, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_BranchName(ctx)
    ccall((:ctx_Topology_Get_BranchName, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Topology_Get_First(ctx)
    ccall((:ctx_Topology_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_ForwardBranch(ctx)
    ccall((:ctx_Topology_Get_ForwardBranch, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_LoopedBranch(ctx)
    ccall((:ctx_Topology_Get_LoopedBranch, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_Next(ctx)
    ccall((:ctx_Topology_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_NumIsolatedBranches(ctx)
    ccall((:ctx_Topology_Get_NumIsolatedBranches, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_ParallelBranch(ctx)
    ccall((:ctx_Topology_Get_ParallelBranch, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Set_BranchName(ctx, Value)
    ccall((:ctx_Topology_Set_BranchName, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Topology_Get_AllIsolatedLoads(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Topology_Get_AllIsolatedLoads, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Topology_Get_AllIsolatedLoads_GR(ctx)
    ccall((:ctx_Topology_Get_AllIsolatedLoads_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Topology_Get_FirstLoad(ctx)
    ccall((:ctx_Topology_Get_FirstLoad, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_NextLoad(ctx)
    ccall((:ctx_Topology_Get_NextLoad, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_NumIsolatedLoads(ctx)
    ccall((:ctx_Topology_Get_NumIsolatedLoads, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_ActiveLevel(ctx)
    ccall((:ctx_Topology_Get_ActiveLevel, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_BusName(ctx)
    ccall((:ctx_Topology_Get_BusName, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Topology_Set_BusName(ctx, Value)
    ccall((:ctx_Topology_Set_BusName, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Transformers_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Transformers_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Transformers_Get_AllNames_GR(ctx)
    ccall((:ctx_Transformers_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_First(ctx)
    ccall((:ctx_Transformers_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_IsDelta(ctx)
    ccall((:ctx_Transformers_Get_IsDelta, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_kV(ctx)
    ccall((:ctx_Transformers_Get_kV, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_kVA(ctx)
    ccall((:ctx_Transformers_Get_kVA, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_MaxTap(ctx)
    ccall((:ctx_Transformers_Get_MaxTap, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_MinTap(ctx)
    ccall((:ctx_Transformers_Get_MinTap, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Name(ctx)
    ccall((:ctx_Transformers_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Next(ctx)
    ccall((:ctx_Transformers_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_NumTaps(ctx)
    ccall((:ctx_Transformers_Get_NumTaps, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_NumWindings(ctx)
    ccall((:ctx_Transformers_Get_NumWindings, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_R(ctx)
    ccall((:ctx_Transformers_Get_R, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Rneut(ctx)
    ccall((:ctx_Transformers_Get_Rneut, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Tap(ctx)
    ccall((:ctx_Transformers_Get_Tap, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Wdg(ctx)
    ccall((:ctx_Transformers_Get_Wdg, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_XfmrCode(ctx)
    ccall((:ctx_Transformers_Get_XfmrCode, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Xhl(ctx)
    ccall((:ctx_Transformers_Get_Xhl, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Xht(ctx)
    ccall((:ctx_Transformers_Get_Xht, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Xlt(ctx)
    ccall((:ctx_Transformers_Get_Xlt, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Xneut(ctx)
    ccall((:ctx_Transformers_Get_Xneut, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Set_IsDelta(ctx, Value)
    ccall((:ctx_Transformers_Set_IsDelta, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Transformers_Set_kV(ctx, Value)
    ccall((:ctx_Transformers_Set_kV, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_kVA(ctx, Value)
    ccall((:ctx_Transformers_Set_kVA, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_MaxTap(ctx, Value)
    ccall((:ctx_Transformers_Set_MaxTap, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_MinTap(ctx, Value)
    ccall((:ctx_Transformers_Set_MinTap, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_Name(ctx, Value)
    ccall((:ctx_Transformers_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Transformers_Set_NumTaps(ctx, Value)
    ccall((:ctx_Transformers_Set_NumTaps, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Transformers_Set_NumWindings(ctx, Value)
    ccall((:ctx_Transformers_Set_NumWindings, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Transformers_Set_R(ctx, Value)
    ccall((:ctx_Transformers_Set_R, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_Rneut(ctx, Value)
    ccall((:ctx_Transformers_Set_Rneut, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_Tap(ctx, Value)
    ccall((:ctx_Transformers_Set_Tap, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_Wdg(ctx, Value)
    ccall((:ctx_Transformers_Set_Wdg, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Transformers_Set_XfmrCode(ctx, Value)
    ccall((:ctx_Transformers_Set_XfmrCode, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Transformers_Set_Xhl(ctx, Value)
    ccall((:ctx_Transformers_Set_Xhl, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_Xht(ctx, Value)
    ccall((:ctx_Transformers_Set_Xht, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_Xlt(ctx, Value)
    ccall((:ctx_Transformers_Set_Xlt, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_Xneut(ctx, Value)
    ccall((:ctx_Transformers_Set_Xneut, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Get_Count(ctx)
    ccall((:ctx_Transformers_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_WdgVoltages(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Transformers_Get_WdgVoltages, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Transformers_Get_WdgVoltages_GR(ctx)
    ccall((:ctx_Transformers_Get_WdgVoltages_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_WdgCurrents(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Transformers_Get_WdgCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Transformers_Get_WdgCurrents_GR(ctx)
    ccall((:ctx_Transformers_Get_WdgCurrents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_strWdgCurrents(ctx)
    ccall((:ctx_Transformers_Get_strWdgCurrents, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_CoreType(ctx)
    ccall((:ctx_Transformers_Get_CoreType, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Transformers_Set_CoreType(ctx, Value)
    ccall((:ctx_Transformers_Set_CoreType, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Transformers_Get_RdcOhms(ctx)
    ccall((:ctx_Transformers_Get_RdcOhms, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Set_RdcOhms(ctx, Value)
    ccall((:ctx_Transformers_Set_RdcOhms, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Get_LossesByType(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Transformers_Get_LossesByType, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Transformers_Get_LossesByType_GR(ctx)
    ccall((:ctx_Transformers_Get_LossesByType_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_AllLossesByType(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Transformers_Get_AllLossesByType, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Transformers_Get_AllLossesByType_GR(ctx)
    ccall((:ctx_Transformers_Get_AllLossesByType_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Vsources_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Vsources_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Vsources_Get_AllNames_GR(ctx)
    ccall((:ctx_Vsources_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Vsources_Get_Count(ctx)
    ccall((:ctx_Vsources_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Vsources_Get_First(ctx)
    ccall((:ctx_Vsources_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Vsources_Get_Next(ctx)
    ccall((:ctx_Vsources_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Vsources_Get_Name(ctx)
    ccall((:ctx_Vsources_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Vsources_Set_Name(ctx, Value)
    ccall((:ctx_Vsources_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Vsources_Get_BasekV(ctx)
    ccall((:ctx_Vsources_Get_BasekV, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Vsources_Get_pu(ctx)
    ccall((:ctx_Vsources_Get_pu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Vsources_Set_BasekV(ctx, Value)
    ccall((:ctx_Vsources_Set_BasekV, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Vsources_Set_pu(ctx, Value)
    ccall((:ctx_Vsources_Set_pu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Vsources_Get_AngleDeg(ctx)
    ccall((:ctx_Vsources_Get_AngleDeg, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Vsources_Get_Frequency(ctx)
    ccall((:ctx_Vsources_Get_Frequency, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Vsources_Get_Phases(ctx)
    ccall((:ctx_Vsources_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Vsources_Set_AngleDeg(ctx, Value)
    ccall((:ctx_Vsources_Set_AngleDeg, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Vsources_Set_Frequency(ctx, Value)
    ccall((:ctx_Vsources_Set_Frequency, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Vsources_Set_Phases(ctx, Value)
    ccall((:ctx_Vsources_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function XYCurves_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_XYCurves_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function XYCurves_Get_AllNames_GR(ctx)
    ccall((:ctx_XYCurves_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_Count(ctx)
    ccall((:ctx_XYCurves_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_First(ctx)
    ccall((:ctx_XYCurves_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_Name(ctx)
    ccall((:ctx_XYCurves_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_Next(ctx)
    ccall((:ctx_XYCurves_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function XYCurves_Set_Name(ctx, Value)
    ccall((:ctx_XYCurves_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function XYCurves_Get_Npts(ctx)
    ccall((:ctx_XYCurves_Get_Npts, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_Xarray(ctx, ResultPtr, ResultCount)
    ccall((:ctx_XYCurves_Get_Xarray, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function XYCurves_Get_Xarray_GR(ctx)
    ccall((:ctx_XYCurves_Get_Xarray_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function XYCurves_Set_Npts(ctx, Value)
    ccall((:ctx_XYCurves_Set_Npts, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function XYCurves_Set_Xarray(ctx, ValuePtr, ValueCount)
    ccall((:ctx_XYCurves_Set_Xarray, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function XYCurves_Get_x(ctx)
    ccall((:ctx_XYCurves_Get_x, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_y(ctx)
    ccall((:ctx_XYCurves_Get_y, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_Yarray(ctx, ResultPtr, ResultCount)
    ccall((:ctx_XYCurves_Get_Yarray, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function XYCurves_Get_Yarray_GR(ctx)
    ccall((:ctx_XYCurves_Get_Yarray_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function XYCurves_Set_x(ctx, Value)
    ccall((:ctx_XYCurves_Set_x, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function XYCurves_Set_y(ctx, Value)
    ccall((:ctx_XYCurves_Set_y, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function XYCurves_Set_Yarray(ctx, ValuePtr, ValueCount)
    ccall((:ctx_XYCurves_Set_Yarray, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function XYCurves_Get_Xscale(ctx)
    ccall((:ctx_XYCurves_Get_Xscale, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_Xshift(ctx)
    ccall((:ctx_XYCurves_Get_Xshift, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_Yscale(ctx)
    ccall((:ctx_XYCurves_Get_Yscale, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_Yshift(ctx)
    ccall((:ctx_XYCurves_Get_Yshift, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function XYCurves_Set_Xscale(ctx, Value)
    ccall((:ctx_XYCurves_Set_Xscale, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function XYCurves_Set_Xshift(ctx, Value)
    ccall((:ctx_XYCurves_Set_Xshift, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function XYCurves_Set_Yscale(ctx, Value)
    ccall((:ctx_XYCurves_Set_Yscale, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function XYCurves_Set_Yshift(ctx, Value)
    ccall((:ctx_XYCurves_Set_Yshift, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function YMatrix_GetCompressedYMatrix(ctx, factor, nBus, nNz, ColPtr, RowIdxPtr, cValsPtr)
    ccall((:ctx_YMatrix_GetCompressedYMatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16, Ptr{UInt32}, Ptr{UInt32}, Ptr{Ptr{Int32}}, Ptr{Ptr{Int32}}, Ptr{Ptr{Cdouble}}), ctx, factor, nBus, nNz, ColPtr, RowIdxPtr, cValsPtr)
end

function YMatrix_ZeroInjCurr(ctx)
    ccall((:ctx_YMatrix_ZeroInjCurr, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function YMatrix_GetSourceInjCurrents(ctx)
    ccall((:ctx_YMatrix_GetSourceInjCurrents, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function YMatrix_GetPCInjCurr(ctx)
    ccall((:ctx_YMatrix_GetPCInjCurr, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function YMatrix_BuildYMatrixD(ctx, BuildOps, AllocateVI)
    ccall((:ctx_YMatrix_BuildYMatrixD, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Int32), ctx, BuildOps, AllocateVI)
end

function YMatrix_AddInAuxCurrents(ctx, SType)
    ccall((:ctx_YMatrix_AddInAuxCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, SType)
end

function YMatrix_getIpointer(ctx, IvectorPtr)
    ccall((:ctx_YMatrix_getIpointer, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}},), ctx, IvectorPtr)
end

function YMatrix_getVpointer(ctx, VvectorPtr)
    ccall((:ctx_YMatrix_getVpointer, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}},), ctx, VvectorPtr)
end

function YMatrix_SolveSystem(ctx, NodeVPtr)
    ccall((:ctx_YMatrix_SolveSystem, LIBRARY), Int32, (Ptr{Cvoid}, Ptr{Cdouble},), ctx, NodeVPtr)
end

function YMatrix_Set_SystemYChanged(ctx, arg)
    ccall((:ctx_YMatrix_Set_SystemYChanged, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, arg)
end

function YMatrix_Get_SystemYChanged(ctx)
    ccall((:ctx_YMatrix_Get_SystemYChanged, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function YMatrix_Set_UseAuxCurrents(ctx, arg)
    ccall((:ctx_YMatrix_Set_UseAuxCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, arg)
end

function YMatrix_Get_UseAuxCurrents(ctx)
    ccall((:ctx_YMatrix_Get_UseAuxCurrents, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_Get_Zmag(ctx)
    ccall((:ctx_ReduceCkt_Get_Zmag, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_Set_Zmag(ctx, Value)
    ccall((:ctx_ReduceCkt_Set_Zmag, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function ReduceCkt_Get_KeepLoad(ctx)
    ccall((:ctx_ReduceCkt_Get_KeepLoad, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_Set_KeepLoad(ctx, Value)
    ccall((:ctx_ReduceCkt_Set_KeepLoad, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function ReduceCkt_Get_EditString(ctx)
    ccall((:ctx_ReduceCkt_Get_EditString, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_Set_EditString(ctx, Value)
    ccall((:ctx_ReduceCkt_Set_EditString, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function ReduceCkt_Get_StartPDElement(ctx)
    ccall((:ctx_ReduceCkt_Get_StartPDElement, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_Set_StartPDElement(ctx, Value)
    ccall((:ctx_ReduceCkt_Set_StartPDElement, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function ReduceCkt_Get_EnergyMeter(ctx)
    ccall((:ctx_ReduceCkt_Get_EnergyMeter, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_Set_EnergyMeter(ctx, Value)
    ccall((:ctx_ReduceCkt_Set_EnergyMeter, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function ReduceCkt_SaveCircuit(ctx, CktName)
    ccall((:ctx_ReduceCkt_SaveCircuit, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, CktName)
end

function ReduceCkt_DoDefault(ctx)
    ccall((:ctx_ReduceCkt_DoDefault, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_DoShortLines(ctx)
    ccall((:ctx_ReduceCkt_DoShortLines, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_DoDangling(ctx)
    ccall((:ctx_ReduceCkt_DoDangling, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_DoLoopBreak(ctx)
    ccall((:ctx_ReduceCkt_DoLoopBreak, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_DoParallelLines(ctx)
    ccall((:ctx_ReduceCkt_DoParallelLines, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_DoSwitches(ctx)
    ccall((:ctx_ReduceCkt_DoSwitches, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_Do1phLaterals(ctx)
    ccall((:ctx_ReduceCkt_Do1phLaterals, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_DoBranchRemove(ctx)
    ccall((:ctx_ReduceCkt_DoBranchRemove, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Storages_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Storages_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Storages_Get_First(ctx)
    ccall((:ctx_Storages_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Storages_Get_Next(ctx)
    ccall((:ctx_Storages_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Storages_Get_Count(ctx)
    ccall((:ctx_Storages_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Storages_Get_idx(ctx)
    ccall((:ctx_Storages_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Storages_Set_idx(ctx, Value)
    ccall((:ctx_Storages_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Storages_Get_Name(ctx)
    ccall((:ctx_Storages_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Storages_Set_Name(ctx, Value)
    ccall((:ctx_Storages_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Storages_Get_RegisterNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Storages_Get_RegisterNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Storages_Get_RegisterValues(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Storages_Get_RegisterValues, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Storages_Get_RegisterValues_GR(ctx)
    ccall((:ctx_Storages_Get_RegisterValues_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Storages_Get_puSOC(ctx)
    ccall((:ctx_Storages_Get_puSOC, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Storages_Set_puSOC(ctx, Value)
    ccall((:ctx_Storages_Set_puSOC, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Storages_Get_State(ctx)
    ccall((:ctx_Storages_Get_State, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Storages_Set_State(ctx, Value)
    ccall((:ctx_Storages_Set_State, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CNData_Get_Count(ctx)
    ccall((:ctx_CNData_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CNData_Get_First(ctx)
    ccall((:ctx_CNData_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CNData_Get_Next(ctx)
    ccall((:ctx_CNData_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CNData_Get_Name(ctx)
    ccall((:ctx_CNData_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function CNData_Set_Name(ctx, Value)
    ccall((:ctx_CNData_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function CNData_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CNData_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CNData_Get_AllNames_GR(ctx)
    ccall((:ctx_CNData_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CNData_Get_Rdc(ctx)
    ccall((:ctx_CNData_Get_Rdc, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_Rdc(ctx, Value)
    ccall((:ctx_CNData_Set_Rdc, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_Rac(ctx)
    ccall((:ctx_CNData_Get_Rac, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_Rac(ctx, Value)
    ccall((:ctx_CNData_Set_Rac, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_GMRac(ctx)
    ccall((:ctx_CNData_Get_GMRac, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_GMRac(ctx, Value)
    ccall((:ctx_CNData_Set_GMRac, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_GMRUnits(ctx)
    ccall((:ctx_CNData_Get_GMRUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CNData_Set_GMRUnits(ctx, Value)
    ccall((:ctx_CNData_Set_GMRUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CNData_Get_Radius(ctx)
    ccall((:ctx_CNData_Get_Radius, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_Radius(ctx, Value)
    ccall((:ctx_CNData_Set_Radius, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_RadiusUnits(ctx)
    ccall((:ctx_CNData_Get_RadiusUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CNData_Set_RadiusUnits(ctx, Value)
    ccall((:ctx_CNData_Set_RadiusUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CNData_Get_ResistanceUnits(ctx)
    ccall((:ctx_CNData_Get_ResistanceUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CNData_Set_ResistanceUnits(ctx, Value)
    ccall((:ctx_CNData_Set_ResistanceUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CNData_Get_Diameter(ctx)
    ccall((:ctx_CNData_Get_Diameter, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_Diameter(ctx, Value)
    ccall((:ctx_CNData_Set_Diameter, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_NormAmps(ctx)
    ccall((:ctx_CNData_Get_NormAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_NormAmps(ctx, Value)
    ccall((:ctx_CNData_Set_NormAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_EmergAmps(ctx)
    ccall((:ctx_CNData_Get_EmergAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_EmergAmps(ctx, Value)
    ccall((:ctx_CNData_Set_EmergAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_EpsR(ctx)
    ccall((:ctx_CNData_Get_EpsR, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_EpsR(ctx, Value)
    ccall((:ctx_CNData_Set_EpsR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_InsLayer(ctx)
    ccall((:ctx_CNData_Get_InsLayer, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_InsLayer(ctx, Value)
    ccall((:ctx_CNData_Set_InsLayer, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_DiaIns(ctx)
    ccall((:ctx_CNData_Get_DiaIns, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_DiaIns(ctx, Value)
    ccall((:ctx_CNData_Set_DiaIns, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_DiaCable(ctx)
    ccall((:ctx_CNData_Get_DiaCable, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_DiaCable(ctx, Value)
    ccall((:ctx_CNData_Set_DiaCable, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_k(ctx)
    ccall((:ctx_CNData_Get_k, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CNData_Set_k(ctx, Value)
    ccall((:ctx_CNData_Set_k, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CNData_Get_DiaStrand(ctx)
    ccall((:ctx_CNData_Get_DiaStrand, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_DiaStrand(ctx, Value)
    ccall((:ctx_CNData_Set_DiaStrand, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_GmrStrand(ctx)
    ccall((:ctx_CNData_Get_GmrStrand, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_GmrStrand(ctx, Value)
    ccall((:ctx_CNData_Set_GmrStrand, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_RStrand(ctx)
    ccall((:ctx_CNData_Get_RStrand, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_RStrand(ctx, Value)
    ccall((:ctx_CNData_Set_RStrand, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineGeometries_Get_Count(ctx)
    ccall((:ctx_LineGeometries_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Get_First(ctx)
    ccall((:ctx_LineGeometries_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Get_Next(ctx)
    ccall((:ctx_LineGeometries_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Get_Name(ctx)
    ccall((:ctx_LineGeometries_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_Name(ctx, Value)
    ccall((:ctx_LineGeometries_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function LineGeometries_Get_Nconds(ctx)
    ccall((:ctx_LineGeometries_Get_Nconds, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_Nconds(ctx, Value)
    ccall((:ctx_LineGeometries_Set_Nconds, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineGeometries_Get_Phases(ctx)
    ccall((:ctx_LineGeometries_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_Phases(ctx, Value)
    ccall((:ctx_LineGeometries_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineGeometries_Get_Cmatrix(ctx, ResultPtr, ResultCount, Frequency, Length, Units)
    ccall((:ctx_LineGeometries_Get_Cmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Int32), ctx, ResultPtr, ResultCount, Frequency, Length, Units)
end

function LineGeometries_Get_Cmatrix_GR(ctx, Frequency, Length, Units)
    ccall((:ctx_LineGeometries_Get_Cmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble, Int32), ctx, Frequency, Length, Units)
end

function LineGeometries_Get_Rmatrix(ctx, ResultPtr, ResultCount, Frequency, Length, Units)
    ccall((:ctx_LineGeometries_Get_Rmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Int32), ctx, ResultPtr, ResultCount, Frequency, Length, Units)
end

function LineGeometries_Get_Rmatrix_GR(ctx, Frequency, Length, Units)
    ccall((:ctx_LineGeometries_Get_Rmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble, Int32), ctx, Frequency, Length, Units)
end

function LineGeometries_Get_Xmatrix(ctx, ResultPtr, ResultCount, Frequency, Length, Units)
    ccall((:ctx_LineGeometries_Get_Xmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Int32), ctx, ResultPtr, ResultCount, Frequency, Length, Units)
end

function LineGeometries_Get_Xmatrix_GR(ctx, Frequency, Length, Units)
    ccall((:ctx_LineGeometries_Get_Xmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble, Int32), ctx, Frequency, Length, Units)
end

function LineGeometries_Get_Zmatrix(ctx, ResultPtr, ResultCount, Frequency, Length, Units)
    ccall((:ctx_LineGeometries_Get_Zmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Int32), ctx, ResultPtr, ResultCount, Frequency, Length, Units)
end

function LineGeometries_Get_Zmatrix_GR(ctx, Frequency, Length, Units)
    ccall((:ctx_LineGeometries_Get_Zmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble, Int32), ctx, Frequency, Length, Units)
end

function LineGeometries_Get_Units(ctx, ResultPtr, ResultCount)
    ccall((:ctx_LineGeometries_Get_Units, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineGeometries_Get_Units_GR(ctx)
    ccall((:ctx_LineGeometries_Get_Units_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_Units(ctx, ValuePtr, ValueCount)
    ccall((:ctx_LineGeometries_Set_Units, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Int32}, Int32), ctx, ValuePtr, ValueCount)
end

function LineGeometries_Get_Xcoords(ctx, ResultPtr, ResultCount)
    ccall((:ctx_LineGeometries_Get_Xcoords, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineGeometries_Get_Xcoords_GR(ctx)
    ccall((:ctx_LineGeometries_Get_Xcoords_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_Xcoords(ctx, ValuePtr, ValueCount)
    ccall((:ctx_LineGeometries_Set_Xcoords, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LineGeometries_Get_Ycoords(ctx, ResultPtr, ResultCount)
    ccall((:ctx_LineGeometries_Get_Ycoords, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineGeometries_Get_Ycoords_GR(ctx)
    ccall((:ctx_LineGeometries_Get_Ycoords_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_Ycoords(ctx, ValuePtr, ValueCount)
    ccall((:ctx_LineGeometries_Set_Ycoords, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LineGeometries_Get_Conductors(ctx, ResultPtr, ResultCount)
    ccall((:ctx_LineGeometries_Get_Conductors, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineGeometries_Get_Conductors_GR(ctx)
    ccall((:ctx_LineGeometries_Get_Conductors_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Get_Reduce(ctx)
    ccall((:ctx_LineGeometries_Get_Reduce, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_Reduce(ctx, Value)
    ccall((:ctx_LineGeometries_Set_Reduce, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function LineGeometries_Get_RhoEarth(ctx)
    ccall((:ctx_LineGeometries_Get_RhoEarth, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_RhoEarth(ctx, Value)
    ccall((:ctx_LineGeometries_Set_RhoEarth, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineGeometries_Get_NormAmps(ctx)
    ccall((:ctx_LineGeometries_Get_NormAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_NormAmps(ctx, Value)
    ccall((:ctx_LineGeometries_Set_NormAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineGeometries_Get_EmergAmps(ctx)
    ccall((:ctx_LineGeometries_Get_EmergAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_EmergAmps(ctx, Value)
    ccall((:ctx_LineGeometries_Set_EmergAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineGeometries_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_LineGeometries_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineGeometries_Get_AllNames_GR(ctx)
    ccall((:ctx_LineGeometries_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Get_Count(ctx)
    ccall((:ctx_LineSpacings_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Get_First(ctx)
    ccall((:ctx_LineSpacings_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Get_Next(ctx)
    ccall((:ctx_LineSpacings_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Get_Name(ctx)
    ccall((:ctx_LineSpacings_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Set_Name(ctx, Value)
    ccall((:ctx_LineSpacings_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function LineSpacings_Get_Nconds(ctx)
    ccall((:ctx_LineSpacings_Get_Nconds, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Set_Nconds(ctx, Value)
    ccall((:ctx_LineSpacings_Set_Nconds, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineSpacings_Get_Phases(ctx)
    ccall((:ctx_LineSpacings_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Set_Phases(ctx, Value)
    ccall((:ctx_LineSpacings_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineSpacings_Get_Units(ctx)
    ccall((:ctx_LineSpacings_Get_Units, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Set_Units(ctx, Value)
    ccall((:ctx_LineSpacings_Set_Units, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineSpacings_Get_Xcoords(ctx, ResultPtr, ResultCount)
    ccall((:ctx_LineSpacings_Get_Xcoords, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineSpacings_Get_Xcoords_GR(ctx)
    ccall((:ctx_LineSpacings_Get_Xcoords_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Set_Xcoords(ctx, ValuePtr, ValueCount)
    ccall((:ctx_LineSpacings_Set_Xcoords, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LineSpacings_Get_Ycoords(ctx, ResultPtr, ResultCount)
    ccall((:ctx_LineSpacings_Get_Ycoords, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineSpacings_Get_Ycoords_GR(ctx)
    ccall((:ctx_LineSpacings_Get_Ycoords_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Set_Ycoords(ctx, ValuePtr, ValueCount)
    ccall((:ctx_LineSpacings_Set_Ycoords, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LineSpacings_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_LineSpacings_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineSpacings_Get_AllNames_GR(ctx)
    ccall((:ctx_LineSpacings_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Phases(ctx)
    ccall((:ctx_Loads_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Set_Phases(ctx, Integer)
    ccall((:ctx_Loads_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Integer)
end

function Reactors_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Reactors_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reactors_Get_AllNames_GR(ctx)
    ccall((:ctx_Reactors_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reactors_Get_Name(ctx)
    ccall((:ctx_Reactors_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Name(ctx, Value)
    ccall((:ctx_Reactors_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Reactors_Get_First(ctx)
    ccall((:ctx_Reactors_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reactors_Get_Next(ctx)
    ccall((:ctx_Reactors_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reactors_Get_Count(ctx)
    ccall((:ctx_Reactors_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reactors_Get_kV(ctx)
    ccall((:ctx_Reactors_Get_kV, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_kV(ctx, Value)
    ccall((:ctx_Reactors_Set_kV, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reactors_Get_kvar(ctx)
    ccall((:ctx_Reactors_Get_kvar, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_kvar(ctx, Value)
    ccall((:ctx_Reactors_Set_kvar, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reactors_Get_Phases(ctx)
    ccall((:ctx_Reactors_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Phases(ctx, Integer)
    ccall((:ctx_Reactors_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Integer)
end

function Reactors_Get_IsDelta(ctx)
    ccall((:ctx_Reactors_Get_IsDelta, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_IsDelta(ctx, Value)
    ccall((:ctx_Reactors_Set_IsDelta, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Reactors_Get_Parallel(ctx)
    ccall((:ctx_Reactors_Get_Parallel, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Parallel(ctx, Value)
    ccall((:ctx_Reactors_Set_Parallel, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Reactors_Get_LmH(ctx)
    ccall((:ctx_Reactors_Get_LmH, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_LmH(ctx, Value)
    ccall((:ctx_Reactors_Set_LmH, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reactors_Get_Bus1(ctx)
    ccall((:ctx_Reactors_Get_Bus1, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reactors_Get_Bus2(ctx)
    ccall((:ctx_Reactors_Get_Bus2, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Bus1(ctx, Value)
    ccall((:ctx_Reactors_Set_Bus1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Reactors_Set_Bus2(ctx, Value)
    ccall((:ctx_Reactors_Set_Bus2, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Reactors_Get_R(ctx)
    ccall((:ctx_Reactors_Get_R, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_R(ctx, Value)
    ccall((:ctx_Reactors_Set_R, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reactors_Get_X(ctx)
    ccall((:ctx_Reactors_Get_X, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_X(ctx, Value)
    ccall((:ctx_Reactors_Set_X, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reactors_Get_Rp(ctx)
    ccall((:ctx_Reactors_Get_Rp, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Rp(ctx, Value)
    ccall((:ctx_Reactors_Set_Rp, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reactors_Get_RCurve(ctx)
    ccall((:ctx_Reactors_Get_RCurve, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_RCurve(ctx, Value)
    ccall((:ctx_Reactors_Set_RCurve, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Reactors_Get_LCurve(ctx)
    ccall((:ctx_Reactors_Get_LCurve, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_LCurve(ctx, Value)
    ccall((:ctx_Reactors_Set_LCurve, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Reactors_Get_Rmatrix(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Reactors_Get_Rmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reactors_Get_Rmatrix_GR(ctx)
    ccall((:ctx_Reactors_Get_Rmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Rmatrix(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Reactors_Set_Rmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Reactors_Get_Xmatrix(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Reactors_Get_Xmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reactors_Get_Xmatrix_GR(ctx)
    ccall((:ctx_Reactors_Get_Xmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Xmatrix(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Reactors_Set_Xmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Reactors_Get_Z(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Reactors_Get_Z, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reactors_Get_Z_GR(ctx)
    ccall((:ctx_Reactors_Get_Z_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Z(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Reactors_Set_Z, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Reactors_Get_Z1(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Reactors_Get_Z1, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reactors_Get_Z1_GR(ctx)
    ccall((:ctx_Reactors_Get_Z1_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Z1(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Reactors_Set_Z1, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Reactors_Get_Z2(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Reactors_Get_Z2, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reactors_Get_Z2_GR(ctx)
    ccall((:ctx_Reactors_Get_Z2_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Z2(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Reactors_Set_Z2, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Reactors_Get_Z0(ctx, ResultPtr, ResultCount)
    ccall((:ctx_Reactors_Get_Z0, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reactors_Get_Z0_GR(ctx)
    ccall((:ctx_Reactors_Get_Z0_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Z0(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Reactors_Set_Z0, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Reactors_Get_SpecType(ctx)
    ccall((:ctx_Reactors_Get_SpecType, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function TSData_Get_Count(ctx)
    ccall((:ctx_TSData_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function TSData_Get_First(ctx)
    ccall((:ctx_TSData_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function TSData_Get_Next(ctx)
    ccall((:ctx_TSData_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function TSData_Get_Name(ctx)
    ccall((:ctx_TSData_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function TSData_Set_Name(ctx, Value)
    ccall((:ctx_TSData_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function TSData_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_TSData_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function TSData_Get_AllNames_GR(ctx)
    ccall((:ctx_TSData_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function TSData_Get_Rdc(ctx)
    ccall((:ctx_TSData_Get_Rdc, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_Rdc(ctx, Value)
    ccall((:ctx_TSData_Set_Rdc, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_Rac(ctx)
    ccall((:ctx_TSData_Get_Rac, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_Rac(ctx, Value)
    ccall((:ctx_TSData_Set_Rac, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_GMRac(ctx)
    ccall((:ctx_TSData_Get_GMRac, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_GMRac(ctx, Value)
    ccall((:ctx_TSData_Set_GMRac, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_GMRUnits(ctx)
    ccall((:ctx_TSData_Get_GMRUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function TSData_Set_GMRUnits(ctx, Value)
    ccall((:ctx_TSData_Set_GMRUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function TSData_Get_Radius(ctx)
    ccall((:ctx_TSData_Get_Radius, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_Radius(ctx, Value)
    ccall((:ctx_TSData_Set_Radius, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_RadiusUnits(ctx)
    ccall((:ctx_TSData_Get_RadiusUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function TSData_Set_RadiusUnits(ctx, Value)
    ccall((:ctx_TSData_Set_RadiusUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function TSData_Get_ResistanceUnits(ctx)
    ccall((:ctx_TSData_Get_ResistanceUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function TSData_Set_ResistanceUnits(ctx, Value)
    ccall((:ctx_TSData_Set_ResistanceUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function TSData_Get_Diameter(ctx)
    ccall((:ctx_TSData_Get_Diameter, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_Diameter(ctx, Value)
    ccall((:ctx_TSData_Set_Diameter, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_NormAmps(ctx)
    ccall((:ctx_TSData_Get_NormAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_NormAmps(ctx, Value)
    ccall((:ctx_TSData_Set_NormAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_EmergAmps(ctx)
    ccall((:ctx_TSData_Get_EmergAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_EmergAmps(ctx, Value)
    ccall((:ctx_TSData_Set_EmergAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_EpsR(ctx)
    ccall((:ctx_TSData_Get_EpsR, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_EpsR(ctx, Value)
    ccall((:ctx_TSData_Set_EpsR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_InsLayer(ctx)
    ccall((:ctx_TSData_Get_InsLayer, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_InsLayer(ctx, Value)
    ccall((:ctx_TSData_Set_InsLayer, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_DiaIns(ctx)
    ccall((:ctx_TSData_Get_DiaIns, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_DiaIns(ctx, Value)
    ccall((:ctx_TSData_Set_DiaIns, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_DiaCable(ctx)
    ccall((:ctx_TSData_Get_DiaCable, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_DiaCable(ctx, Value)
    ccall((:ctx_TSData_Set_DiaCable, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_DiaShield(ctx)
    ccall((:ctx_TSData_Get_DiaShield, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_DiaShield(ctx, Value)
    ccall((:ctx_TSData_Set_DiaShield, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_TapeLayer(ctx)
    ccall((:ctx_TSData_Get_TapeLayer, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_TapeLayer(ctx, Value)
    ccall((:ctx_TSData_Set_TapeLayer, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_TapeLap(ctx)
    ccall((:ctx_TSData_Get_TapeLap, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_TapeLap(ctx, Value)
    ccall((:ctx_TSData_Set_TapeLap, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function WireData_Get_Count(ctx)
    ccall((:ctx_WireData_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function WireData_Get_First(ctx)
    ccall((:ctx_WireData_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function WireData_Get_Next(ctx)
    ccall((:ctx_WireData_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function WireData_Get_Name(ctx)
    ccall((:ctx_WireData_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function WireData_Set_Name(ctx, Value)
    ccall((:ctx_WireData_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function WireData_Get_AllNames(ctx, ResultPtr, ResultCount)
    ccall((:ctx_WireData_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function WireData_Get_AllNames_GR(ctx)
    ccall((:ctx_WireData_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function WireData_Get_Rdc(ctx)
    ccall((:ctx_WireData_Get_Rdc, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function WireData_Set_Rdc(ctx, Value)
    ccall((:ctx_WireData_Set_Rdc, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function WireData_Get_Rac(ctx)
    ccall((:ctx_WireData_Get_Rac, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function WireData_Set_Rac(ctx, Value)
    ccall((:ctx_WireData_Set_Rac, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function WireData_Get_GMRac(ctx)
    ccall((:ctx_WireData_Get_GMRac, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function WireData_Set_GMRac(ctx, Value)
    ccall((:ctx_WireData_Set_GMRac, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function WireData_Get_GMRUnits(ctx)
    ccall((:ctx_WireData_Get_GMRUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function WireData_Set_GMRUnits(ctx, Value)
    ccall((:ctx_WireData_Set_GMRUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function WireData_Get_Radius(ctx)
    ccall((:ctx_WireData_Get_Radius, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function WireData_Set_Radius(ctx, Value)
    ccall((:ctx_WireData_Set_Radius, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function WireData_Get_RadiusUnits(ctx)
    ccall((:ctx_WireData_Get_RadiusUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function WireData_Set_RadiusUnits(ctx, Value)
    ccall((:ctx_WireData_Set_RadiusUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function WireData_Get_ResistanceUnits(ctx)
    ccall((:ctx_WireData_Get_ResistanceUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function WireData_Set_ResistanceUnits(ctx, Value)
    ccall((:ctx_WireData_Set_ResistanceUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function WireData_Get_Diameter(ctx)
    ccall((:ctx_WireData_Get_Diameter, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function WireData_Set_Diameter(ctx, Value)
    ccall((:ctx_WireData_Set_Diameter, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function WireData_Get_NormAmps(ctx)
    ccall((:ctx_WireData_Get_NormAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function WireData_Set_NormAmps(ctx, Value)
    ccall((:ctx_WireData_Set_NormAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function WireData_Get_EmergAmps(ctx)
    ccall((:ctx_WireData_Get_EmergAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function WireData_Set_EmergAmps(ctx, Value)
    ccall((:ctx_WireData_Set_EmergAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function WireData_Get_CapRadius(ctx)
    ccall((:ctx_WireData_Get_CapRadius, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function WireData_Set_CapRadius(ctx, Value)
    ccall((:ctx_WireData_Set_CapRadius, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Bus_Get_Next(ctx)
    ccall((:ctx_Bus_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Error_Get_EarlyAbort(ctx)
    ccall((:ctx_Error_Get_EarlyAbort, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Error_Set_EarlyAbort(ctx, Value)
    ccall((:ctx_Error_Set_EarlyAbort, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Error_Get_ExtendedErrors(ctx)
    ccall((:ctx_Error_Get_ExtendedErrors, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Error_Set_ExtendedErrors(ctx, Value)
    ccall((:ctx_Error_Set_ExtendedErrors, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function CNData_Get_idx(ctx)
    ccall((:ctx_CNData_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CNData_Set_idx(ctx, Value)
    ccall((:ctx_CNData_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CapControls_Get_idx(ctx)
    ccall((:ctx_CapControls_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CapControls_Set_idx(ctx, Value)
    ccall((:ctx_CapControls_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Capacitors_Get_idx(ctx)
    ccall((:ctx_Capacitors_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Capacitors_Set_idx(ctx, Value)
    ccall((:ctx_Capacitors_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function GICSources_Get_idx(ctx)
    ccall((:ctx_GICSources_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_idx(ctx, Value)
    ccall((:ctx_GICSources_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function ISources_Get_idx(ctx)
    ccall((:ctx_ISources_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function ISources_Set_idx(ctx, Value)
    ccall((:ctx_ISources_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineCodes_Get_idx(ctx)
    ccall((:ctx_LineCodes_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_idx(ctx, Value)
    ccall((:ctx_LineCodes_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineGeometries_Get_idx(ctx)
    ccall((:ctx_LineGeometries_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_idx(ctx, Value)
    ccall((:ctx_LineGeometries_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineSpacings_Get_idx(ctx)
    ccall((:ctx_LineSpacings_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Set_idx(ctx, Value)
    ccall((:ctx_LineSpacings_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Lines_Get_idx(ctx)
    ccall((:ctx_Lines_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Set_idx(ctx, Value)
    ccall((:ctx_Lines_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LoadShapes_Get_idx(ctx)
    ccall((:ctx_LoadShapes_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_idx(ctx, Value)
    ccall((:ctx_LoadShapes_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Meters_Get_idx(ctx)
    ccall((:ctx_Meters_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Set_idx(ctx, Value)
    ccall((:ctx_Meters_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Monitors_Get_idx(ctx)
    ccall((:ctx_Monitors_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Set_idx(ctx, Value)
    ccall((:ctx_Monitors_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Reactors_Get_idx(ctx)
    ccall((:ctx_Reactors_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_idx(ctx, Value)
    ccall((:ctx_Reactors_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function RegControls_Get_idx(ctx)
    ccall((:ctx_RegControls_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function RegControls_Set_idx(ctx, Value)
    ccall((:ctx_RegControls_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Sensors_Get_idx(ctx)
    ccall((:ctx_Sensors_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Sensors_Set_idx(ctx, Value)
    ccall((:ctx_Sensors_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function SwtControls_Get_idx(ctx)
    ccall((:ctx_SwtControls_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function SwtControls_Set_idx(ctx, Value)
    ccall((:ctx_SwtControls_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function TSData_Get_idx(ctx)
    ccall((:ctx_TSData_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function TSData_Set_idx(ctx, Value)
    ccall((:ctx_TSData_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Transformers_Get_idx(ctx)
    ccall((:ctx_Transformers_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Transformers_Set_idx(ctx, Value)
    ccall((:ctx_Transformers_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Vsources_Get_idx(ctx)
    ccall((:ctx_Vsources_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Vsources_Set_idx(ctx, Value)
    ccall((:ctx_Vsources_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function WireData_Get_idx(ctx)
    ccall((:ctx_WireData_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function WireData_Set_idx(ctx, Value)
    ccall((:ctx_WireData_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function XYCurves_Get_idx(ctx)
    ccall((:ctx_XYCurves_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function XYCurves_Set_idx(ctx, Value)
    ccall((:ctx_XYCurves_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Circuit_Get_ElementLosses(ctx, ResultPtr, ResultCount, ElementsPtr, ElementsCount)
    ccall((:ctx_Circuit_Get_ElementLosses, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, ElementsPtr, ElementsCount)
end

function Circuit_Get_ElementLosses_GR(ctx, ElementsPtr, ElementsCount)
    ccall((:ctx_Circuit_Get_ElementLosses_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Int32}, Int32), ctx, ElementsPtr, ElementsCount)
end

function LoadShapes_Set_Points(ctx, Npts, HoursPtr, PMultPtr, QMultPtr, ExternalMemory, IsFloat32, Stride)
    ccall((:ctx_LoadShapes_Set_Points, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, UInt16, UInt16, Int32), ctx, Npts, HoursPtr, PMultPtr, QMultPtr, ExternalMemory, IsFloat32, Stride)
end

function LoadShapes_UseFloat32(ctx)
    ccall((:ctx_LoadShapes_UseFloat32, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LoadShapes_UseFloat64(ctx)
    ccall((:ctx_LoadShapes_UseFloat64, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_MaxP(ctx, Value)
    ccall((:ctx_LoadShapes_Set_MaxP, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LoadShapes_Get_MaxP(ctx)
    ccall((:ctx_LoadShapes_Get_MaxP, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_MaxQ(ctx, Value)
    ccall((:ctx_LoadShapes_Set_MaxQ, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LoadShapes_Get_MaxQ(ctx)
    ccall((:ctx_LoadShapes_Get_MaxQ, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_NodeRef(ctx, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_NodeRef, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_NodeRef_GR(ctx)
    ccall((:ctx_CktElement_Get_NodeRef_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function YMatrix_CheckConvergence(ctx)
    ccall((:ctx_YMatrix_CheckConvergence, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function YMatrix_SetGeneratordQdV(ctx)
    ccall((:ctx_YMatrix_SetGeneratordQdV, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function YMatrix_Get_LoadsNeedUpdating(ctx)
    ccall((:ctx_YMatrix_Get_LoadsNeedUpdating, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function YMatrix_Set_LoadsNeedUpdating(ctx, Value)
    ccall((:ctx_YMatrix_Set_LoadsNeedUpdating, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function YMatrix_Get_SolutionInitialized(ctx)
    ccall((:ctx_YMatrix_Get_SolutionInitialized, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function YMatrix_Set_SolutionInitialized(ctx, Value)
    ccall((:ctx_YMatrix_Set_SolutionInitialized, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function YMatrix_Get_Iteration(ctx)
    ccall((:ctx_YMatrix_Get_Iteration, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function YMatrix_Set_Iteration(ctx, Value)
    ccall((:ctx_YMatrix_Set_Iteration, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function YMatrix_Get_Handle(ctx)
    ccall((:ctx_YMatrix_Get_Handle, LIBRARY), Ptr{Cvoid}, (Ptr{Cvoid},), ctx)
end

function YMatrix_Set_SolverOptions(ctx, opts)
    ccall((:ctx_YMatrix_Set_SolverOptions, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt64,), ctx, opts)
end

function YMatrix_Get_SolverOptions(ctx)
    ccall((:ctx_YMatrix_Get_SolverOptions, LIBRARY), UInt64, (Ptr{Cvoid},), ctx)
end

function Text_CommandBlock(ctx, Value)
    ccall((:ctx_Text_CommandBlock, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Text_CommandArray(ctx, ValuePtr, ValueCount)
    ccall((:ctx_Text_CommandArray, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cstring}, Int32), ctx, ValuePtr, ValueCount)
end

function ZIP_Open(ctx, FileName)
    ccall((:ctx_ZIP_Open, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, FileName)
end

function ZIP_Redirect(ctx, FileInZip)
    ccall((:ctx_ZIP_Redirect, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, FileInZip)
end

function ZIP_Contains(ctx, Name)
    ccall((:ctx_ZIP_Contains, LIBRARY), UInt16, (Ptr{Cvoid}, Cstring,), ctx, Name)
end

function ZIP_List(ctx, ResultPtr, ResultCount, RegExp)
    ccall((:ctx_ZIP_List, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}, Cstring), ctx, ResultPtr, ResultCount, RegExp)
end

function ZIP_Extract(ctx, ResultPtr, ResultCount, FileName)
    ccall((:ctx_ZIP_Extract, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int8}}, Ptr{Int32}, Cstring), ctx, ResultPtr, ResultCount, FileName)
end

function ZIP_Extract_GR(ctx, FileName)
    ccall((:ctx_ZIP_Extract_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, FileName)
end

function ZIP_Close(ctx)
    ccall((:ctx_ZIP_Close, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSS_ExtractSchema(ctx)
    ccall((:DSS_ExtractSchema, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function DSS_Dispose_String(S)
    ccall((:DSS_Dispose_String, LIBRARY), Cvoid, (Cstring,), S)
end

function DSS_Dispose_PPointer(p)
    ccall((:DSS_Dispose_PPointer, LIBRARY), Cvoid, (Ptr{Ptr{Ptr{Cvoid}}},), p)
end

function Obj_New(ctx, ClsIdx, Name, Activate, BeginEdit)
    ccall((:Obj_New, LIBRARY), Ptr{Cvoid}, (Ptr{Cvoid}, Int32, Cstring, UInt16, UInt16), ctx, ClsIdx, Name, Activate, BeginEdit)
end

function Obj_GetCount(ctx, ClsIdx)
    ccall((:Obj_GetCount, LIBRARY), Int32, (Ptr{Cvoid}, Int32), ctx, ClsIdx)
end

function Obj_GetHandleByName(ctx, ClsIdx, Name)
    ccall((:Obj_GetHandleByName, LIBRARY), Ptr{Cvoid}, (Ptr{Cvoid}, Int32, Cstring), ctx, ClsIdx, Name)
end

function Obj_GetHandleByIdx(ctx, ClsIdx, Idx)
    ccall((:Obj_GetHandleByIdx, LIBRARY), Ptr{Cvoid}, (Ptr{Cvoid}, Int32, Int32), ctx, ClsIdx, Idx)
end

function Obj_PropertySideEffects(obj, Index, PreviousInt)
    ccall((:Obj_PropertySideEffects, LIBRARY), UInt16, (Ptr{Cvoid}, Int32, Int32), obj, Index, PreviousInt)
end

function Obj_BeginEdit(obj)
    ccall((:Obj_BeginEdit, LIBRARY), Cvoid, (Ptr{Cvoid},), obj)
end

function Obj_EndEdit(obj, NumChanges)
    ccall((:Obj_EndEdit, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32), obj, NumChanges)
end

function Obj_GetNumProperties(obj)
    ccall((:Obj_GetNumProperties, LIBRARY), Int32, (Ptr{Cvoid},), obj)
end

function Obj_ToJSON(obj, options)
    ccall((:Obj_ToJSON, LIBRARY), Cstring, (Ptr{Cvoid}, Int32), obj, options)
end

function Batch_ToJSON(batch, batchSize, options)
    ccall((:Batch_ToJSON, LIBRARY), Cstring, (Ptr{Ptr{Cvoid}}, Int32, Int32), batch, batchSize, options)
end

function Obj_GetName(obj)
    ccall((:Obj_GetName, LIBRARY), Cstring, (Ptr{Cvoid},), obj)
end

function Obj_GetClassName(obj)
    ccall((:Obj_GetClassName, LIBRARY), Cstring, (Ptr{Cvoid},), obj)
end

function Obj_GetIdx(obj)
    ccall((:Obj_GetIdx, LIBRARY), Int32, (Ptr{Cvoid},), obj)
end

function Obj_GetClassIdx(obj)
    ccall((:Obj_GetClassIdx, LIBRARY), Cstring, (Ptr{Cvoid},), obj)
end

function Obj_Activate(obj, AllLists)
    ccall((:Obj_Activate, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16), obj, AllLists)
end

function Obj_GetPropSeqPtr(obj)
    ccall((:Obj_GetPropSeqPtr, LIBRARY), Ptr{Int32}, (Ptr{Cvoid},), obj)
end

function Obj_GetFloat64(obj, Index)
    ccall((:Obj_GetFloat64, LIBRARY), Cdouble, (Ptr{Cvoid}, Int32), obj, Index)
end

function Obj_GetInt32(obj, Index)
    ccall((:Obj_GetInt32, LIBRARY), Int32, (Ptr{Cvoid}, Int32), obj, Index)
end

function Obj_GetObject(obj, Index)
    ccall((:Obj_GetObject, LIBRARY), Ptr{Cvoid}, (Ptr{Cvoid}, Int32), obj, Index)
end

function Obj_GetString(obj, Index)
    ccall((:Obj_GetString, LIBRARY), Cstring, (Ptr{Cvoid}, Int32), obj, Index)
end

function Obj_GetAsString(obj, Index)
    ccall((:Obj_GetAsString, LIBRARY), Cstring, (Ptr{Cvoid}, Int32), obj, Index)
end

function Obj_GetFloat64Array(ResultPtr, ResultCount, obj, Index)
    ccall((:Obj_GetFloat64Array, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Ptr{Cvoid}, Int32), ResultPtr, ResultCount, obj, Index)
end

function Obj_GetInt32Array(ResultPtr, ResultCount, obj, Index)
    ccall((:Obj_GetInt32Array, LIBRARY), Cvoid, (Ptr{Ptr{Int32}}, Ptr{Int32}, Ptr{Cvoid}, Int32), ResultPtr, ResultCount, obj, Index)
end

function Obj_GetStringArray(ResultPtr, ResultCount, obj, Index)
    ccall((:Obj_GetStringArray, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}, Ptr{Cvoid}, Int32), ResultPtr, ResultCount, obj, Index)
end

function Obj_GetObjectArray(ResultPtr, ResultCount, obj, Index)
    ccall((:Obj_GetObjectArray, LIBRARY), Cvoid, (Ptr{Ptr{Ptr{Cvoid}}}, Ptr{Int32}, Ptr{Cvoid}, Int32), ResultPtr, ResultCount, obj, Index)
end

function Obj_SetAsString(obj, Index, Value)
    ccall((:Obj_SetAsString, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Cstring), obj, Index, Value)
end

function Obj_SetFloat64(obj, Index, Value)
    ccall((:Obj_SetFloat64, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Cdouble), obj, Index, Value)
end

function Obj_SetInt32(obj, Index, Value)
    ccall((:Obj_SetInt32, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Int32), obj, Index, Value)
end

function Obj_SetString(obj, Index, Value)
    ccall((:Obj_SetString, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Cstring), obj, Index, Value)
end

function Obj_SetObject(obj, Index, Value)
    ccall((:Obj_SetObject, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Ptr{Cvoid}), obj, Index, Value)
end

function Obj_SetFloat64Array(obj, Index, Value, ValueCount)
    ccall((:Obj_SetFloat64Array, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Ptr{Cdouble}, Int32), obj, Index, Value, ValueCount)
end

function Obj_SetInt32Array(obj, Index, Value, ValueCount)
    ccall((:Obj_SetInt32Array, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Ptr{Int32}, Int32), obj, Index, Value, ValueCount)
end

function Obj_SetStringArray(obj, Index, Value, ValueCount)
    ccall((:Obj_SetStringArray, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Ptr{Cstring}, Int32), obj, Index, Value, ValueCount)
end

function Obj_SetObjectArray(obj, Index, Value, ValueCount)
    ccall((:Obj_SetObjectArray, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Ptr{Ptr{Cvoid}}, Int32), obj, Index, Value, ValueCount)
end

function Batch_Dispose(batch)
    ccall((:Batch_Dispose, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}},), batch)
end

function Batch_BeginEdit(batch, batchSize)
    ccall((:Batch_BeginEdit, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32), batch, batchSize)
end

function Batch_EndEdit(batch, batchSize, numEdits)
    ccall((:Batch_EndEdit, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Int32), batch, batchSize, numEdits)
end

function Batch_GetPropSeq(ResultPtr, ResultCount, batch, batchSize)
    ccall((:Batch_GetPropSeq, LIBRARY), Cvoid, (Ptr{Ptr{Int32}}, Ptr{Int32}, Ptr{Ptr{Cvoid}}, Int32), ResultPtr, ResultCount, batch, batchSize)
end

function Batch_CreateFromNew(ctx, ResultPtr, ResultCount, clsid, names, count, BeginEdit)
    ccall((:Batch_CreateFromNew, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Ptr{Cvoid}}}, Ptr{Int32}, Int32, Ptr{Cstring}, Int32, UInt16), ctx, ResultPtr, ResultCount, clsid, names, count, BeginEdit)
end

function Batch_CreateByClass(ctx, ResultPtr, ResultCount, clsidx)
    ccall((:Batch_CreateByClass, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Ptr{Cvoid}}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, clsidx)
end

function Batch_CreateByRegExp(ctx, ResultPtr, ResultCount, clsidx, re)
    ccall((:Batch_CreateByRegExp, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Ptr{Cvoid}}}, Ptr{Int32}, Int32, Cstring), ctx, ResultPtr, ResultCount, clsidx, re)
end

function Batch_CreateByIndex(ctx, ResultPtr, ResultCount, clsidx, Value, ValueCount)
    ccall((:Batch_CreateByIndex, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Ptr{Cvoid}}}, Ptr{Int32}, Int32, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, clsidx, Value, ValueCount)
end

function Batch_CreateByInt32Property(ctx, ResultPtr, ResultCount, ClsIdx, idx, value)
    ccall((:Batch_CreateByInt32Property, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Ptr{Cvoid}}}, Ptr{Int32}, Int32, Int32, Int32), ctx, ResultPtr, ResultCount, ClsIdx, idx, value)
end

function Batch_GetFloat64(ResultPtr, ResultCount, batch, batchSize, Index)
    ccall((:Batch_GetFloat64, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Ptr{Ptr{Cvoid}}, Int32, Int32), ResultPtr, ResultCount, batch, batchSize, Index)
end

function Batch_GetInt32(ResultPtr, ResultCount, batch, batchSize, Index)
    ccall((:Batch_GetInt32, LIBRARY), Cvoid, (Ptr{Ptr{Int32}}, Ptr{Int32}, Ptr{Ptr{Cvoid}}, Int32, Int32), ResultPtr, ResultCount, batch, batchSize, Index)
end

function Batch_GetString(ResultPtr, ResultCount, batch, batchSize, Index)
    ccall((:Batch_GetString, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}, Ptr{Ptr{Cvoid}}, Int32, Int32), ResultPtr, ResultCount, batch, batchSize, Index)
end

function Batch_GetAsString(ResultPtr, ResultCount, batch, batchSize, Index)
    ccall((:Batch_GetAsString, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}, Ptr{Ptr{Cvoid}}, Int32, Int32), ResultPtr, ResultCount, batch, batchSize, Index)
end

function Batch_GetObject(ResultPtr, ResultCount, batch, batchSize, Index)
    ccall((:Batch_GetObject, LIBRARY), Cvoid, (Ptr{Ptr{Ptr{Cvoid}}}, Ptr{Int32}, Ptr{Ptr{Cvoid}}, Int32, Int32), ResultPtr, ResultCount, batch, batchSize, Index)
end

function Batch_Float64(batch, batchSize, Index, Operation, Value)
    ccall((:Batch_Float64, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Int32, Int32, Cdouble), batch, batchSize, Index, Operation, Value)
end

function Batch_Int32(batch, batchSize, Index, Operation, Value)
    ccall((:Batch_Int32, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Int32, Int32, Int32), batch, batchSize, Index, Operation, Value)
end

function Batch_SetString(batch, batchSize, Index, Value)
    ccall((:Batch_SetString, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Int32, Cstring), batch, batchSize, Index, Value)
end

function Batch_SetObject(batch, batchSize, Index, Value)
    ccall((:Batch_SetObject, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Int32, Ptr{Cvoid}), batch, batchSize, Index, Value)
end

function Batch_SetFloat64Array(batch, batchSize, Index, Value)
    ccall((:Batch_SetFloat64Array, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Int32, Ptr{Cdouble}), batch, batchSize, Index, Value)
end

function Batch_SetInt32Array(batch, batchSize, Index, Value)
    ccall((:Batch_SetInt32Array, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Int32, Ptr{Int32}), batch, batchSize, Index, Value)
end

function Batch_SetStringArray(batch, batchSize, Index, Value)
    ccall((:Batch_SetStringArray, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Int32, Ptr{Cstring}), batch, batchSize, Index, Value)
end

function Batch_SetObjectArray(batch, batchSize, Index, Value)
    ccall((:Batch_SetObjectArray, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Int32, Ptr{Ptr{Cvoid}}), batch, batchSize, Index, Value)
end

function Batch_CreateFromNewS(ctx, ResultPtr, ResultCount, clsname, names, count, BeginEdit)
    ccall((:Batch_CreateFromNewS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Ptr{Cvoid}}}, Ptr{Int32}, Cstring, Ptr{Cstring}, Int32, UInt16), ctx, ResultPtr, ResultCount, clsname, names, count, BeginEdit)
end

function Batch_CreateByClassS(ctx, ResultPtr, ResultCount, clsname)
    ccall((:Batch_CreateByClassS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Ptr{Cvoid}}}, Ptr{Int32}, Cstring), ctx, ResultPtr, ResultCount, clsname)
end

function Batch_CreateByRegExpS(ctx, ResultPtr, ResultCount, clsname, re)
    ccall((:Batch_CreateByRegExpS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Ptr{Cvoid}}}, Ptr{Int32}, Cstring, Cstring), ctx, ResultPtr, ResultCount, clsname, re)
end

function Batch_CreateByIndexS(ctx, ResultPtr, ResultCount, clsname, Value, ValueCount)
    ccall((:Batch_CreateByIndexS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Ptr{Cvoid}}}, Ptr{Int32}, Cstring, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, clsname, Value, ValueCount)
end

function Batch_CreateByInt32PropertyS(ctx, ResultPtr, ResultCount, clsname, Name, value)
    ccall((:Batch_CreateByInt32PropertyS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Ptr{Cvoid}}}, Ptr{Int32}, Cstring, Cstring, Int32), ctx, ResultPtr, ResultCount, clsname, Name, value)
end

function Batch_GetFloat64S(ResultPtr, ResultCount, batch, batchSize, Name)
    ccall((:Batch_GetFloat64S, LIBRARY), Cvoid, (Ptr{Ptr{Cdouble}}, Ptr{Int32}, Ptr{Ptr{Cvoid}}, Int32, Cstring), ResultPtr, ResultCount, batch, batchSize, Name)
end

function Batch_GetInt32S(ResultPtr, ResultCount, batch, batchSize, Name)
    ccall((:Batch_GetInt32S, LIBRARY), Cvoid, (Ptr{Ptr{Int32}}, Ptr{Int32}, Ptr{Ptr{Cvoid}}, Int32, Cstring), ResultPtr, ResultCount, batch, batchSize, Name)
end

function Batch_GetStringS(ResultPtr, ResultCount, batch, batchSize, Name)
    ccall((:Batch_GetStringS, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}, Ptr{Ptr{Cvoid}}, Int32, Cstring), ResultPtr, ResultCount, batch, batchSize, Name)
end

function Batch_GetAsStringS(ResultPtr, ResultCount, batch, batchSize, Name)
    ccall((:Batch_GetAsStringS, LIBRARY), Cvoid, (Ptr{Ptr{Cstring}}, Ptr{Int32}, Ptr{Ptr{Cvoid}}, Int32, Cstring), ResultPtr, ResultCount, batch, batchSize, Name)
end

function Batch_GetObjectS(ResultPtr, ResultCount, batch, batchSize, Name)
    ccall((:Batch_GetObjectS, LIBRARY), Cvoid, (Ptr{Ptr{Ptr{Cvoid}}}, Ptr{Int32}, Ptr{Ptr{Cvoid}}, Int32, Cstring), ResultPtr, ResultCount, batch, batchSize, Name)
end

function Batch_Float64S(batch, batchSize, Name, Operation, Value)
    ccall((:Batch_Float64S, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Cstring, Int32, Cdouble), batch, batchSize, Name, Operation, Value)
end

function Batch_Int32S(batch, batchSize, Name, Operation, Value)
    ccall((:Batch_Int32S, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Cstring, Int32, Int32), batch, batchSize, Name, Operation, Value)
end

function Batch_SetStringS(batch, batchSize, Name, Value)
    ccall((:Batch_SetStringS, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Cstring, Cstring), batch, batchSize, Name, Value)
end

function Batch_SetObjectS(batch, batchSize, Name, Value)
    ccall((:Batch_SetObjectS, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Cstring, Ptr{Cvoid}), batch, batchSize, Name, Value)
end

function Batch_SetFloat64ArrayS(batch, batchSize, Name, Value)
    ccall((:Batch_SetFloat64ArrayS, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Cstring, Ptr{Cdouble}), batch, batchSize, Name, Value)
end

function Batch_SetInt32ArrayS(batch, batchSize, Name, Value)
    ccall((:Batch_SetInt32ArrayS, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Cstring, Ptr{Int32}), batch, batchSize, Name, Value)
end

function Batch_SetStringArrayS(batch, batchSize, Name, Value)
    ccall((:Batch_SetStringArrayS, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Cstring, Ptr{Cstring}), batch, batchSize, Name, Value)
end

function Batch_SetObjectArrayS(batch, batchSize, Name, Value)
    ccall((:Batch_SetObjectArrayS, LIBRARY), Cvoid, (Ptr{Ptr{Cvoid}}, Int32, Cstring, Ptr{Ptr{Cvoid}}), batch, batchSize, Name, Value)
end

function DSS_BeginPascalThread(func, paramptr)
    ccall((:DSS_BeginPascalThread, LIBRARY), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}), func, paramptr)
end

function DSS_WaitPascalThread(handle)
    ccall((:DSS_WaitPascalThread, LIBRARY), Cvoid, (Ptr{Cvoid},), handle)
end

function DSS_SetMessagesMO(Value)
    ccall((:DSS_SetMessagesMO, LIBRARY), Cvoid, (Cstring,), Value)
end

function DSS_SetPropertiesMO(Value)
    ccall((:DSS_SetPropertiesMO, LIBRARY), Cvoid, (Cstring,), Value)
end

const DSS_CAPI_VERSION = "0.12.1"

