export dss, activeclass, bus, capacitors, capcontrols, circuit, cktelement,
       ctrlqueue, element, executive, progress, fuses, generators, properties,
       isource, lines, loads, loadshape, meters, monitors, parser, pdelements, 
       pvsystems, reclosers, regcontrols, relays, sensors, settings, solution,
       swtcontrols, topology, transformers, vsources, xycurves

cmplx(x) = reinterpret(Complex128, x)


gendict(;args...) = Dict{Symbol,Int}(args)

################################################################################
##
## dss
##
################################################################################
dss(x::Symbol, arg...) = dss(Val{x}, arg...)

for (k,v) in gendict(NumCircuits = 0, ClearAll = 1, ShowPanel = 2, Start = 3, 
                     NumClasses = 4, NumUserClasses = 5, Reset = 6, 
                     Allowforms_get = 7, Allowforms_set = 8)
    @eval dss(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.DSSI($v, arg)
end

for (k,v) in gendict(NewCircuit = 0, Version = 1, DataPath_get = 2, 
                     DataPath_set = 3, DefaultEditor = 4)
    @eval dss(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.DSSS($v, arg)
end

dss(::Type{Val{:Classes}}) = DSSCore.DSSV(0)
dss(::Type{Val{:UserClasses}}) = DSSCore.DSSV(1)

function dss(arg::AbstractString) 
    nlines = length(matchall(r"\n", arg)) + 1
    if nlines == 1 && arg != ""
        DSSCore.DSSPut_Command(arg)
    elseif nlines > 1
        for s in split(arg, "\n")
            if s != ""
                DSSCore.DSSPut_Command(s)
            end
        end
    end
end


################################################################################
##
## activeclass
##
################################################################################
activeclass(x::Symbol, arg...) = activeclass(Val{x}, arg...)

for (k,v) in gendict(First = 0, Next = 1, NumElements = 2, Count = 3)
    @eval activeclass(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.ActiveClassI($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1, ActiveClassName = 2) 
    @eval activeclass(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.ActiveClassS($v, arg)
end

activeclass(::Type{Val{:AllNames}}) = DSSCore.ActiveClassV(0)

################################################################################
##
## bus
##
################################################################################
bus(x::Symbol, arg...) = bus(Val{x}, arg...)

for (k,v) in gendict(NumNodes = 0, ZscRefresh = 1, Coorddefined = 2, 
                     GetUniqueNodeNumber = 3, N_Customers = 4, SectionID = 5)
    @eval bus(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.BUSI($v, arg)
end

for (k,v) in gendict(kVBase = 0, X_get = 1, X_set = 2, Y_get = 3, Y_set = 4,
                     Distance = 5, Lambda = 6, N_interrupts = 7, int_duration = 8,
                     Cust_interrupts = 9, Cust_duration = 10, Totalmiles = 11) 
    @eval bus(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.BUSF($v, arg)
end

for (k,v) in gendict(Name = 0) 
    @eval bus(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.BUSS($v, arg)
end

bus(::Type{Val{:Voltages}})        = cmplx(DSSCore.BUSV(0))
bus(::Type{Val{:SeqVoltages}})     = DSSCore.BUSV(1)
bus(::Type{Val{:Nodes}})           = DSSCore.BUSV(2)
bus(::Type{Val{:Voc}})             = cmplx(DSSCore.BUSV(3))
bus(::Type{Val{:Isc}})             = cmplx(DSSCore.BUSV(4))
bus(::Type{Val{:PuVoltage}})       = cmplx(DSSCore.BUSV(5))
bus(::Type{Val{:ZscMatrix}})       = cmplx(DSSCore.BUSV(6))
bus(::Type{Val{:Zsc1}})            = cmplx(DSSCore.BUSV(7))
bus(::Type{Val{:Zsc0}})            = cmplx(DSSCore.BUSV(8))
bus(::Type{Val{:YscMatrix}})       = cmplx(DSSCore.BUSV(9))
bus(::Type{Val{:CplxSeqVoltages}}) = cmplx(DSSCore.BUSV(10))
bus(::Type{Val{:Vll}})             = cmplx(DSSCore.BUSV(11))
bus(::Type{Val{:PuVll}})           = cmplx(DSSCore.BUSV(12))
bus(::Type{Val{:VMagAngle}})       = DSSCore.BUSV(13)
bus(::Type{Val{:PuVMagAngle}})     = DSSCore.BUSV(14)


################################################################################
##
## capacitors
##
################################################################################
capacitors(x::Symbol, arg...) = capacitors(Val{x}, arg...)

for (k,v) in gendict(NumSteps_get = 0, NumSteps_set = 1, IsDelta_get = 2, 
                     IsDelta_set = 3, First = 4, Next = 5, Count = 6,
                     AddStep = 7, SubtractStep = 8, AvailableSteps = 9,
                     Open = 10, Close = 11)
    @eval capacitors(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.CapacitorsI($v, arg)
end

for (k,v) in gendict(kV_get = 0, kV_set = 1, kvar_get = 2, kvar_set = 3) 
    @eval capacitors(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.CapacitorsF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1) 
    @eval capacitors(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.CapacitorsS($v, arg)
end

capacitors(::Type{Val{:AllNames}})        = DSSCore.CapacitorsV(0)
# capacitors(::Type{Val{:States_get}})      = DSSCore.CapacitorsV(1)   # Needs to handle Int's
# capacitors(::Type{Val{:States_set}}, arg) = DSSCore.CapacitorsV(2, arg)


################################################################################
##
## capcontrols
##
################################################################################
capcontrols(x::Symbol, arg...) = capcontrols(Val{x}, arg...)

for (k,v) in gendict(First = 0, Next = 1, Mode_get = 2, Mode_set = 3, 
                     MonitoredTerm_get = 4, MonitoredTerm_set = 5, 
                     UseVoltOverride_get = 6, UseVoltOverride_set = 7, 
                     Count = 8)
    @eval capcontrols(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.CapControlsI($v, arg)
end

for (k,v) in gendict(CTRatio_get = 0, CTRatio_set = 1, 
                     PTRatio_get = 2, PTRatio_set = 3,
                     ONSetting_get = 4, ONSetting_set = 5,
                     OFFSetting_get = 6, OFFSetting_set = 7,  
                     Vmax_get = 8, Vmax_set = 9,  
                     Vmin_get = 10, Vmin_set = 11,  
                     Delay_get = 12, Delay_set = 13,  
                     DelayOff_get = 14, DelayOff_set = 15) 
    @eval capcontrols(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.CapControlsF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1,
                     Capacitor_get = 2, Capacitor_set = 3,
                     MonitoredObj_get = 4, MonitoredObj_set = 5) 
    @eval capcontrols(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.CapControlsS($v, arg)
end

capcontrols(::Type{Val{:AllNames}})        = DSSCore.CapControlsV(0)


################################################################################
##
## circuit
##
################################################################################
circuit(x::Symbol, arg...) = circuit(Val{x}, arg...)

for (k,v) in gendict(NumDevices = 0, NumBuses = 1, NumNodes = 2, 
                     FirstPCElement = 3, NextPCElement = 4, 
                     FirstPDElement = 5, NextPDElement = 6, 
                     Sample = 7, SaveSample = 8, SetActiveBusi = 9, 
                     FirstElement = 10, NextElement = 11, 
                     UpdateStorage = 12, ParentPDElement = 13, 
                     EndOfTimeStepUpdate = 14)
    @eval circuit(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.CircuitI($v, arg)
end

for (k,v) in gendict(Capacity = 0) 
    @eval circuit(::Type{Val{$(Meta.quot(k))}}, arg = 0.0, arg2 = 0.0) = DSSCore.CircuitF($v, arg, arg2)
end

for (k,v) in gendict(Name = 0, Disable = 1, Enable = 2, SetActiveElement = 3,
                     SetActiveBus = 4, SetActiveBus = 5, SetActiveClass = 6) 
    @eval circuit(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.CircuitS($v, arg)
end

circuit(::Type{Val{:Losses}})                  = cmplx(DSSCore.CircuitV(0))[1]
circuit(::Type{Val{:LineLosses}})              = cmplx(DSSCore.CircuitV(1))[1]
circuit(::Type{Val{:SubstationLosses}})        = cmplx(DSSCore.CircuitV(2))[1]
circuit(::Type{Val{:TotalPower}})              = cmplx(DSSCore.CircuitV(3))[1]
circuit(::Type{Val{:AllBusVolts}})             = cmplx(DSSCore.CircuitV(4))
circuit(::Type{Val{:AllBusVMag}})              =       DSSCore.CircuitV(5)
circuit(::Type{Val{:AllElementNames}})         =       DSSCore.CircuitV(6)
circuit(::Type{Val{:AllBusNames}})             =       DSSCore.CircuitV(7)
circuit(::Type{Val{:AllElementLosses}})        =       DSSCore.CircuitV(8)
circuit(::Type{Val{:AllBusMagPu}})             =       DSSCore.CircuitV(9)
circuit(::Type{Val{:AllNodeNames}})            =       DSSCore.CircuitV(10)
circuit(::Type{Val{:SystemY}})                 = cmplx(DSSCore.CircuitV(11))
circuit(::Type{Val{:AllBusDistances}})         =       DSSCore.CircuitV(12)
circuit(::Type{Val{:AllNodeDistances}})        =       DSSCore.CircuitV(13)
circuit(::Type{Val{:AllVmagByPhase}})          =       DSSCore.CircuitV(14)
circuit(::Type{Val{:AllVmagPuByPhase}})        =       DSSCore.CircuitV(15)
circuit(::Type{Val{:AllNodeDistancesByPhase}}) =       DSSCore.CircuitV(16)
circuit(::Type{Val{:AllNodeNamesByPhase}})     =       DSSCore.CircuitV(17)
circuit(::Type{Val{:YNodeVArray}})             = cmplx(DSSCore.CircuitV(18))
circuit(::Type{Val{:YNodeOrder}})              =       DSSCore.CircuitV(19)
circuit(::Type{Val{:YCurrents}})               = cmplx(DSSCore.CircuitV(20))


################################################################################
##
## cktelement
##
################################################################################
cktelement(x::Symbol, arg...) = cktelement(Val{x}, arg...)

for (k,v) in gendict(NumTerminals = 0, NumConductors = 1, NumPhases = 2, 
                     Open = 3, Close = 4, 
                     IsOpen = 5, NumProperties = 6, 
                     HasSwitchControl = 7, HasVoltControl = 8, NumControls = 9, 
                     OCPDevIndex = 10, OCPDevType = 11, 
                     Enabled_get = 12, Enabled_set = 13)
    @eval cktelement(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.CktElementI($v, arg)
end

for (k,v) in gendict(NormalAmps_get = 0, NormalAmps_set = 1,
                     EmergAmps_get = 2, EmergAmps_set = 3,
                     Variablei = 4)
    @eval cktelement(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.CktElementF($v, arg)
end

for (k,v) in gendict(Name = 0, Display_get = 1, Display_set = 2, 
                     GUID = 3, EnergyMeter = 4, Controller = 5) 
    @eval cktelement(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.CktElementS($v, arg)
end

cktelement(::Type{Val{:BusNames}})       =       DSSCore.CktElementV(0)
# cktelement(::Type{Val{:BusNames_set}}, arg) =       DSSCore.CktElementV(1, arg)
cktelement(::Type{Val{:Voltages}})       = cmplx(DSSCore.CktElementV(2))
cktelement(::Type{Val{:Currents}})       = cmplx(DSSCore.CktElementV(3))
cktelement(::Type{Val{:Powers}})         = cmplx(DSSCore.CktElementV(4))
cktelement(::Type{Val{:Losses}})         = cmplx(DSSCore.CktElementV(5))
cktelement(::Type{Val{:PhaseLosses}})    = cmplx(DSSCore.CktElementV(6))
cktelement(::Type{Val{:SeqVoltages}})    =       DSSCore.CktElementV(7)     ## maybe reshape
cktelement(::Type{Val{:SeqCurrents}})    =       DSSCore.CktElementV(8)     ## maybe reshape
cktelement(::Type{Val{:SeqPowers}})      = cmplx(DSSCore.CktElementV(9))    ## maybe reshape
cktelement(::Type{Val{:AllPropertyNames}}) =     DSSCore.CktElementV(10)
cktelement(::Type{Val{:Residuals}})      =       DSSCore.CktElementV(11)    ## maybe reshape
cktelement(::Type{Val{:YPrim}})          = cmplx(DSSCore.CktElementV(12))
cktelement(::Type{Val{:CplxSeqVoltages}}) = cmplx(DSSCore.CktElementV(13))
cktelement(::Type{Val{:CplxSeqCurrents}}) = cmplx(DSSCore.CktElementV(14))
cktelement(::Type{Val{:AllVariableNames}}) =     DSSCore.CktElementV(15)
cktelement(::Type{Val{:AllVariableValues}}) =    DSSCore.CktElementV(16)
cktelement(::Type{Val{:NodeOrder}})      =       DSSCore.CktElementV(17)   ## Needs Int
cktelement(::Type{Val{:CurrentsMagAng}}) =       DSSCore.CktElementV(18)
cktelement(::Type{Val{:VoltagesMagAng}}) =       DSSCore.CktElementV(19)


################################################################################
##
## ctrlqueue
##
################################################################################
ctrlqueue(x::Symbol, arg...) = ctrlqueue(Val{x}, arg...)

for (k,v) in gendict(ClearQueue = 0, Delete = 1, NumActions = 2, 
                     Action = 3, ActionCode = 4, 
                     DeviceHandle = 5, Push = 6, 
                     Show = 7, ClearActions = 8, PopAction = 9)
    @eval ctrlqueue(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.CtrlQueueI($v, arg)
end


################################################################################
##
## element
##
################################################################################
element(x::Symbol, arg...) = element(Val{x}, arg...)

for (k,v) in gendict(NumProperties = 0)
    @eval element(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.DSSElementI($v, arg)
end

for (k,v) in gendict(Name = 0) 
    @eval element(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.DSSElementS($v, arg)
end

element(::Type{Val{:AllNames}})        = DSSCore.ElementV(0)


################################################################################
##
## executive
##
################################################################################
executive(x::Symbol, arg...) = executive(Val{x}, arg...)

for (k,v) in gendict(NumExecCommands = 0, NumExecOptions = 1)
    @eval executive(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.ExecutiveI($v, arg)
end

for (k,v) in gendict(Command = 0, Option = 1, CommandHelp = 2, OptionHelp = 3,
                     OptionValue = 4) 
    @eval executive(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.ExecutiveS($v, arg)
end


################################################################################
##
## progress
##
################################################################################
progress(x::Symbol, arg...) = progress(Val{x}, arg...)

for (k,v) in gendict(PctProgress = 0, Show = 1, Close = 2)
    @eval progress(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.DSSProgressI($v, arg)
end

for (k,v) in gendict(Caption = 0) 
    @eval progress(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.DSSProgressS($v, arg)
end


################################################################################
##
## fuses
##
################################################################################
fuses(x::Symbol, arg...) = fuses(Val{x}, arg...)

for (k,v) in gendict(Count = 0, First = 1, Next = 2, 
                     MonitoredTerm_get = 3, MonitoredTerm_set = 4, 
                     Open = 5, Close = 6, 
                     IsBlown = 7, Idx_get = 8, Idx_set = 9, 
                     NumPhases = 10)
    @eval fuses(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.FusesI($v, arg)
end

for (k,v) in gendict(RatedCurrent_get = 0, RatedCurrent_set = 1)
    @eval fuses(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.FusesF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1, 
                     MonitoredObj_get = 2, MonitoredObj_set = 3, 
                     SwitchedObj_get = 4, SwitchedObj_set = 5, 
                     TCCCurve_get = 6, TCCCurve_set = 7) 
    @eval fuses(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.FusesS($v, arg)
end

fuses(::Type{Val{:AllNames}})        = DSSCore.FusesV(0)


################################################################################
##
## generators
##
################################################################################
generators(x::Symbol, arg...) = generators(Val{x}, arg...)

for (k,v) in gendict(First = 0, Next = 1, 
                     ForcedON_get = 2, ForcedON_set = 3, 
                     Phases_get = 4, Phases_set = 5, 
                     Count = 6, 
                     Idx_get = 7, Idx_set = 8, 
                     Model_get = 9, Model_set = 10)
    @eval generators(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.GeneratorsI($v, arg)
end

for (k,v) in gendict(kV_get = 0, kV_set = 1,
                     kW_get = 2, kW_set = 3, 
                     kvar_get = 4, kvar_set = 5, 
                     PF_get = 6, PF_set = 7, 
                     kVARated_get = 8, kVARated_set = 9, 
                     Vmaxpu_get = 10, Vmaxpu_set = 11, 
                     Vminpu_get = 12, Vminpu_set = 13)
    @eval generators(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.GeneratorsF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1) 
    @eval generators(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.GeneratorsS($v, arg)
end

generators(::Type{Val{:AllNames}})        = DSSCore.GeneratorsV(0)
generators(::Type{Val{:RegisterNames}})   = DSSCore.GeneratorsV(1)
generators(::Type{Val{:RegisterValues}})  = DSSCore.GeneratorsV(2)


################################################################################
##
## properties
##
################################################################################
properties(x::Symbol, arg...) = properties(Val{x}, arg...)

for (k,v) in gendict(Name = 0, Description = 1,
                     Value_get = 2, Value_set = 3) 
    @eval properties(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.DSSProperties($v, arg)
end

################################################################################
##
## isource
##
################################################################################
isource(x::Symbol, arg...) = isource(Val{x}, arg...)

for (k,v) in gendict(Count = 0, First = 1, Next = 2)
    @eval isource(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.IsourceI($v, arg)
end

for (k,v) in gendict(Amps_get = 0, Amps_set = 1,
                     AngleDeg_get = 2, AngleDeg_set = 3, 
                     Frequency_get = 4, Frequency_set = 5)
    @eval isource(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.IsourceF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1) 
    @eval isource(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.IsourceS($v, arg)
end

isource(::Type{Val{:AllNames}})        = DSSCore.IsourceV(0)


################################################################################
##
## lines
##
################################################################################
lines(x::Symbol, arg...) = lines(Val{x}, arg...)

for (k,v) in gendict(First = 0, Next = 1,
                     Phases_get = 2, Phases_set = 3,
                     NumCust = 4, Parent = 5, Count = 6, 
                     Units_get = 7, Units_set = 8)
    @eval lines(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.LinesI($v, arg)
end

for (k,v) in gendict(Length_get = 0, Length_set = 1,
                     R1_get = 2, R1_set = 3, 
                     X1_get = 4, X1_set = 5,
                     R0_get = 6, R0_set = 7, 
                     X0_get = 8, X0_set = 9,
                     C1_get = 10, C1_set = 11,
                     C0_get = 12, C0_set = 13, 
                     NormAmps_get = 14, NormAmps_set = 15, 
                     EmergAmps_get = 16, EmergAmps_set = 17, 
                     Rg_get = 18, Rg_set = 19,
                     Xg_get = 20, Xg_set = 21,
                     Rho_get = 22, Rho_set = 23)
    @eval lines(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.LinesF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1,
                     Bus1_get = 2, Bus1_set = 3, 
                     Bus2_get = 4, Bus2_set = 5, 
                     LineCode_get = 6, LineCode_set = 7, 
                     Geometry_get = 8, Geometry_set = 9,
                     Spacing_get = 10, Spacing_set = 11) 
    @eval lines(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.LinesS($v, arg)
end

lines(::Type{Val{:AllNames}})         = DSSCore.LinesV(0)
lines(::Type{Val{:RMatrix_get}})      = DSSCore.LinesV(1)
lines(::Type{Val{:RMatrix_set}}, arg) = DSSCore.LinesV(2, arg)
lines(::Type{Val{:XMatrix_get}})      = DSSCore.LinesV(3)
lines(::Type{Val{:XMatrix_set}}, arg) = DSSCore.LinesV(4, arg)
lines(::Type{Val{:CMatrix_get}})      = DSSCore.LinesV(5)
lines(::Type{Val{:CMatrix_set}}, arg) = DSSCore.LinesV(6, arg)
lines(::Type{Val{:Yprim_get}})        = cmplx(DSSCore.LinesV(7))
lines(::Type{Val{:Yprim_set}}, arg)   = DSSCore.LinesV(8, arg)


################################################################################
##
## loads
##
################################################################################
loads(x::Symbol, arg...) = loads(Val{x}, arg...)

for (k,v) in gendict(First = 0, Next = 1,
                     Idx_get = 2, Idx_set = 3, Count = 4, 
                     Class_get = 5, Class_set = 6, 
                     Model_get = 7, Model_set = 8,
                     NumCust_get = 9, NumCust_set = 10, 
                     Status_get = 11, Status_set = 12, 
                     IsDelta_get = 13, IsDelta_set = 14)
    @eval loads(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.DSSLoads($v, arg)
end

for (k,v) in gendict(kW_get = 0, kW_set = 1,
                     kV_get = 2, kV_set = 3, 
                     kvar_get = 4, kvar_set = 5,
                     PF_get = 6, PF_set = 7, 
                     PctMean_get = 8, PctMean_set = 9,
                     PctStdDev_get = 10, PctStdDev_set = 11,
                     AllocationFactor_get = 12, AllocationFactor_set = 13, 
                     CFactor_get = 14, CFactor_set = 15, 
                     CVRwatts_get = 16, CVRwatts_set = 17, 
                     CVRvars_get = 18, CVRvars_set = 19,
                     kVABase_get = 20, kVABase_set = 21,
                     kWh_get = 22, kWh_set = 23,
                     kWhDays_get = 24, kWhDays_set = 25, 
                     Rneut_get = 26, Rneut_set = 27, 
                     Vmaxpu_get = 28, Vmaxpu_set = 29, 
                     VminEmerg_get = 30, VminEmerg_set = 31, 
                     VminNorm_get = 32, VminNorm_set = 33, 
                     Vminpu_get = 34, Vminpu_set = 35, 
                     XfkVA_get = 36, XfkVA_set = 37, 
                     Xneut_get = 38, Xneut_set = 39, 
                     puSeriesRL_get = 40, puSeriesRL_set = 41, 
                     RelWeighting_get = 42, RelWeighting_set = 43)
    @eval loads(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.DSSLoadsF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1,
                     CVRCurve_get = 2, CVRCurve_set = 3, 
                     Daily_get = 4, Daily_set = 5, 
                     Duty_get = 6, Duty_set = 7, 
                     Spectrum_get = 8, Spectrum_set = 9,
                     Yearly_get = 10, Yearly_set = 11, 
                     Growth_get = 12, Growth_set = 13) 
    @eval loads(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.DSSLoadsS($v, arg)
end

loads(::Type{Val{:AllNames}})         = DSSCore.LoadsV(0)
loads(::Type{Val{:ZipV_get}})         = DSSCore.LoadsV(1)
loads(::Type{Val{:ZipV_set}}, arg)    = DSSCore.LoadsV(2, arg)


################################################################################
##
## loadshape
##
################################################################################
loadshape(x::Symbol, arg...) = loadshape(Val{x}, arg...)

for (k,v) in gendict(Count = 0, First = 1, Next = 2, 
                     Npts_get = 3, Npts_set = 4, 
                     Normalize = 5, 
                     UseActual_get = 6, UseActual_set = 7) 
    @eval loadshape(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.LoadShapeI($v, arg)
end

for (k,v) in gendict(HrInterval_get = 0, HrInterval_set = 1,
                     MinInterval_get = 2, MinInterval_set = 3, 
                     PBase_get = 4, PBase_set = 5,
                     QBase_get = 6, QBase_set = 7, 
                     SInterval_get = 8, SInterval_set = 9)
    @eval loadshape(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.LoadShapeF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1)
    @eval loadshape(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.LoadShapeS($v, arg)
end

loadshape(::Type{Val{:PMult_get}})         = DSSCore.LoadShapeV(0)
loadshape(::Type{Val{:PMult_set}}, arg)    = DSSCore.LoadShapeV(1, arg)
loadshape(::Type{Val{:QMult_get}})         = DSSCore.LoadShapeV(2)
loadshape(::Type{Val{:QMult_set}}, arg)    = DSSCore.LoadShapeV(3, arg)
loadshape(::Type{Val{:TimeArray_get}})     = DSSCore.LoadShapeV(4)
loadshape(::Type{Val{:TimeArray_set}}, arg)= DSSCore.LoadShapeV(5, arg)


################################################################################
##
## meters
##
################################################################################
meters(x::Symbol, arg...) = meters(Val{x}, arg...)

for (k,v) in gendict(First = 0, Next = 1, Reset = 2, 
                     ResetAll = 3, Sample = 4, Save = 5, 
                     MeteredTerminal_get = 6, MeteredTerminal_set = 7,
                     DIFilesAreOpen = 8, SampleAll = 9, SaveAll = 10,
                     OpenAllDIFiles = 11, CloseAllDIFiles = 12,
                     CountEndElements = 13, Count = 14, CountBranches = 15,
                     SequenceList_get = 16, SequenceList_set = 17, 
                     DoReliabilityCalc = 18, SeqListSize = 19, 
                     TotalCustomers = 20, NumSections = 21, SetActiveSection = 22,
                     OCPDeviceType = 23, NumSectionCustomers = 24,
                     NumSectionBranches = 25, SectSeqidx = 26,
                     SectTotalCust = 27)
    @eval meters(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.MetersI($v, arg)
end

for (k,v) in gendict(SAIFI = 0, SAIFIkW = 1,
                     SAIDI = 2, CustInterrupts = 3, 
                     AvgRepairTime = 4, FaultRateXRepairHrs = 5,
                     SumBranchFltRates = 6)
    @eval meters(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.MetersF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1,
                     MeteredElement_get = 2, MeteredElement_set = 3)
    @eval meters(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.MetersS($v, arg)
end

meters(::Type{Val{:AllNames}})         = DSSCore.MetersV(0)
meters(::Type{Val{:RegisterNames}})    = DSSCore.MetersV(1)
meters(::Type{Val{:RegisterValues}})   = DSSCore.MetersV(2)
meters(::Type{Val{:Totals}})           = DSSCore.MetersV(3)
meters(::Type{Val{:PeakCurrent_get}})  = DSSCore.MetersV(4)
meters(::Type{Val{:PeakCurrent_set}}, arg) = DSSCore.MetersV(5, arg)
meters(::Type{Val{:CalcCurrent_get}})  = DSSCore.MetersV(6)
meters(::Type{Val{:CalcCurrent_set}}, arg) = DSSCore.MetersV(7, arg)
meters(::Type{Val{:AllocFactors_get}}) = DSSCore.MetersV(8)
meters(::Type{Val{:AllocFactors_set}}, arg) = DSSCore.MetersV(9, arg)
meters(::Type{Val{:AllEndElements}})   = DSSCore.MetersV(10)
meters(::Type{Val{:ALlBranchesInZone}})= DSSCore.MetersV(11)


################################################################################
##
## monitors
##
################################################################################
monitors(x::Symbol, arg...) = monitors(Val{x}, arg...)

for (k,v) in gendict(First = 0, Next = 1, Reset = 2, 
                     ResetAll = 3, Sample = 4, Save = 5, Show = 6, 
                     Mode_set = 7, Mode_get = 8,
                     SampleCount = 9, SampleAll = 10, SaveAll = 11,
                     Count = 12, Process = 13, ProcessAll = 14, 
                     FileVersion = 15, NumChannels = 16, 
                     Terminal_get = 17, Terminal_set = 18) 
    @eval monitors(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.MonitorsI($v, arg)
end

for (k,v) in gendict(FileName = 0, 
                     Name_get = 1, Name_set = 2,
                     Element_get = 3, Element_set = 4)
    @eval monitors(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.MonitorsS($v, arg)
end

monitors(::Type{Val{:AllNames}})         = DSSCore.MonitorsV(0)
monitors(::Type{Val{:ByteStream}})       = DSSCore.MonitorsV(1)
monitors(::Type{Val{:DblHourS}})          = DSSCore.MonitorsV(2)   # Name goofed??
monitors(::Type{Val{:DblHour}})          = DSSCore.MonitorsV(3)
monitors(::Type{Val{:DblFreqS}})          = DSSCore.MonitorsV(4)
monitors(::Type{Val{:DblFreq}})          = DSSCore.MonitorsV(5)     # name?


################################################################################
##
## parser
##
################################################################################
parser(x::Symbol, arg...) = parser(Val{x}, arg...)

for (k,v) in gendict(IntValue = 0, ResetDelimiters = 1, 
                     AutoIncrement_get = 2, AutoIncrement_set = 3)
    @eval parser(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.ParserI($v, arg)
end

for (k,v) in gendict(DblValue = 0)
    @eval parser(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.ParserF($v, arg)
end

for (k,v) in gendict(CmdString_get = 0, CmdString_set = 1,
                     NextParam = 2, StrValue = 3,
                     WhiteSpace_get = 4, WhiteSpace_set = 5, 
                     BeginQuote_get = 6, BeginQuote_set = 7, 
                     EndQuote_get = 8, EndQuote_set = 9,
                     Delimiters_get = 10, Delimiters_set = 11)
    @eval parser(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.ParserS($v, arg)
end

parser(::Type{Val{:Vector}})         = DSSCore.ParserV(0)
parser(::Type{Val{:Matrix}})         = DSSCore.ParserV(1)
parser(::Type{Val{:SymMatrix}})      = DSSCore.ParserV(2)


################################################################################
##
## pdelements
##
################################################################################
pdelements(x::Symbol, arg...) = pdelements(Val{x}, arg...)

for (k,v) in gendict(Count = 0, First = 1, Next = 2, IsShunt = 3,
                     NumCustomers = 4, TotalCustomers = 5, ParentPDElement = 6,
                     FromTerminal = 7, SectionID = 8)
    @eval pdelements(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.PDElementsI($v, arg)
end

for (k,v) in gendict(FaultRate_get = 0, FaultRate_get = 1,
                     PctPermanent_get = 2, PctPermanent_set = 3, 
                     Lambda = 4, AccumulatedL = 5,
                     RepairTime = 6, TotalMiles = 7)
    @eval pdelements(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.PDElementsF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1)
    @eval pdelements(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.PDElementsS($v, arg)
end


################################################################################
##
## pvsystems
##
################################################################################
pvsystems(x::Symbol, arg...) = pvsystems(Val{x}, arg...)

for (k,v) in gendict(Count = 0, First = 1, Next = 2, 
                     Idx_get = 3, Idx_set = 4)
    @eval pvsystems(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.PVsystemsI($v, arg)
end

for (k,v) in gendict(Irradiance_get = 0, Irradiance_get = 1, kW = 2, 
                     kvar_get = 3, kvar_set = 4, 
                     pf_get = 5, pf_set = 6)
    @eval pvsystems(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.PVsystemsF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1)
    @eval pvsystems(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.PVsystemsS($v, arg)
end

pvsystems(::Type{Val{:AllNames}})         = DSSCore.PVsystemsV(0)


################################################################################
##
## reclosers
##
################################################################################
reclosers(x::Symbol, arg...) = reclosers(Val{x}, arg...)

for (k,v) in gendict(Count = 0, First = 1, Next = 2, 
                     MonitoredTerm_get = 3, MonitoredTerm_set = 4,
                     SwitchedTerm_get = 5, SwitchedTerm_set = 6, 
                     NumFast_get = 7, NumFast_set = 8,
                     Shots_get = 9, Shots_set = 10, 
                     Open = 11, Close = 12, 
                     Idx_get = 13, Idx_set = 14)
    @eval reclosers(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.ReclosersI($v, arg)
end

for (k,v) in gendict(PhaseTrip_get = 0, PhaseTrip_get = 1,
                     PhaseInst_get = 2, PhaseInst_set = 3,
                     GroundTrip_get = 4, GroundTrip_set = 5, 
                     GroundInst_get = 6, GroundInst_set = 7)
    @eval reclosers(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.ReclosersF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1,
                     MonitoredObj_get = 2, MonitoredObj_set = 3, 
                     SwitchedObj_get = 4, SwitchedObj_set = 5)
    @eval reclosers(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.ReclosersS($v, arg)
end

reclosers(::Type{Val{:AllNames}})         = ReclosersV(0)
reclosers(::Type{Val{:RecloseIntervals}}) = ReclosersV(1)


################################################################################
##
## regcontrols
##
################################################################################
regcontrols(x::Symbol, arg...) = regcontrols(Val{x}, arg...)

for (k,v) in gendict(First = 0, Next = 1, 
                     TapWinding_get = 2, TapWinding_set = 3,
                     Winding_get = 4, Winding_set = 5,
                     IsReversible_get = 6, IsReversible_set = 7, 
                     IsInverseTime_get = 8, IsInverseTime_set = 9,
                     MaxTapChange_get = 10, MaxTapChange_set = 11,
                     Count = 12)
    @eval regcontrols(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.RegControlsI($v, arg)
end

for (k,v) in gendict(CTPrimary_get = 0, CTPrimary_get = 1,
                     PTRatio_get = 2, PTRatio_set = 3,
                     ForwardR_get = 4, ForwardR_set = 5, 
                     ForwardX_get = 6, ForwardX_set = 7,
                     ReverseR_get = 8, ReverseR_set = 9,
                     ReverseX_get = 10, ReverseX_set = 11,
                     Delay_get = 12, Delay_set = 13, 
                     TapDelay_get = 14, TapDelay_set = 15, 
                     VoltageLimit_get = 16, VoltageLimit_set = 17, 
                     ForwardBand_get = 18, ForwardBand_set = 19,
                     ForwardVreg_get = 20, ForwardVreg_set = 21,
                     ReverseBand_get = 22, ReverseBand_set = 23,
                     ReverseVreg_get = 24, ReverseVreg_set = 25)
    @eval regcontrols(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.RegControlsF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1,
                     MonitoredBus_get = 2, MonitoredBus_set = 3, 
                     Transformer_get = 4, Transformer_set = 5)
    @eval regcontrols(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.RegControlsS($v, arg)
end

regcontrols(::Type{Val{:AllNames}})         = RegControlsV(0)


################################################################################
##
## relays
##
################################################################################
relays(x::Symbol, arg...) = relays(Val{x}, arg...)

for (k,v) in gendict(Count = 0, First = 1, Next = 2, 
                     MonitoredTerm_get = 3, MonitoredTerm_set = 4,
                     SwitchedTerm_get = 5, SwitchedTerm_set = 6, 
                     Idx_get = 7, Idx_set = 8)
    @eval relays(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.RelaysI($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1,
                     MonitoredObj_get = 2, MonitoredObj_set = 3, 
                     SwitchedObj_get = 4, SwitchedObj_set = 5)
    @eval relays(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.RelaysS($v, arg)
end

relays(::Type{Val{:AllNames}})         = RelaysV(0)


################################################################################
##
## sensors
##
################################################################################
sensors(x::Symbol, arg...) = sensors(Val{x}, arg...)

for (k,v) in gendict(Count = 0, First = 1, Next = 2, 
                     IsDelta_get = 3, IsDelta_set = 4,
                     ReverseDelta_get = 5, ReverseDelta_set = 6, 
                     MeteredTerminal_get = 7, MeteredTerminal_set = 8, 
                     Reset = 9, ResetAll = 10)
    @eval sensors(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.SensorsI($v, arg)
end

for (k,v) in gendict(PctError_get = 0, PctError_get = 1,
                     Weight_get = 2, Weight_set = 3,
                     kVBase_get = 4, kVBase_set = 5)
    @eval sensors(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.SensorsF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1,
                     MeteredElement_get = 2, MeteredElement_set = 3)
    @eval sensors(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.SensorsS($v, arg)
end

sensors(::Type{Val{:AllNames}})          = SensorsV(0)
sensors(::Type{Val{:Currents_get}})      = SensorsV(1)
sensors(::Type{Val{:Currents_set}}, arg) = SensorsV(2, arg)
sensors(::Type{Val{:kvar_get}})          = SensorsV(3)
sensors(::Type{Val{:kvar_set}}, arg)     = SensorsV(4, arg)
sensors(::Type{Val{:kW_get}})            = SensorsV(5)
sensors(::Type{Val{:kW_set}}, arg)       = SensorsV(6, arg)


################################################################################
##
## settings
##
################################################################################
settings(x::Symbol, arg...) = settings(Val{x}, arg...)

for (k,v) in gendict(AllowDuplicates_get = 0, AllowDuplicates_set = 1,
                     ZoneLock_get = 2, ZoneLock_set = 3,
                     CktModel_get = 4, CktModel_set = 5, 
                     Trapezoidal_get = 6, Trapezoidal_set = 7) 
    @eval settings(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.SettingsI($v, arg)
end

for (k,v) in gendict(AllocationFactors = 0, 
                     NormVminpu_get = 1, NormVminpu_set = 2,
                     NormVmaxpu_get = 3, NormVmaxpu_set = 4,
                     EmergVminpu_get = 5, EmergVminpu_set = 6, 
                     EmergVmaxpu_get = 7, EmergVmaxpu_set = 8, 
                     UEWeight_get = 9, UEWeight_set = 10, 
                     LossWeight_get = 11, LossWeight_set = 12, 
                     PriceSignal_get = 13, PriceSignal_set = 14)
    @eval settings(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.SettingsF($v, arg)
end

for (k,v) in gendict(AutoBusList_get = 0, AutoBusList_set = 1,
                     PriceCurve_get = 2, PriceCurve_set = 3)
    @eval settings(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.SettingsS($v, arg)
end

settings(::Type{Val{:UERegs_get}})            = SettingsV(0)
settings(::Type{Val{:UERegs_set}}, arg)       = SettingsV(1, arg)
settings(::Type{Val{:LossRegs_get}})          = SettingsV(2)
settings(::Type{Val{:LossRegs_set}}, arg)     = SettingsV(3, arg)
settings(::Type{Val{:VoltageBases_get}})      = SettingsV(4)
settings(::Type{Val{:VoltageBases_set}}, arg) = SettingsV(5, arg)


################################################################################
##
## solution
##
################################################################################
solution(x::Symbol, arg...) = solution(Val{x}, arg...)

for (k,v) in gendict(Solve = 0, 
                     Mode_get = 1, Mode_set = 2,
                     Hour_get = 3, Hour_set = 4,
                     Year_get = 5, Year_set = 6, 
                     Iterations = 7, 
                     MaxIterations_get = 8, MaxIterations_set = 9,
                     Number_get = 10, Number_set = 11,
                     Random_get = 12, Random_set = 13, 
                     LoadModel_get = 14, LoadModel_set = 15, 
                     AddType_get = 16, AddType_set = 17, 
                     Algorithm_get = 18, Algorithm_set = 19,
                     ControlMode_get = 20, ControlMode_set = 21,
                     ControlIterations_get = 22, ControlIterations_set = 23,
                     MaxControlIterations_get = 24, MaxControlIterations_set = 25,
                     SampleDoControlActions = 26, CheckFaultStatus = 27,
                     SolveDirect = 28, SolvePFlow = 29, 
                     SolveNoControl = 30, SolvePlusControl = 31, 
                     InitSnap = 32, CheckControls = 33, 
                     SampleControlDevices = 34, DoControlActions = 35,
                     BuildYMatrix = 36, SystemYChanged = 37,
                     Converged_get = 38, Converged_set = 39, 
                     TotalIterations = 40, MostIterationsDone = 41,
                     ControlActionsDone_get = 42, ControlActionsDone_set = 43,  
                     FinishTimeStep = 44, Cleanup = 45)
    @eval solution(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.SolutionI($v, arg)
end

for (k,v) in gendict(Frequency_get = 0, Frequency_get = 1,
                     Seconds_get = 2, Seconds_set = 3,
                     StepSize_get = 4, StepSize_set = 5, 
                     LoadMult_get = 6, LoadMult_set = 7,
                     Convergence_get = 8, Convergence_set = 9,
                     PctGrowth_get = 10, PctGrowth_set = 11,
                     GenkW_get = 12, GenkW_set = 13, 
                     GenPF_get = 14, GenPF_set = 15, 
                     Capkvar_get = 16, Capkvar_set = 17, 
                     GenMult_get = 18, GenMult_set = 19,
                     DblHour_get = 20, DblHour_set = 21,
                     StepSizeMin = 22, StepSizeHr = 23)
    @eval solution(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.SolutionF($v, arg)
end

for (k,v) in gendict(ModeID = 0, 
                     LDCurve_get = 1, LDCurve_set = 2,
                     DefaultDaily_get = 3, DefaultDaily_set = 4,
                     DefaultYearly_get = 5, DefaultYearly_set = 6)
    @eval solution(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.SolutionS($v, arg)
end

settings(::Type{Val{:EventLog}})            = SolutionV(0)


################################################################################
##
## swtcontrols
##
################################################################################
swtcontrols(x::Symbol, arg...) = swtcontrols(Val{x}, arg...)

for (k,v) in gendict(First = 0, Next = 1, 
                     Action_get = 2, Action_set = 3,
                     IsLocked_get = 4, IsLocked_set = 5, 
                     SwitchedTerm_get = 6, SwitchedTerm_set = 7, 
                     Count = 8)
    @eval swtcontrols(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.SwtControlsI($v, arg)
end

for (k,v) in gendict(Delay_get = 0, Delay_get = 1)
    @eval swtcontrols(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.SwtControlsF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1,
                     SwitchedObj_get = 2, SwitchedObj_set = 3)
    @eval swtcontrols(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.SwtControlsS($v, arg)
end

swtcontrols(::Type{Val{:AllNames}})          = SensorsV(0)


################################################################################
##
## topology
##
################################################################################
topology(x::Symbol, arg...) = topology(Val{x}, arg...)

for (k,v) in gendict(NumLoops = 0, NumIsolatedBranches = 1, 
                     NumIsolatedLoads = 2, First = 3, Next = 4, 
                     ActiveBranch = 5, ForwardBranch = 6, BackwardBranch = 7, 
                     LoopedBranch = 8, ParallelBranch = 9,
                     FirstLoad = 10, NextLoad = 11, ActiveLevel = 12)
    @eval topology(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.TopologyI($v, arg)
end

for (k,v) in gendict(Delay_get = 0, Delay_get = 1)
    @eval topology(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.TopologyF($v, arg)
end

for (k,v) in gendict(BranchName_get = 0, BranchName_set = 1,
                     BusName_get = 2, BusName_set = 3)
    @eval topology(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.TopologyS($v, arg)
end

topology(::Type{Val{:AllLoopedPairs}})      = SensorsV(0)
topology(::Type{Val{:AllIsolatedBranches}}) = SensorsV(1)
topology(::Type{Val{:AllIsolatedLoads}})    = SensorsV(2)


################################################################################
##
## transformers
##
################################################################################
transformers(x::Symbol, arg...) = transformers(Val{x}, arg...)

for (k,v) in gendict(NumWindings_get = 0, NumWindings_get = 1,
                     Wdg_get = 2, Wdg_set = 3,
                     NumTaps_get = 4, NumTaps_set = 5, 
                     IsDelta_get = 6, IsDelta_set = 7,
                     First = 8, Next = 9, Count = 10)
    @eval transformers(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.TransformersI($v, arg)
end

for (k,v) in gendict(R_get = 0, R_get = 1,
                     Tap_get = 2, Tap_set = 3,
                     MinTap_get = 4, MinTap_set = 5, 
                     MaxTap_get = 6, MaxTap_set = 7,
                     kV_get = 8, kV_set = 9,
                     kVA_get = 10, kVA_set = 11,
                     Xneut_get = 12, Xneut_set = 13, 
                     Rneut_get = 14, Rneut_set = 15, 
                     Xhl_get = 16, Xhl_set = 17, 
                     Xht_get = 18, Xht_set = 19,
                     Xlt_get = 20, Xlt_set = 21)
    @eval transformers(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.TransformersF($v, arg)
end

for (k,v) in gendict(XfmrCode_get = 0, XfmrCode_set = 1,
                     Name_get = 2, Name_set = 3)
    @eval transformers(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.TransformersS($v, arg)
end

transformers(::Type{Val{:AllNames}})          = SensorsV(0)


################################################################################
##
## vsources
##
################################################################################
vsources(x::Symbol, arg...) = vsources(Val{x}, arg...)

for (k,v) in gendict(Count = 0, First = 1, Next = 2, 
                     Phases_get = 3, Phases_set = 4)
    @eval vsources(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.VsourcesI($v, arg)
end

for (k,v) in gendict(BasekV_get = 0, BasekV_get = 1,
                     PU_get = 2, PU_set = 3,
                     AngleDeg_get = 4, AngleDeg_set = 5, 
                     Frequency_get = 6, Frequency_set = 7)
    @eval vsources(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.VsourcesF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1)
    @eval vsources(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.VsourcesS($v, arg)
end

vsources(::Type{Val{:AllNames}})          = SensorsV(0)


################################################################################
##
## xycurves
##
################################################################################
xycurves(x::Symbol, arg...) = xycurves(Val{x}, arg...)

for (k,v) in gendict(Count = 0, First = 1, Next = 2, 
                     Npts_get = 3, Npts_set = 4)
    @eval xycurves(::Type{Val{$(Meta.quot(k))}}, arg = 0) = DSSCore.XYCurvesI($v, arg)
end

for (k,v) in gendict(X_get = 0, X_get = 1,
                     Y_get = 2, Y_set = 3,
                     XShift_get = 4, XShift_set = 5, 
                     YShift_get = 6, YShift_set = 7,
                     XScale_get = 8, XScale_set = 9, 
                     YScale_get = 10, YScale_set = 11)
    @eval xycurves(::Type{Val{$(Meta.quot(k))}}, arg = 0.0) = DSSCore.XYCurvesF($v, arg)
end

for (k,v) in gendict(Name_get = 0, Name_set = 1)
    @eval xycurves(::Type{Val{$(Meta.quot(k))}}, arg = "") = DSSCore.XYCurvesS($v, arg)
end

xycurves(::Type{Val{:XArray_get}})          = XYCurvesV(0)
xycurves(::Type{Val{:XArray_set}}, arg)     = XYCurvesV(1, arg)
xycurves(::Type{Val{:YArray_get}})          = XYCurvesV(2)
xycurves(::Type{Val{:YArray_set}}, arg)     = XYCurvesV(3, arg)
