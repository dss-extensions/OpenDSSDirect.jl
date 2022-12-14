module RegControls

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

function Reset(dss::DSSContext)
    Lib.RegControls_Reset(dss.ctx)
end
Reset() = Reset(DSS_DEFAULT_CTX)

"""Array of strings containing all RegControl names"""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.RegControls_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""CT primary ampere rating (secondary is 0.2 amperes) (Getter)"""
function CTPrimary(dss::DSSContext)::Float64
    return @checked Lib.RegControls_Get_CTPrimary(dss.ctx)
end
CTPrimary() = CTPrimary(DSS_DEFAULT_CTX)

"""CT primary ampere rating (secondary is 0.2 amperes) (Setter)"""
function CTPrimary(dss::DSSContext, Value::Float64)
    @checked Lib.RegControls_Set_CTPrimary(dss.ctx, Value)
end
CTPrimary(Value::Float64) = CTPrimary(DSS_DEFAULT_CTX, Value)

"""Number of RegControl objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.RegControls_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Time delay [s] after arming before the first tap change. Control may reset before actually changing taps. (Getter)"""
function Delay(dss::DSSContext)::Float64
    return @checked Lib.RegControls_Get_Delay(dss.ctx)
end
Delay() = Delay(DSS_DEFAULT_CTX)

"""Time delay [s] after arming before the first tap change. Control may reset before actually changing taps. (Setter)"""
function Delay(dss::DSSContext, Value::Float64)
    @checked Lib.RegControls_Set_Delay(dss.ctx, Value)
end
Delay(Value::Float64) = Delay(DSS_DEFAULT_CTX, Value)

"""Sets the first RegControl active. Returns 0 if none."""
function First(dss::DSSContext)::Int
    return @checked Lib.RegControls_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""Regulation bandwidth in forward direciton, centered on Vreg (Getter)"""
function ForwardBand(dss::DSSContext)::Float64
    return @checked Lib.RegControls_Get_ForwardBand(dss.ctx)
end
ForwardBand() = ForwardBand(DSS_DEFAULT_CTX)

"""Regulation bandwidth in forward direciton, centered on Vreg (Setter)"""
function ForwardBand(dss::DSSContext, Value::Float64)
    @checked Lib.RegControls_Set_ForwardBand(dss.ctx, Value)
end
ForwardBand(Value::Float64) = ForwardBand(DSS_DEFAULT_CTX, Value)

"""LDC R setting in Volts (Getter)"""
function ForwardR(dss::DSSContext)::Float64
    return @checked Lib.RegControls_Get_ForwardR(dss.ctx)
end
ForwardR() = ForwardR(DSS_DEFAULT_CTX)

"""LDC R setting in Volts (Setter)"""
function ForwardR(dss::DSSContext, Value::Float64)
    @checked Lib.RegControls_Set_ForwardR(dss.ctx, Value)
end
ForwardR(Value::Float64) = ForwardR(DSS_DEFAULT_CTX, Value)

"""Target voltage in the forward direction, on PT secondary base. (Getter)"""
function ForwardVreg(dss::DSSContext)::Float64
    return @checked Lib.RegControls_Get_ForwardVreg(dss.ctx)
end
ForwardVreg() = ForwardVreg(DSS_DEFAULT_CTX)

"""Target voltage in the forward direction, on PT secondary base. (Setter)"""
function ForwardVreg(dss::DSSContext, Value::Float64)
    @checked Lib.RegControls_Set_ForwardVreg(dss.ctx, Value)
end
ForwardVreg(Value::Float64) = ForwardVreg(DSS_DEFAULT_CTX, Value)

"""LDC X setting in Volts (Getter)"""
function ForwardX(dss::DSSContext)::Float64
    return @checked Lib.RegControls_Get_ForwardX(dss.ctx)
end
ForwardX() = ForwardX(DSS_DEFAULT_CTX)

"""LDC X setting in Volts (Setter)"""
function ForwardX(dss::DSSContext, Value::Float64)
    @checked Lib.RegControls_Set_ForwardX(dss.ctx, Value)
end
ForwardX(Value::Float64) = ForwardX(DSS_DEFAULT_CTX, Value)

"""Time delay is inversely adjsuted, proportinal to the amount of voltage outside the regulating band. (Getter)"""
function IsInverseTime(dss::DSSContext)::Bool
    return @checked(Lib.RegControls_Get_IsInverseTime(dss.ctx)) != 0
end
IsInverseTime() = IsInverseTime(DSS_DEFAULT_CTX)

"""Time delay is inversely adjsuted, proportinal to the amount of voltage outside the regulating band. (Setter)"""
function IsInverseTime(dss::DSSContext, Value::Bool)
    @checked Lib.RegControls_Set_IsInverseTime(dss.ctx, Value ? 1 : 0)
end
IsInverseTime(Value::Bool) = IsInverseTime(DSS_DEFAULT_CTX, Value)

"""Regulator can use different settings in the reverse direction.  Usually not applicable to substation transformers. (Getter)"""
function IsReversible(dss::DSSContext)::Bool
    return @checked(Lib.RegControls_Get_IsReversible(dss.ctx)) != 0
end
IsReversible() = IsReversible(DSS_DEFAULT_CTX)

"""Regulator can use different settings in the reverse direction.  Usually not applicable to substation transformers. (Setter)"""
function IsReversible(dss::DSSContext, Value::Bool)
    @checked Lib.RegControls_Set_IsReversible(dss.ctx, Value ? 1 : 0)
end
IsReversible(Value::Bool) = IsReversible(DSS_DEFAULT_CTX, Value)

"""Maximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for a faster solution. (Getter)"""
function MaxTapChange(dss::DSSContext)::Float64
    return @checked Lib.RegControls_Get_MaxTapChange(dss.ctx)
end
MaxTapChange() = MaxTapChange(DSS_DEFAULT_CTX)

"""Maximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for a faster solution. (Setter)"""
function MaxTapChange(dss::DSSContext, Value::Float64)
    @checked Lib.RegControls_Set_MaxTapChange(dss.ctx, Value)
end
MaxTapChange(Value::Float64) = MaxTapChange(DSS_DEFAULT_CTX, Value)

"""Name of a remote regulated bus, in lieu of LDC settings (Getter)"""
function MonitoredBus(dss::DSSContext)::String
    return get_string(@checked Lib.RegControls_Get_MonitoredBus(dss.ctx))
end
MonitoredBus() = MonitoredBus(DSS_DEFAULT_CTX)

"""Name of a remote regulated bus, in lieu of LDC settings (Setter)"""
function MonitoredBus(dss::DSSContext, Value::String)
    @checked Lib.RegControls_Set_MonitoredBus(dss.ctx, Value)
end
MonitoredBus(Value::String) = MonitoredBus(DSS_DEFAULT_CTX, Value)

"""Active RegControl name (Getter)"""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.RegControls_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Active RegControl name (Setter)"""
function Name(dss::DSSContext, Value::String)
    @checked Lib.RegControls_Set_Name(dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Sets the next RegControl active. Returns 0 if none."""
function Next(dss::DSSContext)::Int
    return @checked Lib.RegControls_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""PT ratio for voltage control settings (Getter)"""
function PTRatio(dss::DSSContext)::Float64
    return @checked Lib.RegControls_Get_PTratio(dss.ctx)
end
PTRatio() = PTRatio(DSS_DEFAULT_CTX)

"""PT ratio for voltage control settings (Setter)"""
function PTRatio(dss::DSSContext, Value::Float64)
    @checked Lib.RegControls_Set_PTratio(dss.ctx, Value)
end
PTRatio(Value::Float64) = PTRatio(DSS_DEFAULT_CTX, Value)

"""Bandwidth in reverse direction, centered on reverse Vreg. (Getter)"""
function ReverseBand(dss::DSSContext)::Float64
    return @checked Lib.RegControls_Get_ReverseBand(dss.ctx)
end
ReverseBand() = ReverseBand(DSS_DEFAULT_CTX)

"""Bandwidth in reverse direction, centered on reverse Vreg. (Setter)"""
function ReverseBand(dss::DSSContext, Value::Float64)
    @checked Lib.RegControls_Set_ReverseBand(dss.ctx, Value)
end
ReverseBand(Value::Float64) = ReverseBand(DSS_DEFAULT_CTX, Value)

"""Reverse LDC R setting in Volts. (Getter)"""
function ReverseR(dss::DSSContext)::Float64
    return @checked Lib.RegControls_Get_ReverseR(dss.ctx)
end
ReverseR() = ReverseR(DSS_DEFAULT_CTX)

"""Reverse LDC R setting in Volts. (Setter)"""
function ReverseR(dss::DSSContext, Value::Float64)
    @checked Lib.RegControls_Set_ReverseR(dss.ctx, Value)
end
ReverseR(Value::Float64) = ReverseR(DSS_DEFAULT_CTX, Value)

"""Target voltage in the revese direction, on PT secondary base. (Getter)"""
function ReverseVreg(dss::DSSContext)::Float64
    return @checked Lib.RegControls_Get_ReverseVreg(dss.ctx)
end
ReverseVreg() = ReverseVreg(DSS_DEFAULT_CTX)

"""Target voltage in the revese direction, on PT secondary base. (Setter)"""
function ReverseVreg(dss::DSSContext, Value::Float64)
    @checked Lib.RegControls_Set_ReverseVreg(dss.ctx, Value)
end
ReverseVreg(Value::Float64) = ReverseVreg(DSS_DEFAULT_CTX, Value)

"""Reverse LDC X setting in volts. (Getter)"""
function ReverseX(dss::DSSContext)::Float64
    return @checked Lib.RegControls_Get_ReverseX(dss.ctx)
end
ReverseX() = ReverseX(DSS_DEFAULT_CTX)

"""Reverse LDC X setting in volts. (Setter)"""
function ReverseX(dss::DSSContext, Value::Float64)
    @checked Lib.RegControls_Set_ReverseX(dss.ctx, Value)
end
ReverseX(Value::Float64) = ReverseX(DSS_DEFAULT_CTX, Value)

"""Time delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps. (Getter)"""
function TapDelay(dss::DSSContext)::Float64
    return @checked Lib.RegControls_Get_TapDelay(dss.ctx)
end
TapDelay() = TapDelay(DSS_DEFAULT_CTX)

"""Time delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps. (Setter)"""
function TapDelay(dss::DSSContext, Value::Float64)
    @checked Lib.RegControls_Set_TapDelay(dss.ctx, Value)
end
TapDelay(Value::Float64) = TapDelay(DSS_DEFAULT_CTX, Value)

"""Integer number of the tap that the controlled transformer winding is currentliy on. (Getter)"""
function TapNumber(dss::DSSContext)::Int
    return @checked Lib.RegControls_Get_TapNumber(dss.ctx)
end
TapNumber() = TapNumber(DSS_DEFAULT_CTX)

"""Integer number of the tap that the controlled transformer winding is currentliy on. (Setter)"""
function TapNumber(dss::DSSContext, Value::Int)
    @checked Lib.RegControls_Set_TapNumber(dss.ctx, Value)
end
TapNumber(Value::Int) = TapNumber(DSS_DEFAULT_CTX, Value)

"""Tapped winding number (Getter)"""
function TapWinding(dss::DSSContext)::Int
    return @checked Lib.RegControls_Get_TapWinding(dss.ctx)
end
TapWinding() = TapWinding(DSS_DEFAULT_CTX)

"""Tapped winding number (Setter)"""
function TapWinding(dss::DSSContext, Value::Int)
    @checked Lib.RegControls_Set_TapWinding(dss.ctx, Value)
end
TapWinding(Value::Int) = TapWinding(DSS_DEFAULT_CTX, Value)

"""Name of the transformer this regulator controls (Getter)"""
function Transformer(dss::DSSContext)::String
    return get_string(@checked Lib.RegControls_Get_Transformer(dss.ctx))
end
Transformer() = Transformer(DSS_DEFAULT_CTX)

"""Name of the transformer this regulator controls (Setter)"""
function Transformer(dss::DSSContext, Value::String)
    @checked Lib.RegControls_Set_Transformer(dss.ctx, Value)
end
Transformer(Value::String) = Transformer(DSS_DEFAULT_CTX, Value)

"""First house voltage limit on PT secondary base.  Setting to 0 disables this function. (Getter)"""
function VoltageLimit(dss::DSSContext)::Float64
    return @checked Lib.RegControls_Get_VoltageLimit(dss.ctx)
end
VoltageLimit() = VoltageLimit(DSS_DEFAULT_CTX)

"""First house voltage limit on PT secondary base.  Setting to 0 disables this function. (Setter)"""
function VoltageLimit(dss::DSSContext, Value::Float64)
    @checked Lib.RegControls_Set_VoltageLimit(dss.ctx, Value)
end
VoltageLimit(Value::Float64) = VoltageLimit(DSS_DEFAULT_CTX, Value)

"""Winding number for PT and CT connections (Getter)"""
function Winding(dss::DSSContext)::Float64
    return @checked Lib.RegControls_Get_Winding(dss.ctx)
end
Winding() = Winding(DSS_DEFAULT_CTX)

"""Winding number for PT and CT connections (Setter)"""
function Winding(dss::DSSContext, Value::Float64)
    @checked Lib.RegControls_Set_Winding(dss.ctx, Value)
end
Winding(Value::Float64) = Winding(DSS_DEFAULT_CTX, Value)

"""RegControl Index (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.RegControls_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""RegControl Index (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.RegControls_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

end
