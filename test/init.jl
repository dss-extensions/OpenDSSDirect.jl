
using OpenDSSDirect.DSS

init8500() = dss("""
    clear
    compile $(dirname(@__FILE__))/../examples/8500-Node/Master.dss
    solve
""")

≋(x,y) = isapprox(x,y,rtol=0.000001)
