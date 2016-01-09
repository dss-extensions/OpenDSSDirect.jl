module OpenDSSDirect

include("core.jl")
include("api.jl")
include("repl.jl")

import .DSS.dss
export dss


__init__() = dss(:Start)

if isdefined(Base, :active_repl)
    run_dss_repl()
end

end # module
