## This example shows a custom 8760-hour run. It adjusts all loads at each time step
using OpenDSSDirect.DSS

@everywhere begin
using OpenDSSDirect.DSS

basepath = joinpath(Pkg.dir(), "OpenDSSDirect", "examples", "ckt5")
include(joinpath(basepath, "../loadshape.jl"))
filename = joinpath(basepath, "Master_ckt5.dss")

dss("""
    clear
    compile $filename
    Solve  ! This executes a snaphot power flow solution of the circuit
""")
const nloads = loads(Val{:Count})
const basekw = Array(Float64, nloads)
const basekvar = Array(Float64, nloads)
function init()
    loadnumber = loads(Val{:First})
    for i in 1:length(basekw)
        basekw[i]   = loads(Val{:kW})
        basekvar[i] = loads(Val{:kvar})
        loadnumber = loads(Val{:Next})
    end
end
init()
function scaleloads(k)
    loadnumber = loads(Val{:First})
    for i in 1:length(basekw)
        loads(Val{:kW},   k * basekw[i])
        loads(Val{:kvar}, k * basekvar[i])
        loadnumber = loads(Val{:Next})
    end
end
function run_loads(idx)
    result = Array(Complex128, length(idx))
    for i in 1:length(idx)
        scaleloads(loadshape[idx[i]]) 
        solution(Val{:Solve})
        result[i] = circuit(:TotalPower)
    end
    result
end


N = nprocs()
n = length(loadshape)
numhours = 8760 ÷ N

end # @everywhere

@time res = pmap(run_loads, 
                 [(1 + (i-1)*numhours) : (i*numhours) for i in 1:N])

