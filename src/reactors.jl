module Reactors

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all Reactor objects."""
function AllNames()::Vector{String}
    return get_string_array(Lib.Reactors_Get_AllNames)
end

"""Sets a Reactor active by name."""
function Name()::String
    return get_string(@checked Lib.Reactors_Get_Name())
end

"""Sets a Reactor active by name."""
function Name(Value::String)
    @checked Lib.Reactors_Set_Name(Cstring(pointer(Value)))
end

"""Number of Reactor Objects in Active Circuit"""
function Count()::Int
    return @checked Lib.Reactors_Get_Count()
end

"""Sets first Reactor to be active.  Returns 0 if none."""
function First()::Int
    return @checked Lib.Reactors_Get_First()
end

"""Sets next Reactor to be active.  Returns 0 if no more."""
function Next()::Int
    return @checked Lib.Reactors_Get_Next()
end

"""Active Reactor by index.  1..Count (Getter)"""
function Idx()::Int
    return @checked Lib.Reactors_Get_idx()
end

"""Active Reactor by index.  1..Count (Setter)"""
function Idx(Value::Int)
    @checked Lib.Reactors_Set_idx(Value)
end

"""Delta connection or wye? (Getter)"""
function IsDelta()::Bool
    return (@checked Lib.Reactors_Get_IsDelta()) != 0
end

"""Delta connection or wye? (Setter)"""
function IsDelta(Value::Bool)
    return @checked Lib.Reactors_Set_IsDelta(Value)
end

"""For 2, 3-phase, kV phase-phase. Otherwise specify actual coil rating. (Getter)"""
function kV()::Float64
    return @checked Lib.Reactors_Get_kV()
end

"""For 2, 3-phase, kV phase-phase. Otherwise specify actual coil rating. (Setter)"""
function kV(Value::Float64)
    return @checked Lib.Reactors_Set_kV(Value)
end

"""Name of 2nd bus. Defaults to all phases connected to first bus, node 0, (Shunt Wye Connection) except when Bus2 is specifically defined.
Not necessary to specify for delta (LL) connection (Getter)"""
function Bus2()::String
    return get_string(@checked Lib.Reactors_Get_Bus2())
end

"""Name of 2nd bus. Defaults to all phases connected to first bus, node 0, (Shunt Wye Connection) except when Bus2 is specifically defined.
Not necessary to specify for delta (LL) connection (Setter)"""
function Bus2(Value::String)
    return @checked Lib.Reactors_Set_Bus2(Cstring(pointer(Value)))
end

"""Indicates whether Rmatrix and Xmatrix are to be considered in parallel. (Getter)"""
function Parallel()::Bool
    return (@checked Lib.Reactors_Get_Parallel()) != 0
end

"""Indicates whether Rmatrix and Xmatrix are to be considered in parallel. (Setter)"""
function Parallel(Value::Bool)
    return @checked Lib.Reactors_Set_Parallel(Value)
end

"""Name of first bus.
Bus2 property will default to this bus, node 0, unless previously specified.
Only Bus1 need be specified for a Yg shunt reactor. (Getter)"""
function Bus1()::String
    return get_string(@checked Lib.Reactors_Get_Bus1())
end

"""Name of first bus.
Bus2 property will default to this bus, node 0, unless previously specified.
Only Bus1 need be specified for a Yg shunt reactor. (Setter)"""
function Bus1(Value::String)
    return @checked Lib.Reactors_Set_Bus1(Cstring(pointer(Value)))
end

"""Name of XYCurve object, previously defined, describing per-unit variation of phase resistance, R, vs. frequency. Applies to resistance specified by R or Z property. If actual values are not known, R often increases by approximately the square root of frequency. (Getter)"""
function RCurve()::String
    return get_string(@checked Lib.Reactors_Get_RCurve())
end

"""Name of XYCurve object, previously defined, describing per-unit variation of phase resistance, R, vs. frequency. Applies to resistance specified by R or Z property. If actual values are not known, R often increases by approximately the square root of frequency. (Setter)"""
function RCurve(Value::String)
    return @checked Lib.Reactors_Set_RCurve(Cstring(pointer(Value)))
end

"""Number of phases. (Getter)"""
function Phases()::Int
    return @checked Lib.Reactors_Get_Phases()
end

"""Number of phases. (Setter)"""
function Phases(Value::Int)
    return @checked Lib.Reactors_Set_Phases(Value)
end

"""Resistance in parallel with R and X (the entire branch). Assumed infinite if not specified. (Getter)"""
function Rp()::Float64
    return @checked Lib.Reactors_Get_Rp()
end

"""Resistance in parallel with R and X (the entire branch). Assumed infinite if not specified. (Setter)"""
function Rp(Value::Float64)
    return @checked Lib.Reactors_Set_Rp(Value)
end

"""Name of XYCurve object, previously defined, describing per-unit variation of phase inductance, L=X/w, vs. frequency. Applies to reactance specified by X, LmH, Z, or kvar property. L generally decreases somewhat with frequency above the base frequency, approaching a limit at a few kHz. (Getter)"""
function LCurve()::Float64
    return @checked Lib.Reactors_Get_LCurve()
end

"""Name of XYCurve object, previously defined, describing per-unit variation of phase inductance, L=X/w, vs. frequency. Applies to reactance specified by X, LmH, Z, or kvar property. L generally decreases somewhat with frequency above the base frequency, approaching a limit at a few kHz. (Setter)"""
function LCurve(Value::Float64)
    return @checked Lib.Reactors_Set_LCurve(Value)
end

"""Total kvar, all phases.  Evenly divided among phases. Only determines X. Specify R separately (Getter)"""
function kvar()::Float64
    return @checked Lib.Reactors_Get_kvar()
end

"""Total kvar, all phases.  Evenly divided among phases. Only determines X. Specify R separately (Setter)"""
function kvar(Value::Float64)
    return @checked Lib.Reactors_Set_kvar(Value)
end

"""Resistance (in series with reactance), each phase, ohms. This property applies to REACTOR specified by either kvar or X. See also help on Z. (Getter)"""
function R()::Float64
    return @checked Lib.Reactors_Get_R()
end

"""Resistance (in series with reactance), each phase, ohms. This property applies to REACTOR specified by either kvar or X. See also help on Z. (Setter)"""
function R(Value::Float64)
    return @checked Lib.Reactors_Set_R(Value)
end

"""Inductance, mH. Alternate way to define the reactance, X, property. (Getter)"""
function LmH()::Float64
    return @checked Lib.Reactors_Get_LmH()
end

"""Inductance, mH. Alternate way to define the reactance, X, property. (Setter)"""
function LmH(Value::Float64)
    return @checked Lib.Reactors_Set_LmH(Value)
end

"""Reactance, each phase, ohms at base frequency. See also help on Z and LmH properties. (Getter)"""
function X()::Float64
    return @checked Lib.Reactors_Get_X()
end

"""Reactance, each phase, ohms at base frequency. See also help on Z and LmH properties. (Setter)"""
function X(Value::Float64)
    return @checked Lib.Reactors_Set_X(Value)
end

"""How the reactor data was provided: 1=kvar, 2=R+jX, 3=R and X matrices, 4=sym components.
Depending on this value, only some properties are filled or make sense in the context."""
function SpecType()::Int
    return @checked Lib.Reactors_Get_SpecType()
end

"""Reactance matrix, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X. (Getter)"""
function Xmatrix()::Array{Float64}
    return get_float64_array(Lib.Reactors_Get_Xmatrix)
end

"""Reactance matrix, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X. (Setter)"""
function Xmatrix(Value::Array{Float64})
    return set_float64_array(Lib.Reactors_Set_Xmatrix, Value)
end

"""Resistance matrix, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X. (Getter)"""
function Rmatrix()::Array{Float64}
    return get_float64_array(Lib.Reactors_Get_Rmatrix)
end

"""Resistance matrix, ohms at base frequency. Order of the matrix is the number of phases. Mutually exclusive to specifying parameters by kvar or X. (Setter)"""
function Rmatrix(Value::Array{Float64})
    return set_float64_array(Lib.Reactors_Set_Rmatrix, Value)
end

"""Zero-sequence impedance, ohms.
Used to define the impedance matrix of the REACTOR if Z1 is also specified.
Note: Z0 defaults to Z1 if it is not specifically defined. (Getter)"""
function Z0()::ComplexF64
    return get_complex64(Lib.Reactors_Get_Z0)
end

"""Zero-sequence impedance, ohms.
Used to define the impedance matrix of the REACTOR if Z1 is also specified.
Note: Z0 defaults to Z1 if it is not specifically defined. (Setter)"""
function Z0(Value::ComplexF64)
    @checked Lib.Reactors_Set_Z0(pointer(Value), 2)
end

"""Positive-sequence impedance, ohms.
If defined, Z1, Z2, and Z0 are used to define the impedance matrix of the REACTOR.
Z1 MUST BE DEFINED TO USE THIS OPTION FOR DEFINING THE MATRIX.
Side Effect: Sets Z2 and Z0 to same values unless they were previously defined. (Getter)"""
function Z1()::ComplexF64
    return get_complex64(Lib.Reactors_Get_Z1)
end

"""Positive-sequence impedance, ohms.
If defined, Z1, Z2, and Z0 are used to define the impedance matrix of the REACTOR.
Z1 MUST BE DEFINED TO USE THIS OPTION FOR DEFINING THE MATRIX.
Side Effect: Sets Z2 and Z0 to same values unless they were previously defined. (Setter)"""
function Z1(Value::ComplexF64)
    @checked Lib.Reactors_Set_Z1(pointer(Value), 2)
end

"""Negative-sequence impedance, ohms.
Used to define the impedance matrix of the REACTOR if Z1 is also specified.
Note: Z2 defaults to Z1 if it is not specifically defined. If Z2 is not equal to Z1, the impedance matrix is asymmetrical. (Getter)"""
function Z2()::ComplexF64
    return get_complex64(Lib.Reactors_Get_Z2)
end

"""Negative-sequence impedance, ohms.
Used to define the impedance matrix of the REACTOR if Z1 is also specified.
Note: Z2 defaults to Z1 if it is not specifically defined. If Z2 is not equal to Z1, the impedance matrix is asymmetrical. (Setter)"""
function Z2(Value::ComplexF64)
    @checked Lib.Reactors_Set_Z2(pointer(Value), 2)
end

"""Alternative way of defining R and X properties (Getter)"""
function Z()::ComplexF64
    return get_complex64(Lib.Reactors_Get_Z)
end

"""Alternative way of defining R and X properties (Setter)"""
function Z(Value::ComplexF64)
    @checked Lib.Reactors_Set_Z(pointer(Value), 2)
end

end