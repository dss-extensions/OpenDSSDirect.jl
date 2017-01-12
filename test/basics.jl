module X

using OpenDSSDirect
using Base.Test


filename = string("$(dirname(@__FILE__))/../examples/8500-Node/Master.dss")

dss("""
    clear
    compile $filename
""")
loadnumber = DSS.Loads.First()
@test DSS.Loads.Name() == "138236b0"
while loadnumber > 0
    DSS.Loads.kW(50.)
    DSS.Loads.kvar(20.)
    loadnumber = DSS.Loads.Next()
end
@test DSS.Loads.Count() == 1177

end # module

module Y

using OpenDSSDirect.DSS
using Base.Test

filename = string("$(dirname(@__FILE__))/../examples/8500-Node/Master.dss")

dss("""
    clear
    compile $filename
    solve
""")

loadnumber = Loads.First()
@test Loads.Name() == "138236b0"
kWsum = 0.0
kvarsum = 0.0
while loadnumber > 0
    kWsum += Loads.kW()
    kvarsum += Loads.kvar()
    loadnumber = Loads.Next()
end

linelosssum = 0.0im
linenumber = Lines.First()
n = Lines.Count()
linelosses = zeros(Complex128, n)
for i in 1:n
    linelosssum += CktElement.Losses()[1]
    linelosses[i] = CktElement.Losses()[1]
    linenumber = Lines.Next()
end
@test_approx_eq_eps linelosssum.re Circuit.LineLosses().re * 1000  50

@test Solution.Mode() == 0

@show Circuit.Losses()
@show Circuit.SubstationLosses()
@show Circuit.LineLosses()
@show Circuit.TotalPower()
Circuit.AllElementLosses()
Circuit.AllBusNames()

end # module
