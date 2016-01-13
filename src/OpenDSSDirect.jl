module OpenDSSDirect

include("core.jl")
include("api.jl")
include("repl.jl")

import .DSS.dss
export dss


function __init__()
    dss(:Start)
    
    global commandhelp = Dict{ASCIIString, ASCIIString}()
    for i in 1:DSS.executive(:NumCommands)
        commandhelp[DSS.executive(:Command, string(i))] = DSS.executive(:CommandHelp, string(i))
    end
    global optionhelp = Dict{ASCIIString, ASCIIString}()
    for i in 1:DSS.executive(:NumOptions)
        optionhelp[DSS.executive(:Option, string(i))] = DSS.executive(:OptionHelp, string(i))
    end
    
    if isdefined(Base, :active_repl)
        run_dss_repl()
    end
end

end # module
