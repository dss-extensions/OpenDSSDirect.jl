is_windows() && __precompile__()

module OpenDSSDirect

include("core.jl")
include("api.jl")
include("repl.jl")

import .DSS.dss
export dss


is_windows() && function __init__()
    DSS.Basic.Start()
    
    global commandhelp = Dict{String, String}()
    for i in 1:DSS.Executive.NumCommands()
        commandhelp[lowercase(DSS.Executive.Command(string(i)))] = DSS.Executive.CommandHelp(string(i))
    end
    global optionhelp = Dict{String, String}()
    for i in 1:DSS.Executive.NumOptions()
        optionhelp[lowercase(DSS.Executive.Option(string(i)))] = DSS.Executive.OptionHelp(string(i))
    end
    
    if isdefined(Base, :active_repl)
        run_dss_repl()
    end
end

end # module
