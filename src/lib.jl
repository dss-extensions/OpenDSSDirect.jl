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

function DSS_ResetStringBuffer(ctx::Ptr{Cvoid})
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

function DSS_DisposeGRData(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_DisposeGRData, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSS_GetGRPointers(ctx::Ptr{Cvoid}, DataPtr_PPAnsiChar, DataPtr_PDouble, DataPtr_PInteger, DataPtr_PByte, CountPtr_PPAnsiChar, CountPtr_PDouble, CountPtr_PInteger, CountPtr_PByte)
    ccall((:ctx_DSS_GetGRPointers, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Ptr{Cstring}}}, Ptr{Ptr{Ptr{Cdouble}}}, Ptr{Ptr{Ptr{Int32}}}, Ptr{Ptr{Ptr{Int8}}}, Ptr{Ptr{Int32}}, Ptr{Ptr{Int32}}, Ptr{Ptr{Int32}}, Ptr{Ptr{Int32}}), ctx, DataPtr_PPAnsiChar, DataPtr_PDouble, DataPtr_PInteger, DataPtr_PByte, CountPtr_PPAnsiChar, CountPtr_PDouble, CountPtr_PInteger, CountPtr_PByte)
end

function DSS_GR_DataPtr_PDouble(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_GR_DataPtr_PDouble, LIBRARY), Ptr{Cdouble}, (Ptr{Cvoid},), ctx)
end

function DSS_GR_DataPtr_PInteger(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_GR_DataPtr_PInteger, LIBRARY), Ptr{Int32}, (Ptr{Cvoid},), ctx)
end

function DSS_GR_DataPtr_PByte(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_GR_DataPtr_PByte, LIBRARY), Ptr{Int8}, (Ptr{Cvoid},), ctx)
end

function DSS_GR_CountPtr_PDouble(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_GR_CountPtr_PDouble, LIBRARY), Ptr{Int32}, (Ptr{Cvoid},), ctx)
end

function DSS_GR_CountPtr_PInteger(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_GR_CountPtr_PInteger, LIBRARY), Ptr{Int32}, (Ptr{Cvoid},), ctx)
end

function DSS_GR_CountPtr_PByte(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_GR_CountPtr_PByte, LIBRARY), Ptr{Int32}, (Ptr{Cvoid},), ctx)
end

function DSS_RegisterPlotCallback(ctx::Ptr{Cvoid}, cb)
    ccall((:ctx_DSS_RegisterPlotCallback, LIBRARY), Cvoid, (Ptr{Cvoid}, dss_callback_plot_t,), ctx, cb)
end

function DSS_RegisterMessageCallback(ctx::Ptr{Cvoid}, cb)
    ccall((:ctx_DSS_RegisterMessageCallback, LIBRARY), Cvoid, (Ptr{Cvoid}, dss_callback_message_t,), ctx, cb)
end

function DSS_NewCircuit(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_DSS_NewCircuit, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function ActiveClass_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_ActiveClass_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function ActiveClass_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_ActiveClass_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ActiveClass_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_ActiveClass_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function ActiveClass_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_ActiveClass_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function ActiveClass_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_ActiveClass_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function ActiveClass_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_ActiveClass_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function ActiveClass_Get_NumElements(ctx::Ptr{Cvoid})
    ccall((:ctx_ActiveClass_Get_NumElements, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function ActiveClass_Get_ActiveClassName(ctx::Ptr{Cvoid})
    ccall((:ctx_ActiveClass_Get_ActiveClassName, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function ActiveClass_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_ActiveClass_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function ActiveClass_Get_ActiveClassParent(ctx::Ptr{Cvoid})
    ccall((:ctx_ActiveClass_Get_ActiveClassParent, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function ActiveClass_ToJSON(ctx::Ptr{Cvoid}, options)
    ccall((:ctx_ActiveClass_ToJSON, LIBRARY), Cstring, (Ptr{Cvoid}, Int32,), ctx, options)
end

function Bus_Get_AllPCEatBus(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_AllPCEatBus, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_AllPDEatBus(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_AllPDEatBus, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Bus_Get_NumNodes(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_NumNodes, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Bus_Get_SeqVoltages(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_SeqVoltages, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_SeqVoltages_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_SeqVoltages_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Voltages(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_Voltages, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_Voltages_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_Voltages_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Nodes(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_Nodes, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_Nodes_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_Nodes_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Isc(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_Isc, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_Isc_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_Isc_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Voc(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_Voc, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_Voc_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_Voc_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_kVBase(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_kVBase, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Get_puVoltages(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_puVoltages, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_puVoltages_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_puVoltages_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Zsc0(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_Zsc0, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_Zsc0_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_Zsc0_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Zsc1(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_Zsc1, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_Zsc1_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_Zsc1_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_ZscMatrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_ZscMatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_ZscMatrix_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_ZscMatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_ZscRefresh(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_ZscRefresh, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Bus_Get_YscMatrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_YscMatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_YscMatrix_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_YscMatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Coorddefined(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_Coorddefined, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Bus_Get_x(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_x, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Set_x(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Bus_Set_x, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Bus_Get_y(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_y, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Set_y(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Bus_Set_y, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Bus_Get_Distance(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_Distance, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_GetUniqueNodeNumber(ctx::Ptr{Cvoid}, StartNumber)
    ccall((:ctx_Bus_GetUniqueNodeNumber, LIBRARY), Int32, (Ptr{Cvoid}, Int32,), ctx, StartNumber)
end

function Bus_Get_CplxSeqVoltages(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_CplxSeqVoltages, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_CplxSeqVoltages_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_CplxSeqVoltages_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Int_Duration(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_Int_Duration, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Lambda(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_Lambda, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Cust_Duration(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_Cust_Duration, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Get_Cust_Interrupts(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_Cust_Interrupts, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Get_N_Customers(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_N_Customers, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Bus_Get_N_interrupts(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_N_interrupts, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Get_puVLL(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_puVLL, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_puVLL_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_puVLL_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_VLL(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_VLL, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_VLL_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_VLL_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_puVmagAngle(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_puVmagAngle, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_puVmagAngle_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_puVmagAngle_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_VMagAngle(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_VMagAngle, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_VMagAngle_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_VMagAngle_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_TotalMiles(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_TotalMiles, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Bus_Get_SectionID(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_SectionID, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Bus_Get_LineList(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_LineList, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_LineList_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_LineList_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_LoadList(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_LoadList, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_LoadList_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_LoadList_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Bus_Get_ZSC012Matrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Bus_Get_ZSC012Matrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Bus_Get_ZSC012Matrix_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_ZSC012Matrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Capacitors_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Capacitors_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Capacitors_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_Capacitors_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_IsDelta(ctx::Ptr{Cvoid})
    ccall((:ctx_Capacitors_Get_IsDelta, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_kV(ctx::Ptr{Cvoid})
    ccall((:ctx_Capacitors_Get_kV, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_kvar(ctx::Ptr{Cvoid})
    ccall((:ctx_Capacitors_Get_kvar, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_Capacitors_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_Capacitors_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_NumSteps(ctx::Ptr{Cvoid})
    ccall((:ctx_Capacitors_Get_NumSteps, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Capacitors_Set_IsDelta(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Capacitors_Set_IsDelta, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Capacitors_Set_kV(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Capacitors_Set_kV, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Capacitors_Set_kvar(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Capacitors_Set_kvar, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Capacitors_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Capacitors_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Capacitors_Set_NumSteps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Capacitors_Set_NumSteps, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Capacitors_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_Capacitors_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Capacitors_AddStep(ctx::Ptr{Cvoid})
    ccall((:ctx_Capacitors_AddStep, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Capacitors_SubtractStep(ctx::Ptr{Cvoid})
    ccall((:ctx_Capacitors_SubtractStep, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_AvailableSteps(ctx::Ptr{Cvoid})
    ccall((:ctx_Capacitors_Get_AvailableSteps, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Capacitors_Get_States(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Capacitors_Get_States, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Capacitors_Get_States_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Capacitors_Get_States_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Capacitors_Set_States(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Capacitors_Set_States, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Int32}, Int32), ctx, ValuePtr, ValueCount)
end

function Capacitors_Open(ctx::Ptr{Cvoid})
    ccall((:ctx_Capacitors_Open, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Capacitors_Close(ctx::Ptr{Cvoid})
    ccall((:ctx_Capacitors_Close, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CapControls_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CapControls_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_Capacitor(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_Capacitor, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_CTratio(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_CTratio, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_DeadTime(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_DeadTime, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_Delay(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_Delay, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_DelayOff(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_DelayOff, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_Mode(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_Mode, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_MonitoredObj(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_MonitoredObj, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_MonitoredTerm(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_MonitoredTerm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_OFFSetting(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_OFFSetting, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_ONSetting(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_ONSetting, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_PTratio(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_PTratio, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_UseVoltOverride(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_UseVoltOverride, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_Vmax(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_Vmax, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Get_Vmin(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_Vmin, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CapControls_Set_Capacitor(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CapControls_Set_Capacitor, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function CapControls_Set_CTratio(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CapControls_Set_CTratio, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Set_DeadTime(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CapControls_Set_DeadTime, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Set_Delay(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CapControls_Set_Delay, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Set_DelayOff(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CapControls_Set_DelayOff, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Set_Mode(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CapControls_Set_Mode, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CapControls_Set_MonitoredObj(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CapControls_Set_MonitoredObj, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function CapControls_Set_MonitoredTerm(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CapControls_Set_MonitoredTerm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CapControls_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CapControls_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function CapControls_Set_OFFSetting(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CapControls_Set_OFFSetting, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Set_ONSetting(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CapControls_Set_ONSetting, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Set_PTratio(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CapControls_Set_PTratio, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Set_UseVoltOverride(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CapControls_Set_UseVoltOverride, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function CapControls_Set_Vmax(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CapControls_Set_Vmax, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Set_Vmin(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CapControls_Set_Vmin, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CapControls_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CapControls_Reset(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_NumBuses(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_NumBuses, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_NumCktElements(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_NumCktElements, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_NumNodes(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_NumNodes, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_LineLosses(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_LineLosses, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_LineLosses_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_LineLosses_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_Losses(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_Losses, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_Losses_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_Losses_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_AllBusVmag(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllBusVmag, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllBusVmag_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_AllBusVmag_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_AllBusVolts(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllBusVolts, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllBusVolts_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_AllBusVolts_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_AllElementNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllElementNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllElementNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_AllElementNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_SubstationLosses(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_SubstationLosses, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_SubstationLosses_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_SubstationLosses_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_TotalPower(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_TotalPower, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_TotalPower_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_TotalPower_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Disable(ctx::Ptr{Cvoid}, Name)
    ccall((:ctx_Circuit_Disable, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Name)
end

function Circuit_Enable(ctx::Ptr{Cvoid}, Name)
    ccall((:ctx_Circuit_Enable, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Name)
end

function Circuit_FirstPCElement(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_FirstPCElement, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_FirstPDElement(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_FirstPDElement, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_NextPCElement(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_NextPCElement, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_NextPDElement(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_NextPDElement, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_AllBusNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllBusNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllBusNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_AllBusNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_AllElementLosses(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllElementLosses, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllElementLosses_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_AllElementLosses_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Sample(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Sample, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_SaveSample(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_SaveSample, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_SetActiveElement(ctx::Ptr{Cvoid}, FullName)
    ccall((:ctx_Circuit_SetActiveElement, LIBRARY), Int32, (Ptr{Cvoid}, Cstring,), ctx, FullName)
end

function Circuit_Capacity(ctx::Ptr{Cvoid}, Start, Increment)
    ccall((:ctx_Circuit_Capacity, LIBRARY), Cdouble, (Ptr{Cvoid}, Cdouble, Cdouble), ctx, Start, Increment)
end

function Circuit_Get_AllBusVmagPu(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllBusVmagPu, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllBusVmagPu_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_AllBusVmagPu_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_SetActiveBus(ctx::Ptr{Cvoid}, BusName)
    ccall((:ctx_Circuit_SetActiveBus, LIBRARY), Int32, (Ptr{Cvoid}, Cstring,), ctx, BusName)
end

function Circuit_SetActiveBusi(ctx::Ptr{Cvoid}, BusIndex)
    ccall((:ctx_Circuit_SetActiveBusi, LIBRARY), Int32, (Ptr{Cvoid}, Int32,), ctx, BusIndex)
end

function Circuit_Get_AllNodeNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllNodeNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllNodeNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_AllNodeNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_SystemY(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_SystemY, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_SystemY_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_SystemY_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_AllBusDistances(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllBusDistances, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllBusDistances_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_AllBusDistances_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_AllNodeDistances(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_AllNodeDistances, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_AllNodeDistances_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_AllNodeDistances_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_AllNodeDistancesByPhase(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, Phase)
    ccall((:ctx_Circuit_Get_AllNodeDistancesByPhase, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, Phase)
end

function Circuit_Get_AllNodeDistancesByPhase_GR(ctx::Ptr{Cvoid}, Phase)
    ccall((:ctx_Circuit_Get_AllNodeDistancesByPhase_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Phase)
end

function Circuit_Get_AllNodeVmagByPhase(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, Phase)
    ccall((:ctx_Circuit_Get_AllNodeVmagByPhase, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, Phase)
end

function Circuit_Get_AllNodeVmagByPhase_GR(ctx::Ptr{Cvoid}, Phase)
    ccall((:ctx_Circuit_Get_AllNodeVmagByPhase_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Phase)
end

function Circuit_Get_AllNodeVmagPUByPhase(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, Phase)
    ccall((:ctx_Circuit_Get_AllNodeVmagPUByPhase, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, Phase)
end

function Circuit_Get_AllNodeVmagPUByPhase_GR(ctx::Ptr{Cvoid}, Phase)
    ccall((:ctx_Circuit_Get_AllNodeVmagPUByPhase_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Phase)
end

function Circuit_Get_AllNodeNamesByPhase(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, Phase)
    ccall((:ctx_Circuit_Get_AllNodeNamesByPhase, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, Phase)
end

function Circuit_Get_AllNodeNamesByPhase_GR(ctx::Ptr{Cvoid}, Phase)
    ccall((:ctx_Circuit_Get_AllNodeNamesByPhase_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Phase)
end

function Circuit_SetActiveClass(ctx::Ptr{Cvoid}, ClassName)
    ccall((:ctx_Circuit_SetActiveClass, LIBRARY), Int32, (Ptr{Cvoid}, Cstring,), ctx, ClassName)
end

function Circuit_FirstElement(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_FirstElement, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_NextElement(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_NextElement, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_UpdateStorage(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_UpdateStorage, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_ParentPDElement(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_ParentPDElement, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Circuit_EndOfTimeStepUpdate(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_EndOfTimeStepUpdate, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_YNodeOrder(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_YNodeOrder, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_YNodeOrder_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_YNodeOrder_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_YCurrents(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_YCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_YCurrents_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_YCurrents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_Get_YNodeVarray(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Circuit_Get_YNodeVarray, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Circuit_Get_YNodeVarray_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Circuit_Get_YNodeVarray_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Circuit_SetCktElementName(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Circuit_SetCktElementName, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Circuit_SetCktElementIndex(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Circuit_SetCktElementIndex, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CktElement_Get_BusNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_BusNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_BusNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_BusNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_NumConductors(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_NumConductors, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_NumPhases(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_NumPhases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_NumTerminals(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_NumTerminals, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CktElement_Set_BusNames(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_CktElement_Set_BusNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cstring}, Int32), ctx, ValuePtr, ValueCount)
end

function CktElement_Get_Currents(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_Currents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_Currents_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_Currents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Voltages(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_Voltages, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_Voltages_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_Voltages_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_EmergAmps(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_EmergAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Enabled(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_Enabled, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Losses(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_Losses, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_Losses_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_Losses_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_NormalAmps(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_NormalAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_PhaseLosses(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_PhaseLosses, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_PhaseLosses_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_PhaseLosses_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Powers(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_Powers, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_Powers_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_Powers_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_SeqCurrents(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_SeqCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_SeqCurrents_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_SeqCurrents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_SeqPowers(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_SeqPowers, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_SeqPowers_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_SeqPowers_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_SeqVoltages(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_SeqVoltages, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_SeqVoltages_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_SeqVoltages_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Close(ctx::Ptr{Cvoid}, Term, Phs)
    ccall((:ctx_CktElement_Close, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Int32), ctx, Term, Phs)
end

function CktElement_Open(ctx::Ptr{Cvoid}, Term, Phs)
    ccall((:ctx_CktElement_Open, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Int32), ctx, Term, Phs)
end

function CktElement_Set_EmergAmps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CktElement_Set_EmergAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CktElement_Set_Enabled(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CktElement_Set_Enabled, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function CktElement_Set_NormalAmps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CktElement_Set_NormalAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CktElement_IsOpen(ctx::Ptr{Cvoid}, Term, Phs)
    ccall((:ctx_CktElement_IsOpen, LIBRARY), UInt16, (Ptr{Cvoid}, Int32, Int32), ctx, Term, Phs)
end

function CktElement_Get_AllPropertyNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_AllPropertyNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_AllPropertyNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_AllPropertyNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_NumProperties(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_NumProperties, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Residuals(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_Residuals, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_Residuals_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_Residuals_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Yprim(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_Yprim, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_Yprim_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_Yprim_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_DisplayName(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_DisplayName, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_GUID(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_GUID, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Handle(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_Handle, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CktElement_Set_DisplayName(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CktElement_Set_DisplayName, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function CktElement_Get_Controller(ctx::Ptr{Cvoid}, idx)
    ccall((:ctx_CktElement_Get_Controller, LIBRARY), Cstring, (Ptr{Cvoid}, Int32,), ctx, idx)
end

function CktElement_Get_EnergyMeter(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_EnergyMeter, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_HasVoltControl(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_HasVoltControl, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_HasSwitchControl(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_HasSwitchControl, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_CplxSeqVoltages(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_CplxSeqVoltages, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_CplxSeqVoltages_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_CplxSeqVoltages_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_CplxSeqCurrents(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_CplxSeqCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_CplxSeqCurrents_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_CplxSeqCurrents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_AllVariableNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_AllVariableNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_AllVariableNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_AllVariableNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_AllVariableValues(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_AllVariableValues, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_AllVariableValues_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_AllVariableValues_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_Variable(ctx::Ptr{Cvoid}, MyVarName, Code)
    ccall((:ctx_CktElement_Get_Variable, LIBRARY), Cdouble, (Ptr{Cvoid}, Cstring, Ptr{Int32}), ctx, MyVarName, Code)
end

function CktElement_Set_Variable(ctx::Ptr{Cvoid}, MyVarName, Code, Value)
    ccall((:ctx_CktElement_Set_Variable, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring, Ptr{Int32}, Cdouble), ctx, MyVarName, Code, Value)
end

function CktElement_Get_Variablei(ctx::Ptr{Cvoid}, Idx, Code)
    ccall((:ctx_CktElement_Get_Variablei, LIBRARY), Cdouble, (Ptr{Cvoid}, Int32, Ptr{Int32}), ctx, Idx, Code)
end

function CktElement_Set_Variablei(ctx::Ptr{Cvoid}, Idx, Code, Value)
    ccall((:ctx_CktElement_Set_Variablei, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Ptr{Int32}, Cdouble), ctx, Idx, Code, Value)
end

function CktElement_Get_NodeOrder(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_NodeOrder, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_NodeOrder_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_NodeOrder_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_HasOCPDevice(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_HasOCPDevice, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_NumControls(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_NumControls, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_OCPDevIndex(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_OCPDevIndex, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_OCPDevType(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_OCPDevType, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_CurrentsMagAng(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_CurrentsMagAng, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_CurrentsMagAng_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_CurrentsMagAng_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_VoltagesMagAng(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_VoltagesMagAng, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_VoltagesMagAng_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_VoltagesMagAng_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_IsIsolated(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_IsIsolated, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_TotalPowers(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_TotalPowers, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_TotalPowers_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_TotalPowers_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CmathLib_Get_cmplx(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, RealPart, ImagPart)
    ccall((:ctx_CmathLib_Get_cmplx, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble), ctx, ResultPtr, ResultCount, RealPart, ImagPart)
end

function CmathLib_Get_cmplx_GR(ctx::Ptr{Cvoid}, RealPart, ImagPart)
    ccall((:ctx_CmathLib_Get_cmplx_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble), ctx, RealPart, ImagPart)
end

function CmathLib_Get_cabs(ctx::Ptr{Cvoid}, realpart, imagpart)
    ccall((:ctx_CmathLib_Get_cabs, LIBRARY), Cdouble, (Ptr{Cvoid}, Cdouble, Cdouble), ctx, realpart, imagpart)
end

function CmathLib_Get_cdang(ctx::Ptr{Cvoid}, RealPart, ImagPart)
    ccall((:ctx_CmathLib_Get_cdang, LIBRARY), Cdouble, (Ptr{Cvoid}, Cdouble, Cdouble), ctx, RealPart, ImagPart)
end

function CmathLib_Get_ctopolardeg(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, RealPart, ImagPart)
    ccall((:ctx_CmathLib_Get_ctopolardeg, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble), ctx, ResultPtr, ResultCount, RealPart, ImagPart)
end

function CmathLib_Get_ctopolardeg_GR(ctx::Ptr{Cvoid}, RealPart, ImagPart)
    ccall((:ctx_CmathLib_Get_ctopolardeg_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble), ctx, RealPart, ImagPart)
end

function CmathLib_Get_pdegtocomplex(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, magnitude, angle)
    ccall((:ctx_CmathLib_Get_pdegtocomplex, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble), ctx, ResultPtr, ResultCount, magnitude, angle)
end

function CmathLib_Get_pdegtocomplex_GR(ctx::Ptr{Cvoid}, magnitude, angle)
    ccall((:ctx_CmathLib_Get_pdegtocomplex_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble), ctx, magnitude, angle)
end

function CmathLib_Get_cmul(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, a1, b1, a2, b2)
    ccall((:ctx_CmathLib_Get_cmul, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Cdouble, Cdouble), ctx, ResultPtr, ResultCount, a1, b1, a2, b2)
end

function CmathLib_Get_cmul_GR(ctx::Ptr{Cvoid}, a1, b1, a2, b2)
    ccall((:ctx_CmathLib_Get_cmul_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), ctx, a1, b1, a2, b2)
end

function CmathLib_Get_cdiv(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, a1, b1, a2, b2)
    ccall((:ctx_CmathLib_Get_cdiv, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Cdouble, Cdouble), ctx, ResultPtr, ResultCount, a1, b1, a2, b2)
end

function CmathLib_Get_cdiv_GR(ctx::Ptr{Cvoid}, a1, b1, a2, b2)
    ccall((:ctx_CmathLib_Get_cdiv_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), ctx, a1, b1, a2, b2)
end

function CtrlQueue_ClearQueue(ctx::Ptr{Cvoid})
    ccall((:ctx_CtrlQueue_ClearQueue, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_Delete(ctx::Ptr{Cvoid}, ActionHandle)
    ccall((:ctx_CtrlQueue_Delete, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, ActionHandle)
end

function CtrlQueue_Get_ActionCode(ctx::Ptr{Cvoid})
    ccall((:ctx_CtrlQueue_Get_ActionCode, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_Get_DeviceHandle(ctx::Ptr{Cvoid})
    ccall((:ctx_CtrlQueue_Get_DeviceHandle, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_Get_NumActions(ctx::Ptr{Cvoid})
    ccall((:ctx_CtrlQueue_Get_NumActions, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_Push(ctx::Ptr{Cvoid}, Hour, Seconds, ActionCode, DeviceHandle)
    ccall((:ctx_CtrlQueue_Push, LIBRARY), Int32, (Ptr{Cvoid}, Int32, Cdouble, Int32, Int32), ctx, Hour, Seconds, ActionCode, DeviceHandle)
end

function CtrlQueue_Show(ctx::Ptr{Cvoid})
    ccall((:ctx_CtrlQueue_Show, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_ClearActions(ctx::Ptr{Cvoid})
    ccall((:ctx_CtrlQueue_ClearActions, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_Get_PopAction(ctx::Ptr{Cvoid})
    ccall((:ctx_CtrlQueue_Get_PopAction, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_Set_Action(ctx::Ptr{Cvoid}, Param1)
    ccall((:ctx_CtrlQueue_Set_Action, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Param1)
end

function CtrlQueue_Get_QueueSize(ctx::Ptr{Cvoid})
    ccall((:ctx_CtrlQueue_Get_QueueSize, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_DoAllQueue(ctx::Ptr{Cvoid})
    ccall((:ctx_CtrlQueue_DoAllQueue, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CtrlQueue_Get_Queue(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CtrlQueue_Get_Queue, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CtrlQueue_Get_Queue_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CtrlQueue_Get_Queue_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSS_Get_NumCircuits(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Get_NumCircuits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function DSS_ClearAll(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_ClearAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSS_Get_Version(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Get_Version, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function DSS_Start(ctx::Ptr{Cvoid}, code)
    ccall((:ctx_DSS_Start, LIBRARY), UInt16, (Ptr{Cvoid}, Int32,), ctx, code)
end

function DSS_Get_Classes(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_DSS_Get_Classes, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function DSS_Get_Classes_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Get_Classes_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSS_Get_UserClasses(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_DSS_Get_UserClasses, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function DSS_Get_UserClasses_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Get_UserClasses_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSS_Get_NumClasses(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Get_NumClasses, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function DSS_Get_NumUserClasses(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Get_NumUserClasses, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function DSS_Get_DataPath(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Get_DataPath, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function DSS_Set_DataPath(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_DSS_Set_DataPath, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function DSS_Reset(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSS_Get_DefaultEditor(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Get_DefaultEditor, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function DSS_SetActiveClass(ctx::Ptr{Cvoid}, ClassName)
    ccall((:ctx_DSS_SetActiveClass, LIBRARY), Int32, (Ptr{Cvoid}, Cstring,), ctx, ClassName)
end

function DSS_Get_AllowForms(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Get_AllowForms, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function DSS_Set_AllowForms(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_DSS_Set_AllowForms, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function DSS_Get_AllowEditor(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Get_AllowEditor, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function DSS_Set_AllowEditor(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_DSS_Set_AllowEditor, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function DSS_Get_LegacyModels(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Get_LegacyModels, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function DSS_Set_LegacyModels(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_DSS_Set_LegacyModels, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function DSS_Get_AllowDOScmd(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Get_AllowDOScmd, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function DSS_Set_AllowDOScmd(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_DSS_Set_AllowDOScmd, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function DSS_Get_AllowChangeDir(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Get_AllowChangeDir, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function DSS_Set_AllowChangeDir(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_DSS_Set_AllowChangeDir, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function DSS_Get_COMErrorResults(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Get_COMErrorResults, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function DSS_Set_COMErrorResults(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_DSS_Set_COMErrorResults, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function DSSElement_Get_AllPropertyNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_DSSElement_Get_AllPropertyNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function DSSElement_Get_AllPropertyNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_DSSElement_Get_AllPropertyNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSSElement_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_DSSElement_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function DSSElement_Get_NumProperties(ctx::Ptr{Cvoid})
    ccall((:ctx_DSSElement_Get_NumProperties, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function DSSElement_ToJSON(ctx::Ptr{Cvoid}, options)
    ccall((:ctx_DSSElement_ToJSON, LIBRARY), Cstring, (Ptr{Cvoid}, Int32,), ctx, options)
end

function DSSimComs_BusVoltagepu(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, Index)
    ccall((:ctx_DSSimComs_BusVoltagepu, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Csize_t), ctx, ResultPtr, ResultCount, Index)
end

function DSSimComs_BusVoltagepu_GR(ctx::Ptr{Cvoid}, Index)
    ccall((:ctx_DSSimComs_BusVoltagepu_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Csize_t,), ctx, Index)
end

function DSSimComs_BusVoltage(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, Index)
    ccall((:ctx_DSSimComs_BusVoltage, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Csize_t), ctx, ResultPtr, ResultCount, Index)
end

function DSSimComs_BusVoltage_GR(ctx::Ptr{Cvoid}, Index)
    ccall((:ctx_DSSimComs_BusVoltage_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Csize_t,), ctx, Index)
end

function DSSProgress_Close(ctx::Ptr{Cvoid})
    ccall((:ctx_DSSProgress_Close, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSSProgress_Set_Caption(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_DSSProgress_Set_Caption, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function DSSProgress_Set_PctProgress(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_DSSProgress_Set_PctProgress, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function DSSProgress_Show(ctx::Ptr{Cvoid})
    ccall((:ctx_DSSProgress_Show, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function DSSProperty_Get_Description(ctx::Ptr{Cvoid})
    ccall((:ctx_DSSProperty_Get_Description, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function DSSProperty_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_DSSProperty_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function DSSProperty_Get_Val(ctx::Ptr{Cvoid})
    ccall((:ctx_DSSProperty_Get_Val, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function DSSProperty_Set_Val(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_DSSProperty_Set_Val, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function DSSProperty_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_DSSProperty_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function DSSProperty_Set_Index(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_DSSProperty_Set_Index, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function DSS_Executive_Get_Command(ctx::Ptr{Cvoid}, i)
    ccall((:ctx_DSS_Executive_Get_Command, LIBRARY), Cstring, (Ptr{Cvoid}, Int32,), ctx, i)
end

function DSS_Executive_Get_NumCommands(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Executive_Get_NumCommands, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function DSS_Executive_Get_NumOptions(ctx::Ptr{Cvoid})
    ccall((:ctx_DSS_Executive_Get_NumOptions, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function DSS_Executive_Get_Option(ctx::Ptr{Cvoid}, i)
    ccall((:ctx_DSS_Executive_Get_Option, LIBRARY), Cstring, (Ptr{Cvoid}, Int32,), ctx, i)
end

function DSS_Executive_Get_CommandHelp(ctx::Ptr{Cvoid}, i)
    ccall((:ctx_DSS_Executive_Get_CommandHelp, LIBRARY), Cstring, (Ptr{Cvoid}, Int32,), ctx, i)
end

function DSS_Executive_Get_OptionHelp(ctx::Ptr{Cvoid}, i)
    ccall((:ctx_DSS_Executive_Get_OptionHelp, LIBRARY), Cstring, (Ptr{Cvoid}, Int32,), ctx, i)
end

function DSS_Executive_Get_OptionValue(ctx::Ptr{Cvoid}, i)
    ccall((:ctx_DSS_Executive_Get_OptionValue, LIBRARY), Cstring, (Ptr{Cvoid}, Int32,), ctx, i)
end

function Error_Get_Description(ctx::Ptr{Cvoid})
    ccall((:ctx_Error_Get_Description, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Error_Get_Number(ctx::Ptr{Cvoid})
    ccall((:ctx_Error_Get_Number, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Error_Get_NumberPtr(ctx::Ptr{Cvoid})
    ccall((:ctx_Error_Get_NumberPtr, LIBRARY), Ptr{Int32}, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Fuses_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Fuses_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Fuses_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Fuses_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Fuses_Get_MonitoredObj(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Get_MonitoredObj, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_MonitoredTerm(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Get_MonitoredTerm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_SwitchedObj(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Get_SwitchedObj, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Fuses_Set_MonitoredObj(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Fuses_Set_MonitoredObj, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Fuses_Set_MonitoredTerm(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Fuses_Set_MonitoredTerm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Fuses_Set_SwitchedObj(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Fuses_Set_SwitchedObj, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Fuses_Get_SwitchedTerm(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Get_SwitchedTerm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Fuses_Set_SwitchedTerm(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Fuses_Set_SwitchedTerm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Fuses_Get_TCCcurve(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Get_TCCcurve, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Fuses_Set_TCCcurve(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Fuses_Set_TCCcurve, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Fuses_Get_RatedCurrent(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Get_RatedCurrent, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Fuses_Set_RatedCurrent(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Fuses_Set_RatedCurrent, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Fuses_Get_Delay(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Get_Delay, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Fuses_Open(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Open, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Fuses_Close(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Close, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Fuses_Set_Delay(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Fuses_Set_Delay, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Fuses_IsBlown(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_IsBlown, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Fuses_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Fuses_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Fuses_Reset(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Fuses_Get_State(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Fuses_Get_State, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Fuses_Set_State(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Fuses_Set_State, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cstring}, Int32), ctx, ValuePtr, ValueCount)
end

function Fuses_Get_NormalState(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Fuses_Get_NormalState, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Fuses_Set_NormalState(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Fuses_Set_NormalState, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cstring}, Int32), ctx, ValuePtr, ValueCount)
end

function Fuses_Get_NumPhases(ctx::Ptr{Cvoid})
    ccall((:ctx_Fuses_Get_NumPhases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Generators_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Generators_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Generators_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Generators_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Get_RegisterNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Generators_Get_RegisterNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Generators_Get_RegisterNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_RegisterNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Generators_Get_RegisterValues(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Generators_Get_RegisterValues, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Generators_Get_RegisterValues_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_RegisterValues_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Generators_Get_ForcedON(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_ForcedON, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Generators_Set_ForcedON(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_ForcedON, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Generators_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Generators_Get_kV(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_kV, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Generators_Get_kvar(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_kvar, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Generators_Get_kW(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_kW, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Generators_Get_PF(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_PF, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Generators_Get_Phases(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Set_kV(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_kV, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Generators_Set_kvar(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_kvar, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Generators_Set_kW(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_kW, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Generators_Set_PF(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_PF, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Generators_Set_Phases(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Generators_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Generators_Get_Model(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_Model, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Set_Model(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_Model, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Generators_Get_kVArated(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_kVArated, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Generators_Set_kVArated(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_kVArated, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Generators_Get_Vmaxpu(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_Vmaxpu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Generators_Get_Vminpu(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_Vminpu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Generators_Set_Vmaxpu(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_Vmaxpu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Generators_Set_Vminpu(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_Vminpu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Generators_Get_daily(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_daily, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Generators_Set_daily(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_daily, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Generators_Get_duty(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_duty, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Generators_Set_duty(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_duty, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Generators_Get_Yearly(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_Yearly, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Generators_Set_Yearly(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_Yearly, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Generators_Get_Status(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_Status, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Set_Status(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_Status, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Generators_Get_IsDelta(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_IsDelta, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Generators_Set_IsDelta(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_IsDelta, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Generators_Get_kva(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_kva, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Generators_Set_kva(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_kva, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Generators_Get_Class_(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_Class_, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Generators_Set_Class_(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_Class_, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Generators_Get_Bus1(ctx::Ptr{Cvoid})
    ccall((:ctx_Generators_Get_Bus1, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Generators_Set_Bus1(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Generators_Set_Bus1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function GICSources_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_GICSources_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function GICSources_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_GICSources_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function GICSources_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_GICSources_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function GICSources_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_GICSources_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function GICSources_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_GICSources_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function GICSources_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_GICSources_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_GICSources_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function GICSources_Get_Phases(ctx::Ptr{Cvoid})
    ccall((:ctx_GICSources_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_Phases(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_GICSources_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function GICSources_Get_Bus1(ctx::Ptr{Cvoid})
    ccall((:ctx_GICSources_Get_Bus1, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function GICSources_Get_Bus2(ctx::Ptr{Cvoid})
    ccall((:ctx_GICSources_Get_Bus2, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function GICSources_Get_EN(ctx::Ptr{Cvoid})
    ccall((:ctx_GICSources_Get_EN, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_EN(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_GICSources_Set_EN, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function GICSources_Get_EE(ctx::Ptr{Cvoid})
    ccall((:ctx_GICSources_Get_EE, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_EE(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_GICSources_Set_EE, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function GICSources_Get_Lat1(ctx::Ptr{Cvoid})
    ccall((:ctx_GICSources_Get_Lat1, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_Lat1(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_GICSources_Set_Lat1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function GICSources_Get_Lat2(ctx::Ptr{Cvoid})
    ccall((:ctx_GICSources_Get_Lat2, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_Lat2(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_GICSources_Set_Lat2, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function GICSources_Get_Lon1(ctx::Ptr{Cvoid})
    ccall((:ctx_GICSources_Get_Lon1, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_Lon1(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_GICSources_Set_Lon1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function GICSources_Get_Lon2(ctx::Ptr{Cvoid})
    ccall((:ctx_GICSources_Get_Lon2, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_Lon2(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_GICSources_Set_Lon2, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function GICSources_Get_Volts(ctx::Ptr{Cvoid})
    ccall((:ctx_GICSources_Get_Volts, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_Volts(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_GICSources_Set_Volts, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function ISources_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_ISources_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function ISources_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_ISources_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ISources_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_ISources_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function ISources_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_ISources_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function ISources_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_ISources_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function ISources_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_ISources_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function ISources_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_ISources_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function ISources_Get_Amps(ctx::Ptr{Cvoid})
    ccall((:ctx_ISources_Get_Amps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function ISources_Set_Amps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_ISources_Set_Amps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function ISources_Get_AngleDeg(ctx::Ptr{Cvoid})
    ccall((:ctx_ISources_Get_AngleDeg, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function ISources_Get_Frequency(ctx::Ptr{Cvoid})
    ccall((:ctx_ISources_Get_Frequency, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function ISources_Set_AngleDeg(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_ISources_Set_AngleDeg, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function ISources_Set_Frequency(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_ISources_Set_Frequency, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineCodes_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineCodes_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineCodes_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineCodes_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function LineCodes_Get_IsZ1Z0(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_IsZ1Z0, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function LineCodes_Get_Units(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_Units, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_Units(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineCodes_Set_Units, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineCodes_Get_Phases(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_Phases(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineCodes_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineCodes_Get_R1(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_R1, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_R1(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineCodes_Set_R1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Get_X1(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_X1, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_X1(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineCodes_Set_X1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Get_R0(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_R0, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineCodes_Get_X0(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_X0, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_R0(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineCodes_Set_R0, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Set_X0(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineCodes_Set_X0, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Get_C0(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_C0, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineCodes_Get_C1(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_C1, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_C0(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineCodes_Set_C0, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Set_C1(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineCodes_Set_C1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Get_Cmatrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_LineCodes_Get_Cmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineCodes_Get_Cmatrix_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_Cmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineCodes_Get_Rmatrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_LineCodes_Get_Rmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineCodes_Get_Rmatrix_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_Rmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineCodes_Get_Xmatrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_LineCodes_Get_Xmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineCodes_Get_Xmatrix_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_Xmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_Cmatrix(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_LineCodes_Set_Cmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LineCodes_Set_Rmatrix(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_LineCodes_Set_Rmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LineCodes_Set_Xmatrix(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_LineCodes_Set_Xmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LineCodes_Get_NormAmps(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_NormAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_NormAmps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineCodes_Set_NormAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Get_EmergAmps(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_EmergAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_EmergAmps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineCodes_Set_EmergAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineCodes_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_LineCodes_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineCodes_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Lines_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Lines_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Lines_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Bus1(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Bus1, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Bus2(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Bus2, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Lines_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Length(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Length, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_LineCode(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_LineCode, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Phases(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Get_R1(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_R1, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_X1(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_X1, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_New(ctx::Ptr{Cvoid}, Name)
    ccall((:ctx_Lines_New, LIBRARY), Int32, (Ptr{Cvoid}, Cstring,), ctx, Name)
end

function Lines_Set_Bus1(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_Bus1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Lines_Set_Bus2(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_Bus2, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Lines_Set_Length(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_Length, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_LineCode(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_LineCode, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Lines_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Lines_Set_Phases(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Lines_Set_R1(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_R1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_X1(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_X1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Get_C0(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_C0, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_C1(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_C1, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Cmatrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Lines_Get_Cmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Lines_Get_Cmatrix_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Cmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Lines_Get_R0(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_R0, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Rmatrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Lines_Get_Rmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Lines_Get_Rmatrix_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Rmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Lines_Get_X0(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_X0, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Xmatrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Lines_Get_Xmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Lines_Get_Xmatrix_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Xmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Lines_Set_C0(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_C0, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_C1(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_C1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_Cmatrix(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Lines_Set_Cmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Lines_Set_R0(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_R0, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_Rmatrix(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Lines_Set_Rmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Lines_Set_X0(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_X0, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_Xmatrix(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Lines_Set_Xmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Lines_Get_EmergAmps(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_EmergAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_NormAmps(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_NormAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Set_EmergAmps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_EmergAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_NormAmps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_NormAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Get_Geometry(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Geometry, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Lines_Set_Geometry(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_Geometry, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Lines_Get_Rg(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Rg, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Rho(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Rho, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Xg(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Xg, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Set_Rg(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_Rg, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_Rho(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_Rho, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Set_Xg(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_Xg, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Lines_Get_Yprim(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Lines_Get_Yprim, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Lines_Get_Yprim_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Yprim_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Lines_Set_Yprim(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Lines_Set_Yprim, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Lines_Get_NumCust(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_NumCust, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Get_TotalCust(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_TotalCust, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Parent(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Parent, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Get_Spacing(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Spacing, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Lines_Set_Spacing(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_Spacing, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Lines_Get_Units(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_Units, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Set_Units(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_Units, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Lines_Get_SeasonRating(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_SeasonRating, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Lines_Get_IsSwitch(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_IsSwitch, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Lines_Set_IsSwitch(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_IsSwitch, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Loads_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Loads_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Loads_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Loads_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Loads_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Loads_Get_kV(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_kV, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_kvar(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_kvar, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_kW(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_kW, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_PF(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_PF, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Set_kV(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_kV, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_kvar(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_kvar, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_kW(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_kW, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_PF(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_PF, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Get_AllocationFactor(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_AllocationFactor, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Cfactor(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Cfactor, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Class_(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Class_, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Get_CVRcurve(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_CVRcurve, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Loads_Get_CVRvars(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_CVRvars, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_CVRwatts(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_CVRwatts, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_daily(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_daily, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Loads_Get_duty(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_duty, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Growth(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Growth, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Loads_Get_IsDelta(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_IsDelta, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Loads_Get_kva(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_kva, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_kwh(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_kwh, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_kwhdays(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_kwhdays, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Model(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Model, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Get_NumCust(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_NumCust, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Get_PctMean(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_PctMean, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_PctStdDev(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_PctStdDev, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Rneut(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Rneut, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Spectrum(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Spectrum, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Status(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Status, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Vmaxpu(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Vmaxpu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Vminemerg(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Vminemerg, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Vminnorm(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Vminnorm, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Vminpu(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Vminpu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_xfkVA(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_xfkVA, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Xneut(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Xneut, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Yearly(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Yearly, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Loads_Set_AllocationFactor(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_AllocationFactor, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Cfactor(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_Cfactor, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Class_(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_Class_, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Loads_Set_CVRcurve(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_CVRcurve, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Loads_Set_CVRvars(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_CVRvars, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_CVRwatts(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_CVRwatts, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_daily(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_daily, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Loads_Set_duty(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_duty, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Loads_Set_Growth(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_Growth, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Loads_Set_IsDelta(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_IsDelta, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Loads_Set_kva(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_kva, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_kwh(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_kwh, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_kwhdays(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_kwhdays, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Model(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_Model, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Loads_Set_NumCust(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_NumCust, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Loads_Set_PctMean(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_PctMean, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_PctStdDev(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_PctStdDev, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Rneut(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_Rneut, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Spectrum(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_Spectrum, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Loads_Set_Status(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_Status, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Loads_Set_Vmaxpu(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_Vmaxpu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Vminemerg(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_Vminemerg, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Vminnorm(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_Vminnorm, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Vminpu(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_Vminpu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_xfkVA(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_xfkVA, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Xneut(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_Xneut, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Set_Yearly(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_Yearly, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Loads_Get_ZIPV(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Loads_Get_ZIPV, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Loads_Get_ZIPV_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_ZIPV_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Loads_Set_ZIPV(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Loads_Set_ZIPV, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Loads_Get_pctSeriesRL(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_pctSeriesRL, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Set_pctSeriesRL(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_pctSeriesRL, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Get_RelWeight(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_RelWeight, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Loads_Set_RelWeight(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Loads_Set_RelWeight, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Loads_Get_Sensor(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Sensor, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LoadShapes_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function LoadShapes_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_LoadShapes_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LoadShapes_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_Npts(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_Npts, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_Pmult(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_LoadShapes_Get_Pmult, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LoadShapes_Get_Pmult_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_Pmult_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_Qmult(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_LoadShapes_Get_Qmult, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LoadShapes_Get_Qmult_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_Qmult_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_Npts(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LoadShapes_Set_Npts, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LoadShapes_Set_Pmult(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_LoadShapes_Set_Pmult, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LoadShapes_Set_Qmult(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_LoadShapes_Set_Qmult, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LoadShapes_Normalize(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Normalize, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_TimeArray(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_LoadShapes_Get_TimeArray, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LoadShapes_Get_TimeArray_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_TimeArray_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_TimeArray(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_LoadShapes_Set_TimeArray, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LoadShapes_Get_HrInterval(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_HrInterval, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_MinInterval(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_MinInterval, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_SInterval(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_SInterval, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_SInterval(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LoadShapes_Set_SInterval, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LoadShapes_Set_HrInterval(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LoadShapes_Set_HrInterval, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LoadShapes_Set_MinInterval(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LoadShapes_Set_MinInterval, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LoadShapes_New(ctx::Ptr{Cvoid}, Name)
    ccall((:ctx_LoadShapes_New, LIBRARY), Int32, (Ptr{Cvoid}, Cstring,), ctx, Name)
end

function LoadShapes_Get_PBase(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_PBase, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Get_Qbase(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_Qbase, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_PBase(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LoadShapes_Set_PBase, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LoadShapes_Set_Qbase(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LoadShapes_Set_Qbase, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LoadShapes_Get_UseActual(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_UseActual, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_UseActual(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LoadShapes_Set_UseActual, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Meters_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Meters_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_RegisterNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_RegisterNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_RegisterNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_RegisterNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Get_RegisterValues(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_RegisterValues, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_RegisterValues_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_RegisterValues_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Reset(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_ResetAll(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_ResetAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Sample(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Sample, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Save(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Save, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Meters_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Meters_Get_Totals(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_Totals, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_Totals_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_Totals_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Get_Peakcurrent(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_Peakcurrent, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_Peakcurrent_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_Peakcurrent_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Set_Peakcurrent(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Meters_Set_Peakcurrent, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Meters_Get_CalcCurrent(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_CalcCurrent, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_CalcCurrent_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_CalcCurrent_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Set_CalcCurrent(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Meters_Set_CalcCurrent, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Meters_Get_AllocFactors(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_AllocFactors, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_AllocFactors_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_AllocFactors_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Set_AllocFactors(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Meters_Set_AllocFactors, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Meters_Get_MeteredElement(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_MeteredElement, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Meters_Get_MeteredTerminal(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_MeteredTerminal, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Set_MeteredElement(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Meters_Set_MeteredElement, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Meters_Set_MeteredTerminal(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Meters_Set_MeteredTerminal, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Meters_Get_DIFilesAreOpen(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_DIFilesAreOpen, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Meters_CloseAllDIFiles(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_CloseAllDIFiles, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_OpenAllDIFiles(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_OpenAllDIFiles, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_SampleAll(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_SampleAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_SaveAll(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_SaveAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Get_AllEndElements(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_AllEndElements, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_AllEndElements_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_AllEndElements_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Get_CountEndElements(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_CountEndElements, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_AllBranchesInZone(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_AllBranchesInZone, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Meters_Get_AllBranchesInZone_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_AllBranchesInZone_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Meters_Get_CountBranches(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_CountBranches, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_SAIFI(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_SAIFI, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Meters_Get_SequenceIndex(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_SequenceIndex, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Set_SequenceIndex(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Meters_Set_SequenceIndex, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Meters_Get_SAIFIKW(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_SAIFIKW, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Meters_DoReliabilityCalc(ctx::Ptr{Cvoid}, AssumeRestoration)
    ccall((:ctx_Meters_DoReliabilityCalc, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, AssumeRestoration)
end

function Meters_Get_SeqListSize(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_SeqListSize, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_TotalCustomers(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_TotalCustomers, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_SAIDI(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_SAIDI, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Meters_Get_CustInterrupts(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_CustInterrupts, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Meters_Get_NumSections(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_NumSections, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_SetActiveSection(ctx::Ptr{Cvoid}, SectIdx)
    ccall((:ctx_Meters_SetActiveSection, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, SectIdx)
end

function Meters_Get_AvgRepairTime(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_AvgRepairTime, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Meters_Get_FaultRateXRepairHrs(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_FaultRateXRepairHrs, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Meters_Get_NumSectionBranches(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_NumSectionBranches, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_NumSectionCustomers(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_NumSectionCustomers, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_OCPDeviceType(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_OCPDeviceType, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_SumBranchFltRates(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_SumBranchFltRates, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Meters_Get_SectSeqIdx(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_SectSeqIdx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_SectTotalCust(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_SectTotalCust, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Get_ZonePCE(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Meters_Get_ZonePCE, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Monitors_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Monitors_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Monitors_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_FileName(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_FileName, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_Mode(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_Mode, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Reset(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_ResetAll(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_ResetAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Sample(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Sample, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Save(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Save, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Set_Mode(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Monitors_Set_Mode, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Monitors_Show(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Show, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Monitors_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Monitors_Get_ByteStream(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Monitors_Get_ByteStream, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int8}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Monitors_Get_ByteStream_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_ByteStream_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_SampleCount(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_SampleCount, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_SampleAll(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_SampleAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_SaveAll(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_SaveAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Process(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Process, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_ProcessAll(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_ProcessAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_Channel(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, Index)
    ccall((:ctx_Monitors_Get_Channel, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, Index)
end

function Monitors_Get_Channel_GR(ctx::Ptr{Cvoid}, Index)
    ccall((:ctx_Monitors_Get_Channel_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Index)
end

function Monitors_Get_dblFreq(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Monitors_Get_dblFreq, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Monitors_Get_dblFreq_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_dblFreq_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_dblHour(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Monitors_Get_dblHour, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Monitors_Get_dblHour_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_dblHour_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_FileVersion(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_FileVersion, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_Header(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Monitors_Get_Header, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Monitors_Get_Header_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_Header_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_NumChannels(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_NumChannels, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_RecordSize(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_RecordSize, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Get_Element(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_Element, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Monitors_Set_Element(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Monitors_Set_Element, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Monitors_Get_Terminal(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_Terminal, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Set_Terminal(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Monitors_Set_Terminal, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Parallel_Get_NumCPUs(ctx::Ptr{Cvoid})
    ccall((:ctx_Parallel_Get_NumCPUs, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Parallel_Get_NumCores(ctx::Ptr{Cvoid})
    ccall((:ctx_Parallel_Get_NumCores, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Parallel_Get_ActiveActor(ctx::Ptr{Cvoid})
    ccall((:ctx_Parallel_Get_ActiveActor, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Parallel_Set_ActiveActor(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Parallel_Set_ActiveActor, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Parallel_CreateActor(ctx::Ptr{Cvoid})
    ccall((:ctx_Parallel_CreateActor, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Parallel_Get_ActorCPU(ctx::Ptr{Cvoid})
    ccall((:ctx_Parallel_Get_ActorCPU, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Parallel_Set_ActorCPU(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Parallel_Set_ActorCPU, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Parallel_Get_NumOfActors(ctx::Ptr{Cvoid})
    ccall((:ctx_Parallel_Get_NumOfActors, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Parallel_Wait(ctx::Ptr{Cvoid})
    ccall((:ctx_Parallel_Wait, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Parallel_Get_ActorProgress(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Parallel_Get_ActorProgress, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Parallel_Get_ActorProgress_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Parallel_Get_ActorProgress_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Parallel_Get_ActorStatus(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Parallel_Get_ActorStatus, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Parallel_Get_ActorStatus_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Parallel_Get_ActorStatus_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Parallel_Get_ActiveParallel(ctx::Ptr{Cvoid})
    ccall((:ctx_Parallel_Get_ActiveParallel, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Parallel_Set_ActiveParallel(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Parallel_Set_ActiveParallel, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Parallel_Get_ConcatenateReports(ctx::Ptr{Cvoid})
    ccall((:ctx_Parallel_Get_ConcatenateReports, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Parallel_Set_ConcatenateReports(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Parallel_Set_ConcatenateReports, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Parser_Get_CmdString(ctx::Ptr{Cvoid})
    ccall((:ctx_Parser_Get_CmdString, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Parser_Set_CmdString(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Parser_Set_CmdString, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Parser_Get_NextParam(ctx::Ptr{Cvoid})
    ccall((:ctx_Parser_Get_NextParam, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Parser_Get_AutoIncrement(ctx::Ptr{Cvoid})
    ccall((:ctx_Parser_Get_AutoIncrement, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Parser_Set_AutoIncrement(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Parser_Set_AutoIncrement, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Parser_Get_DblValue(ctx::Ptr{Cvoid})
    ccall((:ctx_Parser_Get_DblValue, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Parser_Get_IntValue(ctx::Ptr{Cvoid})
    ccall((:ctx_Parser_Get_IntValue, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Parser_Get_StrValue(ctx::Ptr{Cvoid})
    ccall((:ctx_Parser_Get_StrValue, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Parser_Get_WhiteSpace(ctx::Ptr{Cvoid})
    ccall((:ctx_Parser_Get_WhiteSpace, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Parser_Set_WhiteSpace(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Parser_Set_WhiteSpace, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Parser_Get_BeginQuote(ctx::Ptr{Cvoid})
    ccall((:ctx_Parser_Get_BeginQuote, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Parser_Get_EndQuote(ctx::Ptr{Cvoid})
    ccall((:ctx_Parser_Get_EndQuote, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Parser_Set_BeginQuote(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Parser_Set_BeginQuote, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Parser_Set_EndQuote(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Parser_Set_EndQuote, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Parser_Get_Delimiters(ctx::Ptr{Cvoid})
    ccall((:ctx_Parser_Get_Delimiters, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Parser_Set_Delimiters(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Parser_Set_Delimiters, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Parser_ResetDelimiters(ctx::Ptr{Cvoid})
    ccall((:ctx_Parser_ResetDelimiters, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Parser_Get_Vector(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, ExpectedSize)
    ccall((:ctx_Parser_Get_Vector, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, ExpectedSize)
end

function Parser_Get_Vector_GR(ctx::Ptr{Cvoid}, ExpectedSize)
    ccall((:ctx_Parser_Get_Vector_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, ExpectedSize)
end

function Parser_Get_Matrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, ExpectedOrder)
    ccall((:ctx_Parser_Get_Matrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, ExpectedOrder)
end

function Parser_Get_Matrix_GR(ctx::Ptr{Cvoid}, ExpectedOrder)
    ccall((:ctx_Parser_Get_Matrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, ExpectedOrder)
end

function Parser_Get_SymMatrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, ExpectedOrder)
    ccall((:ctx_Parser_Get_SymMatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, ExpectedOrder)
end

function Parser_Get_SymMatrix_GR(ctx::Ptr{Cvoid}, ExpectedOrder)
    ccall((:ctx_Parser_Get_SymMatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, ExpectedOrder)
end

function PDElements_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_FaultRate(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_FaultRate, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_IsShunt(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_IsShunt, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_pctPermanent(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_pctPermanent, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PDElements_Set_FaultRate(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PDElements_Set_FaultRate, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function PDElements_Set_pctPermanent(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PDElements_Set_pctPermanent, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function PDElements_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function PDElements_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PDElements_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function PDElements_Get_AccumulatedL(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_AccumulatedL, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_Lambda(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_Lambda, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_Numcustomers(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_Numcustomers, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_ParentPDElement(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_ParentPDElement, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_RepairTime(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_RepairTime, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_Totalcustomers(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_Totalcustomers, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_FromTerminal(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_FromTerminal, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_TotalMiles(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_TotalMiles, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_SectionID(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_SectionID, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PDElements_Set_RepairTime(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PDElements_Set_RepairTime, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function PDElements_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllMaxCurrents(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, AllNodes)
    ccall((:ctx_PDElements_Get_AllMaxCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, UInt16), ctx, ResultPtr, ResultCount, AllNodes)
end

function PDElements_Get_AllMaxCurrents_GR(ctx::Ptr{Cvoid}, AllNodes)
    ccall((:ctx_PDElements_Get_AllMaxCurrents_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, AllNodes)
end

function PDElements_Get_AllPctNorm(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, AllNodes)
    ccall((:ctx_PDElements_Get_AllPctNorm, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, UInt16), ctx, ResultPtr, ResultCount, AllNodes)
end

function PDElements_Get_AllPctNorm_GR(ctx::Ptr{Cvoid}, AllNodes)
    ccall((:ctx_PDElements_Get_AllPctNorm_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, AllNodes)
end

function PDElements_Get_AllPctEmerg(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, AllNodes)
    ccall((:ctx_PDElements_Get_AllPctEmerg, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, UInt16), ctx, ResultPtr, ResultCount, AllNodes)
end

function PDElements_Get_AllPctEmerg_GR(ctx::Ptr{Cvoid}, AllNodes)
    ccall((:ctx_PDElements_Get_AllPctEmerg_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, AllNodes)
end

function PDElements_Get_AllCurrents(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllCurrents_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_AllCurrents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllCurrentsMagAng(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllCurrentsMagAng, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllCurrentsMagAng_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_AllCurrentsMagAng_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllCplxSeqCurrents(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllCplxSeqCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllCplxSeqCurrents_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_AllCplxSeqCurrents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllSeqCurrents(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllSeqCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllSeqCurrents_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_AllSeqCurrents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllPowers(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllPowers, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllPowers_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_AllPowers_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllSeqPowers(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllSeqPowers, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllSeqPowers_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_AllSeqPowers_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllNumPhases(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllNumPhases, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllNumPhases_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_AllNumPhases_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllNumConductors(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllNumConductors, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllNumConductors_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_AllNumConductors_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PDElements_Get_AllNumTerminals(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_PDElements_Get_AllNumTerminals, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PDElements_Get_AllNumTerminals_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_PDElements_Get_AllNumTerminals_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_PVSystems_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PVSystems_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_RegisterNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_PVSystems_Get_RegisterNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PVSystems_Get_RegisterNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_RegisterNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_RegisterValues(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_PVSystems_Get_RegisterValues, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function PVSystems_Get_RegisterValues_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_RegisterValues_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PVSystems_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function PVSystems_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PVSystems_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function PVSystems_Get_Irradiance(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_Irradiance, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_Irradiance(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PVSystems_Set_Irradiance, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function PVSystems_Get_kvar(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_kvar, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_kVArated(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_kVArated, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_kW(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_kW, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_PF(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_PF, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_kVArated(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PVSystems_Set_kVArated, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function PVSystems_Set_PF(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PVSystems_Set_PF, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function PVSystems_Set_kvar(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PVSystems_Set_kvar, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function PVSystems_Get_daily(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_daily, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_daily(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PVSystems_Set_daily, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function PVSystems_Get_duty(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_duty, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_duty(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PVSystems_Set_duty, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function PVSystems_Get_yearly(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_yearly, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_yearly(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PVSystems_Set_yearly, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function PVSystems_Get_Tdaily(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_Tdaily, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_Tdaily(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PVSystems_Set_Tdaily, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function PVSystems_Get_Tduty(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_Tduty, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_Tduty(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PVSystems_Set_Tduty, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function PVSystems_Get_Tyearly(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_Tyearly, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_Tyearly(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PVSystems_Set_Tyearly, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function PVSystems_Get_Pmpp(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_Pmpp, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PVSystems_Set_Pmpp(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_PVSystems_Set_Pmpp, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function PVSystems_Get_IrradianceNow(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_IrradianceNow, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function PVSystems_Get_Sensor(ctx::Ptr{Cvoid})
    ccall((:ctx_PVSystems_Get_Sensor, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Reclosers_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reclosers_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reclosers_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Reclosers_Get_MonitoredTerm(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_MonitoredTerm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_MonitoredTerm(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reclosers_Set_MonitoredTerm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Reclosers_Get_SwitchedObj(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_SwitchedObj, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_SwitchedObj(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reclosers_Set_SwitchedObj, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Reclosers_Get_MonitoredObj(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_MonitoredObj, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_SwitchedTerm(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_SwitchedTerm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_MonitoredObj(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reclosers_Set_MonitoredObj, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Reclosers_Set_SwitchedTerm(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reclosers_Set_SwitchedTerm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Reclosers_Get_NumFast(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_NumFast, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_RecloseIntervals(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Reclosers_Get_RecloseIntervals, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reclosers_Get_RecloseIntervals_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_RecloseIntervals_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_Shots(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_Shots, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_NumFast(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reclosers_Set_NumFast, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Reclosers_Set_Shots(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reclosers_Set_Shots, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Reclosers_Get_PhaseTrip(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_PhaseTrip, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_PhaseTrip(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reclosers_Set_PhaseTrip, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reclosers_Get_GroundInst(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_GroundInst, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_GroundTrip(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_GroundTrip, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_PhaseInst(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_PhaseInst, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_GroundInst(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reclosers_Set_GroundInst, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reclosers_Set_GroundTrip(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reclosers_Set_GroundTrip, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reclosers_Set_PhaseInst(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reclosers_Set_PhaseInst, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reclosers_Close(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Close, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reclosers_Open(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Open, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reclosers_Reset(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reclosers_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reclosers_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Reclosers_Get_State(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_State, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_State(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reclosers_Set_State, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Reclosers_Get_NormalState(ctx::Ptr{Cvoid})
    ccall((:ctx_Reclosers_Get_NormalState, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reclosers_Set_NormalState(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reclosers_Set_NormalState, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function RegControls_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_RegControls_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function RegControls_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_CTPrimary(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_CTPrimary, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_Delay(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_Delay, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_ForwardBand(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_ForwardBand, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_ForwardR(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_ForwardR, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_ForwardVreg(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_ForwardVreg, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_ForwardX(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_ForwardX, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_IsInverseTime(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_IsInverseTime, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_IsReversible(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_IsReversible, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_MaxTapChange(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_MaxTapChange, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_MonitoredBus(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_MonitoredBus, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_PTratio(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_PTratio, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_ReverseBand(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_ReverseBand, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_ReverseR(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_ReverseR, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_ReverseVreg(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_ReverseVreg, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_ReverseX(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_ReverseX, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_TapDelay(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_TapDelay, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_TapWinding(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_TapWinding, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_Transformer(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_Transformer, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_VoltageLimit(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_VoltageLimit, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_Winding(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_Winding, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function RegControls_Get_TapNumber(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_TapNumber, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function RegControls_Set_CTPrimary(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_CTPrimary, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_Delay(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_Delay, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_ForwardBand(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_ForwardBand, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_ForwardR(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_ForwardR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_ForwardVreg(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_ForwardVreg, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_ForwardX(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_ForwardX, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_IsInverseTime(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_IsInverseTime, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function RegControls_Set_IsReversible(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_IsReversible, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function RegControls_Set_MaxTapChange(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_MaxTapChange, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function RegControls_Set_MonitoredBus(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_MonitoredBus, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function RegControls_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function RegControls_Set_PTratio(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_PTratio, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_ReverseBand(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_ReverseBand, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_ReverseR(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_ReverseR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_ReverseVreg(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_ReverseVreg, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_ReverseX(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_ReverseX, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_TapDelay(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_TapDelay, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_TapWinding(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_TapWinding, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function RegControls_Set_Transformer(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_Transformer, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function RegControls_Set_VoltageLimit(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_VoltageLimit, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function RegControls_Set_Winding(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_Winding, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function RegControls_Set_TapNumber(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_TapNumber, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function RegControls_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function RegControls_Reset(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Relays_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Relays_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Relays_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Relays_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Relays_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_Relays_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Relays_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_Relays_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Relays_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_Relays_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Relays_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_Relays_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Relays_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Relays_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Relays_Get_MonitoredObj(ctx::Ptr{Cvoid})
    ccall((:ctx_Relays_Get_MonitoredObj, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Relays_Set_MonitoredObj(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Relays_Set_MonitoredObj, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Relays_Get_MonitoredTerm(ctx::Ptr{Cvoid})
    ccall((:ctx_Relays_Get_MonitoredTerm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Relays_Get_SwitchedObj(ctx::Ptr{Cvoid})
    ccall((:ctx_Relays_Get_SwitchedObj, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Relays_Set_MonitoredTerm(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Relays_Set_MonitoredTerm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Relays_Set_SwitchedObj(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Relays_Set_SwitchedObj, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Relays_Get_SwitchedTerm(ctx::Ptr{Cvoid})
    ccall((:ctx_Relays_Get_SwitchedTerm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Relays_Set_SwitchedTerm(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Relays_Set_SwitchedTerm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Relays_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_Relays_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Relays_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Relays_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Relays_Open(ctx::Ptr{Cvoid})
    ccall((:ctx_Relays_Open, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Relays_Close(ctx::Ptr{Cvoid})
    ccall((:ctx_Relays_Close, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Relays_Reset(ctx::Ptr{Cvoid})
    ccall((:ctx_Relays_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Relays_Get_State(ctx::Ptr{Cvoid})
    ccall((:ctx_Relays_Get_State, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Relays_Set_State(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Relays_Set_State, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Relays_Get_NormalState(ctx::Ptr{Cvoid})
    ccall((:ctx_Relays_Get_NormalState, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Relays_Set_NormalState(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Relays_Set_NormalState, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Sensors_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Sensors_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Sensors_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_Currents(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Sensors_Get_Currents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Sensors_Get_Currents_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_Currents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_IsDelta(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_IsDelta, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_kVARS(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Sensors_Get_kVARS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Sensors_Get_kVARS_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_kVARS_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_kVS(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Sensors_Get_kVS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Sensors_Get_kVS_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_kVS_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_kWS(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Sensors_Get_kWS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Sensors_Get_kWS_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_kWS_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_MeteredElement(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_MeteredElement, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_MeteredTerminal(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_MeteredTerminal, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_PctError(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_PctError, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_ReverseDelta(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_ReverseDelta, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Sensors_Get_Weight(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_Weight, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Sensors_Reset(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Sensors_ResetAll(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_ResetAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Sensors_Set_Currents(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Sensors_Set_Currents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Sensors_Set_IsDelta(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Sensors_Set_IsDelta, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Sensors_Set_kVARS(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Sensors_Set_kVARS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Sensors_Set_kVS(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Sensors_Set_kVS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Sensors_Set_kWS(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Sensors_Set_kWS, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Sensors_Set_MeteredElement(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Sensors_Set_MeteredElement, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Sensors_Set_MeteredTerminal(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Sensors_Set_MeteredTerminal, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Sensors_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Sensors_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Sensors_Set_PctError(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Sensors_Set_PctError, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Sensors_Set_ReverseDelta(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Sensors_Set_ReverseDelta, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Sensors_Set_Weight(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Sensors_Set_Weight, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Sensors_Get_kVbase(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_kVbase, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Sensors_Set_kVbase(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Sensors_Set_kVbase, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Sensors_Get_AllocationFactor(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Sensors_Get_AllocationFactor, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Sensors_Get_AllocationFactor_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_AllocationFactor_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Settings_Get_AllowDuplicates(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_AllowDuplicates, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Settings_Get_AutoBusList(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_AutoBusList, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Settings_Get_CktModel(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_CktModel, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Settings_Set_CktModel(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_CktModel, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Settings_Get_EmergVmaxpu(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_EmergVmaxpu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Settings_Get_EmergVminpu(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_EmergVminpu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Settings_Get_NormVmaxpu(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_NormVmaxpu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Settings_Get_NormVminpu(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_NormVminpu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Settings_Get_ZoneLock(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_ZoneLock, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Settings_Set_AllocationFactors(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_AllocationFactors, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Settings_Set_AllowDuplicates(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_AllowDuplicates, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Settings_Set_AutoBusList(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_AutoBusList, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Settings_Set_EmergVmaxpu(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_EmergVmaxpu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Settings_Set_EmergVminpu(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_EmergVminpu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Settings_Set_NormVmaxpu(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_NormVmaxpu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Settings_Set_NormVminpu(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_NormVminpu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Settings_Set_ZoneLock(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_ZoneLock, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Settings_Get_LossRegs(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Settings_Get_LossRegs, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Settings_Get_LossRegs_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_LossRegs_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Settings_Get_LossWeight(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_LossWeight, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Settings_Get_Trapezoidal(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_Trapezoidal, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Settings_Get_UEregs(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Settings_Get_UEregs, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Settings_Get_UEregs_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_UEregs_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Settings_Get_UEweight(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_UEweight, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Settings_Set_LossRegs(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Settings_Set_LossRegs, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Int32}, Int32), ctx, ValuePtr, ValueCount)
end

function Settings_Set_LossWeight(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_LossWeight, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Settings_Set_Trapezoidal(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_Trapezoidal, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Settings_Set_UEregs(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Settings_Set_UEregs, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Int32}, Int32), ctx, ValuePtr, ValueCount)
end

function Settings_Set_UEweight(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_UEweight, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Settings_Get_ControlTrace(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_ControlTrace, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Settings_Get_VoltageBases(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Settings_Get_VoltageBases, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Settings_Get_VoltageBases_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_VoltageBases_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Settings_Set_ControlTrace(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_ControlTrace, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Settings_Set_VoltageBases(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Settings_Set_VoltageBases, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Settings_Get_PriceCurve(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_PriceCurve, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Settings_Get_PriceSignal(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_PriceSignal, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Settings_Set_PriceCurve(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_PriceCurve, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Settings_Set_PriceSignal(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_PriceSignal, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Settings_Get_LoadsTerminalCheck(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_LoadsTerminalCheck, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Settings_Set_LoadsTerminalCheck(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_LoadsTerminalCheck, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Settings_Get_IterateDisabled(ctx::Ptr{Cvoid})
    ccall((:ctx_Settings_Get_IterateDisabled, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Settings_Set_IterateDisabled(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Settings_Set_IterateDisabled, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Get_Frequency(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Frequency, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Hour(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Hour, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Iterations(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Iterations, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Get_LoadMult(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_LoadMult, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Get_MaxIterations(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_MaxIterations, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Mode(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Mode, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Number(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Number, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Set_Random(ctx::Ptr{Cvoid}, Random)
    ccall((:ctx_Solution_Set_Random, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Random)
end

function Solution_Get_Random(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Random, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Seconds(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Seconds, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Get_StepSize(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_StepSize, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Tolerance(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Tolerance, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Year(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Year, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Set_Frequency(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_Frequency, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Set_Hour(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_Hour, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Set_LoadMult(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_LoadMult, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Set_MaxIterations(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_MaxIterations, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Set_Mode(ctx::Ptr{Cvoid}, Mode)
    ccall((:ctx_Solution_Set_Mode, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Mode)
end

function Solution_Set_Number(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_Number, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Set_Seconds(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_Seconds, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Set_StepSize(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_StepSize, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Set_Tolerance(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_Tolerance, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Set_Year(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_Year, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Solve(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Solve, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_ModeID(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_ModeID, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Solution_Get_LoadModel(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_LoadModel, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Set_LoadModel(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_LoadModel, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Get_LDCurve(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_LDCurve, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Solution_Set_LDCurve(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_LDCurve, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Solution_Get_pctGrowth(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_pctGrowth, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Set_pctGrowth(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_pctGrowth, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Get_AddType(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_AddType, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Set_AddType(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_AddType, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Get_GenkW(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_GenkW, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Set_GenkW(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_GenkW, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Get_GenPF(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_GenPF, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Set_GenPF(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_GenPF, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Get_Capkvar(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Capkvar, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Set_Capkvar(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_Capkvar, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Get_Algorithm(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Algorithm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Set_Algorithm(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_Algorithm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Get_ControlMode(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_ControlMode, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Set_ControlMode(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_ControlMode, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Get_GenMult(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_GenMult, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Set_GenMult(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_GenMult, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Get_DefaultDaily(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_DefaultDaily, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Solution_Get_DefaultYearly(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_DefaultYearly, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Solution_Set_DefaultDaily(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_DefaultDaily, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Solution_Set_DefaultYearly(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_DefaultYearly, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Solution_Get_EventLog(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Solution_Get_EventLog, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Solution_Get_EventLog_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_EventLog_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_dblHour(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_dblHour, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Set_dblHour(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_dblHour, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Set_StepsizeHr(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_StepsizeHr, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Set_StepsizeMin(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_StepsizeMin, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Get_ControlIterations(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_ControlIterations, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Get_MaxControlIterations(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_MaxControlIterations, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Sample_DoControlActions(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Sample_DoControlActions, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Set_ControlIterations(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_ControlIterations, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_Set_MaxControlIterations(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_MaxControlIterations, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_CheckFaultStatus(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_CheckFaultStatus, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_SolveDirect(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_SolveDirect, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_SolveNoControl(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_SolveNoControl, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_SolvePflow(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_SolvePflow, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_SolvePlusControl(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_SolvePlusControl, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_SolveSnap(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_SolveSnap, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_CheckControls(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_CheckControls, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_InitSnap(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_InitSnap, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_SystemYChanged(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_SystemYChanged, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Solution_BuildYMatrix(ctx::Ptr{Cvoid}, BuildOption, AllocateVI)
    ccall((:ctx_Solution_BuildYMatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Int32), ctx, BuildOption, AllocateVI)
end

function Solution_DoControlActions(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_DoControlActions, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_SampleControlDevices(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_SampleControlDevices, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Converged(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Converged, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Solution_Set_Converged(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_Converged, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Solution_Get_Totaliterations(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Totaliterations, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Get_MostIterationsDone(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_MostIterationsDone, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Get_ControlActionsDone(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_ControlActionsDone, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Solution_Set_ControlActionsDone(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_ControlActionsDone, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Solution_Cleanup(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Cleanup, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_FinishTimeStep(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_FinishTimeStep, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Process_Time(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Process_Time, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Total_Time(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Total_Time, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Set_Total_Time(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_Total_Time, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Get_Time_of_Step(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Time_of_Step, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Get_IntervalHrs(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_IntervalHrs, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Solution_Set_IntervalHrs(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_IntervalHrs, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Solution_Get_MinIterations(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_MinIterations, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Solution_Set_MinIterations(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Solution_Set_MinIterations, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Solution_SolveAll(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_SolveAll, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_IncMatrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Solution_Get_IncMatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Solution_Get_IncMatrix_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_IncMatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_Laplacian(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Solution_Get_Laplacian, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Solution_Get_Laplacian_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_Laplacian_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_BusLevels(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Solution_Get_BusLevels, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Solution_Get_BusLevels_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_BusLevels_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_IncMatrixRows(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Solution_Get_IncMatrixRows, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Solution_Get_IncMatrixRows_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_IncMatrixRows_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Solution_Get_IncMatrixCols(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Solution_Get_IncMatrixCols, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Solution_Get_IncMatrixCols_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Solution_Get_IncMatrixCols_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_Action(ctx::Ptr{Cvoid})
    ccall((:ctx_SwtControls_Get_Action, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_SwtControls_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function SwtControls_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_SwtControls_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_Delay(ctx::Ptr{Cvoid})
    ccall((:ctx_SwtControls_Get_Delay, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_SwtControls_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_IsLocked(ctx::Ptr{Cvoid})
    ccall((:ctx_SwtControls_Get_IsLocked, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_SwtControls_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_SwtControls_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_SwitchedObj(ctx::Ptr{Cvoid})
    ccall((:ctx_SwtControls_Get_SwitchedObj, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_SwitchedTerm(ctx::Ptr{Cvoid})
    ccall((:ctx_SwtControls_Get_SwitchedTerm, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function SwtControls_Set_Action(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_SwtControls_Set_Action, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function SwtControls_Set_Delay(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_SwtControls_Set_Delay, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function SwtControls_Set_IsLocked(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_SwtControls_Set_IsLocked, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function SwtControls_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_SwtControls_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function SwtControls_Set_SwitchedObj(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_SwtControls_Set_SwitchedObj, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function SwtControls_Set_SwitchedTerm(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_SwtControls_Set_SwitchedTerm, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function SwtControls_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_SwtControls_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function SwtControls_Get_NormalState(ctx::Ptr{Cvoid})
    ccall((:ctx_SwtControls_Get_NormalState, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function SwtControls_Set_NormalState(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_SwtControls_Set_NormalState, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function SwtControls_Get_State(ctx::Ptr{Cvoid})
    ccall((:ctx_SwtControls_Get_State, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function SwtControls_Set_State(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_SwtControls_Set_State, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function SwtControls_Reset(ctx::Ptr{Cvoid})
    ccall((:ctx_SwtControls_Reset, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Text_Get_Command(ctx::Ptr{Cvoid})
    ccall((:ctx_Text_Get_Command, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Text_Set_Command(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Text_Set_Command, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Text_Get_Result(ctx::Ptr{Cvoid})
    ccall((:ctx_Text_Get_Result, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Topology_Get_NumLoops(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_NumLoops, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_ActiveBranch(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_ActiveBranch, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_AllIsolatedBranches(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Topology_Get_AllIsolatedBranches, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Topology_Get_AllIsolatedBranches_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_AllIsolatedBranches_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Topology_Get_AllLoopedPairs(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Topology_Get_AllLoopedPairs, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Topology_Get_AllLoopedPairs_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_AllLoopedPairs_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Topology_Get_BackwardBranch(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_BackwardBranch, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_BranchName(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_BranchName, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Topology_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_ForwardBranch(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_ForwardBranch, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_LoopedBranch(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_LoopedBranch, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_NumIsolatedBranches(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_NumIsolatedBranches, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_ParallelBranch(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_ParallelBranch, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Set_BranchName(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Topology_Set_BranchName, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Topology_Get_AllIsolatedLoads(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Topology_Get_AllIsolatedLoads, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Topology_Get_AllIsolatedLoads_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_AllIsolatedLoads_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Topology_Get_FirstLoad(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_FirstLoad, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_NextLoad(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_NextLoad, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_NumIsolatedLoads(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_NumIsolatedLoads, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_ActiveLevel(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_ActiveLevel, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Topology_Get_BusName(ctx::Ptr{Cvoid})
    ccall((:ctx_Topology_Get_BusName, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Topology_Set_BusName(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Topology_Set_BusName, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Transformers_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Transformers_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Transformers_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_IsDelta(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_IsDelta, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_kV(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_kV, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_kVA(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_kVA, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_MaxTap(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_MaxTap, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_MinTap(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_MinTap, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_NumTaps(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_NumTaps, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_NumWindings(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_NumWindings, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_R(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_R, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Rneut(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_Rneut, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Tap(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_Tap, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Wdg(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_Wdg, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_XfmrCode(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_XfmrCode, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Xhl(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_Xhl, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Xht(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_Xht, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Xlt(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_Xlt, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_Xneut(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_Xneut, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Set_IsDelta(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_IsDelta, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Transformers_Set_kV(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_kV, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_kVA(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_kVA, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_MaxTap(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_MaxTap, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_MinTap(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_MinTap, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Transformers_Set_NumTaps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_NumTaps, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Transformers_Set_NumWindings(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_NumWindings, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Transformers_Set_R(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_R, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_Rneut(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_Rneut, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_Tap(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_Tap, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_Wdg(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_Wdg, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Transformers_Set_XfmrCode(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_XfmrCode, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Transformers_Set_Xhl(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_Xhl, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_Xht(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_Xht, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_Xlt(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_Xlt, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Set_Xneut(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_Xneut, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_WdgVoltages(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Transformers_Get_WdgVoltages, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Transformers_Get_WdgVoltages_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_WdgVoltages_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_WdgCurrents(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Transformers_Get_WdgCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Transformers_Get_WdgCurrents_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_WdgCurrents_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_strWdgCurrents(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_strWdgCurrents, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_CoreType(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_CoreType, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Transformers_Set_CoreType(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_CoreType, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Transformers_Get_RdcOhms(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_RdcOhms, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Transformers_Set_RdcOhms(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_RdcOhms, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Transformers_Get_LossesByType(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Transformers_Get_LossesByType, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Transformers_Get_LossesByType_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_LossesByType_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Transformers_Get_AllLossesByType(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Transformers_Get_AllLossesByType, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Transformers_Get_AllLossesByType_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_AllLossesByType_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Vsources_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Vsources_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Vsources_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Vsources_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Vsources_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_Vsources_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Vsources_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_Vsources_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Vsources_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_Vsources_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Vsources_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_Vsources_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Vsources_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Vsources_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Vsources_Get_BasekV(ctx::Ptr{Cvoid})
    ccall((:ctx_Vsources_Get_BasekV, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Vsources_Get_pu(ctx::Ptr{Cvoid})
    ccall((:ctx_Vsources_Get_pu, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Vsources_Set_BasekV(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Vsources_Set_BasekV, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Vsources_Set_pu(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Vsources_Set_pu, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Vsources_Get_AngleDeg(ctx::Ptr{Cvoid})
    ccall((:ctx_Vsources_Get_AngleDeg, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Vsources_Get_Frequency(ctx::Ptr{Cvoid})
    ccall((:ctx_Vsources_Get_Frequency, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Vsources_Get_Phases(ctx::Ptr{Cvoid})
    ccall((:ctx_Vsources_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Vsources_Set_AngleDeg(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Vsources_Set_AngleDeg, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Vsources_Set_Frequency(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Vsources_Set_Frequency, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Vsources_Set_Phases(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Vsources_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function XYCurves_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_XYCurves_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function XYCurves_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_XYCurves_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_XYCurves_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_XYCurves_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_XYCurves_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_XYCurves_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function XYCurves_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_XYCurves_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function XYCurves_Get_Npts(ctx::Ptr{Cvoid})
    ccall((:ctx_XYCurves_Get_Npts, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_Xarray(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_XYCurves_Get_Xarray, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function XYCurves_Get_Xarray_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_XYCurves_Get_Xarray_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function XYCurves_Set_Npts(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_XYCurves_Set_Npts, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function XYCurves_Set_Xarray(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_XYCurves_Set_Xarray, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function XYCurves_Get_x(ctx::Ptr{Cvoid})
    ccall((:ctx_XYCurves_Get_x, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_y(ctx::Ptr{Cvoid})
    ccall((:ctx_XYCurves_Get_y, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_Yarray(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_XYCurves_Get_Yarray, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function XYCurves_Get_Yarray_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_XYCurves_Get_Yarray_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function XYCurves_Set_x(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_XYCurves_Set_x, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function XYCurves_Set_y(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_XYCurves_Set_y, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function XYCurves_Set_Yarray(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_XYCurves_Set_Yarray, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function XYCurves_Get_Xscale(ctx::Ptr{Cvoid})
    ccall((:ctx_XYCurves_Get_Xscale, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_Xshift(ctx::Ptr{Cvoid})
    ccall((:ctx_XYCurves_Get_Xshift, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_Yscale(ctx::Ptr{Cvoid})
    ccall((:ctx_XYCurves_Get_Yscale, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function XYCurves_Get_Yshift(ctx::Ptr{Cvoid})
    ccall((:ctx_XYCurves_Get_Yshift, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function XYCurves_Set_Xscale(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_XYCurves_Set_Xscale, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function XYCurves_Set_Xshift(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_XYCurves_Set_Xshift, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function XYCurves_Set_Yscale(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_XYCurves_Set_Yscale, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function XYCurves_Set_Yshift(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_XYCurves_Set_Yshift, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function YMatrix_GetCompressedYMatrix(ctx::Ptr{Cvoid}, factor, nBus, nNz, ColPtr, RowIdxPtr, cValsPtr)
    ccall((:ctx_YMatrix_GetCompressedYMatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16, Ptr{UInt32}, Ptr{UInt32}, Ptr{Ptr{Int32}}, Ptr{Ptr{Int32}}, Ptr{Ptr{Cdouble}}), ctx, factor, nBus, nNz, ColPtr, RowIdxPtr, cValsPtr)
end

function YMatrix_ZeroInjCurr(ctx::Ptr{Cvoid})
    ccall((:ctx_YMatrix_ZeroInjCurr, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function YMatrix_GetSourceInjCurrents(ctx::Ptr{Cvoid})
    ccall((:ctx_YMatrix_GetSourceInjCurrents, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function YMatrix_GetPCInjCurr(ctx::Ptr{Cvoid})
    ccall((:ctx_YMatrix_GetPCInjCurr, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function YMatrix_BuildYMatrixD(ctx::Ptr{Cvoid}, BuildOps, AllocateVI)
    ccall((:ctx_YMatrix_BuildYMatrixD, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Int32), ctx, BuildOps, AllocateVI)
end

function YMatrix_AddInAuxCurrents(ctx::Ptr{Cvoid}, SType)
    ccall((:ctx_YMatrix_AddInAuxCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, SType)
end

function YMatrix_getIpointer(ctx::Ptr{Cvoid}, IvectorPtr)
    ccall((:ctx_YMatrix_getIpointer, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}},), ctx, IvectorPtr)
end

function YMatrix_getVpointer(ctx::Ptr{Cvoid}, VvectorPtr)
    ccall((:ctx_YMatrix_getVpointer, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}},), ctx, VvectorPtr)
end

function YMatrix_SolveSystem(ctx::Ptr{Cvoid}, NodeVPtr)
    ccall((:ctx_YMatrix_SolveSystem, LIBRARY), Int32, (Ptr{Cvoid}, Ptr{Cdouble},), ctx, NodeVPtr)
end

function YMatrix_Set_SystemYChanged(ctx::Ptr{Cvoid}, arg)
    ccall((:ctx_YMatrix_Set_SystemYChanged, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, arg)
end

function YMatrix_Get_SystemYChanged(ctx::Ptr{Cvoid})
    ccall((:ctx_YMatrix_Get_SystemYChanged, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function YMatrix_Set_UseAuxCurrents(ctx::Ptr{Cvoid}, arg)
    ccall((:ctx_YMatrix_Set_UseAuxCurrents, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, arg)
end

function YMatrix_Get_UseAuxCurrents(ctx::Ptr{Cvoid})
    ccall((:ctx_YMatrix_Get_UseAuxCurrents, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_Get_Zmag(ctx::Ptr{Cvoid})
    ccall((:ctx_ReduceCkt_Get_Zmag, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_Set_Zmag(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_ReduceCkt_Set_Zmag, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function ReduceCkt_Get_KeepLoad(ctx::Ptr{Cvoid})
    ccall((:ctx_ReduceCkt_Get_KeepLoad, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_Set_KeepLoad(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_ReduceCkt_Set_KeepLoad, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function ReduceCkt_Get_EditString(ctx::Ptr{Cvoid})
    ccall((:ctx_ReduceCkt_Get_EditString, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_Set_EditString(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_ReduceCkt_Set_EditString, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function ReduceCkt_Get_StartPDElement(ctx::Ptr{Cvoid})
    ccall((:ctx_ReduceCkt_Get_StartPDElement, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_Set_StartPDElement(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_ReduceCkt_Set_StartPDElement, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function ReduceCkt_Get_EnergyMeter(ctx::Ptr{Cvoid})
    ccall((:ctx_ReduceCkt_Get_EnergyMeter, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_Set_EnergyMeter(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_ReduceCkt_Set_EnergyMeter, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function ReduceCkt_SaveCircuit(ctx::Ptr{Cvoid}, CktName)
    ccall((:ctx_ReduceCkt_SaveCircuit, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, CktName)
end

function ReduceCkt_DoDefault(ctx::Ptr{Cvoid})
    ccall((:ctx_ReduceCkt_DoDefault, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_DoShortLines(ctx::Ptr{Cvoid})
    ccall((:ctx_ReduceCkt_DoShortLines, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_DoDangling(ctx::Ptr{Cvoid})
    ccall((:ctx_ReduceCkt_DoDangling, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_DoLoopBreak(ctx::Ptr{Cvoid})
    ccall((:ctx_ReduceCkt_DoLoopBreak, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_DoParallelLines(ctx::Ptr{Cvoid})
    ccall((:ctx_ReduceCkt_DoParallelLines, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_DoSwitches(ctx::Ptr{Cvoid})
    ccall((:ctx_ReduceCkt_DoSwitches, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_Do1phLaterals(ctx::Ptr{Cvoid})
    ccall((:ctx_ReduceCkt_Do1phLaterals, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function ReduceCkt_DoBranchRemove(ctx::Ptr{Cvoid})
    ccall((:ctx_ReduceCkt_DoBranchRemove, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Storages_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Storages_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Storages_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_Storages_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Storages_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_Storages_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Storages_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_Storages_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Storages_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_Storages_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Storages_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Storages_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Storages_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_Storages_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Storages_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Storages_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Storages_Get_RegisterNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Storages_Get_RegisterNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Storages_Get_RegisterValues(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Storages_Get_RegisterValues, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Storages_Get_RegisterValues_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Storages_Get_RegisterValues_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Storages_Get_puSOC(ctx::Ptr{Cvoid})
    ccall((:ctx_Storages_Get_puSOC, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Storages_Set_puSOC(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Storages_Set_puSOC, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Storages_Get_State(ctx::Ptr{Cvoid})
    ccall((:ctx_Storages_Get_State, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Storages_Set_State(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Storages_Set_State, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CNData_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CNData_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CNData_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CNData_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function CNData_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function CNData_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CNData_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CNData_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function CNData_Get_Rdc(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_Rdc, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_Rdc(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_Rdc, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_Rac(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_Rac, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_Rac(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_Rac, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_GMRac(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_GMRac, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_GMRac(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_GMRac, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_GMRUnits(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_GMRUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CNData_Set_GMRUnits(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_GMRUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CNData_Get_Radius(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_Radius, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_Radius(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_Radius, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_RadiusUnits(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_RadiusUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CNData_Set_RadiusUnits(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_RadiusUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CNData_Get_ResistanceUnits(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_ResistanceUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CNData_Set_ResistanceUnits(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_ResistanceUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CNData_Get_Diameter(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_Diameter, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_Diameter(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_Diameter, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_NormAmps(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_NormAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_NormAmps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_NormAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_EmergAmps(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_EmergAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_EmergAmps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_EmergAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_EpsR(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_EpsR, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_EpsR(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_EpsR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_InsLayer(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_InsLayer, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_InsLayer(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_InsLayer, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_DiaIns(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_DiaIns, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_DiaIns(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_DiaIns, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_DiaCable(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_DiaCable, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_DiaCable(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_DiaCable, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_k(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_k, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CNData_Set_k(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_k, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CNData_Get_DiaStrand(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_DiaStrand, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_DiaStrand(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_DiaStrand, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_GmrStrand(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_GmrStrand, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_GmrStrand(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_GmrStrand, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function CNData_Get_RStrand(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_RStrand, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CNData_Set_RStrand(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_RStrand, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineGeometries_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_LineGeometries_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_LineGeometries_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_LineGeometries_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_LineGeometries_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineGeometries_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function LineGeometries_Get_Nconds(ctx::Ptr{Cvoid})
    ccall((:ctx_LineGeometries_Get_Nconds, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_Nconds(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineGeometries_Set_Nconds, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineGeometries_Get_Phases(ctx::Ptr{Cvoid})
    ccall((:ctx_LineGeometries_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_Phases(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineGeometries_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineGeometries_Get_Cmatrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, Frequency, Length, Units)
    ccall((:ctx_LineGeometries_Get_Cmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Int32), ctx, ResultPtr, ResultCount, Frequency, Length, Units)
end

function LineGeometries_Get_Cmatrix_GR(ctx::Ptr{Cvoid}, Frequency, Length, Units)
    ccall((:ctx_LineGeometries_Get_Cmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble, Int32), ctx, Frequency, Length, Units)
end

function LineGeometries_Get_Rmatrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, Frequency, Length, Units)
    ccall((:ctx_LineGeometries_Get_Rmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Int32), ctx, ResultPtr, ResultCount, Frequency, Length, Units)
end

function LineGeometries_Get_Rmatrix_GR(ctx::Ptr{Cvoid}, Frequency, Length, Units)
    ccall((:ctx_LineGeometries_Get_Rmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble, Int32), ctx, Frequency, Length, Units)
end

function LineGeometries_Get_Xmatrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, Frequency, Length, Units)
    ccall((:ctx_LineGeometries_Get_Xmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Int32), ctx, ResultPtr, ResultCount, Frequency, Length, Units)
end

function LineGeometries_Get_Xmatrix_GR(ctx::Ptr{Cvoid}, Frequency, Length, Units)
    ccall((:ctx_LineGeometries_Get_Xmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble, Int32), ctx, Frequency, Length, Units)
end

function LineGeometries_Get_Zmatrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, Frequency, Length, Units)
    ccall((:ctx_LineGeometries_Get_Zmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Cdouble, Cdouble, Int32), ctx, ResultPtr, ResultCount, Frequency, Length, Units)
end

function LineGeometries_Get_Zmatrix_GR(ctx::Ptr{Cvoid}, Frequency, Length, Units)
    ccall((:ctx_LineGeometries_Get_Zmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble, Cdouble, Int32), ctx, Frequency, Length, Units)
end

function LineGeometries_Get_Units(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_LineGeometries_Get_Units, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineGeometries_Get_Units_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_LineGeometries_Get_Units_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_Units(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_LineGeometries_Set_Units, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Int32}, Int32), ctx, ValuePtr, ValueCount)
end

function LineGeometries_Get_Xcoords(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_LineGeometries_Get_Xcoords, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineGeometries_Get_Xcoords_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_LineGeometries_Get_Xcoords_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_Xcoords(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_LineGeometries_Set_Xcoords, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LineGeometries_Get_Ycoords(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_LineGeometries_Get_Ycoords, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineGeometries_Get_Ycoords_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_LineGeometries_Get_Ycoords_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_Ycoords(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_LineGeometries_Set_Ycoords, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LineGeometries_Get_Conductors(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_LineGeometries_Get_Conductors, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineGeometries_Get_Conductors_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_LineGeometries_Get_Conductors_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Get_Reduce(ctx::Ptr{Cvoid})
    ccall((:ctx_LineGeometries_Get_Reduce, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_Reduce(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineGeometries_Set_Reduce, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function LineGeometries_Get_RhoEarth(ctx::Ptr{Cvoid})
    ccall((:ctx_LineGeometries_Get_RhoEarth, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_RhoEarth(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineGeometries_Set_RhoEarth, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineGeometries_Get_NormAmps(ctx::Ptr{Cvoid})
    ccall((:ctx_LineGeometries_Get_NormAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_NormAmps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineGeometries_Set_NormAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineGeometries_Get_EmergAmps(ctx::Ptr{Cvoid})
    ccall((:ctx_LineGeometries_Get_EmergAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_EmergAmps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineGeometries_Set_EmergAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LineGeometries_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_LineGeometries_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineGeometries_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_LineGeometries_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_LineSpacings_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_LineSpacings_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_LineSpacings_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_LineSpacings_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineSpacings_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function LineSpacings_Get_Nconds(ctx::Ptr{Cvoid})
    ccall((:ctx_LineSpacings_Get_Nconds, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Set_Nconds(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineSpacings_Set_Nconds, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineSpacings_Get_Phases(ctx::Ptr{Cvoid})
    ccall((:ctx_LineSpacings_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Set_Phases(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineSpacings_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineSpacings_Get_Units(ctx::Ptr{Cvoid})
    ccall((:ctx_LineSpacings_Get_Units, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Set_Units(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineSpacings_Set_Units, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineSpacings_Get_Xcoords(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_LineSpacings_Get_Xcoords, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineSpacings_Get_Xcoords_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_LineSpacings_Get_Xcoords_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Set_Xcoords(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_LineSpacings_Set_Xcoords, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LineSpacings_Get_Ycoords(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_LineSpacings_Get_Ycoords, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineSpacings_Get_Ycoords_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_LineSpacings_Get_Ycoords_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Set_Ycoords(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_LineSpacings_Set_Ycoords, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function LineSpacings_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_LineSpacings_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function LineSpacings_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_LineSpacings_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Loads_Get_Phases(ctx::Ptr{Cvoid})
    ccall((:ctx_Loads_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Loads_Set_Phases(ctx::Ptr{Cvoid}, Integer)
    ccall((:ctx_Loads_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Integer)
end

function Reactors_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Reactors_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reactors_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reactors_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reactors_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Reactors_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reactors_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reactors_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reactors_Get_kV(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_kV, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_kV(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reactors_Set_kV, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reactors_Get_kvar(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_kvar, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_kvar(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reactors_Set_kvar, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reactors_Get_Phases(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_Phases, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Phases(ctx::Ptr{Cvoid}, Integer)
    ccall((:ctx_Reactors_Set_Phases, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Integer)
end

function Reactors_Get_IsDelta(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_IsDelta, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_IsDelta(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reactors_Set_IsDelta, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Reactors_Get_Parallel(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_Parallel, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Parallel(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reactors_Set_Parallel, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Reactors_Get_LmH(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_LmH, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_LmH(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reactors_Set_LmH, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reactors_Get_Bus1(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_Bus1, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reactors_Get_Bus2(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_Bus2, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Bus1(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reactors_Set_Bus1, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Reactors_Set_Bus2(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reactors_Set_Bus2, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Reactors_Get_R(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_R, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_R(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reactors_Set_R, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reactors_Get_X(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_X, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_X(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reactors_Set_X, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reactors_Get_Rp(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_Rp, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Rp(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reactors_Set_Rp, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Reactors_Get_RCurve(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_RCurve, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_RCurve(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reactors_Set_RCurve, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Reactors_Get_LCurve(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_LCurve, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_LCurve(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reactors_Set_LCurve, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Reactors_Get_Rmatrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Reactors_Get_Rmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reactors_Get_Rmatrix_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_Rmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Rmatrix(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Reactors_Set_Rmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Reactors_Get_Xmatrix(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Reactors_Get_Xmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reactors_Get_Xmatrix_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_Xmatrix_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Xmatrix(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Reactors_Set_Xmatrix, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Reactors_Get_Z(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Reactors_Get_Z, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reactors_Get_Z_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_Z_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Z(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Reactors_Set_Z, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Reactors_Get_Z1(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Reactors_Get_Z1, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reactors_Get_Z1_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_Z1_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Z1(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Reactors_Set_Z1, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Reactors_Get_Z2(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Reactors_Get_Z2, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reactors_Get_Z2_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_Z2_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Z2(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Reactors_Set_Z2, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Reactors_Get_Z0(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_Reactors_Get_Z0, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function Reactors_Get_Z0_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_Z0_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_Z0(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Reactors_Set_Z0, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Int32), ctx, ValuePtr, ValueCount)
end

function Reactors_Get_SpecType(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_SpecType, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function TSData_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function TSData_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function TSData_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function TSData_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function TSData_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function TSData_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_TSData_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function TSData_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function TSData_Get_Rdc(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_Rdc, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_Rdc(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_Rdc, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_Rac(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_Rac, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_Rac(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_Rac, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_GMRac(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_GMRac, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_GMRac(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_GMRac, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_GMRUnits(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_GMRUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function TSData_Set_GMRUnits(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_GMRUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function TSData_Get_Radius(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_Radius, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_Radius(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_Radius, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_RadiusUnits(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_RadiusUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function TSData_Set_RadiusUnits(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_RadiusUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function TSData_Get_ResistanceUnits(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_ResistanceUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function TSData_Set_ResistanceUnits(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_ResistanceUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function TSData_Get_Diameter(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_Diameter, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_Diameter(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_Diameter, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_NormAmps(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_NormAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_NormAmps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_NormAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_EmergAmps(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_EmergAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_EmergAmps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_EmergAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_EpsR(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_EpsR, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_EpsR(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_EpsR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_InsLayer(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_InsLayer, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_InsLayer(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_InsLayer, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_DiaIns(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_DiaIns, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_DiaIns(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_DiaIns, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_DiaCable(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_DiaCable, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_DiaCable(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_DiaCable, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_DiaShield(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_DiaShield, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_DiaShield(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_DiaShield, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_TapeLayer(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_TapeLayer, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_TapeLayer(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_TapeLayer, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function TSData_Get_TapeLap(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_TapeLap, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function TSData_Set_TapeLap(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_TapeLap, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function WireData_Get_Count(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_Count, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function WireData_Get_First(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_First, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function WireData_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function WireData_Get_Name(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_Name, LIBRARY), Cstring, (Ptr{Cvoid},), ctx)
end

function WireData_Set_Name(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_WireData_Set_Name, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function WireData_Get_AllNames(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_WireData_Get_AllNames, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function WireData_Get_AllNames_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_AllNames_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function WireData_Get_Rdc(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_Rdc, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function WireData_Set_Rdc(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_WireData_Set_Rdc, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function WireData_Get_Rac(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_Rac, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function WireData_Set_Rac(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_WireData_Set_Rac, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function WireData_Get_GMRac(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_GMRac, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function WireData_Set_GMRac(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_WireData_Set_GMRac, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function WireData_Get_GMRUnits(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_GMRUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function WireData_Set_GMRUnits(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_WireData_Set_GMRUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function WireData_Get_Radius(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_Radius, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function WireData_Set_Radius(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_WireData_Set_Radius, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function WireData_Get_RadiusUnits(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_RadiusUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function WireData_Set_RadiusUnits(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_WireData_Set_RadiusUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function WireData_Get_ResistanceUnits(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_ResistanceUnits, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function WireData_Set_ResistanceUnits(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_WireData_Set_ResistanceUnits, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function WireData_Get_Diameter(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_Diameter, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function WireData_Set_Diameter(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_WireData_Set_Diameter, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function WireData_Get_NormAmps(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_NormAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function WireData_Set_NormAmps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_WireData_Set_NormAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function WireData_Get_EmergAmps(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_EmergAmps, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function WireData_Set_EmergAmps(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_WireData_Set_EmergAmps, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function WireData_Get_CapRadius(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_CapRadius, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function WireData_Set_CapRadius(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_WireData_Set_CapRadius, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function Bus_Get_Next(ctx::Ptr{Cvoid})
    ccall((:ctx_Bus_Get_Next, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Error_Get_EarlyAbort(ctx::Ptr{Cvoid})
    ccall((:ctx_Error_Get_EarlyAbort, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Error_Set_EarlyAbort(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Error_Set_EarlyAbort, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function Error_Get_ExtendedErrors(ctx::Ptr{Cvoid})
    ccall((:ctx_Error_Get_ExtendedErrors, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function Error_Set_ExtendedErrors(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Error_Set_ExtendedErrors, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function CNData_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_CNData_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CNData_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CNData_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function CapControls_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_CapControls_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function CapControls_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_CapControls_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Capacitors_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_Capacitors_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Capacitors_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Capacitors_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function GICSources_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_GICSources_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function GICSources_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_GICSources_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function ISources_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_ISources_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function ISources_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_ISources_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineCodes_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_LineCodes_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineCodes_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineCodes_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineGeometries_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_LineGeometries_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineGeometries_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineGeometries_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LineSpacings_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_LineSpacings_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LineSpacings_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LineSpacings_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Lines_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_Lines_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Lines_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Lines_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function LoadShapes_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LoadShapes_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Meters_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_Meters_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Meters_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Meters_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Monitors_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_Monitors_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Monitors_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Monitors_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Reactors_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_Reactors_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Reactors_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Reactors_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function RegControls_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_RegControls_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function RegControls_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_RegControls_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Sensors_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_Sensors_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Sensors_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Sensors_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function SwtControls_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_SwtControls_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function SwtControls_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_SwtControls_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function TSData_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_TSData_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function TSData_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_TSData_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Transformers_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_Transformers_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Transformers_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Transformers_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Vsources_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_Vsources_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function Vsources_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Vsources_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function WireData_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_WireData_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function WireData_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_WireData_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function XYCurves_Get_idx(ctx::Ptr{Cvoid})
    ccall((:ctx_XYCurves_Get_idx, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function XYCurves_Set_idx(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_XYCurves_Set_idx, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function Circuit_Get_ElementLosses(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, ElementsPtr, ElementsCount)
    ccall((:ctx_Circuit_Get_ElementLosses, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cdouble}}, Ptr{Int32}, Ptr{Int32}, Int32), ctx, ResultPtr, ResultCount, ElementsPtr, ElementsCount)
end

function Circuit_Get_ElementLosses_GR(ctx::Ptr{Cvoid}, ElementsPtr, ElementsCount)
    ccall((:ctx_Circuit_Get_ElementLosses_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Int32}, Int32), ctx, ElementsPtr, ElementsCount)
end

function LoadShapes_Set_Points(ctx::Ptr{Cvoid}, Npts, HoursPtr, PMultPtr, QMultPtr, ExternalMemory, IsFloat32, Stride)
    ccall((:ctx_LoadShapes_Set_Points, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, UInt16, UInt16, Int32), ctx, Npts, HoursPtr, PMultPtr, QMultPtr, ExternalMemory, IsFloat32, Stride)
end

function LoadShapes_UseFloat32(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_UseFloat32, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LoadShapes_UseFloat64(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_UseFloat64, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_MaxP(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LoadShapes_Set_MaxP, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LoadShapes_Get_MaxP(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_MaxP, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function LoadShapes_Set_MaxQ(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_LoadShapes_Set_MaxQ, LIBRARY), Cvoid, (Ptr{Cvoid}, Cdouble,), ctx, Value)
end

function LoadShapes_Get_MaxQ(ctx::Ptr{Cvoid})
    ccall((:ctx_LoadShapes_Get_MaxQ, LIBRARY), Cdouble, (Ptr{Cvoid},), ctx)
end

function CktElement_Get_NodeRef(ctx::Ptr{Cvoid}, ResultPtr, ResultCount)
    ccall((:ctx_CktElement_Get_NodeRef, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int32}}, Ptr{Int32}), ctx, ResultPtr, ResultCount)
end

function CktElement_Get_NodeRef_GR(ctx::Ptr{Cvoid})
    ccall((:ctx_CktElement_Get_NodeRef_GR, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function YMatrix_CheckConvergence(ctx::Ptr{Cvoid})
    ccall((:ctx_YMatrix_CheckConvergence, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function YMatrix_SetGeneratordQdV(ctx::Ptr{Cvoid})
    ccall((:ctx_YMatrix_SetGeneratordQdV, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

function YMatrix_Get_LoadsNeedUpdating(ctx::Ptr{Cvoid})
    ccall((:ctx_YMatrix_Get_LoadsNeedUpdating, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function YMatrix_Set_LoadsNeedUpdating(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_YMatrix_Set_LoadsNeedUpdating, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function YMatrix_Get_SolutionInitialized(ctx::Ptr{Cvoid})
    ccall((:ctx_YMatrix_Get_SolutionInitialized, LIBRARY), UInt16, (Ptr{Cvoid},), ctx)
end

function YMatrix_Set_SolutionInitialized(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_YMatrix_Set_SolutionInitialized, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt16,), ctx, Value)
end

function YMatrix_Get_Iteration(ctx::Ptr{Cvoid})
    ccall((:ctx_YMatrix_Get_Iteration, LIBRARY), Int32, (Ptr{Cvoid},), ctx)
end

function YMatrix_Set_Iteration(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_YMatrix_Set_Iteration, LIBRARY), Cvoid, (Ptr{Cvoid}, Int32,), ctx, Value)
end

function YMatrix_Get_Handle(ctx::Ptr{Cvoid})
    ccall((:ctx_YMatrix_Get_Handle, LIBRARY), Ptr{Cvoid}, (Ptr{Cvoid},), ctx)
end

function YMatrix_Set_SolverOptions(ctx::Ptr{Cvoid}, opts)
    ccall((:ctx_YMatrix_Set_SolverOptions, LIBRARY), Cvoid, (Ptr{Cvoid}, UInt64,), ctx, opts)
end

function YMatrix_Get_SolverOptions(ctx::Ptr{Cvoid})
    ccall((:ctx_YMatrix_Get_SolverOptions, LIBRARY), UInt64, (Ptr{Cvoid},), ctx)
end

function Text_CommandBlock(ctx::Ptr{Cvoid}, Value)
    ccall((:ctx_Text_CommandBlock, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, Value)
end

function Text_CommandArray(ctx::Ptr{Cvoid}, ValuePtr, ValueCount)
    ccall((:ctx_Text_CommandArray, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Cstring}, Int32), ctx, ValuePtr, ValueCount)
end

function ZIP_Open(ctx::Ptr{Cvoid}, FileName)
    ccall((:ctx_ZIP_Open, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, FileName)
end

function ZIP_Redirect(ctx::Ptr{Cvoid}, FileInZip)
    ccall((:ctx_ZIP_Redirect, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, FileInZip)
end

function ZIP_Contains(ctx::Ptr{Cvoid}, Name)
    ccall((:ctx_ZIP_Contains, LIBRARY), UInt16, (Ptr{Cvoid}, Cstring,), ctx, Name)
end

function ZIP_List(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, RegExp)
    ccall((:ctx_ZIP_List, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Cstring}}, Ptr{Int32}, Cstring), ctx, ResultPtr, ResultCount, RegExp)
end

function ZIP_Extract(ctx::Ptr{Cvoid}, ResultPtr, ResultCount, FileName)
    ccall((:ctx_ZIP_Extract, LIBRARY), Cvoid, (Ptr{Cvoid}, Ptr{Ptr{Int8}}, Ptr{Int32}, Cstring), ctx, ResultPtr, ResultCount, FileName)
end

function ZIP_Extract_GR(ctx::Ptr{Cvoid}, FileName)
    ccall((:ctx_ZIP_Extract_GR, LIBRARY), Cvoid, (Ptr{Cvoid}, Cstring,), ctx, FileName)
end

function ZIP_Close(ctx::Ptr{Cvoid})
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

function ctx_New()
    ccall((:ctx_New, LIBRARY), Ptr{Cvoid}, ())
end

function ctx_Get_Prime()
    ccall((:ctx_Get_Prime, LIBRARY), Ptr{Cvoid}, ())
end

function ctx_Set_Prime(ctx::Ptr{Cvoid})
    ccall((:ctx_Set_Prime, LIBRARY), Ptr{Cvoid}, (Ptr{Cvoid},), ctx)
end

function ctx_Dispose(ctx::Ptr{Cvoid})
    ccall((:ctx_Dispose, LIBRARY), Cvoid, (Ptr{Cvoid},), ctx)
end

const DSS_CAPI_VERSION = "0.12.1"
