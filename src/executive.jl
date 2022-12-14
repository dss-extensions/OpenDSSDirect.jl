module Executive

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Get i-th command"""
function Command(dss::DSSContext, i::Int)::String
    return get_string(@checked Lib.DSS_Executive_Get_Command(dss.ctx, i))
end
Command(i::Int) = Command(DSS_DEFAULT_CTX, i)

"""Get help string for i-th command"""
function CommandHelp(dss::DSSContext, i::Int)::String
    return get_string(@checked Lib.DSS_Executive_Get_CommandHelp(dss.ctx, i))
end
CommandHelp(i::Int) = CommandHelp(DSS_DEFAULT_CTX, i)

"""Get i-th option"""
function Option(dss::DSSContext, i::Int)::String
    return get_string(@checked Lib.DSS_Executive_Get_Option(dss.ctx, i))
end
Option(i::Int) = Option(DSS_DEFAULT_CTX, i)

"""Get help string for i-th option"""
function OptionHelp(dss::DSSContext, i::Int)::String
    return get_string(@checked Lib.DSS_Executive_Get_OptionHelp(dss.ctx, i))
end
OptionHelp(i::Int) = OptionHelp(DSS_DEFAULT_CTX, i)

"""Get present value of i-th option"""
function OptionValue(dss::DSSContext, i::Int)::String
    return get_string(@checked Lib.DSS_Executive_Get_OptionValue(dss.ctx, i))
end
OptionValue(i::Int) = OptionValue(DSS_DEFAULT_CTX, i)

"""Number of DSS Executive Commands"""
function NumCommands(dss::DSSContext)::Int
    return @checked Lib.DSS_Executive_Get_NumCommands(dss.ctx)
end
NumCommands() = NumCommands(DSS_DEFAULT_CTX)

"""Number of DSS Executive Options"""
function NumOptions(dss::DSSContext)::Int
    return @checked Lib.DSS_Executive_Get_NumOptions(dss.ctx)
end
NumOptions() = NumOptions(DSS_DEFAULT_CTX)

end
