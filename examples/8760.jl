using OpenDSSDirect

filename = joinpath(Pkg.dir(), "OpenDSSDirect", "examples", "ckt5", "Master_ckt5.dss")

@time dss("""
    clear
    compile $filename

    New monitor.ckt5_totalizedmonitor Transformer.MDV_SUB_1 term=2 mode=1 
    New monitor.ckt5_mon element=Line.MDV201_connector terminal=1 mode=0 Residual=yes
    New monitor.ckt5_mon_p element=Line.MDV201_connector terminal=1 mode=1 Ppolar=No

    Solve  ! This executes a snaphot power flow solution of the circuit

    set mode=yearly
    set demand=true
    set DIVerbose=true
    set voltexceptionreport = true
    set casename=ckt5
    set Year=1        ! This statement resets all meters
    solve
    closeDI
""")

