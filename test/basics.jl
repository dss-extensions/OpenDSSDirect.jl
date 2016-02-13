module X

using OpenDSSDirect
using Base.Test


filename = joinpath(Pkg.dir(), "OpenDSSDirect", "examples", "8500-Node", "Master.dss")

dss("""
    clear
    compile $filename
""")
loadnumber = DSS.loads(Val{:First})
@test DSS.loads(Val{:Name}) == "138236b0"
while loadnumber > 0
    DSS.loads(Val{:kW},50.)
    DSS.loads(Val{:kvar},20.)
    loadnumber = DSS.loads(Val{:Next})
end
@test DSS.loads.Count() == 1177

end # module

module Y

using OpenDSSDirect.DSS
using Base.Test

filename = joinpath(Pkg.dir(), "OpenDSSDirect", "examples", "8500-Node", "Master.dss")

dss("""
    clear
    compile $filename
    solve
""")

loadnumber = loads(Val{:First})
@test loads(Val{:Name}) == "138236b0"
kWsum = 0.0
kvarsum = 0.0
while loadnumber > 0
    kWsum += loads(Val{:kW})
    kvarsum += loads(Val{:kvar})
    loadnumber = loads(Val{:Next})
end

linelosssum = 0.0im
linenumber = Lines(Val{:First})
n = Lines(Val{:Count})
linelosses = zeros(Complex128, n)
for i in 1:n
    linelosssum += CktElement(Val{:Losses})[1]
    linelosses[i] = CktElement(Val{:Losses})[1]
    linenumber = Lines(Val{:Next})
end
@test_approx_eq_eps linelosssum.re circuit.LineLosses().re * 1000  50

@test solution.Mode() == 0

circuit.Losses()
circuit.SubstationLosses()
circuit.LineLosses()
circuit.TotalPower()
circuit.AllElementLosses()
circuit.AllBusNames()

end # module