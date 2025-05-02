module Transformers

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all Transformers objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Transformers_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active Transformers object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Transformers_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a Transformers object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Transformers_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of Transformers Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.Transformers_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first Transformers to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked Lib.Transformers_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next Transformers to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.Transformers_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active Transformers (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Transformers_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate Transformers by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Transformers_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Active Winding delta or wye connection?

Original COM help: https://opendss.epri.com/IsDelta3.html

(Getter)
"""
function IsDelta(dss::DSSContext)::Bool
    return @checked(Lib.Transformers_Get_IsDelta(dss.ctx)) != 0
end
IsDelta() = IsDelta(DSS_DEFAULT_CTX)

"""
Active Winding delta or wye connection?

Original COM help: https://opendss.epri.com/IsDelta3.html

(Setter)
"""
function IsDelta(dss::DSSContext, Value::Bool)
    @checked Lib.Transformers_Set_IsDelta(dss.ctx, Value ? 1 : 0)
end
IsDelta(Value::Bool) = IsDelta(DSS_DEFAULT_CTX, Value)

"""
Active Winding maximum tap in per-unit.

Original COM help: https://opendss.epri.com/MaxTap.html

(Getter)
"""
function MaxTap(dss::DSSContext)::Float64
        # TODO: should this be Int64?
    return @checked Lib.Transformers_Get_MaxTap(dss.ctx)
end
MaxTap() = MaxTap(DSS_DEFAULT_CTX)

"""
Active Winding maximum tap in per-unit.

Original COM help: https://opendss.epri.com/MaxTap.html

(Setter)
"""
function MaxTap(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_MaxTap(dss.ctx, Value)
end
MaxTap(Value::Float64) = MaxTap(DSS_DEFAULT_CTX, Value)

"""
Active Winding minimum tap in per-unit.

Original COM help: https://opendss.epri.com/MinTap.html

(Getter)
"""
function MinTap(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_MinTap(dss.ctx)
end
MinTap() = MinTap(DSS_DEFAULT_CTX)

"""
Active Winding minimum tap in per-unit.

Original COM help: https://opendss.epri.com/MinTap.html

(Setter)
"""
function MinTap(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_MinTap(dss.ctx, Value)
end
MinTap(Value::Float64) = MinTap(DSS_DEFAULT_CTX, Value)

"""
Active Winding number of tap steps between MinTap and MaxTap.

Original COM help: https://opendss.epri.com/NumTaps.html

(Getter)
"""
function NumTaps(dss::DSSContext)::Int
    return @checked Lib.Transformers_Get_NumTaps(dss.ctx)
end
NumTaps() = NumTaps(DSS_DEFAULT_CTX)

"""
Active Winding number of tap steps between MinTap and MaxTap.

Original COM help: https://opendss.epri.com/NumTaps.html

(Setter)
"""
function NumTaps(dss::DSSContext, Value::Int)
    @checked Lib.Transformers_Set_NumTaps(dss.ctx, Value)
end
NumTaps(Value::Int) = NumTaps(DSS_DEFAULT_CTX, Value)

"""
Number of windings on this transformer. Allocates memory; set or change this property first.

Original COM help: https://opendss.epri.com/NumWindings.html

(Getter)
"""
function NumWindings(dss::DSSContext)::Int
    return @checked Lib.Transformers_Get_NumWindings(dss.ctx)
end
NumWindings() = NumWindings(DSS_DEFAULT_CTX)

"""
Number of windings on this transformer. Allocates memory; set or change this property first.

Original COM help: https://opendss.epri.com/NumWindings.html

(Setter)
"""
function NumWindings(dss::DSSContext, Value::Int)
    @checked Lib.Transformers_Set_NumWindings(dss.ctx, Value)
end
NumWindings(Value::Int) = NumWindings(DSS_DEFAULT_CTX, Value)

"""
Active Winding resistance in %

Original COM help: https://opendss.epri.com/R.html

(Getter)
"""
function R(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_R(dss.ctx)
end
R() = R(DSS_DEFAULT_CTX)

"""
Active Winding resistance in %

Original COM help: https://opendss.epri.com/R.html

(Setter)
"""
function R(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_R(dss.ctx, Value)
end
R(Value::Float64) = R(DSS_DEFAULT_CTX, Value)

"""
Active Winding neutral resistance [ohms] for wye connections. Set less than zero for ungrounded wye.

Original COM help: https://opendss.epri.com/Rneut1.html

(Getter)
"""
function Rneut(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_Rneut(dss.ctx)
end
Rneut() = Rneut(DSS_DEFAULT_CTX)

"""
Active Winding neutral resistance [ohms] for wye connections. Set less than zero for ungrounded wye.

Original COM help: https://opendss.epri.com/Rneut1.html

(Setter)
"""
function Rneut(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_Rneut(dss.ctx, Value)
end
Rneut(Value::Float64) = Rneut(DSS_DEFAULT_CTX, Value)

"""
Active Winding tap in per-unit.

Original COM help: https://opendss.epri.com/Tap.html

(Getter)
"""
function Tap(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_Tap(dss.ctx)
end
Tap() = Tap(DSS_DEFAULT_CTX)

"""
Active Winding tap in per-unit.

Original COM help: https://opendss.epri.com/Tap.html

(Setter)
"""
function Tap(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_Tap(dss.ctx, Value)
end
Tap(Value::Float64) = Tap(DSS_DEFAULT_CTX, Value)

"""
Active Winding Number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.)

Original COM help: https://opendss.epri.com/Wdg.html

(Getter)
"""
function Wdg(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_Wdg(dss.ctx)
end
Wdg() = Wdg(DSS_DEFAULT_CTX)

"""
Active Winding Number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.)

Original COM help: https://opendss.epri.com/Wdg.html

(Setter)
"""
function Wdg(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_Wdg(dss.ctx, Value)
end
Wdg(Value::Float64) = Wdg(DSS_DEFAULT_CTX, Value)

"""
Name of an XfrmCode that supplies electrical parameters for this Transformer.

Original COM help: https://opendss.epri.com/XfmrCode1.html

(Getter)
"""
function XfmrCode(dss::DSSContext)::String
    return get_string(@checked Lib.Transformers_Get_XfmrCode(dss.ctx))
end
XfmrCode() = XfmrCode(DSS_DEFAULT_CTX)

"""
Name of an XfrmCode that supplies electrical parameters for this Transformer.

Original COM help: https://opendss.epri.com/XfmrCode1.html

(Setter)
"""
function XfmrCode(dss::DSSContext, Value::String)
    @checked Lib.Transformers_Set_XfmrCode(dss.ctx, Value)
end
XfmrCode(Value::String) = XfmrCode(DSS_DEFAULT_CTX, Value)

"""
Percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2-winding or 3-winding transformers.

Original COM help: https://opendss.epri.com/Xhl.html

(Getter)
"""
function Xhl(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_Xhl(dss.ctx)
end
Xhl() = Xhl(DSS_DEFAULT_CTX)

"""
Percent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2-winding or 3-winding transformers.

Original COM help: https://opendss.epri.com/Xhl.html

(Setter)
"""
function Xhl(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_Xhl(dss.ctx, Value)
end
Xhl(Value::Float64) = Xhl(DSS_DEFAULT_CTX, Value)

"""
Percent reactance between windings 1 and 3, on winding 1 kVA base.  Use for 3-winding transformers only.

Original COM help: https://opendss.epri.com/Xht.html

(Getter)
"""
function Xht(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_Xht(dss.ctx)
end
Xht() = Xht(DSS_DEFAULT_CTX)

"""
Percent reactance between windings 1 and 3, on winding 1 kVA base.  Use for 3-winding transformers only.

Original COM help: https://opendss.epri.com/Xht.html

(Setter)
"""
function Xht(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_Xht(dss.ctx, Value)
end
Xht(Value::Float64) = Xht(DSS_DEFAULT_CTX, Value)

"""
Percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3-winding transformers only.

Original COM help: https://opendss.epri.com/Xlt.html

(Getter)
"""
function Xlt(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_Xlt(dss.ctx)
end
Xlt() = Xlt(DSS_DEFAULT_CTX)

"""
Percent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3-winding transformers only.

Original COM help: https://opendss.epri.com/Xlt.html

(Setter)
"""
function Xlt(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_Xlt(dss.ctx, Value)
end
Xlt(Value::Float64) = Xlt(DSS_DEFAULT_CTX, Value)

"""
Active Winding neutral reactance [ohms] for wye connections.

Original COM help: https://opendss.epri.com/Xneut1.html

(Getter)
"""
function Xneut(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_Xneut(dss.ctx)
end
Xneut() = Xneut(DSS_DEFAULT_CTX)

"""
Active Winding neutral reactance [ohms] for wye connections.

Original COM help: https://opendss.epri.com/Xneut1.html

(Setter)
"""
function Xneut(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_Xneut(dss.ctx, Value)
end
Xneut(Value::Float64) = Xneut(DSS_DEFAULT_CTX, Value)

"""
Active Winding kV rating.  Phase-phase for 2 or 3 phases, actual winding kV for 1 phase transformer.

Original COM help: https://opendss.epri.com/kV3.html

(Getter)
"""
function kV(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_kV(dss.ctx)
end
kV() = kV(DSS_DEFAULT_CTX)

"""
Active Winding kV rating.  Phase-phase for 2 or 3 phases, actual winding kV for 1 phase transformer.

Original COM help: https://opendss.epri.com/kV3.html

(Setter)
"""
function kV(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_kV(dss.ctx, Value)
end
kV(Value::Float64) = kV(DSS_DEFAULT_CTX, Value)

"""
Active Winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings.

Original COM help: https://opendss.epri.com/kva1.html

(Getter)
"""
function kVA(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_kVA(dss.ctx)
end
kVA() = kVA(DSS_DEFAULT_CTX)

"""
Active Winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings.

Original COM help: https://opendss.epri.com/kva1.html

(Setter)
"""
function kVA(dss::DSSContext, Value::Float64)
    @checked Lib.Transformers_Set_kVA(dss.ctx, Value)
end
kVA(Value::Float64) = kVA(DSS_DEFAULT_CTX, Value)

"""
Transformer Core Type: 0=Shell; 1=1ph; 3-3leg; 4=4-Leg; 5=5-leg; 9=Core-1-phase

Original COM help: https://opendss.epri.com/CoreType.html

(Getter)
"""
function CoreType(dss::DSSContext)::Int
    return @checked Lib.Transformers_Get_CoreType(dss.ctx)
end
CoreType() = CoreType(DSS_DEFAULT_CTX)

"""
Transformer Core Type: 0=Shell; 1=1ph; 3-3leg; 4=4-Leg; 5=5-leg; 9=Core-1-phase

Original COM help: https://opendss.epri.com/CoreType.html

(Setter)
"""
function CoreType(dss::DSSContext, Value::Int)
    return @checked Lib.Transformers_Set_CoreType(dss.ctx, Value)
end
CoreType(Value::Int) = CoreType(DSS_DEFAULT_CTX, Value)

"""
dc Resistance of active winding in ohms for GIC analysis

Original COM help: https://opendss.epri.com/RdcOhms.html

(Getter)
"""
function RdcOhms(dss::DSSContext)::Float64
    return @checked Lib.Transformers_Get_RdcOhms(dss.ctx)
end
RdcOhms() = RdcOhms(DSS_DEFAULT_CTX)

"""
dc Resistance of active winding in ohms for GIC analysis

Original COM help: https://opendss.epri.com/RdcOhms.html

(Setter)
"""
function RdcOhms(dss::DSSContext, Value::Float64)
    return @checked Lib.Transformers_Set_RdcOhms(dss.ctx, Value)
end
RdcOhms(Value::Float64) = RdcOhms(DSS_DEFAULT_CTX, Value)

"""
All winding currents in CSV string form like the WdgCurrents property

**WARNING:** If the transformer has open terminal(s), results may be wrong, i.e. avoid using this
in those situations. For more information, see https://github.com/dss-extensions/dss-extensions/issues/24
"""
function strWdgCurrents(dss::DSSContext)::String
    return get_string(@checked Lib.Transformers_Get_strWdgCurrents(dss.ctx))
end
strWdgCurrents() = strWdgCurrents(DSS_DEFAULT_CTX)

"""
Complex array with the losses by type (total losses, load losses, no-load losses), in VA

**(API Extension)**
"""
function LossesByType(dss::DSSContext)::Array{ComplexF64}
    return get_complex64_array(Lib.Transformers_Get_LossesByType, dss.ctx)
end
LossesByType() = LossesByType(DSS_DEFAULT_CTX)

"""
All Winding currents (ph1, wdg1, wdg2,... ph2, wdg1, wdg2 ...)

**WARNING:** If the transformer has open terminal(s), results may be wrong, i.e. avoid using this
in those situations. For more information, see https://github.com/dss-extensions/dss-extensions/issues/24

Original COM help: https://opendss.epri.com/WdgCurrents.html
"""
function WdgCurrents(dss::DSSContext)::Array{Float64}
    return get_float64_array(Lib.Transformers_Get_WdgCurrents, dss.ctx)
end
WdgCurrents() = WdgCurrents(DSS_DEFAULT_CTX)

"""
Complex array of voltages for active winding

**WARNING:** If the transformer has open terminal(s), results may be wrong, i.e. avoid using this
in those situations. For more information, see https://github.com/dss-extensions/dss-extensions/issues/24

Original COM help: https://opendss.epri.com/WdgVoltages.html
"""
function WdgVoltages(dss::DSSContext)::Array{ComplexF64}
    return get_complex64_array(Lib.Transformers_Get_WdgVoltages, dss.ctx)
end
WdgVoltages() = WdgVoltages(DSS_DEFAULT_CTX)

"""
Complex array with the losses by type (total losses, load losses, no-load losses), in VA, concatenated for ALL transformers

**(API Extension)**
"""
function AllLossesByType(dss::DSSContext)::Array{ComplexF64}
    return get_complex64_array(Lib.Transformers_Get_AllLossesByType, dss.ctx)
end
AllLossesByType() = AllLossesByType(DSS_DEFAULT_CTX)

end
