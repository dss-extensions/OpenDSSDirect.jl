## This example shows a custom 8760-hour run. It adjusts all loads at each time step

using OpenDSSDirect.DSS

basepath = joinpath(Pkg.dir(), "OpenDSSDirect", "examples", "ckt5")
include(joinpath(basepath, "../loadshape.jl"))
filename = joinpath(basepath, "Master_ckt5.dss")

@time dss("""
    clear
    compile $filename

    Solve  ! This executes a snaphot power flow solution of the circuit
""")

function scaleloads(k, basekw, basekvar)
    loadnumber = loads(Val{:First})
    for i in 1:length(basekw)
        loads(Val{:kW},   k * basekw[i])
        loads(Val{:kvar}, k * basekvar[i])
        loadnumber = loads(Val{:Next})
    end
end
function run_loads(loadshape)
    nloads = loads(Val{:Count})
    basekw = Array(Float64, nloads)
    basekvar = Array(Float64, nloads)
    loadnumber = loads(Val{:First})
    for i in 1:length(basekw)
        basekw[i]   = loads(Val{:kW})
        basekvar[i] = loads(Val{:kvar})
        loadnumber = loads(Val{:Next})
    end
    n = length(loadshape)
    result = Array(Int, n)
    for i in 1:n
        scaleloads(loadshape[i], basekw, basekvar) 
        solution(Val{:Solve})
        result[i] = solution(Val{:Iterations})
    end
    return result
end

@time x  = run_loads(loadshape) 
# @time xs = run_loads(sort(loadshape))
