module RegControls

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

function Reset()
    Lib.RegControls_Reset(C_NULL_CTX)
end

"""Array of strings containing all RegControl names"""
function AllNames()::Vector{String}
    return get_string_array(Lib.RegControls_Get_AllNames, C_NULL_CTX)
end

"""CT primary ampere rating (secondary is 0.2 amperes) (Getter)"""
function CTPrimary()::Float64
    return @checked Lib.RegControls_Get_CTPrimary(C_NULL_CTX)
end

"""CT primary ampere rating (secondary is 0.2 amperes) (Setter)"""
function CTPrimary(Value::Float64)
    @checked Lib.RegControls_Set_CTPrimary(C_NULL_CTX, Value)
end

"""Number of RegControl objects in Active Circuit"""
function Count()::Int
    return @checked Lib.RegControls_Get_Count(C_NULL_CTX)
end

"""Time delay [s] after arming before the first tap change. Control may reset before actually changing taps. (Getter)"""
function Delay()::Float64
    return @checked Lib.RegControls_Get_Delay(C_NULL_CTX)
end

"""Time delay [s] after arming before the first tap change. Control may reset before actually changing taps. (Setter)"""
function Delay(Value::Float64)
    @checked Lib.RegControls_Set_Delay(C_NULL_CTX, Value)
end

"""Sets the first RegControl active. Returns 0 if none."""
function First()::Int
    return @checked Lib.RegControls_Get_First(C_NULL_CTX)
end

"""Regulation bandwidth in forward direciton, centered on Vreg (Getter)"""
function ForwardBand()::Float64
    return @checked Lib.RegControls_Get_ForwardBand(C_NULL_CTX)
end

"""Regulation bandwidth in forward direciton, centered on Vreg (Setter)"""
function ForwardBand(Value::Float64)
    @checked Lib.RegControls_Set_ForwardBand(C_NULL_CTX, Value)
end

"""LDC R setting in Volts (Getter)"""
function ForwardR()::Float64
    return @checked Lib.RegControls_Get_ForwardR(C_NULL_CTX)
end

"""LDC R setting in Volts (Setter)"""
function ForwardR(Value::Float64)
    @checked Lib.RegControls_Set_ForwardR(C_NULL_CTX, Value)
end

"""Target voltage in the forward direction, on PT secondary base. (Getter)"""
function ForwardVreg()::Float64
    return @checked Lib.RegControls_Get_ForwardVreg(C_NULL_CTX)
end

"""Target voltage in the forward direction, on PT secondary base. (Setter)"""
function ForwardVreg(Value::Float64)
    @checked Lib.RegControls_Set_ForwardVreg(C_NULL_CTX, Value)
end

"""LDC X setting in Volts (Getter)"""
function ForwardX()::Float64
    return @checked Lib.RegControls_Get_ForwardX(C_NULL_CTX)
end

"""LDC X setting in Volts (Setter)"""
function ForwardX(Value::Float64)
    @checked Lib.RegControls_Set_ForwardX(C_NULL_CTX, Value)
end

"""Time delay is inversely adjsuted, proportinal to the amount of voltage outside the regulating band. (Getter)"""
function IsInverseTime()::Bool
    return @checked(Lib.RegControls_Get_IsInverseTime(C_NULL_CTX)) != 0
end

"""Time delay is inversely adjsuted, proportinal to the amount of voltage outside the regulating band. (Setter)"""
function IsInverseTime(Value::Bool)
    @checked Lib.RegControls_Set_IsInverseTime(C_NULL_CTX, Value ? 1 : 0)
end

"""Regulator can use different settings in the reverse direction.  Usually not applicable to substation transformers. (Getter)"""
function IsReversible()::Bool
    return @checked(Lib.RegControls_Get_IsReversible(C_NULL_CTX)) != 0
end

"""Regulator can use different settings in the reverse direction.  Usually not applicable to substation transformers. (Setter)"""
function IsReversible(Value::Bool)
    @checked Lib.RegControls_Set_IsReversible(C_NULL_CTX, Value ? 1 : 0)
end

"""Maximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for a faster solution. (Getter)"""
function MaxTapChange()::Float64
    return @checked Lib.RegControls_Get_MaxTapChange(C_NULL_CTX)
end

"""Maximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for a faster solution. (Setter)"""
function MaxTapChange(Value::Float64)
    @checked Lib.RegControls_Set_MaxTapChange(C_NULL_CTX, Value)
end

"""Name of a remote regulated bus, in lieu of LDC settings (Getter)"""
function MonitoredBus()::String
    return get_string(@checked Lib.RegControls_Get_MonitoredBus(C_NULL_CTX))
end

"""Name of a remote regulated bus, in lieu of LDC settings (Setter)"""
function MonitoredBus(Value::String)
    @checked Lib.RegControls_Set_MonitoredBus(C_NULL_CTX, Value)
end

"""Active RegControl name (Getter)"""
function Name()::String
    return get_string(@checked Lib.RegControls_Get_Name(C_NULL_CTX))
end

"""Active RegControl name (Setter)"""
function Name(Value::String)
    @checked Lib.RegControls_Set_Name(C_NULL_CTX, Value)
end

"""Sets the next RegControl active. Returns 0 if none."""
function Next()::Int
    return @checked Lib.RegControls_Get_Next(C_NULL_CTX)
end

"""PT ratio for voltage control settings (Getter)"""
function PTRatio()::Float64
    return @checked Lib.RegControls_Get_PTratio(C_NULL_CTX)
end

"""PT ratio for voltage control settings (Setter)"""
function PTRatio(Value::Float64)
    @checked Lib.RegControls_Set_PTratio(C_NULL_CTX, Value)
end

"""Bandwidth in reverse direction, centered on reverse Vreg. (Getter)"""
function ReverseBand()::Float64
    return @checked Lib.RegControls_Get_ReverseBand(C_NULL_CTX)
end

"""Bandwidth in reverse direction, centered on reverse Vreg. (Setter)"""
function ReverseBand(Value::Float64)
    @checked Lib.RegControls_Set_ReverseBand(C_NULL_CTX, Value)
end

"""Reverse LDC R setting in Volts. (Getter)"""
function ReverseR()::Float64
    return @checked Lib.RegControls_Get_ReverseR(C_NULL_CTX)
end

"""Reverse LDC R setting in Volts. (Setter)"""
function ReverseR(Value::Float64)
    @checked Lib.RegControls_Set_ReverseR(C_NULL_CTX, Value)
end

"""Target voltage in the revese direction, on PT secondary base. (Getter)"""
function ReverseVreg()::Float64
    return @checked Lib.RegControls_Get_ReverseVreg(C_NULL_CTX)
end

"""Target voltage in the revese direction, on PT secondary base. (Setter)"""
function ReverseVreg(Value::Float64)
    @checked Lib.RegControls_Set_ReverseVreg(C_NULL_CTX, Value)
end

"""Reverse LDC X setting in volts. (Getter)"""
function ReverseX()::Float64
    return @checked Lib.RegControls_Get_ReverseX(C_NULL_CTX)
end

"""Reverse LDC X setting in volts. (Setter)"""
function ReverseX(Value::Float64)
    @checked Lib.RegControls_Set_ReverseX(C_NULL_CTX, Value)
end

"""Time delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps. (Getter)"""
function TapDelay()::Float64
    return @checked Lib.RegControls_Get_TapDelay(C_NULL_CTX)
end

"""Time delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps. (Setter)"""
function TapDelay(Value::Float64)
    @checked Lib.RegControls_Set_TapDelay(C_NULL_CTX, Value)
end

"""Integer number of the tap that the controlled transformer winding is currentliy on. (Getter)"""
function TapNumber()::Int
    return @checked Lib.RegControls_Get_TapNumber(C_NULL_CTX)
end

"""Integer number of the tap that the controlled transformer winding is currentliy on. (Setter)"""
function TapNumber(Value::Int)
    @checked Lib.RegControls_Set_TapNumber(C_NULL_CTX, Value)
end

"""Tapped winding number (Getter)"""
function TapWinding()::Int
    return @checked Lib.RegControls_Get_TapWinding(C_NULL_CTX)
end

"""Tapped winding number (Setter)"""
function TapWinding(Value::Int)
    @checked Lib.RegControls_Set_TapWinding(C_NULL_CTX, Value)
end

"""Name of the transformer this regulator controls (Getter)"""
function Transformer()::String
    return get_string(@checked Lib.RegControls_Get_Transformer(C_NULL_CTX))
end

"""Name of the transformer this regulator controls (Setter)"""
function Transformer(Value::String)
    @checked Lib.RegControls_Set_Transformer(C_NULL_CTX, Value)
end

"""First house voltage limit on PT secondary base.  Setting to 0 disables this function. (Getter)"""
function VoltageLimit()::Float64
    return @checked Lib.RegControls_Get_VoltageLimit(C_NULL_CTX)
end

"""First house voltage limit on PT secondary base.  Setting to 0 disables this function. (Setter)"""
function VoltageLimit(Value::Float64)
    @checked Lib.RegControls_Set_VoltageLimit(C_NULL_CTX, Value)
end

"""Winding number for PT and CT connections (Getter)"""
function Winding()::Float64
    return @checked Lib.RegControls_Get_Winding(C_NULL_CTX)
end

"""Winding number for PT and CT connections (Setter)"""
function Winding(Value::Float64)
    @checked Lib.RegControls_Set_Winding(C_NULL_CTX, Value)
end

"""RegControl Index (Getter)"""
function Idx()::Int
    return @checked Lib.RegControls_Get_idx(C_NULL_CTX)
end

"""RegControl Index (Setter)"""
function Idx(Value::Int)
    @checked Lib.RegControls_Set_idx(C_NULL_CTX, Value)
end

end
