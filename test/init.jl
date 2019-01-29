
using OpenDSSDirect

function init8500()
    master = joinpath(dirname(@__FILE__), "../examples/8500-Node/Master.dss") |> abspath
    OpenDSSDirect.Text.Command("""
        clear
        redirect $master
        solve
    """)

    return dirname(master) |> abspath
end

≋(x,y) = isapprox(x,y,rtol=0.000001)
