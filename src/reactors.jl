module Reactors

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all Reactor objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Reactors_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active Reactor object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Reactors_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a Reactor active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Reactors_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of Reactor Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.Reactors_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Sets first Reactor to be active.  Returns 0 if none."""
function First(dss::DSSContext)::Int
    return @checked Lib.Reactors_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""Sets next Reactor to be active.  Returns 0 if no more."""
function Next(dss::DSSContext)::Int
    return @checked Lib.Reactors_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Active Reactor by index.  1..Count (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Reactors_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""Active Reactor by index.  1..Count (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Reactors_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""Delta connection or wye? (Getter)"""
function IsDelta(dss::DSSContext)::Bool
    return (@checked Lib.Reactors_Get_IsDelta(dss.ctx)) != 0
end
IsDelta() = IsDelta(DSS_DEFAULT_CTX)

"""Delta connection or wye? (Setter)"""
function IsDelta(dss::DSSContext, Value::Bool)
    return @checked Lib.Reactors_Set_IsDelta(dss.ctx, Value)
end
IsDelta(Value::Bool) = IsDelta(DSS_DEFAULT_CTX, Value)

"""For 2, 3-phase, kV phase-phase. Otherwise specify actual coil rating. (Getter)"""
function kV(dss::DSSContext)::Float64
    return @checked Lib.Reactors_Get_kV(dss.ctx)
end
kV() = kV(DSS_DEFAULT_CTX)

"""For 2, 3-phase, kV phase-phase. Otherwise specify actual coil rating. (Setter)"""
function kV(dss::DSSContext, Value::Float64)
    return @checked Lib.Reactors_Set_kV(dss.ctx, Value)
end
kV(Value::Float64) = kV(DSS_DEFAULT_CTX, Value)

"""Name of 2nd bus. Defaults to all phases connected to first bus, node 0, (Shunt Wye Connection) except when Bus2 is specifically defined.
Not necessary to specify for delta (LL) connection (Getter)"""
function Bus2(dss::DSSContext)::String
    return get_string(@checked Lib.Reactors_Get_Bus2(dss.ctx))
end
Bus2() = Bus2(DSS_DEFAULT_CTX)

"""Name of 2nd bus. Defaults to all phases connected to first bus, node 0, (Shunt Wye Connection) except when Bus2 is specifically defined.
Not necessary to specify for delta (LL) connection (Setter)"""
function Bus2(dss::DSSContext, Value::String)
    return @checked Lib.Reactors_Set_Bus2(dss.ctx, Cstring(pointer(Value)))
end
Bus2(Value::String) = Bus2(DSS_DEFAULT_CTX, Value)

"""Indicates whether Rmatrix and Xmatrix are to be considered in parallel. (Getter)"""
function Parallel(dss::DSSContext)::Bool
    return (@checked Lib.Reactors_Get_Parallel(dss.ctx)) != 0
end
Parallel() = Parallel(DSS_DEFAULT_CTX)

"""Indicates whether Rmatrix and Xmatrix are to be considered in parallel. (Setter)"""
function Parallel(dss::DSSContext, Value::Bool)
    return @checked Lib.Reactors_Set_Parallel(dss.ctx, Value)
end
Parallel(Value::Bool) = Parallel(DSS_DEFAULT_CTX, Value)

"""Name of first bus.
Bus2 property will default to this bus, node 0, unless previously specified.
Only Bus1 need be specified for a Yg shunt reactor. (Getter)"""
function Bus1(dss::DSSContext)::String
    return get_string(@checked Lib.Reactors_Get_Bus1(dss.ctx))
end
Bus1() = Bus1(DSS_DEFAULT_CTX)

"""Name of first bus.
Bus2 property will default to this bus, node 0, unless previously specified.
Only Bus1 need be specified for a Yg shunt reactor. (Setter)"""
function Bus1(dss::DSSContext, Value::String)
    return @checked Lib.Reactors_Set_Bus1(dss.ctx, Cstring(pointer(Value)))
end
Bus1(Value::String) = Bus1(DSS_DEFAULT_CTX, Value)

"""Name of XYCurve object, previously defined, describing per-unit variation of phase resistance, R, vs. frequency. Applies to resistance specified by R or Z property. If actual values are not known, R often increases by approximately the square root of frequency. (Getter)"""
function RCurve(dss::DSSContext)::String
    return get_string(@checked Lib.Reactors_Get_RCurve(dss.ctx))
end
RCurve() = RCurve(DSS_DEFAULT_CTX)

"""Name of XYCurve object, previously defined, describing per-unit variation of phase resistance, R, vs. frequency. Applies to resistance specified by R or Z property. If actual values are not known, R often increases by approximately the square root of frequency. (Setter)"""
function RCurve(dss::DSSContext, Value::String)
    return @checked Lib.Reactors_Set_RCurve(dss.ctx, Cstring(pointer(Value)))
end
RCurve(Value::String) = RCurve(DSS_DEFAULT_CTX, Value)

"""Number of phases. (Getter)"""
function Phases(dss::DSSContext)::Int
    return @checked Lib.Reactors_Get_Phases(dss.ctx)
end
Phases() = Phases(DSS_DEFAULT_CTX)

"""Number of phases. (Setter)"""
function Phases(dss::DSSContext, Value::Int)
    return @checked Lib.Reactors_Set_Phases(dss.ctx, Value)
end
Phases(Value::Int) = Phases(DSS_DEFAULT_CTX, Value)

"""Resistance in parallel with R and X (the entire branch). Assumed infinite if not specified. (Getter)"""
function Rp(dss::DSSContext)::Float64
    return @checked Lib.Reactors_Get_Rp(dss.ctx)
end
Rp() = Rp(DSS_DEFAULT_CTX)

"""Resistance in parallel with R and X (the entire branch). Assumed infinite if not specified. (Setter)"""
function Rp(dss::DSSContext, Value::Float64)
    return @checked Lib.Reactors_Set_Rp(dss.ctx, Value)
end
Rp(Value::Float64) = Rp(DSS_DEFAULT_CTX, Value)

"""Name of XYCurve object, previously defined, describing per-unit variation of phase inductance, L=X/w, vs. frequency. Applies to reactance specified by X, LmH, Z, or kvar property. L generally decreases somewhat with frequency above the base frequency, approaching a limit at a few kHz. (Getter)"""
function LCurve(dss::DSSContext)::Float64
    return @checked Lib.Reactors_Get_LCurve(dss.ctx)
end
LCurve() = LCurve(DSS_DEFAULT_CTX)

"""Name of XYCurve object, previously defined, describing per-unit variation of phase inductance, L=X/w, vs. frequency. Applies to reactance specified by X, LmH, Z, or kvar property. L generally decreases somewhat with frequency above the base frequency, approaching a limit at a few kHz. (Setter)"""
function LCurve(dss::DSSContext, Value::Float64)
    return @checked Lib.Reactors_Set_LCurve(dss.ctx, Value)
end
LCurve(Value::Float64) = LCurve(DSS_DEFAULT_CTX, Value)

"""Total kvar, all phases.  Evenly divided among phases. Only determines X. Specify R separately (Getter)"""
function kvar(dss::DSSContext)::Float64
    return @checked Lib.Reactors_Get_kvar(dss.ctx)
end
kvar() = kvar(DSS_DEFAULT_CTX)

"""Total kvar, all phases.  Evenly divided among phases. Only determines X. Specify R separately (Setter)"""
function kvar(dss::DSSContext, Value::Float64)
    return @checked Lib.Reactors_Set_kvar(dss.ctx, Value)
end
kvar(Value::Float64) = kvar(DSS_DEFAULT_CTX, Value)

"""Resistance (in series with reactance), each phase, ohms. This property applies to REACTOR specified by either kvar or X. See also help on Z. (Getter)"""
function R(dss::DSSContext)::Float64
    return @checked Lib.Reactors_Get_R(dss.ctx)
end
R() = R(DSS_DEFAULT_CTX)

"""Resistance (in series with reactance), each phase, ohms. This property applies to REACTOR specified by either kvar or X. See also help on Z. (Setter)"""
function R(dss::DSSContext, Value::Float64)
    return @checked Lib.Reactors_Set_R(dss.ctx, Value)
end
R(Value::Float64) = R(DSS_DEFAULT_CTX, Value)

"""Inductance, mH. Alternate way to define the reactance, X, property. (Getter)"""
function LmH(dss::DSSContext)::Float64
    return @checked Lib.Reactors_Get_LmH(dss.ctx)
end
LmH() = LmH(DSS_DEFAULT_CTX)

"""Inductance, mH. Alternate way to define the reactance, X, property. (Setter)"""
function LmH(dss::DSSContext, Value::Float64)
    return @checked Lib.Reactors_Set_LmH(dss.ctx, Value)
end
LmH(Value::Float64) = LmH(DSS_DEFAULT_CTX, Value)

"""Reactance, each phase, ohms at base frequency. See also help on Z and LmH properties. (Getter)"""
function X(dss::DSSContext)::Float64
    return @checked Lib.Reactors_Get_X(dss.ctx)
end
X() = X(DSS_DEFAULT_CTX)

"""Reactance, each phase, ohms at base frequency. See also help on Z and LmH properties. (Setter)"""
function X(dss::DSSContext, Value::Float64)
    return @checked Lib.Reactors_Set_X(dss.ctx, Value)
end
X(Value::Float64) = X(DSS_DEFAULT_CTX, Value)

"""How the reactor data was provided: 1=kvar, 2=R+jX, 3=R and X matrices, 4=sym components.
Depending on this value, only some properties are filled or make sense in the context."""
function SpecType(dss::DSSContext)::Int
    return @checked Lib.Reactors_Get_SpecType(dss.ctx)
end
SpecType() = SpecType(DSS_DEFAULT_CTX)

"""Reactance matrix, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X. (Getter)"""
function Xmatrix(dss::DSSContext)::Array{Float64}
    return get_float64_array(Lib.Reactors_Get_Xmatrix, dss.ctx)
end
Xmatrix() = Xmatrix(DSS_DEFAULT_CTX)

"""Reactance matrix, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X. (Setter)"""
function Xmatrix(dss::DSSContext, Value::Array{Float64})
    return set_float64_array(Lib.Reactors_Set_Xmatrix, dss.ctx, Value)
end
Xmatrix(Value::Array{Float64}) = Xmatrix(DSS_DEFAULT_CTX, Value)

"""Resistance matrix, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X. (Getter)"""
function Rmatrix(dss::DSSContext)::Array{Float64}
    return get_float64_array(Lib.Reactors_Get_Rmatrix, dss.ctx)
end
Rmatrix() = Rmatrix(DSS_DEFAULT_CTX)

"""Resistance matrix, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X. (Setter)"""
function Rmatrix(dss::DSSContext, Value::Array{Float64})
    return set_float64_array(Lib.Reactors_Set_Rmatrix, dss.ctx, Value)
end
Rmatrix(Value::Array{Float64}) = Rmatrix(DSS_DEFAULT_CTX, Value)

"""Zero-sequence impedance, ohms.
Used to define the impedance matrix of the REACTOR if Z1 is also specified.
Note: Z0 defaults to Z1 if it is not specifically defined. (Getter)"""
function Z0(dss::DSSContext)::ComplexF64
    return get_complex64(Lib.Reactors_Get_Z0, dss.ctx)
end
Z0() = Z0(DSS_DEFAULT_CTX)

"""Zero-sequence impedance, ohms.
Used to define the impedance matrix of the REACTOR if Z1 is also specified.
Note: Z0 defaults to Z1 if it is not specifically defined. (Setter)"""
function Z0(dss::DSSContext, Value::ComplexF64)
    @checked Lib.Reactors_Set_Z0(dss.ctx, pointer(Value), 2)
end
Z0(Value::ComplexF64) = Z0(DSS_DEFAULT_CTX, Value)

"""Positive-sequence impedance, ohms.
If defined, Z1, Z2, and Z0 are used to define the impedance matrix of the REACTOR.
Z1 MUST BE DEFINED TO USE THIS OPTION FOR DEFINING THE MATRIX.
Side Effect: Sets Z2 and Z0 to same values unless they were previously defined. (Getter)"""
function Z1(dss::DSSContext)::ComplexF64
    return get_complex64(Lib.Reactors_Get_Z1, dss.ctx)
end
Z1() = Z1(DSS_DEFAULT_CTX)

"""Positive-sequence impedance, ohms.
If defined, Z1, Z2, and Z0 are used to define the impedance matrix of the REACTOR.
Z1 MUST BE DEFINED TO USE THIS OPTION FOR DEFINING THE MATRIX.
Side Effect: Sets Z2 and Z0 to same values unless they were previously defined. (Setter)"""
function Z1(dss::DSSContext, Value::ComplexF64)
    @checked Lib.Reactors_Set_Z1(dss.ctx, pointer(Value), 2)
end
Z1(Value::ComplexF64) = Z1(DSS_DEFAULT_CTX, Value)

"""Negative-sequence impedance, ohms.
Used to define the impedance matrix of the REACTOR if Z1 is also specified.
Note: Z2 defaults to Z1 if it is not specifically defined. If Z2 is not equal to Z1, the impedance matrix is asymmetrical. (Getter)"""
function Z2(dss::DSSContext)::ComplexF64
    return get_complex64(Lib.Reactors_Get_Z2, dss.ctx)
end
Z2() = Z2(DSS_DEFAULT_CTX)

"""Negative-sequence impedance, ohms.
Used to define the impedance matrix of the REACTOR if Z1 is also specified.
Note: Z2 defaults to Z1 if it is not specifically defined. If Z2 is not equal to Z1, the impedance matrix is asymmetrical. (Setter)"""
function Z2(dss::DSSContext, Value::ComplexF64)
    @checked Lib.Reactors_Set_Z2(dss.ctx, pointer(Value), 2)
end
Z2(Value::ComplexF64) = Z2(DSS_DEFAULT_CTX, Value)

"""Alternative way of defining R and X properties (Getter)"""
function Z(dss::DSSContext)::ComplexF64
    return get_complex64(Lib.Reactors_Get_Z, dss.ctx)
end
Z() = Z(DSS_DEFAULT_CTX)

"""Alternative way of defining R and X properties (Setter)"""
function Z(dss::DSSContext, Value::ComplexF64)
    @checked Lib.Reactors_Set_Z(dss.ctx, pointer(Value), 2)
end
Z(Value::ComplexF64) = Z(DSS_DEFAULT_CTX, Value)

end