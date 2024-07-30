
module Transformers

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Array of strings with all Transformer names in the active circuit."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Transformers_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

function Count(dss::DSSContext)::Int
    return @checked Lib.Transformers_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Sets the first Transformer active. Returns 0 if no more."""
function First(dss::DSSContext)::Int
    return @checked Lib.Transformers_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""Active Winding delta or wye connection? (Getter)"""
function IsDelta(dss::DSSContext)::Bool
    return @checked(Lib.Transformers_Get_IsDelta(dss.ctx)) != 0
end
IsDelta() = IsDelta(DSS_DEFAULT_CTX)

"""Active Winding delta or wye connection? (Setter)"""
function IsDelta(dss::DSSContext, Value::Bool)
    @checked Lib.Transformers_Set_IsDelta(dss.ctx, Value ? 1 : 0)
end
IsDelta(Value::Bool) = IsDelta(DSS_DEFAULT_CTX, Value)

"""Active Winding maximum tap in per-unit. (Getter)"""
function MaxTap(dss::DSSContext)::Float64
        # TODO: should this be Int64?
    return @checked Lib.Transformers_Get_MaxTap(dss.ctx)
end
MaxTap() = MaxTap(DSS_DEFAULT_CTX)

"""Active Winding maximum tap in per-unit. (Setter)"""
function MaxTap(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_MaxTap(dss.ctx, Value)
end
MaxTap(Value::Float64) = MaxTap(DSS_DEFAULT_CTX, Value)

"""Active Winding minimum tap in per-unit. (Getter)"""
function MinTap(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_MinTap(dss.ctx)
end
MinTap() = MinTap(DSS_DEFAULT_CTX)

"""Active Winding minimum tap in per-unit. (Setter)"""
function MinTap(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_MinTap(dss.ctx, Value)
end
MinTap(Value::Float64) = MinTap(DSS_DEFAULT_CTX, Value)

"""Gets the name of the active Transformer object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Transformers_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a Transformer active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Transformers_Set_Name(dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Sets the next Transformer active. Returns 0 if no more."""
function Next(dss::DSSContext)::Int
    return @checked Lib.Transformers_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Active Winding number of tap steps betwein MinTap and MaxTap. (Getter)"""
function NumTaps(dss::DSSContext)::Int
    return @checked Lib.Transformers_Get_NumTaps(dss.ctx)
end
NumTaps() = NumTaps(DSS_DEFAULT_CTX)

"""Active Winding number of tap steps betwein MinTap and MaxTap. (Setter)"""
function NumTaps(dss::DSSContext, Value::Int)
    @checked Lib.Transformers_Set_NumTaps(dss.ctx, Value)
end
NumTaps(Value::Int) = NumTaps(DSS_DEFAULT_CTX, Value)

"""Number of windings on this transformer. Allocates memory; set or change this property first. (Getter)"""
function NumWindings(dss::DSSContext)::Int
    return @checked Lib.Transformers_Get_NumWindings(dss.ctx)
end
NumWindings() = NumWindings(DSS_DEFAULT_CTX)

"""Number of windings on this transformer. Allocates memory; set or change this property first. (Setter)"""
function NumWindings(dss::DSSContext, Value::Int)
    @checked Lib.Transformers_Set_NumWindings(dss.ctx, Value)
end
NumWindings(Value::Int) = NumWindings(DSS_DEFAULT_CTX, Value)

"""Active Winding resistance in % (Getter)"""
function R(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_R(dss.ctx)
end
R() = R(DSS_DEFAULT_CTX)

"""Active Winding resistance in % (Setter)"""
function R(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_R(dss.ctx, Value)
end
R(Value::Float64) = R(DSS_DEFAULT_CTX, Value)

"""Active Winding neutral resistance [ohms] for wye connections. Set less than zero for ungrounded wye. (Getter)"""
function Rneut(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_Rneut(dss.ctx)
end
Rneut() = Rneut(DSS_DEFAULT_CTX)

"""Active Winding neutral resistance [ohms] for wye connections. Set less than zero for ungrounded wye. (Setter)"""
function Rneut(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_Rneut(dss.ctx, Value)
end
Rneut(Value::Float64) = Rneut(DSS_DEFAULT_CTX, Value)

"""Active Winding tap in per-unit. (Getter)"""
function Tap(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_Tap(dss.ctx)
end
Tap() = Tap(DSS_DEFAULT_CTX)

"""Active Winding tap in per-unit. (Setter)"""
function Tap(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_Tap(dss.ctx, Value)
end
Tap(Value::Float64) = Tap(DSS_DEFAULT_CTX, Value)

"""Active Winding Number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.) (Getter)"""
function Wdg(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_Wdg(dss.ctx)
end
Wdg() = Wdg(DSS_DEFAULT_CTX)

"""Active Winding Number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.) (Setter)"""
function Wdg(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_Wdg(dss.ctx, Value)
end
Wdg(Value::Float64) = Wdg(DSS_DEFAULT_CTX, Value)

"""Name of an XfrmCode that supplies electircal parameters for this Transformer. (Getter)"""
function XfmrCode(dss::DSSContext)::String
    return get_string(@checked Lib.Transformers_Get_XfmrCode(dss.ctx))
end
XfmrCode() = XfmrCode(DSS_DEFAULT_CTX)

"""Name of an XfrmCode that supplies electircal parameters for this Transformer. (Setter)"""
function XfmrCode(dss::DSSContext, Value::String)
    @checked Lib.Transformers_Set_XfmrCode(dss.ctx, Value)
end
XfmrCode(Value::String) = XfmrCode(DSS_DEFAULT_CTX, Value)

"""Percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2-winding or 3-winding transformers. (Getter)"""
function Xhl(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_Xhl(dss.ctx)
end
Xhl() = Xhl(DSS_DEFAULT_CTX)

"""Percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2-winding or 3-winding transformers. (Setter)"""
function Xhl(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_Xhl(dss.ctx, Value)
end
Xhl(Value::Float64) = Xhl(DSS_DEFAULT_CTX, Value)

"""Percent reactance between windigns 1 and 3, on winding 1 kVA base.  Use for 3-winding transformers only. (Getter)"""
function Xht(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_Xht(dss.ctx)
end
Xht() = Xht(DSS_DEFAULT_CTX)

"""Percent reactance between windigns 1 and 3, on winding 1 kVA base.  Use for 3-winding transformers only. (Setter)"""
function Xht(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_Xht(dss.ctx, Value)
end
Xht(Value::Float64) = Xht(DSS_DEFAULT_CTX, Value)

"""Percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3-winding transformers only. (Getter)"""
function Xlt(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_Xlt(dss.ctx)
end
Xlt() = Xlt(DSS_DEFAULT_CTX)

"""Percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3-winding transformers only. (Setter)"""
function Xlt(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_Xlt(dss.ctx, Value)
end
Xlt(Value::Float64) = Xlt(DSS_DEFAULT_CTX, Value)

"""Active Winding neutral reactance [ohms] for wye connections. (Getter)"""
function Xneut(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_Xneut(dss.ctx)
end
Xneut() = Xneut(DSS_DEFAULT_CTX)

"""Active Winding neutral reactance [ohms] for wye connections. (Setter)"""
function Xneut(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_Xneut(dss.ctx, Value)
end
Xneut(Value::Float64) = Xneut(DSS_DEFAULT_CTX, Value)

"""Active Winding kV rating.  Phase-phase for 2 or 3 phases, actual winding kV for 1 phase transformer. (Getter)"""
function kV(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_kV(dss.ctx)
end
kV() = kV(DSS_DEFAULT_CTX)

"""Active Winding kV rating.  Phase-phase for 2 or 3 phases, actual winding kV for 1 phase transformer. (Setter)"""
function kV(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_kV(dss.ctx, Value)
end
kV(Value::Float64) = kV(DSS_DEFAULT_CTX, Value)

"""Active Winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings. (Getter)"""
function kVA(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_kVA(dss.ctx)
end
kVA() = kVA(DSS_DEFAULT_CTX)

"""Active Winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings. (Setter)"""
function kVA(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_kVA(dss.ctx, Value)
end
kVA(Value::Float64) = kVA(DSS_DEFAULT_CTX, Value)

"""Transformer Index (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Transformers_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""Transformer Index (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Transformers_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""Transformer Core Type: 0=shell;1 = 1-phase; 3= 3-leg; 5= 5-leg (Getter)"""
function CoreType(dss::DSSContext)::Int
    return @checked Lib.Transformers_Get_CoreType(dss.ctx)
end
CoreType() = CoreType(DSS_DEFAULT_CTX)

"""Transformer Core Type: 0=shell;1 = 1-phase; 3= 3-leg; 5= 5-leg (Setter)"""
function CoreType(dss::DSSContext, Value::Int)
    return @checked Lib.Transformers_Set_CoreType(dss.ctx, Value)
end
CoreType(Value::Int) = CoreType(DSS_DEFAULT_CTX, Value)

"""dc Resistance of active winding in ohms for GIC analysis (Getter)"""
function RdcOhms(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_RdcOhms(dss.ctx)
end
RdcOhms() = RdcOhms(DSS_DEFAULT_CTX)

"""dc Resistance of active winding in ohms for GIC analysis (Setter)"""
function RdcOhms(dss::DSSContext, Value::Float64)
    return @checked Lib.Transformers_Set_RdcOhms(dss.ctx, Value)
end
RdcOhms(Value::Float64) = RdcOhms(DSS_DEFAULT_CTX, Value)

"""All winding currents in CSV string form like the WdgCurrents property

WARNING: If the transformer has open terminal(s), results may be wrong, i.e. avoid using this
in those situations. For more information, see https://github.com/dss-extensions/dss-extensions/issues/24
"""
function strWdgCurrents(dss::DSSContext)::String
    return get_string(@checked Lib.Transformers_Get_strWdgCurrents(dss.ctx))
end
strWdgCurrents() = strWdgCurrents(DSS_DEFAULT_CTX)

"""Complex array with the losses by type (total losses, load losses, no-load losses), in VA"""
function LossesByType(dss::DSSContext)::Array{ComplexF64}
    return get_complex64_array(Lib.Transformers_Get_LossesByType, dss.ctx)
end
LossesByType() = LossesByType(DSS_DEFAULT_CTX)

"""All Winding currents (ph1, wdg1, wdg2,... ph2, wdg1, wdg2 ...)

WARNING: If the transformer has open terminal(s), results may be wrong, i.e. avoid using this
in those situations. For more information, see https://github.com/dss-extensions/dss-extensions/issues/24
"""
function WdgCurrents(dss::DSSContext)::Array{Float64}
    return get_float64_array(Lib.Transformers_Get_WdgCurrents, dss.ctx)
end
WdgCurrents() = WdgCurrents(DSS_DEFAULT_CTX)

"""Complex array of voltages for active winding

WARNING: If the transformer has open terminal(s), results may be wrong, i.e. avoid using this
in those situations. For more information, see https://github.com/dss-extensions/dss-extensions/issues/24
"""
function WdgVoltages(dss::DSSContext)::Array{ComplexF64}
    return get_complex64_array(Lib.Transformers_Get_WdgVoltages, dss.ctx)
end
WdgVoltages() = WdgVoltages(DSS_DEFAULT_CTX)

"""Complex array with the losses by type (total losses, load losses, no-load losses), in VA, concatenated for ALL transformers"""
function AllLossesByType(dss::DSSContext)::Array{ComplexF64}
    return get_complex64_array(Lib.Transformers_Get_AllLossesByType, dss.ctx)
end
AllLossesByType() = AllLossesByType(DSS_DEFAULT_CTX)

end
