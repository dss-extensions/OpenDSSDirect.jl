module SwtControls

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Reset SWT controls"""
function Reset(dss::DSSContext)
    @checked Lib.SwtControls_Reset(dss.ctx)
end
Reset() = Reset(DSS_DEFAULT_CTX)

"""Open or Close the switch. No effect if switch is locked.  However, Reset removes any lock and then closes the switch (shelf state). (Getter)"""
function Action(dss::DSSContext)::Lib.ActionCodes
    return @checked Lib.SwtControls_Get_Action(dss.ctx)
end
Action() = Action(DSS_DEFAULT_CTX)

"""Open or Close the switch. No effect if switch is locked.  However, Reset removes any lock and then closes the switch (shelf state). (Setter)"""
function Action(dss::DSSContext, Value::Union{Int,Lib.ActionCodes})
    Value = convert(Lib.ActionCodes, Value)
    @checked Lib.SwtControls_Set_Action(dss.ctx, Value)
end
Action(Value::Union{Int,Lib.ActionCodes}) = Action(DSS_DEFAULT_CTX, Value)

"""Array of strings with all SwtControl names in the active circuit."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.SwtControls_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

function Count(dss::DSSContext)::Int
    return @checked Lib.SwtControls_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Time delay [s] betwen arming and opening or closing the switch.  Control may reset before actually operating the switch. (Getter)"""
function Delay(dss::DSSContext)::Float64
    return @checked Lib.SwtControls_Get_Delay(dss.ctx)
end
Delay() = Delay(DSS_DEFAULT_CTX)

"""Time delay [s] betwen arming and opening or closing the switch.  Control may reset before actually operating the switch. (Setter)"""
function Delay(dss::DSSContext, Value::Float64)
    @checked Lib.SwtControls_Set_Delay(dss.ctx, Value)
end
Delay(Value::Float64) = Delay(DSS_DEFAULT_CTX, Value)

"""Sets the first SwtControl active. Returns 0 if no more."""
function First(dss::DSSContext)::Int
    return @checked Lib.SwtControls_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""The lock prevents both manual and automatic switch operation. (Getter)"""
function IsLocked(dss::DSSContext)::Bool
    return @checked(Lib.SwtControls_Get_IsLocked(dss.ctx)) != 0
end
IsLocked() = IsLocked(DSS_DEFAULT_CTX)

"""The lock prevents both manual and automatic switch operation. (Setter)"""
function IsLocked(dss::DSSContext, Value::Bool)
    @checked Lib.SwtControls_Set_IsLocked(dss.ctx, Value ? 1 : 0)
end
IsLocked(Value::Bool) = IsLocked(DSS_DEFAULT_CTX, Value)

"""Sets a SwtControl active by Name. (Getter)"""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.SwtControls_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a SwtControl active by Name. (Setter)"""
function Name(dss::DSSContext, Value::String)
    @checked Lib.SwtControls_Set_Name(dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Sets the next SwtControl active. Returns 0 if no more."""
function Next(dss::DSSContext)::Int
    return @checked Lib.SwtControls_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Normal state of switch (Getter)"""
function NormalState(dss::DSSContext)::Lib.ActionCodes
    return @checked Lib.SwtControls_Get_NormalState(dss.ctx)
end
NormalState() = NormalState(DSS_DEFAULT_CTX)

"""Normal state of switch (Setter)"""
function NormalState(dss::DSSContext, Value::Union{Int,Lib.ActionCodes})
    Value = convert(Lib.ActionCodes, Value)
    @checked Lib.SwtControls_Set_NormalState(dss.ctx, Value)
end
NormalState(Value::Union{Int,Lib.ActionCodes}) = NormalState(DSS_DEFAULT_CTX, Value)

"""State of switch (Getter)"""
function State(dss::DSSContext)::Lib.ActionCodes
    return @checked Lib.SwtControls_Get_State(dss.ctx)
end
State() = State(DSS_DEFAULT_CTX)

"""State of switch (Setter)"""
function State(dss::DSSContext, Value::Union{Int,Lib.ActionCodes})
    Value = convert(Lib.ActionCodes, Value)
    @checked Lib.SwtControls_Set_State(dss.ctx, Value)
end
State(Value::Union{Int,Lib.ActionCodes}) = State(DSS_DEFAULT_CTX, Value)

"""Full name of the switched element. (Getter)"""
function SwitchedObj(dss::DSSContext)::String
    return get_string(@checked Lib.SwtControls_Get_SwitchedObj(dss.ctx))
end
SwitchedObj() = SwitchedObj(DSS_DEFAULT_CTX)

"""Full name of the switched element. (Setter)"""
function SwitchedObj(dss::DSSContext, Value::String)
    @checked Lib.SwtControls_Set_SwitchedObj(dss.ctx, Value)
end
SwitchedObj(Value::String) = SwitchedObj(DSS_DEFAULT_CTX, Value)

"""Terminal number where the switch is located on the SwitchedObj (Getter)"""
function SwitchedTerm(dss::DSSContext)::Int
    return @checked Lib.SwtControls_Get_SwitchedTerm(dss.ctx)
end
SwitchedTerm() = SwitchedTerm(DSS_DEFAULT_CTX)

"""Terminal number where the switch is located on the SwitchedObj (Setter)"""
function SwitchedTerm(dss::DSSContext, Value::Int)
    @checked Lib.SwtControls_Set_SwitchedTerm(dss.ctx, Value)
end
SwitchedTerm(Value::Int) = SwitchedTerm(DSS_DEFAULT_CTX, Value)

"""SwtControl Index (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.SwtControls_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""SwtControl Index (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.SwtControls_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

end
