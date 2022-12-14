
module Transformers

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Array of strings with all Transformer names in the active circuit."""
function AllNames()::Vector{String}
    return get_string_array(Lib.Transformers_Get_AllNames, C_NULL_CTX)
end

function Count()::Int
    return @checked Lib.Transformers_Get_Count(C_NULL_CTX)
end

"""Sets the first Transformer active. Returns 0 if no more."""
function First()::Int
    return @checked Lib.Transformers_Get_First(C_NULL_CTX)
end

"""Active Winding delta or wye connection? (Getter)"""
function IsDelta()::Bool
    return @checked(Lib.Transformers_Get_IsDelta(C_NULL_CTX)) != 0
end

"""Active Winding delta or wye connection? (Setter)"""
function IsDelta(Value::Bool)
    @checked Lib.Transformers_Set_IsDelta(C_NULL_CTX, Value ? 1 : 0)
end

"""Active Winding maximum tap in per-unit. (Getter)"""
function MaxTap()::Float64
        # TODO: should this be Int64?
    return @checked Lib.Transformers_Get_MaxTap(C_NULL_CTX)
end

"""Active Winding maximum tap in per-unit. (Setter)"""
function MaxTap(Value::Float64)
    @checked Lib.Transformers_Set_MaxTap(C_NULL_CTX, Value)
end

"""Active Winding minimum tap in per-unit. (Getter)"""
function MinTap()::Float64
    return @checked Lib.Transformers_Get_MinTap(C_NULL_CTX)
end

"""Active Winding minimum tap in per-unit. (Setter)"""
function MinTap(Value::Float64)
    @checked Lib.Transformers_Set_MinTap(C_NULL_CTX, Value)
end

"""Sets a Transformer active by Name. (Getter)"""
function Name()::String
    return get_string(@checked Lib.Transformers_Get_Name(C_NULL_CTX))
end

"""Sets a Transformer active by Name. (Setter)"""
function Name(Value::String)
    @checked Lib.Transformers_Set_Name(C_NULL_CTX, Value)
end

"""Sets the next Transformer active. Returns 0 if no more."""
function Next()::Int
    return @checked Lib.Transformers_Get_Next(C_NULL_CTX)
end

"""Active Winding number of tap steps betwein MinTap and MaxTap. (Getter)"""
function NumTaps()::Int
    return @checked Lib.Transformers_Get_NumTaps(C_NULL_CTX)
end

"""Active Winding number of tap steps betwein MinTap and MaxTap. (Setter)"""
function NumTaps(Value::Int)
    @checked Lib.Transformers_Set_NumTaps(C_NULL_CTX, Value)
end

"""Number of windings on this transformer. Allocates memory; set or change this property first. (Getter)"""
function NumWindings()::Int
    return @checked Lib.Transformers_Get_NumWindings(C_NULL_CTX)
end

"""Number of windings on this transformer. Allocates memory; set or change this property first. (Setter)"""
function NumWindings(Value::Int)
    @checked Lib.Transformers_Set_NumWindings(C_NULL_CTX, Value)
end

"""Active Winding resistance in % (Getter)"""
function R()::Float64
    return @checked Lib.Transformers_Get_R(C_NULL_CTX)
end

"""Active Winding resistance in % (Setter)"""
function R(Value::Float64)
    @checked Lib.Transformers_Set_R(C_NULL_CTX, Value)
end

"""Active Winding neutral resistance [ohms] for wye connections. Set less than zero for ungrounded wye. (Getter)"""
function Rneut()::Float64
    return @checked Lib.Transformers_Get_Rneut(C_NULL_CTX)
end

"""Active Winding neutral resistance [ohms] for wye connections. Set less than zero for ungrounded wye. (Setter)"""
function Rneut(Value::Float64)
    @checked Lib.Transformers_Set_Rneut(C_NULL_CTX, Value)
end

"""Active Winding tap in per-unit. (Getter)"""
function Tap()::Float64
    return @checked Lib.Transformers_Get_Tap(C_NULL_CTX)
end

"""Active Winding tap in per-unit. (Setter)"""
function Tap(Value::Float64)
    @checked Lib.Transformers_Set_Tap(C_NULL_CTX, Value)
end

"""Active Winding Number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.) (Getter)"""
function Wdg()::Float64
    return @checked Lib.Transformers_Get_Wdg(C_NULL_CTX)
end

"""Active Winding Number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.) (Setter)"""
function Wdg(Value::Float64)
    @checked Lib.Transformers_Set_Wdg(C_NULL_CTX, Value)
end

"""Name of an XfrmCode that supplies electircal parameters for this Transformer. (Getter)"""
function XfmrCode()::String
    return get_string(@checked Lib.Transformers_Get_XfmrCode(C_NULL_CTX))
end

"""Name of an XfrmCode that supplies electircal parameters for this Transformer. (Setter)"""
function XfmrCode(Value::String)
    @checked Lib.Transformers_Set_XfmrCode(C_NULL_CTX, Value)
end

"""Percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2-winding or 3-winding transformers. (Getter)"""
function Xhl()::Float64
    return @checked Lib.Transformers_Get_Xhl(C_NULL_CTX)
end

"""Percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2-winding or 3-winding transformers. (Setter)"""
function Xhl(Value::Float64)
    @checked Lib.Transformers_Set_Xhl(C_NULL_CTX, Value)
end

"""Percent reactance between windigns 1 and 3, on winding 1 kVA base.  Use for 3-winding transformers only. (Getter)"""
function Xht()::Float64
    return @checked Lib.Transformers_Get_Xht(C_NULL_CTX)
end

"""Percent reactance between windigns 1 and 3, on winding 1 kVA base.  Use for 3-winding transformers only. (Setter)"""
function Xht(Value::Float64)
    @checked Lib.Transformers_Set_Xht(C_NULL_CTX, Value)
end

"""Percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3-winding transformers only. (Getter)"""
function Xlt()::Float64
    return @checked Lib.Transformers_Get_Xlt(C_NULL_CTX)
end

"""Percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3-winding transformers only. (Setter)"""
function Xlt(Value::Float64)
    @checked Lib.Transformers_Set_Xlt(C_NULL_CTX, Value)
end

"""Active Winding neutral reactance [ohms] for wye connections. (Getter)"""
function Xneut()::Float64
    return @checked Lib.Transformers_Get_Xneut(C_NULL_CTX)
end

"""Active Winding neutral reactance [ohms] for wye connections. (Setter)"""
function Xneut(Value::Float64)
    @checked Lib.Transformers_Set_Xneut(C_NULL_CTX, Value)
end

"""Active Winding kV rating.  Phase-phase for 2 or 3 phases, actual winding kV for 1 phase transformer. (Getter)"""
function kV()::Float64
    return @checked Lib.Transformers_Get_kV(C_NULL_CTX)
end

"""Active Winding kV rating.  Phase-phase for 2 or 3 phases, actual winding kV for 1 phase transformer. (Setter)"""
function kV(Value::Float64)
    @checked Lib.Transformers_Set_kV(C_NULL_CTX, Value)
end

"""Active Winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings. (Getter)"""
function kVA()::Float64
    return @checked Lib.Transformers_Get_kVA(C_NULL_CTX)
end

"""Active Winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings. (Setter)"""
function kVA(Value::Float64)
    @checked Lib.Transformers_Set_kVA(C_NULL_CTX, Value)
end

"""Transformer Index (Getter)"""
function Idx()::Int
    return @checked Lib.Transformers_Get_idx(C_NULL_CTX)
end

"""Transformer Index (Setter)"""
function Idx(Value::Int)
    @checked Lib.Transformers_Set_idx(C_NULL_CTX, Value)
end

"""Transformer Core Type: 0=shell;1 = 1-phase; 3= 3-leg; 5= 5-leg (Getter)"""
function CoreType()::Int
    return @checked Lib.Transformers_Get_CoreType(C_NULL_CTX)
end

"""Transformer Core Type: 0=shell;1 = 1-phase; 3= 3-leg; 5= 5-leg (Setter)"""
function CoreType(Value::Int)
    return @checked Lib.Transformers_Set_CoreType(C_NULL_CTX, Value)
end

"""dc Resistance of active winding in ohms for GIC analysis (Getter)"""
function RdcOhms()::Float64
    return @checked Lib.Transformers_Get_RdcOhms(C_NULL_CTX)
end

"""dc Resistance of active winding in ohms for GIC analysis (Setter)"""
function RdcOhms(Value::Float64)
    return @checked Lib.Transformers_Set_RdcOhms(C_NULL_CTX, Value)
end

"""All winding currents in CSV string form like the WdgCurrents property"""
function strWdgCurrents()::String
    return get_string(@checked Lib.Transformers_Get_strWdgCurrents(C_NULL_CTX))
end

"""Complex array with the losses by type (total losses, load losses, no-load losses), in VA"""
function LossesByType()::Array{ComplexF64}
    return get_complex64_array(Lib.Transformers_Get_LossesByType, C_NULL_CTX)
end

"""All Winding currents (ph1, wdg1, wdg2,... ph2, wdg1, wdg2 ...)"""
function WdgCurrents()::Array{Float64}
    return get_float64_array(Lib.Transformers_Get_WdgCurrents, C_NULL_CTX)
end

"""Complex array of voltages for active winding"""
function WdgVoltages()::Array{ComplexF64}
    return get_complex64_array(Lib.Transformers_Get_WdgVoltages, C_NULL_CTX)
end

"""Complex array with the losses by type (total losses, load losses, no-load losses), in VA, concatenated for ALL transformers"""
function AllLossesByType()::Array{ComplexF64}
    return get_complex64_array(Lib.Transformers_Get_AllLossesByType, C_NULL_CTX)
end

end
