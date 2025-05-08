module SwtControls

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all SwtControl objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.SwtControls_Get_AllNames, dss)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active SwtControl object."""
function Name(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.SwtControls_Get_Name, dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a SwtControl object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.SwtControls_Set_Name, dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of SwtControl Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.SwtControls_Get_Count, dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first SwtControl to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.SwtControls_Get_First, dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next SwtControl to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.SwtControls_Get_Next, dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active SwtControl (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.SwtControls_Get_idx, dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate SwtControl by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.SwtControls_Set_idx, dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""Reset SWT controls"""
function Reset(dss::DSSContext)
    @checked dss_ccall(dss.capi.SwtControls_Reset, dss.ctx)
end
Reset() = Reset(DSS_DEFAULT_CTX)

"""
Open or Close the switch. No effect if switch is locked.  However, Reset removes any lock and then closes the switch (shelf state).

Original COM help: <https://opendss.epri.com/Action1.html>

(Getter)
"""
function Action(dss::DSSContext)::Lib.ActionCodes
    return @checked dss_ccall(dss.capi.SwtControls_Get_Action, dss.ctx)
end
Action() = Action(DSS_DEFAULT_CTX)

"""
Open or Close the switch. No effect if switch is locked.  However, Reset removes any lock and then closes the switch (shelf state).

Original COM help: <https://opendss.epri.com/Action1.html>

(Setter)
"""
function Action(dss::DSSContext, Value::Union{Int,Lib.ActionCodes})
    Value = convert(Lib.ActionCodes, Value)
    @checked dss_ccall(dss.capi.SwtControls_Set_Action, dss.ctx, Value)
end
Action(Value::Union{Int,Lib.ActionCodes}) = Action(DSS_DEFAULT_CTX, Value)

"""
Time delay [s] between arming and opening or closing the switch.  Control may reset before actually operating the switch.

Original COM help: <https://opendss.epri.com/Delay3.html>

(Getter)
"""
function Delay(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.SwtControls_Get_Delay, dss.ctx)
end
Delay() = Delay(DSS_DEFAULT_CTX)

"""
Time delay [s] between arming and opening or closing the switch.  Control may reset before actually operating the switch.

Original COM help: <https://opendss.epri.com/Delay3.html>

(Setter)
"""
function Delay(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.SwtControls_Set_Delay, dss.ctx, Value)
end
Delay(Value::Float64) = Delay(DSS_DEFAULT_CTX, Value)

"""
The lock prevents both manual and automatic switch operation.

Original COM help: <https://opendss.epri.com/IsLocked.html>

(Getter)
"""
function IsLocked(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.SwtControls_Get_IsLocked, dss.ctx)) != 0
end
IsLocked() = IsLocked(DSS_DEFAULT_CTX)

"""
The lock prevents both manual and automatic switch operation.

Original COM help: <https://opendss.epri.com/IsLocked.html>

(Setter)
"""
function IsLocked(dss::DSSContext, Value::Bool)
    @checked dss_ccall(dss.capi.SwtControls_Set_IsLocked, dss.ctx, Value ? 1 : 0)
end
IsLocked(Value::Bool) = IsLocked(DSS_DEFAULT_CTX, Value)

"""
Normal state of switch (see ActionCodes) dssActionOpen or dssActionClose

(Getter)
"""
function NormalState(dss::DSSContext)::Lib.ActionCodes
    return @checked dss_ccall(dss.capi.SwtControls_Get_NormalState, dss.ctx)
end
NormalState() = NormalState(DSS_DEFAULT_CTX)

"""
Normal state of switch (see ActionCodes) dssActionOpen or dssActionClose

(Setter)
"""
function NormalState(dss::DSSContext, Value::Union{Int,Lib.ActionCodes})
    Value = convert(Lib.ActionCodes, Value)
    @checked dss_ccall(dss.capi.SwtControls_Set_NormalState, dss.ctx, Value)
end
NormalState(Value::Union{Int,Lib.ActionCodes}) = NormalState(DSS_DEFAULT_CTX, Value)

"""
Set it to force the switch to a specified state, otherwise read its present state.

Original COM help: <https://opendss.epri.com/State.html>

(Getter)
"""
function State(dss::DSSContext)::Lib.ActionCodes
    return @checked dss_ccall(dss.capi.SwtControls_Get_State, dss.ctx)
end
State() = State(DSS_DEFAULT_CTX)

"""
Set it to force the switch to a specified state, otherwise read its present state.

Original COM help: <https://opendss.epri.com/State.html>

(Setter)
"""
function State(dss::DSSContext, Value::Union{Int,Lib.ActionCodes})
    Value = convert(Lib.ActionCodes, Value)
    @checked dss_ccall(dss.capi.SwtControls_Set_State, dss.ctx, Value)
end
State(Value::Union{Int,Lib.ActionCodes}) = State(DSS_DEFAULT_CTX, Value)

"""
Full name of the switched element.

Original COM help: <https://opendss.epri.com/SwitchedObj3.html>

(Getter)
"""
function SwitchedObj(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.SwtControls_Get_SwitchedObj, dss.ctx))
end
SwitchedObj() = SwitchedObj(DSS_DEFAULT_CTX)

"""
Full name of the switched element.

Original COM help: <https://opendss.epri.com/SwitchedObj3.html>

(Setter)
"""
function SwitchedObj(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.SwtControls_Set_SwitchedObj, dss.ctx, Value)
end
SwitchedObj(Value::String) = SwitchedObj(DSS_DEFAULT_CTX, Value)

"""
Terminal number where the switch is located on the SwitchedObj

Original COM help: <https://opendss.epri.com/SwitchedTerm3.html>

(Getter)
"""
function SwitchedTerm(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.SwtControls_Get_SwitchedTerm, dss.ctx)
end
SwitchedTerm() = SwitchedTerm(DSS_DEFAULT_CTX)

"""
Terminal number where the switch is located on the SwitchedObj

Original COM help: <https://opendss.epri.com/SwitchedTerm3.html>

(Setter)
"""
function SwitchedTerm(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.SwtControls_Set_SwitchedTerm, dss.ctx, Value)
end
SwitchedTerm(Value::Int) = SwitchedTerm(DSS_DEFAULT_CTX, Value)

end
