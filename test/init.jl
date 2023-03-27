
using OpenDSSDirect; const ODD = OpenDSSDirect

function init8500()
    master = normpath(joinpath(dirname(@__FILE__), "../examples/8500-Node/Master.dss"))
    OpenDSSDirect.Text.Command("""
        clear
        set eventlogdefault=yes ! this is required to text the eventlog, now that it's not enable by default
        redirect $master
        solve
    """)

    return abspath(dirname(master))
end

≋(x,y) = isapprox(x,y,rtol=0.000001)
