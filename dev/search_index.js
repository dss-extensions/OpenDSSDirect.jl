var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "Home",
    "title": "Home",
    "category": "page",
    "text": ""
},

{
    "location": "#OpenDSSDirect-1",
    "page": "Home",
    "title": "OpenDSSDirect",
    "category": "section",
    "text": "OpenDSS is an open-source distribution system simulator. This Julia package implements a \"direct\" library interface to OpenDSS. See this documentation for detailed information on the direct library interface to OpenDSS. The direct library interface can be faster than the more traditional COM interface."
},

{
    "location": "#Installation-1",
    "page": "Home",
    "title": "Installation",
    "category": "section",
    "text": "For now, this package is registered, so you can use the following to install:Open the package manager REPL (using ])(v1.1) pkg> add OpenDSSDirectTo install the latest development version, use the following from within Julia:(v1.1) pkg> dev OpenDSSDirectThis package includes OpenDSS as a library. You do not have to install OpenDSS separately. In particular, it includes the OpenDSSDirect dynamically linked library using dss_capi that implements the direct-access API.Note that this should work on 32- and 64-bit Windows systems and 64-bit Linux and Mac systems. The Windows, Mac and Linux libraries are taken from the dss_capi releases page."
},

{
    "location": "#Features-1",
    "page": "Home",
    "title": "Features",
    "category": "section",
    "text": "Julia is a fast, flexible numerical language with Matlab-like syntax. Like Python or Matlab, scripting OpenDSS can be used for Monte-Carlo batch runs, parameter sweeps, post processing and plotting of results, and more.Julia has several key features for advanced operations with OpenDSS:Parallel operations – Julia supports several ways to process data in parallel. This includes parallel operations on multiple CPU cores and parallel operations on processes in a cluster. See examples/8760_pmap.jl for an example of an annual simulation split among local CPU cores.\nOptimization – Julia has strong support for optimization.\nCustom solutions and custom models – Because Julia compiles to codes that run as quickly as C programs, it is possible to implement custom solutions, and these custom solutions can contain custom models implemented in Julia. The basic idea is to run a custom solution as described in OpenDSS Solution Interface.pdf. Custom control or power control elements can be implemented between each model iteration. See examples/low-level-solver.jl for an example with a custom solver, including a case with an alternate sparse matrix solver."
},

{
    "location": "#Example-1",
    "page": "Home",
    "title": "Example",
    "category": "section",
    "text": "The dss function is the main function for passing commands to OpenDSS. After that, a number of modules are available to access different data structures in OpenDSS. Here is an example summing the kW and kvar from loads using the Loads module:using OpenDSSDirect\nfilename = Pkg.dir(\"OpenDSSDirect\", \"examples\", \"8500-Node\", \"Master.dss\")\ndss(\"\"\"\n    clear\n    compile $filename\n    solve\n\"\"\")\n\nloadnumber = Loads.First()\nkWsum = 0.0\nkvarsum = 0.0\nwhile loadnumber > 0\n    kWsum += Loads.kW()\n    kvarsum += Loads.kvar()\n    loadnumber = Loads.Next()\nend"
},

{
    "location": "#Contents-1",
    "page": "Home",
    "title": "Contents",
    "category": "section",
    "text": "Pages = [\n    \"api.md\",\n    \"flags.md\",\n    \"dssmode.md\",\n    \"lowlevel.md\",\n    \"docindex.md\"\n]\nDepth = 1"
},

{
    "location": "api/#",
    "page": "Main API",
    "title": "Main API",
    "category": "page",
    "text": "CurrentModule = OpenDSSDirect"
},

{
    "location": "api/#Main-API-(module-DSS)-1",
    "page": "Main API",
    "title": "Main API (module DSS)",
    "category": "section",
    "text": "The dss function is the main function for passing commands to OpenDSS. You can pass multi-line commands with dss. You can also splice in Julia values with string interpolation. Here is an  example of using dss:using OpenDSSDirect\nfilename = \"C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss\"\ndss(\"\"\"\n    clear\n    compile $filename\n\"\"\")Several functions are available for setting OpenDSS variables, getting values, and initiating commands. Each of these is in one of several modules. Here is an example to set the kW of the active load element:Loads.kW(50.)Here is an example setting some loads:using OpenDSSDirect\nfilename = \"C:/OpenDSS/electricdss/IEEETestCases/8500-Node/Master.dss\"\ndss(\"\"\"\n    clear\n    compile $filename\n\"\"\")\nloadnumber = Loads.First()\nwhile loadnumber > 0\n    Loads.kW(50.)\n    Loads.kvar(20.)\n    loadnumber = Loads.Next()\nend\nprintln(Loads.Count())To use this API, you can either use import OpenDSSDirect and prepend all calls with OpenDSSDirect, or you can run using OpenDSSDirect and use the functions within each module directly. The following two are equivalent:import OpenDSSDirect\nOpenDSSDirect.Circuit.TotalPower()Importing the DSS module:using OpenDSSDirect\nCircuit.TotalPower()Many of the functions that return arrays convert to complex numbers where appropriate. Here is an example session:julia> using OpenDSSDirect\n\njulia> filename = joinpath(Pkg.dir(), \"OpenDSSDirect\", \"examples\", \"8500-Node\", \"Master.dss\");\n\njulia> dss(\"\"\"\n           clear\n           compile $filename\n       \"\"\")\n\njulia> Solution.Solve();\n\njulia> Circuit.Losses()\n1.218242333223247e6 + 2.798391857088721e6im\n\njulia> Circuit.TotalPower()\n-12004.740450109337 - 1471.1749507157301im\n\njulia> Circuit.SetActiveElement(\"Capacitor.CAPBank3\")\n6075\n\njulia> CktElement.Voltages()\n6-element Array{Complex{Float64},1}:\n  5390.82-4652.32im\n -6856.89-2274.93im\n  1284.62+7285.18im\n      0.0+0.0im\n      0.0+0.0im\n      0.0+0.0imTo find the functions available in each module, use Julia\'s help for each module (initiated by hitting ?). See below for an example.julia> using OpenDSSDirect\n\nhelp?> Circuit\nsearch: Circuit\n\n  module Circuit – Functions for interfacing with the active OpenDSS circuit.\n\n  Circuit.NumCktElements() – Number of CktElements in the circuit\n\n  Circuit.NumBuses() – Total number of Buses in the circuit\n\n  Circuit.NumNodes() – Total number of Nodes in the circuit\n\n  Circuit.FirstPCElement() – Sets the first enabled Power Conversion (PC) element in the circuit to be active; if not successful returns a 0\n\n  Circuit.NextPCElement() – Sets the next enabled Power Conversion (PC) element in the circuit to be active; if not successful returns a 0\n\n  Circuit.FirstPDElement() – Sets the first enabled Power Delivery (PD) element in the circuit to be active; if not successful returns a 0\n\n  Circuit.NextPDElement() – Sets the next enabled Power Delivery (PD) element in the circuit to be active; if not successful returns a 0\n\n  {truncated...}Here is a list of modules supported by this API. Each module has several functions."
},

{
    "location": "api/#OpenDSSDirect.dss",
    "page": "Main API",
    "title": "OpenDSSDirect.dss",
    "category": "function",
    "text": "Command() -> String\n\n\nInput command string for the DSS. (Getter)\n\n\n\n\n\nCommand(Value::String) -> String\n\n\nInput command string for the DSS. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#dss-1",
    "page": "Main API",
    "title": "dss",
    "category": "section",
    "text": "OpenDSSDirect.dss"
},

{
    "location": "api/#OpenDSSDirect.ActiveClass.ActiveClassName-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.ActiveClass.ActiveClassName",
    "category": "method",
    "text": "ActiveClassName() -> String\n\n\nReturns name of active class.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.ActiveClass.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.ActiveClass.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nArray of strings consisting of all element names in the active class.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.ActiveClass.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.ActiveClass.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of elements in Active Class. Same as NumElements Property.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.ActiveClass.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.ActiveClass.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSets first element in the active class to be the active DSS object. If object is a CktElement, ActiveCktELment also points to this element. Returns 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.ActiveClass.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.ActiveClass.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nName of the Active Element of the Active Class (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.ActiveClass.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.ActiveClass.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nName of the Active Element of the Active Class (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.ActiveClass.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.ActiveClass.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nSets next element in active class to be the active DSS object. If object is a CktElement, ActiveCktElement also points to this element.  Returns 0 if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.ActiveClass.NumElements-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.ActiveClass.NumElements",
    "category": "method",
    "text": "NumElements() -> Int64\n\n\nNumber of elements in this class. Same as Count property.\n\n\n\n\n\n"
},

{
    "location": "api/#ActiveClass-1",
    "page": "Main API",
    "title": "ActiveClass",
    "category": "section",
    "text": "Modules = [ActiveClass]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Basic.AllowForms-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.Basic.AllowForms",
    "category": "method",
    "text": "AllowForms(Value::Bool)\n\n\nGets/sets whether text output is allowed (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Basic.AllowForms-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Basic.AllowForms",
    "category": "method",
    "text": "AllowForms() -> Bool\n\n\nGets/sets whether text output is allowed (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Basic.Classes-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Basic.Classes",
    "category": "method",
    "text": "Classes() -> Array{String,1}\n\n\nList of DSS intrinsic classes (names of the classes)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Basic.ClearAll-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Basic.ClearAll",
    "category": "method",
    "text": "ClearAll()\n\n\nClear All\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Basic.DataPath-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Basic.DataPath",
    "category": "method",
    "text": "DataPath(Value::String)\n\n\nDSS Data File Path.  Default path for reports, etc. from DSS (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Basic.DataPath-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Basic.DataPath",
    "category": "method",
    "text": "DataPath() -> String\n\n\nDSS Data File Path.  Default path for reports, etc. from DSS (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Basic.DefaultEditor-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Basic.DefaultEditor",
    "category": "method",
    "text": "DefaultEditor() -> String\n\n\nReturns the path name for the default text editor.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Basic.NewCircuit-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Basic.NewCircuit",
    "category": "method",
    "text": "NewCircuit(name::String) -> String\n\n\nCreate a new circuit\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Basic.NumCircuits-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Basic.NumCircuits",
    "category": "method",
    "text": "NumCircuits() -> Int64\n\n\nNumber of Circuits currently defined\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Basic.NumClasses-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Basic.NumClasses",
    "category": "method",
    "text": "NumClasses() -> Int64\n\n\nNumber of DSS intrinsic classes\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Basic.NumUserClasses-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Basic.NumUserClasses",
    "category": "method",
    "text": "NumUserClasses() -> Int64\n\n\nNumber of user-defined classes\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Basic.Reset-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Basic.Reset",
    "category": "method",
    "text": "Reset()\n\n\nReset\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Basic.SetActiveClass-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Basic.SetActiveClass",
    "category": "method",
    "text": "SetActiveClass(ClassName::String) -> Int64\n\n\nSet the Active Class\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Basic.Start-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Basic.Start",
    "category": "method",
    "text": "Start(code::Int64) -> Bool\n\n\nSet the start code\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Basic.UserClasses-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Basic.UserClasses",
    "category": "method",
    "text": "UserClasses() -> Array{String,1}\n\n\nList of user-defined classes\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Basic.Version-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Basic.Version",
    "category": "method",
    "text": "Version() -> String\n\n\nGet version string for the DSS.\n\n\n\n\n\n"
},

{
    "location": "api/#Basic-1",
    "page": "Main API",
    "title": "Basic",
    "category": "section",
    "text": "Modules = [Basic]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Bus.Coorddefined-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.Coorddefined",
    "category": "method",
    "text": "Coorddefined() -> Bool\n\n\nIndicates whether a coordinate has been defined for this bus\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.CplxSeqVoltages-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.CplxSeqVoltages",
    "category": "method",
    "text": "CplxSeqVoltages() -> Array{Complex{Float64},1}\n\n\nComplex Double array of Sequence Voltages (0, 1, 2) at this Bus.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.Cust_Duration-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.Cust_Duration",
    "category": "method",
    "text": "Cust_Duration() -> Float64\n\n\nAccumulated customer outage durations\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.Cust_Interrupts-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.Cust_Interrupts",
    "category": "method",
    "text": "Cust_Interrupts() -> Float64\n\n\nAnnual number of customer-interruptions from this bus\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.Distance-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.Distance",
    "category": "method",
    "text": "Distance() -> Float64\n\n\nDistance from energymeter (if non-zero)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.GetUniqueNodeNumber-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.GetUniqueNodeNumber",
    "category": "method",
    "text": "GetUniqueNodeNumber(StartNumber::Int64) -> Int64\n\n\nGet unique node number\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.Int_Duration-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.Int_Duration",
    "category": "method",
    "text": "Int_Duration() -> Float64\n\n\nAverage interruption duration, hr.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.Isc-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.Isc",
    "category": "method",
    "text": "Isc() -> Array{Complex{Float64},1}\n\n\nShort circuit currents at bus; Complex Array.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.Lambda-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.Lambda",
    "category": "method",
    "text": "Lambda() -> Float64\n\n\nAccumulated failure rate downstream from this bus; faults per year\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.N_Customers-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.N_Customers",
    "category": "method",
    "text": "N_Customers() -> Int64\n\n\nTotal numbers of customers served downline from this bus\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.N_interrupts-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.N_interrupts",
    "category": "method",
    "text": "N_interrupts() -> Float64\n\n\nNumber of interruptions this bus per year\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nName of Bus\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.Nodes-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.Nodes",
    "category": "method",
    "text": "Nodes() -> Array{Int64,1}\n\n\nInteger Array of Node Numbers defined at the bus in same order as the voltages.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.NumNodes-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.NumNodes",
    "category": "method",
    "text": "NumNodes() -> Int64\n\n\nNumber of Nodes this bus.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.PuVoltage-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.PuVoltage",
    "category": "method",
    "text": "PuVoltage() -> Array{Complex{Float64},1}\n\n\nComplex Array of pu voltages at the bus.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.SectionID-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.SectionID",
    "category": "method",
    "text": "SectionID() -> Int64\n\n\nInteger ID of the feeder section in which this bus is located.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.SeqVoltages-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.SeqVoltages",
    "category": "method",
    "text": "SeqVoltages() -> Array{Float64,1}\n\n\nDouble Array of sequence voltages at this bus.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.TotalMiles-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.TotalMiles",
    "category": "method",
    "text": "TotalMiles() -> Float64\n\n\nTotal length of line downline from this bus, in miles. For recloser siting algorithm.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.VLL-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.VLL",
    "category": "method",
    "text": "VLL() -> Array{Complex{Float64},1}\n\n\nFor 2- and 3-phase buses, returns array of complex numbers representing L-L voltages in volts. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only first 3.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.VMagAngle-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.VMagAngle",
    "category": "method",
    "text": "VMagAngle() -> Array{Float64,1}\n\n\nVariant Array of doubles containing voltages in Magnitude (VLN), angle (deg) \n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.Voc-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.Voc",
    "category": "method",
    "text": "Voc() -> Array{Complex{Float64},1}\n\n\nOpen circuit voltage; Complex array.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.Voltages-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.Voltages",
    "category": "method",
    "text": "Voltages() -> Array{Complex{Float64},1}\n\n\nComplex array of voltages at this bus.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.X-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.X",
    "category": "method",
    "text": "X(Value::Float64)\n\n\nX Coordinate for bus (double) (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.X-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.X",
    "category": "method",
    "text": "X() -> Float64\n\n\nX Coordinate for bus (double) (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.Y-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.Y",
    "category": "method",
    "text": "Y(Value::Float64)\n\n\nY coordinate for bus (double)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.Y-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.Y",
    "category": "method",
    "text": "Y() -> Float64\n\n\nY coordinate for bus (double) (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.YscMatrix-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.YscMatrix",
    "category": "method",
    "text": "YscMatrix() -> Array{Complex{Float64},1}\n\n\nComplex array of Ysc matrix at bus. Column by column.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.Zsc0-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.Zsc0",
    "category": "method",
    "text": "Zsc0() -> Complex{Float64}\n\n\nComplex Zero-Sequence short circuit impedance at bus.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.Zsc1-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.Zsc1",
    "category": "method",
    "text": "Zsc1() -> Complex{Float64}\n\n\nComplex Positive-Sequence short circuit impedance at bus..\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.ZscMatrix-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.ZscMatrix",
    "category": "method",
    "text": "ZscMatrix() -> Array{Complex{Float64},1}\n\n\nComplex array of Zsc matrix at bus. Column by column.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.ZscRefresh-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.ZscRefresh",
    "category": "method",
    "text": "ZscRefresh() -> Bool\n\n\nCheck if DoZscRefresh is set\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.kVBase-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.kVBase",
    "category": "method",
    "text": "kVBase() -> Float64\n\n\nBase voltage at bus in kV\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.puVLL-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.puVLL",
    "category": "method",
    "text": "puVLL() -> Array{Complex{Float64},1}\n\n\nReturns Complex array of pu L-L voltages for 2- and 3-phase buses. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only 3 phases.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Bus.puVmagAngle-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Bus.puVmagAngle",
    "category": "method",
    "text": "puVmagAngle() -> Array{Float64,1}\n\n\nArray of doubles containing voltage magnitude, angle pairs in per unit\n\n\n\n\n\n"
},

{
    "location": "api/#Bus-1",
    "page": "Main API",
    "title": "Bus",
    "category": "section",
    "text": "Modules = [Bus]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.AddStep-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.AddStep",
    "category": "method",
    "text": "AddStep() -> Bool\n\n\nCheck if Capacitor AddStep is set\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nArray of strings with all Capacitor names in the circuit.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.AvailableSteps-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.AvailableSteps",
    "category": "method",
    "text": "AvailableSteps() -> Int64\n\n\nNumber of Steps available in cap bank to be switched ON.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.Close-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.Close",
    "category": "method",
    "text": "Close()\n\n\nClose all phases of Capacitor\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of Capacitor objects in active circuit.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSets the first Capacitor active. Returns 0 if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.IsDelta-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.IsDelta",
    "category": "method",
    "text": "IsDelta(Value::Bool)\n\n\nDelta connection or wye? (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.IsDelta-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.IsDelta",
    "category": "method",
    "text": "IsDelta() -> Bool\n\n\nDelta connection or wye? (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nSets the active Capacitor by Name. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nSets the active Capacitor by Name. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nSets the next Capacitor active. Returns 0 if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.NumSteps-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.NumSteps",
    "category": "method",
    "text": "NumSteps(Value::Int64)\n\n\nNumber of steps (default 1) for distributing and switching the total bank kVAR. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.NumSteps-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.NumSteps",
    "category": "method",
    "text": "NumSteps() -> Int64\n\n\nNumber of steps (default 1) for distributing and switching the total bank kVAR. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.Open-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.Open",
    "category": "method",
    "text": "Open()\n\n\nOpen all phases of Capacitor\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.States-Tuple{Any}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.States",
    "category": "method",
    "text": "States(Value::Any)\n\n\nArray of integer [0 ..numSteps-1] indicating the state of each step. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.States-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.States",
    "category": "method",
    "text": "States() -> Array{Int64,1}\n\n\nArray of  integer [0..numsteps-1] indicating state of each step. If value is -1 an error has occurred. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.SubtractStep-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.SubtractStep",
    "category": "method",
    "text": "SubtractStep() -> Bool\n\n\nCheck if Capacitor SubtractStep is set\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.kV-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.kV",
    "category": "method",
    "text": "kV(Value::Float64)\n\n\nBank kV rating. Use LL for 2 or 3 phases, or actual can rating for 1 phase. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.kV-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.kV",
    "category": "method",
    "text": "kV() -> Float64\n\n\nBank kV rating. Use LL for 2 or 3 phases, or actual can rating for 1 phase. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.kvar-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.kvar",
    "category": "method",
    "text": "kvar(Value::Float64)\n\n\nTotal bank KVAR, distributed equally among phases and steps. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Capacitors.kvar-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Capacitors.kvar",
    "category": "method",
    "text": "kvar() -> Float64\n\n\nTotal bank KVAR, distributed equally among phases and steps. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#Capacitors-1",
    "page": "Main API",
    "title": "Capacitors",
    "category": "section",
    "text": "Modules = [Capacitors]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.CapControls.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nArray of strings with all CapControl names.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.CTRatio-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.CTRatio",
    "category": "method",
    "text": "CTRatio(Value::Float64)\n\n\nTransducer ratio from pirmary current to control current. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.CTRatio-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.CTRatio",
    "category": "method",
    "text": "CTRatio() -> Float64\n\n\nTransducer ratio from pirmary current to control current. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.Capacitor-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.Capacitor",
    "category": "method",
    "text": "Capacitor(Value::String)\n\n\nName of the Capacitor that is controlled. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.Capacitor-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.Capacitor",
    "category": "method",
    "text": "Capacitor() -> String\n\n\nName of the Capacitor that is controlled. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of CapControls in Active Circuit\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.DeadTime-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.DeadTime",
    "category": "method",
    "text": "DeadTime(Value::Float64)\n\n\nDead Time for Capacitor Control (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.DeadTime-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.DeadTime",
    "category": "method",
    "text": "DeadTime() -> Float64\n\n\nDead Time for Capacitor Control (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.Delay-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.Delay",
    "category": "method",
    "text": "Delay(Value::Float64)\n\n\nTime delay [s] to switch on after arming.  Control may reset before actually switching. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.Delay-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.Delay",
    "category": "method",
    "text": "Delay() -> Float64\n\n\nTime delay [s] to switch on after arming.  Control may reset before actually switching. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.DelayOff-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.DelayOff",
    "category": "method",
    "text": "DelayOff(Value::Float64)\n\n\nTime delay [s] before switching off a step. Control may reset before actually switching. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.DelayOff-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.DelayOff",
    "category": "method",
    "text": "DelayOff() -> Float64\n\n\nTime delay [s] before switching off a step. Control may reset before actually switching. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSets the first CapControl as active. Return 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.Mode-Tuple{Union{Int64, CapControlModes}}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.Mode",
    "category": "method",
    "text": "Mode(Value::Union{Int64, CapControlModes})\n\n\nType of automatic controller. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.Mode-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.Mode",
    "category": "method",
    "text": "Mode() -> OpenDSSDirect.Lib.CapControlModes\n\n\nType of automatic controller. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.MonitoredObj-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.MonitoredObj",
    "category": "method",
    "text": "MonitoredObj(Value::String)\n\n\nFull name of the element that PT and CT are connected to. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.MonitoredObj-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.MonitoredObj",
    "category": "method",
    "text": "MonitoredObj() -> String\n\n\nFull name of the element that PT and CT are connected to. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.MonitoredTerm-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.MonitoredTerm",
    "category": "method",
    "text": "MonitoredTerm(Value::Int64)\n\n\nTerminal number on the element that PT and CT are connected to. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.MonitoredTerm-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.MonitoredTerm",
    "category": "method",
    "text": "MonitoredTerm() -> Int64\n\n\nTerminal number on the element that PT and CT are connected to. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nSets a CapControl active by name. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nSets a CapControl active by name. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nGets the next CapControl in the circut. Returns 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.OFFSetting-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.OFFSetting",
    "category": "method",
    "text": "OFFSetting(Value::Int64)\n\n\nThreshold to switch off a step. See Mode for units. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.OFFSetting-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.OFFSetting",
    "category": "method",
    "text": "OFFSetting() -> Int64\n\n\nThreshold to switch off a step. See Mode for units. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.ONSetting-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.ONSetting",
    "category": "method",
    "text": "ONSetting(Value::Int64)\n\n\nThreshold to arm or switch on a step.  See Mode for units. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.ONSetting-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.ONSetting",
    "category": "method",
    "text": "ONSetting() -> Int64\n\n\nThreshold to arm or switch on a step.  See Mode for units. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.PTRatio-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.PTRatio",
    "category": "method",
    "text": "PTRatio(Value::Float64)\n\n\nTransducer ratio from primary feeder to control voltage. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.PTRatio-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.PTRatio",
    "category": "method",
    "text": "PTRatio() -> Float64\n\n\nTransducer ratio from primary feeder to control voltage. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.Reset-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.Reset",
    "category": "method",
    "text": "Reset()\n\n\nReset Capacitor Controls\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.UseVoltOverride-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.UseVoltOverride",
    "category": "method",
    "text": "UseVoltOverride(Value::Bool)\n\n\nEnables Vmin and Vmax to override the control Mode (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.UseVoltOverride-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.UseVoltOverride",
    "category": "method",
    "text": "UseVoltOverride() -> Bool\n\n\nEnables Vmin and Vmax to override the control Mode (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.Vmax-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.Vmax",
    "category": "method",
    "text": "Vmax(Value::Float64)\n\n\nWith VoltOverride, swtich off whenever PT voltage exceeds this level. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.Vmax-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.Vmax",
    "category": "method",
    "text": "Vmax() -> Float64\n\n\nWith VoltOverride, swtich off whenever PT voltage exceeds this level. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.Vmin-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.Vmin",
    "category": "method",
    "text": "Vmin(Value::Float64)\n\n\nWith VoltOverride, switch ON whenever PT voltage drops below this level. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CapControls.Vmin-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CapControls.Vmin",
    "category": "method",
    "text": "Vmin() -> Float64\n\n\nWith VoltOverride, switch ON whenever PT voltage drops below this level. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#CapControls-1",
    "page": "Main API",
    "title": "CapControls",
    "category": "section",
    "text": "Modules = [CapControls]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Circuit.AllBusDistances-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.AllBusDistances",
    "category": "method",
    "text": "AllBusDistances() -> Array{Float64,1}\n\n\nReturns distance from each bus to parent EnergyMeter. Corresponds to sequence in AllBusNames.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.AllBusMagPu-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.AllBusMagPu",
    "category": "method",
    "text": "AllBusMagPu() -> Array{Float64,1}\n\n\nDouble Array of all bus voltages (each node) magnitudes in Per unit\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.AllBusNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.AllBusNames",
    "category": "method",
    "text": "AllBusNames() -> Array{String,1}\n\n\nArray of strings containing names of all buses in circuit (see AllNodeNames).\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.AllBusVMag-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.AllBusVMag",
    "category": "method",
    "text": "AllBusVMag() -> Array{Float64,1}\n\n\nArray of magnitudes (doubles) of voltages at all buses\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.AllBusVolts-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.AllBusVolts",
    "category": "method",
    "text": "AllBusVolts() -> Array{Complex{Float64},1}\n\n\nComplex array of all bus, node voltages from most recent solution\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.AllElementLosses-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.AllElementLosses",
    "category": "method",
    "text": "AllElementLosses() -> Array{Float64,1}\n\n\nArray of total losses (complex) in each circuit element\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.AllElementNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.AllElementNames",
    "category": "method",
    "text": "AllElementNames() -> Array{String,1}\n\n\nArray of strings containing Full Name of all elements.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.AllNodeDistances-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.AllNodeDistances",
    "category": "method",
    "text": "AllNodeDistances() -> Array{Float64,1}\n\n\nReturns an array of distances from parent EnergyMeter for each Node. Corresponds to AllBusVMag sequence.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.AllNodeDistancesByPhase-Tuple{Any}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.AllNodeDistancesByPhase",
    "category": "method",
    "text": "AllNodeDistancesByPhase(Phase::Any)\n\n\nReturns an array of doubles representing the distances to parent EnergyMeter. Sequence of array corresponds to other node ByPhase properties.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.AllNodeNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.AllNodeNames",
    "category": "method",
    "text": "AllNodeNames() -> Array{String,1}\n\n\nArray of strings containing full name of each node in system in same order as returned by AllBusVolts, etc.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.AllNodeNamesByPhase-Tuple{Any}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.AllNodeNamesByPhase",
    "category": "method",
    "text": "AllNodeNamesByPhase(Phase::Any)\n\n\nReturn array of strings of the node names for the By Phase criteria. Sequence corresponds to other ByPhase properties.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.AllNodeVmagByPhase-Tuple{Any}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.AllNodeVmagByPhase",
    "category": "method",
    "text": "AllNodeVmagByPhase(Phase::Any)\n\n\nReturns Array of doubles represent voltage magnitudes for nodes on the specified phase.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.AllNodeVmagPUByPhase-Tuple{Any}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.AllNodeVmagPUByPhase",
    "category": "method",
    "text": "AllNodeVmagPUByPhase(Phase::Any)\n\n\nReturns array of per unit voltage magnitudes for each node by phase\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.Capacity-Tuple{Any,Any}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.Capacity",
    "category": "method",
    "text": "Capacity(Start::Any, Increment::Any) -> Float64\n\n\nCompute capacity\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.Disable-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.Disable",
    "category": "method",
    "text": "Disable(Name::String)\n\n\nDisable circuit\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.Enable-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.Enable",
    "category": "method",
    "text": "Enable(Name::String)\n\n\nEnable circuit\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.EndOfTimeStepUpdate-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.EndOfTimeStepUpdate",
    "category": "method",
    "text": "EndOfTimeStepUpdate()\n\n\nDo end of time step update and cleanup\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.FirstElement-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.FirstElement",
    "category": "method",
    "text": "FirstElement() -> Int64\n\n\nSet first element in active class to be active\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.FirstPCElement-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.FirstPCElement",
    "category": "method",
    "text": "FirstPCElement() -> Int64\n\n\nSet first PCElement to be active\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.FirstPDElement-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.FirstPDElement",
    "category": "method",
    "text": "FirstPDElement() -> Int64\n\n\nSet first PDElement to be active\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.LineLosses-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.LineLosses",
    "category": "method",
    "text": "LineLosses() -> Complex{Float64}\n\n\nComplex total line losses in the circuit\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.Losses-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.Losses",
    "category": "method",
    "text": "Losses() -> Complex{Float64}\n\n\nTotal losses in active circuit, complex number (two-element array of double).\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nName of the active circuit.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.NextElement-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.NextElement",
    "category": "method",
    "text": "NextElement() -> Int64\n\n\nSet next element in active class to be active\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.NextPCElement-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.NextPCElement",
    "category": "method",
    "text": "NextPCElement() -> Int64\n\n\nSet next PCElement to be active\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.NextPDElement-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.NextPDElement",
    "category": "method",
    "text": "NextPDElement() -> Int64\n\n\nSet next PDElement to be active\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.NumBuses-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.NumBuses",
    "category": "method",
    "text": "NumBuses() -> Int64\n\n\nTotal number of Buses in the circuit.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.NumCktElements-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.NumCktElements",
    "category": "method",
    "text": "NumCktElements() -> Int64\n\n\nNumber of CktElements in the circuit.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.NumNodes-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.NumNodes",
    "category": "method",
    "text": "NumNodes() -> Int64\n\n\nTotal number of nodes in the circuit.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.ParentPDElement-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.ParentPDElement",
    "category": "method",
    "text": "ParentPDElement() -> Int64\n\n\nSets Parent PD element, if any, to be the active circuit element and returns index>0; Returns 0 if it fails or not applicable.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.Sample-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.Sample",
    "category": "method",
    "text": "Sample()\n\n\nSample all meters and monitors\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.SaveSample-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.SaveSample",
    "category": "method",
    "text": "SaveSample()\n\n\nSave all all meters and monitors registers and buffers\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.SetActiveBus-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.SetActiveBus",
    "category": "method",
    "text": "SetActiveBus(BusName::String) -> Int64\n\n\nSet active bus name\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.SetActiveBusi-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.SetActiveBusi",
    "category": "method",
    "text": "SetActiveBusi(BusIndex::Int64) -> Int64\n\n\nSet active bus index\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.SetActiveClass-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.SetActiveClass",
    "category": "method",
    "text": "SetActiveClass(ClassName::String) -> Int64\n\n\nSet active class name\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.SetActiveElement-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.SetActiveElement",
    "category": "method",
    "text": "SetActiveElement(FullName::String) -> Int64\n\n\nSet active element full name\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.SubstationLosses-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.SubstationLosses",
    "category": "method",
    "text": "SubstationLosses() -> Complex{Float64}\n\n\nComplex losses in all transformers designated to substations.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.SystemY-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.SystemY",
    "category": "method",
    "text": "SystemY() -> Array{Complex{Float64},2}\n\n\nSystem Y matrix (after a solution has been performed)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.TotalPower-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.TotalPower",
    "category": "method",
    "text": "TotalPower() -> Complex{Float64}\n\n\nTotal power, watts delivered to the circuit\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.UpdateStorage-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.UpdateStorage",
    "category": "method",
    "text": "UpdateStorage()\n\n\nUpdate storage\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.YCurrents-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.YCurrents",
    "category": "method",
    "text": "YCurrents() -> Array{Complex{Float64},1}\n\n\nArray of doubles containing complex injection currents for the present solution. Is is the \"I\" vector of I=YV\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.YNodeOrder-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.YNodeOrder",
    "category": "method",
    "text": "YNodeOrder() -> Array{String,1}\n\n\nArray of strings containing the names of the nodes in the same order as the Y matrix\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Circuit.YNodeVArray-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Circuit.YNodeVArray",
    "category": "method",
    "text": "YNodeVArray() -> Array{Complex{Float64},1}\n\n\nComplex array of actual node voltages in same order as SystemY matrix.\n\n\n\n\n\n"
},

{
    "location": "api/#Circuit-1",
    "page": "Main API",
    "title": "Circuit",
    "category": "section",
    "text": "Modules = [Circuit]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.CktElement.AllPropertyNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.AllPropertyNames",
    "category": "method",
    "text": "AllPropertyNames() -> Array{String,1}\n\n\nArray containing all property names of the active device.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.AllVariableNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.AllVariableNames",
    "category": "method",
    "text": "AllVariableNames() -> Array{String,1}\n\n\nArray of strings listing all the published variable names, if a PCElement. Otherwise, null string.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.AllVariableValues-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.AllVariableValues",
    "category": "method",
    "text": "AllVariableValues() -> Array{Float64,1}\n\n\nArray of doubles. Values of state variables of active element if PC element.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.BusNames-Tuple{Array{String,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.BusNames",
    "category": "method",
    "text": "BusNames(Value::Array{String,1})\n\n\nArray of strings. Set Bus definitions for each terminal is connected.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.BusNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.BusNames",
    "category": "method",
    "text": "BusNames() -> Array{String,1}\n\n\nArray of strings. Get Bus definitions to which each terminal is connected. 0-based array.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.Close-Tuple{Int64,Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.Close",
    "category": "method",
    "text": "Close(Term::Int64, Phs::Int64)\n\n\nClose phase of terminal for active circuit element\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.Controller-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.Controller",
    "category": "method",
    "text": "Controller(idx::Int64) -> String\n\n\nFull name of the i-th controller attached to this element. Ex: str = Controller(2).  See NumControls to determine valid index range\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.CplxSeqCurrents-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.CplxSeqCurrents",
    "category": "method",
    "text": "CplxSeqCurrents() -> Array{Complex{Float64},1}\n\n\nComplex double array of Sequence Currents for all conductors of all terminals of active circuit element.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.CplxSeqVoltages-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.CplxSeqVoltages",
    "category": "method",
    "text": "CplxSeqVoltages() -> Array{Complex{Float64},1}\n\n\nComplex double array of Sequence Voltage for all terminals of active circuit element.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.Currents-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.Currents",
    "category": "method",
    "text": "Currents() -> Array{Complex{Float64},1}\n\n\nComplex array of currents into each conductor of each terminal\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.CurrentsMagAng-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.CurrentsMagAng",
    "category": "method",
    "text": "CurrentsMagAng() -> Array{Float64,2}\n\n\nCurrents in magnitude, angle format as a array of doubles.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.DisplayName-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.DisplayName",
    "category": "method",
    "text": "DisplayName(Value::String)\n\n\nDisplay name of the object (not necessarily unique) (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.DisplayName-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.DisplayName",
    "category": "method",
    "text": "DisplayName() -> String\n\n\nDisplay name of the object (not necessarily unique) (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.EmergAmps-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.EmergAmps",
    "category": "method",
    "text": "EmergAmps(Value::Float64)\n\n\nEmergency Ampere Rating for PD elements (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.EmergAmps-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.EmergAmps",
    "category": "method",
    "text": "EmergAmps() -> Float64\n\n\nEmergency Ampere Rating for PD elements (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.Enabled-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.Enabled",
    "category": "method",
    "text": "Enabled(Value::Bool)\n\n\nBoolean indicating that element is currently in the circuit. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.Enabled-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.Enabled",
    "category": "method",
    "text": "Enabled() -> Bool\n\n\nBoolean indicating that element is currently in the circuit. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.EnergyMeter-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.EnergyMeter",
    "category": "method",
    "text": "EnergyMeter() -> String\n\n\nName of the Energy Meter this element is assigned to.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.GUID-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.GUID",
    "category": "method",
    "text": "GUID() -> String\n\n\nglobally unique identifier for this object\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.Handle-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.Handle",
    "category": "method",
    "text": "Handle() -> Int64\n\n\nPointer to this object\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.HasOCPDevice-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.HasOCPDevice",
    "category": "method",
    "text": "HasOCPDevice() -> Bool\n\n\nTrue if a recloser, relay, or fuse controlling this ckt element. OCP = Overcurrent Protection \n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.HasSwitchControl-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.HasSwitchControl",
    "category": "method",
    "text": "HasSwitchControl() -> Bool\n\n\nThis element has a SwtControl attached.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.HasVoltControl-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.HasVoltControl",
    "category": "method",
    "text": "HasVoltControl() -> Bool\n\n\nThis element has a CapControl or RegControl attached.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.IsOpen-Tuple{Int64,Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.IsOpen",
    "category": "method",
    "text": "IsOpen(Term::Int64, Phs::Int64) -> Bool\n\n\nCheck if open phase of terminal for active circuit element\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.Losses-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.Losses",
    "category": "method",
    "text": "Losses() -> Array{Complex{Float64},1}\n\n\nTotal losses in the element: two-element complex array\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nFull Name of Active Circuit Element\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.NodeOrder-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.NodeOrder",
    "category": "method",
    "text": "NodeOrder() -> Array{Int64,1}\n\n\nArray of integer containing the node numbers (representing phases, for example) for each conductor of each terminal. \n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.NormalAmps-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.NormalAmps",
    "category": "method",
    "text": "NormalAmps(Value::Float64)\n\n\nNormal ampere rating for PD Elements (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.NormalAmps-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.NormalAmps",
    "category": "method",
    "text": "NormalAmps() -> Float64\n\n\nNormal ampere rating for PD Elements (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.NumConductors-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.NumConductors",
    "category": "method",
    "text": "NumConductors() -> Int64\n\n\nNumber of Conductors per Terminal\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.NumControls-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.NumControls",
    "category": "method",
    "text": "NumControls() -> Int64\n\n\nNumber of controls connected to this device. Use to determine valid range for index into Controller array.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.NumPhases-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.NumPhases",
    "category": "method",
    "text": "NumPhases() -> Int64\n\n\nNumber of Phases\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.NumProperties-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.NumProperties",
    "category": "method",
    "text": "NumProperties() -> Int64\n\n\nNumber of Properties this Circuit Element.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.NumTerminals-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.NumTerminals",
    "category": "method",
    "text": "NumTerminals() -> Int64\n\n\nNumber of Terminals this Circuit Element\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.OCPDevIndex-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.OCPDevIndex",
    "category": "method",
    "text": "OCPDevIndex() -> Int64\n\n\nIndex into Controller list of OCP Device controlling this CktElement\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.OCPDevType-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.OCPDevType",
    "category": "method",
    "text": "OCPDevType() -> Int64\n\n\n0=None; 1=Fuse; 2=Recloser; 3=Relay;  Type of OCP controller device\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.Open-Tuple{Int64,Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.Open",
    "category": "method",
    "text": "Open(Term::Int64, Phs::Int64)\n\n\nOpen phase of terminal for active circuit element\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.PhaseLosses-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.PhaseLosses",
    "category": "method",
    "text": "PhaseLosses() -> Array{Complex{Float64},1}\n\n\nComplex array of losses by phase\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.Powers-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.Powers",
    "category": "method",
    "text": "Powers() -> Array{Complex{Float64},1}\n\n\nComplex array of powers into each conductor of each terminal\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.Residuals-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.Residuals",
    "category": "method",
    "text": "Residuals() -> Array{Float64,2}\n\n\nResidual currents for each terminal: (mag, angle)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.SeqCurrents-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.SeqCurrents",
    "category": "method",
    "text": "SeqCurrents() -> Array{Float64,1}\n\n\nDouble array of symmetrical component currents into each 3-phase terminal\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.SeqPowers-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.SeqPowers",
    "category": "method",
    "text": "SeqPowers() -> Array{Complex{Float64},1}\n\n\nDouble array of sequence powers into each 3-phase teminal\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.SeqVoltages-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.SeqVoltages",
    "category": "method",
    "text": "SeqVoltages() -> Array{Float64,1}\n\n\nDouble array of symmetrical component voltages at each 3-phase terminal\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.Variable-Tuple{String,Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.Variable",
    "category": "method",
    "text": "Variable(MyVarName::String, Code::Int64) -> Float64\n\n\nFor PCElement, get the value of a variable by name. If Code>0 Then no variable by this name or not a PCElement.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.Variablei-Tuple{Int64,Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.Variablei",
    "category": "method",
    "text": "Variablei(Idx::Int64, Code::Int64) -> Float64\n\n\nFor PCElement, get the value of a variable by integer index.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.Voltages-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.Voltages",
    "category": "method",
    "text": "Voltages() -> Array{Complex{Float64},1}\n\n\nComplex array of voltages at terminals\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.VoltagesMagAng-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.VoltagesMagAng",
    "category": "method",
    "text": "VoltagesMagAng() -> Array{Float64,2}\n\n\nVoltages at each conductor in magnitude, angle form as array of doubles.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CktElement.YPrim-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CktElement.YPrim",
    "category": "method",
    "text": "YPrim() -> Array{Complex{Float64},2}\n\n\nYPrim matrix, column order, complex numbers (paired)\n\n\n\n\n\n"
},

{
    "location": "api/#CktElement-1",
    "page": "Main API",
    "title": "CktElement",
    "category": "section",
    "text": "Modules = [CktElement]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.CtrlQueue.Action-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CtrlQueue.Action",
    "category": "method",
    "text": "Action(Param1::Int64)\n\n\n(write-only) Set the active action by index\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CtrlQueue.ActionCode-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CtrlQueue.ActionCode",
    "category": "method",
    "text": "ActionCode() -> OpenDSSDirect.Lib.ActionCodes\n\n\nCode for the active action. Long integer code to tell the control device what to do\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CtrlQueue.ClearActions-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CtrlQueue.ClearActions",
    "category": "method",
    "text": "ClearActions()\n\n\nClear actions for Control Queue\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CtrlQueue.ClearQueue-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CtrlQueue.ClearQueue",
    "category": "method",
    "text": "ClearQueue()\n\n\nClear queue for Control Queue\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CtrlQueue.Delete-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.CtrlQueue.Delete",
    "category": "method",
    "text": "Delete(ActionHandle::Int64)\n\n\nDelete action handle for Control Queue\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CtrlQueue.DeviceHandle-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CtrlQueue.DeviceHandle",
    "category": "method",
    "text": "DeviceHandle() -> Int64\n\n\nHandle (User defined) to device that must act on the pending action.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CtrlQueue.DoAllQueue-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CtrlQueue.DoAllQueue",
    "category": "method",
    "text": "DoAllQueue()\n\n\nDo all actions\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CtrlQueue.NumActions-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CtrlQueue.NumActions",
    "category": "method",
    "text": "NumActions() -> Int64\n\n\nNumber of Actions on the current actionlist (that have been popped off the control queue by CheckControlActions)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CtrlQueue.PopAction-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CtrlQueue.PopAction",
    "category": "method",
    "text": "PopAction() -> Int64\n\n\nPops next action off the action list and makes it the active action. Returns zero if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CtrlQueue.Queue-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CtrlQueue.Queue",
    "category": "method",
    "text": "Queue() -> Array{String,1}\n\n\nArray of strings containing the entire queue in CSV format\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CtrlQueue.QueueSize-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CtrlQueue.QueueSize",
    "category": "method",
    "text": "QueueSize() -> Int64\n\n\nNumber of items on the OpenDSS control Queue\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.CtrlQueue.Show-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.CtrlQueue.Show",
    "category": "method",
    "text": "Show()\n\n\nShow queue\n\n\n\n\n\n"
},

{
    "location": "api/#CtrlQueue-1",
    "page": "Main API",
    "title": "CtrlQueue",
    "category": "section",
    "text": "Modules = [CtrlQueue]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Element.AllPropertyNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Element.AllPropertyNames",
    "category": "method",
    "text": "AllPropertyNames() -> Array{String,1}\n\n\nArray of strings containing the names of all properties for the active DSS object.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Element.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Element.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nFull Name of Active DSS Object (general element or circuit element).\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Element.NumProperties-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Element.NumProperties",
    "category": "method",
    "text": "NumProperties() -> Int64\n\n\nNumber of Properties for the active DSS object.\n\n\n\n\n\n"
},

{
    "location": "api/#Element-1",
    "page": "Main API",
    "title": "Element",
    "category": "section",
    "text": "Modules = [Element]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Error.Description-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Error.Description",
    "category": "method",
    "text": "Description() -> String\n\n\nDescription of error for last operation\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Error.Number-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Error.Number",
    "category": "method",
    "text": "Number() -> Int64\n\n\nError Number\n\n\n\n\n\n"
},

{
    "location": "api/#Error-1",
    "page": "Main API",
    "title": "Error",
    "category": "section",
    "text": "Modules = [Error]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Executive.Command-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Executive.Command",
    "category": "method",
    "text": "Command(i::Int64) -> String\n\n\nGet i-th command\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Executive.CommandHelp-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Executive.CommandHelp",
    "category": "method",
    "text": "CommandHelp(i::Int64) -> String\n\n\nGet help string for i-th command\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Executive.NumCommands-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Executive.NumCommands",
    "category": "method",
    "text": "NumCommands() -> Int64\n\n\nNumber of DSS Executive Commands\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Executive.NumOptions-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Executive.NumOptions",
    "category": "method",
    "text": "NumOptions() -> Int64\n\n\nNumber of DSS Executive Options\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Executive.Option-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Executive.Option",
    "category": "method",
    "text": "Option(i::Int64) -> String\n\n\nGet i-th option\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Executive.OptionHelp-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Executive.OptionHelp",
    "category": "method",
    "text": "OptionHelp(i::Int64) -> String\n\n\nGet help string for i-th option\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Executive.OptionValue-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Executive.OptionValue",
    "category": "method",
    "text": "OptionValue(i::Int64) -> String\n\n\nGet present value of i-th option\n\n\n\n\n\n"
},

{
    "location": "api/#Executive-1",
    "page": "Main API",
    "title": "Executive",
    "category": "section",
    "text": "Modules = [Executive]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Fuses.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nArray of strings containing names of all Fuses in the circuit\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.Close-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.Close",
    "category": "method",
    "text": "Close()\n\n\nReset fuse\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of Fuse elements in the circuit\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.Delay-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.Delay",
    "category": "method",
    "text": "Delay(Value::Float64)\n\n\nA fixed delay time in seconds added to the fuse blowing time determined by the TCC curve. Default is 0. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.Delay-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.Delay",
    "category": "method",
    "text": "Delay() -> Float64\n\n\nA fixed delay time in seconds added to the fuse blowing time determined by the TCC curve. Default is 0. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSet the first Fuse to be the active fuse. Returns 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.Idx-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.Idx",
    "category": "method",
    "text": "Idx(Value::Int64)\n\n\nActive fuse by index into the list of fuses. 1 indexed based. 1..count (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.Idx-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.Idx",
    "category": "method",
    "text": "Idx() -> Int64\n\n\nActive fuse by index into the list of fuses. 1 indexed based. 1..count (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.IsBlown-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.IsBlown",
    "category": "method",
    "text": "IsBlown() -> Bool\n\n\nCheck if the fuse is blown for any phase\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.MonitoredObj-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.MonitoredObj",
    "category": "method",
    "text": "MonitoredObj(Value::String)\n\n\nFull name of the circuit element to which the fuse is connected.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.MonitoredObj-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.MonitoredObj",
    "category": "method",
    "text": "MonitoredObj() -> String\n\n\nFull name of the circuit element to which the fuse is connected.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.MonitoredTerm-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.MonitoredTerm",
    "category": "method",
    "text": "MonitoredTerm(Value::Int64)\n\n\nTerminal number to which the fuse is connected. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.MonitoredTerm-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.MonitoredTerm",
    "category": "method",
    "text": "MonitoredTerm() -> Int64\n\n\nTerminal number to which the fuse is connected. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nName of the active Fuse element (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nName of the active Fuse element (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nAdvance the active Fuse element pointer to the next fuse. Returns 0 if no more fuses.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.NumPhases-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.NumPhases",
    "category": "method",
    "text": "NumPhases() -> Int64\n\n\nNumber of phases, this fuse. \n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.Open-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.Open",
    "category": "method",
    "text": "Open()\n\n\nOpen all phases\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.RatedCurrent-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.RatedCurrent",
    "category": "method",
    "text": "RatedCurrent(Value::Float64)\n\n\nMultiplier or actual amps for the TCCcurve object. Defaults to 1.0.  Multipliy current values of TCC curve by this to get actual amps. Has to correspond to the Current axis of TCCcurve object. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.RatedCurrent-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.RatedCurrent",
    "category": "method",
    "text": "RatedCurrent() -> Float64\n\n\nMultiplier or actual amps for the TCCcurve object. Defaults to 1.0.  Multipliy current values of TCC curve by this to get actual amps. Has to correspond to the Current axis of TCCcurve object. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.SwitchedObj-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.SwitchedObj",
    "category": "method",
    "text": "SwitchedObj(Value::String)\n\n\nFull name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.SwitchedObj-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.SwitchedObj",
    "category": "method",
    "text": "SwitchedObj() -> String\n\n\nFull name of the circuit element switch that the fuse controls. Defaults to the MonitoredObj. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.SwitchedTerm-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.SwitchedTerm",
    "category": "method",
    "text": "SwitchedTerm(Value::Int64)\n\n\nNumber of the terminal of the controlled element containing the switch controlled by the fuse. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.SwitchedTerm-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.SwitchedTerm",
    "category": "method",
    "text": "SwitchedTerm() -> Int64\n\n\nNumber of the terminal of the controlled element containing the switch controlled by the fuse. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.TCCCurve-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.TCCCurve",
    "category": "method",
    "text": "TCCCurve(Value::String)\n\n\nName of the TCCcurve object that determines fuse blowing. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Fuses.TCCCurve-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Fuses.TCCCurve",
    "category": "method",
    "text": "TCCCurve() -> String\n\n\nName of the TCCcurve object that determines fuse blowing. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#Fuses-1",
    "page": "Main API",
    "title": "Fuses",
    "category": "section",
    "text": "Modules = [Fuses]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Generators.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nArray of names of all Generator objects.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of Generator Objects in Active Circuit\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSets first Generator to be active.  Returns 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.ForcedON-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.ForcedON",
    "category": "method",
    "text": "ForcedON(Value::Bool)\n\n\nIndicates whether the generator is forced ON regardles of other dispatch criteria.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.ForcedON-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.ForcedON",
    "category": "method",
    "text": "ForcedON() -> Bool\n\n\nIndicates whether the generator is forced ON regardles of other dispatch criteria.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.Idx-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.Idx",
    "category": "method",
    "text": "Idx(Value::Int64)\n\n\nActive Generator by index into generators list.  1..Count (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.Idx-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.Idx",
    "category": "method",
    "text": "Idx() -> Int64\n\n\nActive Generator by index into generators list.  1..Count (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.Model-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.Model",
    "category": "method",
    "text": "Model(Value::Int64)\n\n\nGenerator Model\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.Model-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.Model",
    "category": "method",
    "text": "Model() -> Int64\n\n\nGenerator Model\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nSets a generator active by name.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nSets a generator active by name.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nSets next Generator to be active.  Returns 0 if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.PF-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.PF",
    "category": "method",
    "text": "PF(Value::Float64)\n\n\nPower factor (pos. = producing vars). Updates kvar based on present kW value.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.PF-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.PF",
    "category": "method",
    "text": "PF() -> Float64\n\n\nPower factor (pos. = producing vars). Updates kvar based on present kW value.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.Phases-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.Phases",
    "category": "method",
    "text": "Phases(Value::Int64)\n\n\nNumber of phases\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.Phases-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.Phases",
    "category": "method",
    "text": "Phases() -> Int64\n\n\nNumber of phases\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.RegisterNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.RegisterNames",
    "category": "method",
    "text": "RegisterNames() -> Array{String,1}\n\n\nArray of Names of all generator energy meter registers\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.RegisterValues-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.RegisterValues",
    "category": "method",
    "text": "RegisterValues() -> Array{Float64,1}\n\n\nArray of valus in generator energy meter registers.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.Vmaxpu-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.Vmaxpu",
    "category": "method",
    "text": "Vmaxpu(Value::Float64)\n\n\nVmaxpu for generator model\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.Vmaxpu-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.Vmaxpu",
    "category": "method",
    "text": "Vmaxpu() -> Float64\n\n\nVmaxpu for generator model\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.Vminpu-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.Vminpu",
    "category": "method",
    "text": "Vminpu(Value::Float64)\n\n\nVminpu for Generator model\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.Vminpu-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.Vminpu",
    "category": "method",
    "text": "Vminpu() -> Float64\n\n\nVminpu for Generator model\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.kV-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.kV",
    "category": "method",
    "text": "kV(Value::Float64)\n\n\nVoltage base for the active generator, kV (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.kV-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.kV",
    "category": "method",
    "text": "kV() -> Float64\n\n\nVoltage base for the active generator, kV (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.kVARated-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.kVARated",
    "category": "method",
    "text": "kVARated(Value::Float64)\n\n\nkVA rating of the generator (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.kVARated-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.kVARated",
    "category": "method",
    "text": "kVARated() -> Float64\n\n\nkVA rating of the generator (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.kW-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.kW",
    "category": "method",
    "text": "kW(Value::Float64)\n\n\nkW output for the active generator. kvar is updated for current power factor. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.kW-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.kW",
    "category": "method",
    "text": "kW() -> Float64\n\n\nkW output for the active generator. kvar is updated for current power factor. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.kvar-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.kvar",
    "category": "method",
    "text": "kvar(Value::Float64)\n\n\nkvar output for the active generator. Updates power factor based on present kW value. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Generators.kvar-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Generators.kvar",
    "category": "method",
    "text": "kvar() -> Float64\n\n\nkvar output for the active generator. Updates power factor based on present kW value. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#Generators-1",
    "page": "Main API",
    "title": "Generators",
    "category": "section",
    "text": "Modules = [Generators]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Isource.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Isource.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nArray of strings containing names of all ISOURCE elements.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Isource.Amps-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Isource.Amps",
    "category": "method",
    "text": "Amps(Value::Float64)\n\n\nMagnitude of the ISOURCE in amps\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Isource.Amps-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Isource.Amps",
    "category": "method",
    "text": "Amps() -> Float64\n\n\nMagnitude of the ISOURCE in amps\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Isource.AngleDeg-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Isource.AngleDeg",
    "category": "method",
    "text": "AngleDeg(Value::Float64)\n\n\nPhase angle for ISOURCE, degrees (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Isource.AngleDeg-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Isource.AngleDeg",
    "category": "method",
    "text": "AngleDeg() -> Float64\n\n\nPhase angle for ISOURCE, degrees (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Isource.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Isource.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nCount: Number of ISOURCE elements.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Isource.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Isource.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSet the First ISOURCE to be active; returns Zero if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Isource.Frequency-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Isource.Frequency",
    "category": "method",
    "text": "Frequency(Value::Float64)\n\n\nThe present frequency of the ISOURCE, Hz (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Isource.Frequency-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Isource.Frequency",
    "category": "method",
    "text": "Frequency() -> Float64\n\n\nThe present frequency of the ISOURCE, Hz (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Isource.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Isource.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nName of Active ISOURCE (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Isource.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Isource.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nName of Active ISOURCE (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Isource.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Isource.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nSets the next ISOURCE element to be the active one. Returns Zero if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#Isource-1",
    "page": "Main API",
    "title": "Isource",
    "category": "section",
    "text": "Modules = [Isource]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nArray of strings with names of all devices\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.C0-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.C0",
    "category": "method",
    "text": "C0(Value::Float64)\n\n\nZero-sequence capacitance, nF per unit length (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.C0-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.C0",
    "category": "method",
    "text": "C0() -> Float64\n\n\nZero-sequence capacitance, nF per unit length (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.C1-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.C1",
    "category": "method",
    "text": "C1(Value::Float64)\n\n\nPositive-sequence capacitance, nF per unit length (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.C1-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.C1",
    "category": "method",
    "text": "C1() -> Float64\n\n\nPositive-sequence capacitance, nF per unit length (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Cmatrix-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Cmatrix",
    "category": "method",
    "text": "Cmatrix(Value::Array{Float64,1})\n\n\nCapacitance matrix, nF per unit length (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Cmatrix-Tuple{Array{Float64,2}}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Cmatrix",
    "category": "method",
    "text": "Cmatrix(Value::Array{Float64,2})\n\n\nCapacitance matrix, nF per unit length (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Cmatrix-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Cmatrix",
    "category": "method",
    "text": "Cmatrix() -> Array{Float64,2}\n\n\nCapacitance matrix, nF per unit length (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of LineCodes\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.EmergAmps-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.EmergAmps",
    "category": "method",
    "text": "EmergAmps(Value::Float64)\n\n\nEmergency ampere rating (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.EmergAmps-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.EmergAmps",
    "category": "method",
    "text": "EmergAmps() -> Float64\n\n\nEmergency ampere rating (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.IsZ1Z0-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.IsZ1Z0",
    "category": "method",
    "text": "IsZ1Z0() -> Bool\n\n\nFlag denoting whether impedance data were entered in symmetrical components\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nName of active LineCode (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nName of active LineCode (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.NormAmps-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.NormAmps",
    "category": "method",
    "text": "NormAmps(Value::Float64)\n\n\nNormal Ampere rating (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.NormAmps-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.NormAmps",
    "category": "method",
    "text": "NormAmps() -> Float64\n\n\nNormal Ampere rating (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Phases-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Phases",
    "category": "method",
    "text": "Phases(Value::Int64)\n\n\nNumber of Phases (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Phases-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Phases",
    "category": "method",
    "text": "Phases() -> Int64\n\n\nNumber of Phases (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.R0-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.R0",
    "category": "method",
    "text": "R0(Value::Float64)\n\n\nZero-Sequence Resistance, ohms per unit length (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.R0-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.R0",
    "category": "method",
    "text": "R0() -> Float64\n\n\nZero-Sequence Resistance, ohms per unit length (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.R1-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.R1",
    "category": "method",
    "text": "R1(Value::Float64)\n\n\nPositive-sequence resistance ohms per unit length (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.R1-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.R1",
    "category": "method",
    "text": "R1() -> Float64\n\n\nPositive-sequence resistance ohms per unit length (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Rmatrix-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Rmatrix",
    "category": "method",
    "text": "Rmatrix(Value::Array{Float64,1})\n\n\nResistance matrix, ohms per unit length (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Rmatrix-Tuple{Array{Float64,2}}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Rmatrix",
    "category": "method",
    "text": "Rmatrix(Value::Array{Float64,2})\n\n\nResistance matrix, ohms per unit length (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Rmatrix-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Rmatrix",
    "category": "method",
    "text": "Rmatrix() -> Array{Float64,2}\n\n\nResistance matrix, ohms per unit length (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Units-Tuple{Union{Int64, LineUnits}}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Units",
    "category": "method",
    "text": "Units(Value::Union{Int64, LineUnits})\n\n\nUnits of Line Code (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Units-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Units",
    "category": "method",
    "text": "Units() -> OpenDSSDirect.Lib.LineUnits\n\n\nUnits of Line Code (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.X0-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.X0",
    "category": "method",
    "text": "X0(Value::Float64)\n\n\nZero Sequence Reactance, ohms per unit length (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.X0-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.X0",
    "category": "method",
    "text": "X0() -> Float64\n\n\nZero Sequence Reactance, ohms per unit length (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.X1-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.X1",
    "category": "method",
    "text": "X1(Value::Float64)\n\n\nPositive-sequence reactance, ohms per unit length (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.X1-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.X1",
    "category": "method",
    "text": "X1() -> Float64\n\n\nPositive-sequence reactance, ohms per unit length (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Xmatrix-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Xmatrix",
    "category": "method",
    "text": "Xmatrix(Value::Array{Float64,1})\n\n\nReactance matrix, ohms per unit length (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Xmatrix-Tuple{Array{Float64,2}}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Xmatrix",
    "category": "method",
    "text": "Xmatrix(Value::Array{Float64,2})\n\n\nReactance matrix, ohms per unit length (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Xmatrix-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Xmatrix",
    "category": "method",
    "text": "Xmatrix() -> Array{Float64,2}\n\n\nReactance matrix, ohms per unit length (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Zmatrix-Tuple{Array{Complex{Float64},2}}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Zmatrix",
    "category": "method",
    "text": "Zmatrix(Value::Array{Complex{Float64},2})\n\n\nReactance matrix, ohms per unit length (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LineCodes.Zmatrix-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LineCodes.Zmatrix",
    "category": "method",
    "text": "Zmatrix() -> Array{Complex{Float64},2}\n\n\nReactance matrix, ohms per unit length (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#LineCodes-1",
    "page": "Main API",
    "title": "LineCodes",
    "category": "section",
    "text": "Modules = [LineCodes]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Lines.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nNames of all Line Objects\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Bus1-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Bus1",
    "category": "method",
    "text": "Bus1(Value::String)\n\n\nName of bus for terminal 1. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Bus1-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Bus1",
    "category": "method",
    "text": "Bus1() -> String\n\n\nName of bus for terminal 1. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Bus2-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Bus2",
    "category": "method",
    "text": "Bus2(Value::String)\n\n\nName of bus for terminal 2. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Bus2-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Bus2",
    "category": "method",
    "text": "Bus2() -> String\n\n\nName of bus for terminal 2. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.C0-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.C0",
    "category": "method",
    "text": "C0(Value::Float64)\n\n\nZero Sequence capacitance, nanofarads per unit length. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.C0-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.C0",
    "category": "method",
    "text": "C0() -> Float64\n\n\nZero Sequence capacitance, nanofarads per unit length. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.C1-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.C1",
    "category": "method",
    "text": "C1(Value::Float64)\n\n\nPositive Sequence capacitance, nanofarads per unit length. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.C1-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.C1",
    "category": "method",
    "text": "C1() -> Float64\n\n\nPositive Sequence capacitance, nanofarads per unit length. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.CMatrix-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.CMatrix",
    "category": "method",
    "text": "CMatrix(Value::Array{Float64,1})\n\n\nCapacitance matrix, nF per unit length (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.CMatrix-Tuple{Array{Float64,2}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.CMatrix",
    "category": "method",
    "text": "CMatrix(Value::Array{Float64,2})\n\n\nCapacitance matrix, nF per unit length (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.CMatrix-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.CMatrix",
    "category": "method",
    "text": "CMatrix() -> Array{Float64,2}\n\n\nCapacitance matrix, nF per unit length (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of Line objects in Active Circuit.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.EmergAmps-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.EmergAmps",
    "category": "method",
    "text": "EmergAmps(Value::Float64)\n\n\nEmergency (maximum) ampere rating of Line. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.EmergAmps-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.EmergAmps",
    "category": "method",
    "text": "EmergAmps() -> Float64\n\n\nEmergency (maximum) ampere rating of Line. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nInvoking this property sets the first element active.  Returns 0 if no lines.  Otherwise, index of the line element.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Geometry-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Geometry",
    "category": "method",
    "text": "Geometry(Value::String)\n\n\nLine geometry code (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Geometry-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Geometry",
    "category": "method",
    "text": "Geometry() -> String\n\n\nLine geometry code (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Length-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Length",
    "category": "method",
    "text": "Length(Value::Float64)\n\n\nLength of line section in units compatible with the LineCode definition. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Length-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Length",
    "category": "method",
    "text": "Length() -> Float64\n\n\nLength of line section in units compatible with the LineCode definition. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.LineCode-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.LineCode",
    "category": "method",
    "text": "LineCode(Value::String)\n\n\nName of LineCode object that defines the impedances. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.LineCode-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.LineCode",
    "category": "method",
    "text": "LineCode() -> String\n\n\nName of LineCode object that defines the impedances. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nSpecify the name of the Line element to set it active. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nSpecify the name of the Line element to set it active. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.New-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.New",
    "category": "method",
    "text": "New(Name::String) -> Int64\n\n\nCreate new Line object\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nInvoking this property advances to the next Line element active.  Returns 0 if no more lines.  Otherwise, index of the line element.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.NormAmps-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.NormAmps",
    "category": "method",
    "text": "NormAmps(Value::Float64)\n\n\nNormal ampere rating of Line. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.NormAmps-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.NormAmps",
    "category": "method",
    "text": "NormAmps() -> Float64\n\n\nNormal ampere rating of Line. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.NumCust-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.NumCust",
    "category": "method",
    "text": "NumCust() -> Int64\n\n\nNumber of customers on this line section.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Parent-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Parent",
    "category": "method",
    "text": "Parent() -> Int64\n\n\nSets Parent of the active Line to be the active line. Returns 0 if no parent or action fails.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Phases-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Phases",
    "category": "method",
    "text": "Phases(Value::Int64)\n\n\nNumber of Phases, this Line element. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Phases-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Phases",
    "category": "method",
    "text": "Phases() -> Int64\n\n\nNumber of Phases, this Line element. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.R0-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.R0",
    "category": "method",
    "text": "R0(Value::Float64)\n\n\nZero Sequence resistance, ohms per unit length. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.R0-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.R0",
    "category": "method",
    "text": "R0() -> Float64\n\n\nZero Sequence resistance, ohms per unit length. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.R1-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.R1",
    "category": "method",
    "text": "R1(Value::Float64)\n\n\nPositive Sequence resistance, ohms per unit length. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.R1-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.R1",
    "category": "method",
    "text": "R1() -> Float64\n\n\nPositive Sequence resistance, ohms per unit length. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.RMatrix-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.RMatrix",
    "category": "method",
    "text": "RMatrix(Value::Array{Float64,1})\n\n\nResistance matrix (full), ohms per unit length. Vector of doubles. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.RMatrix-Tuple{Array{Float64,2}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.RMatrix",
    "category": "method",
    "text": "RMatrix(Value::Array{Float64,2})\n\n\nResistance matrix (full), ohms per unit length. Matrix of doubles. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.RMatrix-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.RMatrix",
    "category": "method",
    "text": "RMatrix() -> Array{Float64,2}\n\n\nResistance matrix (full), ohms per unit length. Matrix of doubles. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Rg-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Rg",
    "category": "method",
    "text": "Rg(Value::Float64)\n\n\nEarth return resistance value used to compute line impedances at power frequency (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Rg-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Rg",
    "category": "method",
    "text": "Rg() -> Float64\n\n\nEarth return resistance value used to compute line impedances at power frequency (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Rho-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Rho",
    "category": "method",
    "text": "Rho(Value::Float64)\n\n\nEarth Resistivity, ohm-m (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Rho-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Rho",
    "category": "method",
    "text": "Rho() -> Float64\n\n\nEarth Resistivity, ohm-m (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Spacing-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Spacing",
    "category": "method",
    "text": "Spacing(Value::String)\n\n\nLine spacing code (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Spacing-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Spacing",
    "category": "method",
    "text": "Spacing() -> String\n\n\nLine spacing code (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.TotalCust-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.TotalCust",
    "category": "method",
    "text": "TotalCust() -> Int64\n\n\nTotal Number of customers served from this line section.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Units-Tuple{Union{Int64, LineUnits}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Units",
    "category": "method",
    "text": "Units(Value::Union{Int64, LineUnits})\n\n\nUnits for Line (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Units-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Units",
    "category": "method",
    "text": "Units() -> OpenDSSDirect.Lib.LineUnits\n\n\nUnits for Line (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.X0-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.X0",
    "category": "method",
    "text": "X0(Value::Float64)\n\n\nZero Sequence reactance ohms per unit length. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.X0-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.X0",
    "category": "method",
    "text": "X0() -> Float64\n\n\nZero Sequence reactance ohms per unit length. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.X1-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.X1",
    "category": "method",
    "text": "X1(Value::Float64)\n\n\nPositive Sequence reactance, ohms per unit length. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.X1-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.X1",
    "category": "method",
    "text": "X1() -> Float64\n\n\nPositive Sequence reactance, ohms per unit length. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.XMatrix-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.XMatrix",
    "category": "method",
    "text": "XMatrix(Value::Array{Float64,1})\n\n\nSusceptance matrix, ohms per unit length. Vector of doubles. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.XMatrix-Tuple{Array{Float64,2}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.XMatrix",
    "category": "method",
    "text": "XMatrix(Value::Array{Float64,2})\n\n\nSusceptance matrix, ohms per unit length. Matrix of doubles. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.XMatrix-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.XMatrix",
    "category": "method",
    "text": "XMatrix() -> Array{Float64,2}\n\n\nSusceptance matrix, ohms per unit length. Matrix of doubles. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Xg-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Xg",
    "category": "method",
    "text": "Xg(Value::Float64)\n\n\nEarth return reactance value used to compute line impedances at power frequency (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Xg-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Xg",
    "category": "method",
    "text": "Xg() -> Float64\n\n\nEarth return reactance value used to compute line impedances at power frequency (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Yprim-Tuple{Array{Complex{Float64},2}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Yprim",
    "category": "method",
    "text": "Yprim(Value::Array{Complex{Float64},2})\n\n\nYprimitive: Does Nothing at present on Put; Dangerous (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.Yprim-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.Yprim",
    "category": "method",
    "text": "Yprim() -> Array{Complex{Float64},2}\n\n\nYprimitive: Does Nothing at present on Put; Dangerous (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.ZMatrix-Tuple{Array{Complex{Float64},2}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.ZMatrix",
    "category": "method",
    "text": "ZMatrix(Value::Array{Complex{Float64},2})\n\n\nImpedance matrix, ohms per unit length. Matrix of doubles. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Lines.ZMatrix-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Lines.ZMatrix",
    "category": "method",
    "text": "ZMatrix() -> Array{Complex{Float64},2}\n\n\nImpedance matrix, ohms per unit length. Matrix of doubles. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#Lines-1",
    "page": "Main API",
    "title": "Lines",
    "category": "section",
    "text": "Modules = [Lines]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Loads.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nArray of strings containing all Load names\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.AllocationFactor-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.AllocationFactor",
    "category": "method",
    "text": "AllocationFactor(Value::Float64)\n\n\nFactor for allocating loads by connected xfkva (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.AllocationFactor-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.AllocationFactor",
    "category": "method",
    "text": "AllocationFactor() -> Float64\n\n\nFactor for allocating loads by connected xfkva (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.CFactor-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.CFactor",
    "category": "method",
    "text": "CFactor(Value::Float64)\n\n\nFactor relates average to peak kw.  Used for allocation with kwh and kwhdays/ (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.CFactor-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.CFactor",
    "category": "method",
    "text": "CFactor() -> Float64\n\n\nFactor relates average to peak kw.  Used for allocation with kwh and kwhdays/ (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.CVRCurve-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.CVRCurve",
    "category": "method",
    "text": "CVRCurve(Value::String)\n\n\nName of a loadshape with both Mult and Qmult, for CVR factors as a function of time. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.CVRCurve-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.CVRCurve",
    "category": "method",
    "text": "CVRCurve() -> String\n\n\nName of a loadshape with both Mult and Qmult, for CVR factors as a function of time. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.CVRvars-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.CVRvars",
    "category": "method",
    "text": "CVRvars(Value::Float64)\n\n\nPercent reduction in Q for percent reduction in V. Must be used with dssLoadModelCVR. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.CVRvars-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.CVRvars",
    "category": "method",
    "text": "CVRvars() -> Float64\n\n\nPercent reduction in Q for percent reduction in V. Must be used with dssLoadModelCVR. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.CVRwatts-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.CVRwatts",
    "category": "method",
    "text": "CVRwatts(Value::Float64)\n\n\nPercent reduction in P for percent reduction in V. Must be used with dssLoadModelCVR. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.CVRwatts-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.CVRwatts",
    "category": "method",
    "text": "CVRwatts() -> Float64\n\n\nPercent reduction in P for percent reduction in V. Must be used with dssLoadModelCVR. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Class-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Class",
    "category": "method",
    "text": "Class(Value::Int64)\n\n\nLoad Class (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Class-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Class",
    "category": "method",
    "text": "Class() -> Int64\n\n\nLoad Class (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of Load objects in active circuit.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Daily-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Daily",
    "category": "method",
    "text": "Daily(Value::String)\n\n\nName of the loadshape for a daily load profile. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Daily-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Daily",
    "category": "method",
    "text": "Daily() -> String\n\n\nName of the loadshape for a daily load profile. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Duty-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Duty",
    "category": "method",
    "text": "Duty(Value::String)\n\n\nName of the loadshape for a duty cycle simulation. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Duty-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Duty",
    "category": "method",
    "text": "Duty() -> String\n\n\nName of the loadshape for a duty cycle simulation. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSet first Load element to be active; returns 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Growth-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Growth",
    "category": "method",
    "text": "Growth(Value::String)\n\n\nName of the growthshape curve for yearly load growth factors. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Growth-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Growth",
    "category": "method",
    "text": "Growth() -> String\n\n\nName of the growthshape curve for yearly load growth factors. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Idx-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Idx",
    "category": "method",
    "text": "Idx(Value::Int64)\n\n\nLoad Index (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Idx-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Idx",
    "category": "method",
    "text": "Idx() -> Int64\n\n\nLoad Index (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.IsDelta-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.IsDelta",
    "category": "method",
    "text": "IsDelta(Value::Bool)\n\n\nDelta loads are connected line-to-line. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.IsDelta-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.IsDelta",
    "category": "method",
    "text": "IsDelta() -> Bool\n\n\nDelta loads are connected line-to-line. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Model-Tuple{Union{Int64, LoadModels}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Model",
    "category": "method",
    "text": "Model(Value::Union{Int64, LoadModels})\n\n\nThe Load Model defines variation of P and Q with voltage. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Model-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Model",
    "category": "method",
    "text": "Model() -> OpenDSSDirect.Lib.LoadModels\n\n\nThe Load Model defines variation of P and Q with voltage. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nSet active load by name. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nSet active load by name. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nSets next Load element to be active; returns 0 of none else index of active load.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.NumCust-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.NumCust",
    "category": "method",
    "text": "NumCust(Value::Int64)\n\n\nNumber of customers in this load, defaults to one. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.NumCust-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.NumCust",
    "category": "method",
    "text": "NumCust() -> Int64\n\n\nNumber of customers in this load, defaults to one. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.PF-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.PF",
    "category": "method",
    "text": "PF(Value::Float64)\n\n\nPower Factor for Active Load. Specify leading PF as negative. Updates kvar based on present value of kW value (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.PF-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.PF",
    "category": "method",
    "text": "PF() -> Float64\n\n\nPower Factor for Active Load. Specify leading PF as negative. Updates kvar based on present value of kW value (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.PctMean-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.PctMean",
    "category": "method",
    "text": "PctMean(Value::Float64)\n\n\nAverage percent of nominal load in Monte Carlo studies; only if no loadshape defined for this load. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.PctMean-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.PctMean",
    "category": "method",
    "text": "PctMean() -> Float64\n\n\nAverage percent of nominal load in Monte Carlo studies; only if no loadshape defined for this load. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.PctStdDev-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.PctStdDev",
    "category": "method",
    "text": "PctStdDev(Value::Float64)\n\n\nPercent standard deviation for Monte Carlo load studies; if there is no loadshape assigned to this load. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.PctStdDev-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.PctStdDev",
    "category": "method",
    "text": "PctStdDev() -> Float64\n\n\nPercent standard deviation for Monte Carlo load studies; if there is no loadshape assigned to this load. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.RelWeighting-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.RelWeighting",
    "category": "method",
    "text": "RelWeighting(Value::Float64)\n\n\nRelative Weighting factor for the active LOAD (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.RelWeighting-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.RelWeighting",
    "category": "method",
    "text": "RelWeighting() -> Float64\n\n\nRelative Weighting factor for the active LOAD (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Rneut-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Rneut",
    "category": "method",
    "text": "Rneut(Value::Float64)\n\n\nNeutral resistance for wye-connected loads. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Rneut-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Rneut",
    "category": "method",
    "text": "Rneut() -> Float64\n\n\nNeutral resistance for wye-connected loads. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Spectrum-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Spectrum",
    "category": "method",
    "text": "Spectrum(Value::String)\n\n\nLoad Spectrum (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Spectrum-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Spectrum",
    "category": "method",
    "text": "Spectrum() -> String\n\n\nLoad Spectrum (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Status-Tuple{Union{Int64, LoadStatus}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Status",
    "category": "method",
    "text": "Status(Value::Union{Int64, LoadStatus})\n\n\nResponse to load multipliers: Fixed (growth only), Exempt (no LD curve), Variable (all). (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Status-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Status",
    "category": "method",
    "text": "Status() -> OpenDSSDirect.Lib.LoadStatus\n\n\nResponse to load multipliers: Fixed (growth only), Exempt (no LD curve), Variable (all). (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Vmaxpu-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Vmaxpu",
    "category": "method",
    "text": "Vmaxpu(Value::Float64)\n\n\nMaximum per-unit voltage to use the load model. Above this, constant Z applies. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Vmaxpu-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Vmaxpu",
    "category": "method",
    "text": "Vmaxpu() -> Float64\n\n\nMaximum per-unit voltage to use the load model. Above this, constant Z applies. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.VminEmerg-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.VminEmerg",
    "category": "method",
    "text": "VminEmerg(Value::Float64)\n\n\nMinimum voltage for unserved energy (UE) evaluation. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.VminEmerg-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.VminEmerg",
    "category": "method",
    "text": "VminEmerg() -> Float64\n\n\nMinimum voltage for unserved energy (UE) evaluation. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.VminNorm-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.VminNorm",
    "category": "method",
    "text": "VminNorm(Value::Float64)\n\n\nMinimum voltage for energy exceeding normal (EEN) evaluations. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.VminNorm-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.VminNorm",
    "category": "method",
    "text": "VminNorm() -> Float64\n\n\nMinimum voltage for energy exceeding normal (EEN) evaluations. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Vminpu-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Vminpu",
    "category": "method",
    "text": "Vminpu(Value::Float64)\n\n\nMinimum voltage to apply the load model. Below this, constant Z is used. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Vminpu-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Vminpu",
    "category": "method",
    "text": "Vminpu() -> Float64\n\n\nMinimum voltage to apply the load model. Below this, constant Z is used. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.XfkVA-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.XfkVA",
    "category": "method",
    "text": "XfkVA(Value::Float64)\n\n\nRated service transformer kVA for load allocation, using AllocationFactor. Affects kW, kvar, and pf. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.XfkVA-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.XfkVA",
    "category": "method",
    "text": "XfkVA() -> Float64\n\n\nRated service transformer kVA for load allocation, using AllocationFactor. Affects kW, kvar, and pf. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Xneut-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Xneut",
    "category": "method",
    "text": "Xneut(Value::Float64)\n\n\nNeutral reactance for wye-connected loads. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Xneut-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Xneut",
    "category": "method",
    "text": "Xneut() -> Float64\n\n\nNeutral reactance for wye-connected loads. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Yearly-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Yearly",
    "category": "method",
    "text": "Yearly(Value::String)\n\n\nName of yearly duration loadshape (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.Yearly-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.Yearly",
    "category": "method",
    "text": "Yearly() -> String\n\n\nName of yearly duration loadshape (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.ZipV-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.ZipV",
    "category": "method",
    "text": "ZipV(Value::Array{Float64,1})\n\n\nArray of 7 doubles with values for ZIPV property of the LOAD object (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.ZipV-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.ZipV",
    "category": "method",
    "text": "ZipV() -> Array{Float64,1}\n\n\nArray of 7 doubles with values for ZIPV property of the LOAD object (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.kV-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.kV",
    "category": "method",
    "text": "kV(Value::Float64)\n\n\nSet kV rating for active Load. For 2 or more phases set Line-Line kV. Else actual kV across terminals. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.kV-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.kV",
    "category": "method",
    "text": "kV() -> Float64\n\n\nSet kV rating for active Load. For 2 or more phases set Line-Line kV. Else actual kV across terminals. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.kVABase-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.kVABase",
    "category": "method",
    "text": "kVABase(Value::Float64)\n\n\nBase load kva. Also defined kw and kvar or pf input, or load allocation by kwh or xfkva. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.kVABase-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.kVABase",
    "category": "method",
    "text": "kVABase() -> Float64\n\n\nBase load kva. Also defined kw and kvar or pf input, or load allocation by kwh or xfkva. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.kW-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.kW",
    "category": "method",
    "text": "kW(Value::Float64)\n\n\nSet kW for active Load. Updates kvar based on present PF. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.kW-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.kW",
    "category": "method",
    "text": "kW() -> Float64\n\n\nSet kW for active Load. Updates kvar based on present PF. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.kWh-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.kWh",
    "category": "method",
    "text": "kWh(Value::Float64)\n\n\nkwh billed for this period. Can be used with Cfactor for load allocation. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.kWh-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.kWh",
    "category": "method",
    "text": "kWh() -> Float64\n\n\nkwh billed for this period. Can be used with Cfactor for load allocation. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.kWhDays-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.kWhDays",
    "category": "method",
    "text": "kWhDays(Value::Float64)\n\n\nLength of kwh billing period for average demand calculation. Default 30. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.kWhDays-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.kWhDays",
    "category": "method",
    "text": "kWhDays() -> Float64\n\n\nLength of kwh billing period for average demand calculation. Default 30. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.kvar-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.kvar",
    "category": "method",
    "text": "kvar(Value::Float64)\n\n\nSet kvar for active Load. Updates PF based on present kW. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.kvar-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.kvar",
    "category": "method",
    "text": "kvar() -> Float64\n\n\nSet kvar for active Load. Updates PF based on present kW. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.puSeriesRL-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.puSeriesRL",
    "category": "method",
    "text": "puSeriesRL(Value::Float64)\n\n\nPercent of Load that is modeled as series R-L for harmonics studies (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Loads.puSeriesRL-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Loads.puSeriesRL",
    "category": "method",
    "text": "puSeriesRL() -> Float64\n\n\nPercent of Load that is modeled as series R-L for harmonics studies (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#Loads-1",
    "page": "Main API",
    "title": "Loads",
    "category": "section",
    "text": "Modules = [Loads]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nArray of strings containing names of all Loadshape objects currently defined.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of Loadshape objects currently defined in Loadshape collection\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSet the first loadshape active and return integer index of the loadshape. Returns 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.HrInterval-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.HrInterval",
    "category": "method",
    "text": "HrInterval(Value::Float64)\n\n\nFixed interval time value, hours.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.HrInterval-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.HrInterval",
    "category": "method",
    "text": "HrInterval() -> Float64\n\n\nFixed interval time value, hours.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.MinInterval-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.MinInterval",
    "category": "method",
    "text": "MinInterval(Value::Float64)\n\n\nFixed Interval time value, in minutes\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.MinInterval-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.MinInterval",
    "category": "method",
    "text": "MinInterval() -> Float64\n\n\nFixed Interval time value, in minutes\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nName of the active Loadshape (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nName of the active Loadshape (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.New-Tuple{Any}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.New",
    "category": "method",
    "text": "New(Name::Any) -> Int64\n\n\nCreate new Load Shape\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nAdvance active Loadshape to the next on in the collection. Returns 0 if no more loadshapes.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.Normalize-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.Normalize",
    "category": "method",
    "text": "Normalize()\n\n\nNormalize Load Shape\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.Npts-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.Npts",
    "category": "method",
    "text": "Npts(Value::Int64)\n\n\nNumber of points in active Loadshape. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.Npts-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.Npts",
    "category": "method",
    "text": "Npts() -> Int64\n\n\nNumber of points in active Loadshape. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.PBase-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.PBase",
    "category": "method",
    "text": "PBase(Value::Float64)\n\n\nBase for normalizing P curve (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.PBase-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.PBase",
    "category": "method",
    "text": "PBase() -> Float64\n\n\nBase for normalizing P curve (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.PMult-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.PMult",
    "category": "method",
    "text": "PMult(Value::Array{Float64,1})\n\n\nArray of Doubles for the P multiplier in the Loadshape. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.PMult-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.PMult",
    "category": "method",
    "text": "PMult() -> Array{Float64,1}\n\n\nArray of Doubles for the P multiplier in the Loadshape. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.QBase-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.QBase",
    "category": "method",
    "text": "QBase(Value::Float64)\n\n\nBase for normalizing Q curve. If left at zero, the peak value is used. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.QBase-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.QBase",
    "category": "method",
    "text": "QBase() -> Float64\n\n\nBase for normalizing Q curve. If left at zero, the peak value is used. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.QMult-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.QMult",
    "category": "method",
    "text": "QMult(Value::Array{Float64,1})\n\n\nArray of doubles containing the Q multipliers. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.QMult-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.QMult",
    "category": "method",
    "text": "QMult() -> Array{Float64,1}\n\n\nArray of doubles containing the Q multipliers. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.SInterval-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.SInterval",
    "category": "method",
    "text": "SInterval(Value::Float64)\n\n\nInterval of active loadshape in seconds (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.SInterval-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.SInterval",
    "category": "method",
    "text": "SInterval() -> Float64\n\n\nInterval of active loadshape in seconds (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.TimeArray-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.TimeArray",
    "category": "method",
    "text": "TimeArray(Value::Array{Float64,1})\n\n\nTime array in hours correscponding to P and Q multipliers when the Interval=0. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.TimeArray-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.TimeArray",
    "category": "method",
    "text": "TimeArray() -> Array{Float64,1}\n\n\nTime array in hours correscponding to P and Q multipliers when the Interval=0. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.UseActual-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.UseActual",
    "category": "method",
    "text": "UseActual(Value::Bool)\n\n\nT/F flag to let Loads know to use the actual value in the curve rather than use the value as a multiplier. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.LoadShape.UseActual-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.LoadShape.UseActual",
    "category": "method",
    "text": "UseActual() -> Bool\n\n\nT/F flag to let Loads know to use the actual value in the curve rather than use the value as a multiplier. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#LoadShape-1",
    "page": "Main API",
    "title": "LoadShape",
    "category": "section",
    "text": "Modules = [LoadShape]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Meters.AllBranchesInZone-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.AllBranchesInZone",
    "category": "method",
    "text": "AllBranchesInZone() -> Array{String,1}\n\n\nWide string list of all branches in zone of the active energymeter object.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.AllEndElements-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.AllEndElements",
    "category": "method",
    "text": "AllEndElements() -> Array{String,1}\n\n\nArray of names of all zone end elements.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nArray of all energy Meter names\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.AllocFactors-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.AllocFactors",
    "category": "method",
    "text": "AllocFactors(Value::Array{Float64,1})\n\n\nArray of doubles: set the phase allocation factors for the active meter.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.AllocFactors-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.AllocFactors",
    "category": "method",
    "text": "AllocFactors() -> Array{Float64,1}\n\n\nArray of doubles: set the phase allocation factors for the active meter.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.AvgRepairTime-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.AvgRepairTime",
    "category": "method",
    "text": "AvgRepairTime() -> Float64\n\n\nAverage Repair time in this section of the meter zone\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.CalcCurrent-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.CalcCurrent",
    "category": "method",
    "text": "CalcCurrent(Value::Array{Float64,1})\n\n\nSet the magnitude of the real part of the Calculated Current (normally determined by solution) for the Meter to force some behavior on Load Allocation\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.CalcCurrent-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.CalcCurrent",
    "category": "method",
    "text": "CalcCurrent() -> Array{Float64,1}\n\n\nSet the magnitude of the real part of the Calculated Current (normally determined by solution) for the Meter to force some behavior on Load Allocation\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.CloseAllDIFiles-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.CloseAllDIFiles",
    "category": "method",
    "text": "CloseAllDIFiles()\n\n\nClose all DI Files\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of Energy Meters in the Active Circuit\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.CountBranches-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.CountBranches",
    "category": "method",
    "text": "CountBranches() -> Int64\n\n\nNumber of branches in Active energymeter zone. (Same as sequencelist size)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.CountEndElements-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.CountEndElements",
    "category": "method",
    "text": "CountEndElements() -> Int64\n\n\nNumber of zone end elements in the active meter zone.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.CustInterrupts-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.CustInterrupts",
    "category": "method",
    "text": "CustInterrupts() -> Float64\n\n\nTotal customer interruptions for this Meter zone based on reliability calcs.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.DIFilesAreOpen-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.DIFilesAreOpen",
    "category": "method",
    "text": "DIFilesAreOpen() -> Bool\n\n\nGlobal Flag in the DSS to indicate if Demand Interval (DI) files have been properly opened.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.DoReliabilityCalc-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.DoReliabilityCalc",
    "category": "method",
    "text": "DoReliabilityCalc(AssumeRestoration::Bool)\n\n\nDo reliability calculation\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.FaultRateXRepairHrs-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.FaultRateXRepairHrs",
    "category": "method",
    "text": "FaultRateXRepairHrs() -> Float64\n\n\nSum of Fault Rate time Repair Hrs in this section of the meter zone\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSet the first energy Meter active. Returns 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.MeteredElement-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.MeteredElement",
    "category": "method",
    "text": "MeteredElement(Value::String)\n\n\nSet Name of metered element\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.MeteredElement-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.MeteredElement",
    "category": "method",
    "text": "MeteredElement() -> String\n\n\nSet Name of metered element\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.MeteredTerminal-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.MeteredTerminal",
    "category": "method",
    "text": "MeteredTerminal(Value::Int64)\n\n\nset Number of Metered Terminal\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.MeteredTerminal-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.MeteredTerminal",
    "category": "method",
    "text": "MeteredTerminal() -> Int64\n\n\nset Number of Metered Terminal\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\n(read) Get/Set the active meter  name. (write) Set a meter to be active by name.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.Name",
    "category": "method",
    "text": "Name() -> String\n\n\n(read) Get/Set the active meter  name. (write) Set a meter to be active by name.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nSets the next energy Meter active.  Returns 0 if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.NumSectionBranches-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.NumSectionBranches",
    "category": "method",
    "text": "NumSectionBranches() -> Int64\n\n\nNumber of branches (lines) in this section\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.NumSectionCustomers-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.NumSectionCustomers",
    "category": "method",
    "text": "NumSectionCustomers() -> Int64\n\n\nNumber of Customers in the active section.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.NumSections-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.NumSections",
    "category": "method",
    "text": "NumSections() -> Int64\n\n\nNumber of feeder sections in this meter\'s zone\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.OCPDeviceType-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.OCPDeviceType",
    "category": "method",
    "text": "OCPDeviceType() -> Int64\n\n\nType of OCP device. 1=Fuse; 2=Recloser; 3=Relay\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.OpenAllDIFiles-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.OpenAllDIFiles",
    "category": "method",
    "text": "OpenAllDIFiles()\n\n\nOpen all DI Files\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.PeakCurrent-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.PeakCurrent",
    "category": "method",
    "text": "PeakCurrent(Value::Array{Float64,1})\n\n\nArray of doubles to set values of Peak Current property\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.PeakCurrent-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.PeakCurrent",
    "category": "method",
    "text": "PeakCurrent() -> Array{Float64,1}\n\n\nArray of doubles to set values of Peak Current property\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.RegisterNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.RegisterNames",
    "category": "method",
    "text": "RegisterNames() -> Array{String,1}\n\n\nArray of strings containing the names of the registers.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.RegisterValues-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.RegisterValues",
    "category": "method",
    "text": "RegisterValues() -> Array{Float64,1}\n\n\nArray of all the values contained in the Meter registers for the active Meter.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.Reset-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.Reset",
    "category": "method",
    "text": "Reset()\n\n\nReset meter\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.ResetAll-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.ResetAll",
    "category": "method",
    "text": "ResetAll()\n\n\nReset all meters\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.SAIDI-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.SAIDI",
    "category": "method",
    "text": "SAIDI() -> Float64\n\n\nSAIDI for this meter\'s zone. Execute DoReliabilityCalc first.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.SAIFI-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.SAIFI",
    "category": "method",
    "text": "SAIFI() -> Float64\n\n\nReturns SAIFI for this meter\'s Zone. Execute Reliability Calc method first.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.SAIFIkW-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.SAIFIkW",
    "category": "method",
    "text": "SAIFIkW() -> Float64\n\n\nSAIFI based on kW rather than number of customers. Get after reliability calcs.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.Sample-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.Sample",
    "category": "method",
    "text": "Sample()\n\n\nSample meter\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.SampleAll-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.SampleAll",
    "category": "method",
    "text": "SampleAll()\n\n\nSample all meters\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.Save-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.Save",
    "category": "method",
    "text": "Save()\n\n\nSave meter registers\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.SaveAll-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.SaveAll",
    "category": "method",
    "text": "SaveAll()\n\n\nSave all meters registers\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.SectSeqidx-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.SectSeqidx",
    "category": "method",
    "text": "SectSeqidx() -> Int64\n\n\nSequenceIndex of the branch at the head of this section\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.SectTotalCust-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.SectTotalCust",
    "category": "method",
    "text": "SectTotalCust() -> Int64\n\n\nTotal Customers downline from this section\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.SeqListSize-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.SeqListSize",
    "category": "method",
    "text": "SeqListSize() -> Int64\n\n\nSize of Sequence List\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.SequenceList-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.SequenceList",
    "category": "method",
    "text": "SequenceList(Value::Int64)\n\n\nGet/set Index into Meter\'s SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be upline from later index. Sets PDelement active.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.SequenceList-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.SequenceList",
    "category": "method",
    "text": "SequenceList() -> Int64\n\n\nGet/set Index into Meter\'s SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be upline from later index. Sets PDelement active.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.SetActiveSection-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.SetActiveSection",
    "category": "method",
    "text": "SetActiveSection(SectIdx::Int64)\n\n\nSet active section\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.SumBranchFltRates-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.SumBranchFltRates",
    "category": "method",
    "text": "SumBranchFltRates() -> Float64\n\n\nSum of the branch fault rates in this section of the meter\'s zone\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.TotalCustomers-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.TotalCustomers",
    "category": "method",
    "text": "TotalCustomers() -> Int64\n\n\nTotal Number of customers in this zone (downline from the EnergyMeter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Meters.Totals-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Meters.Totals",
    "category": "method",
    "text": "Totals() -> Array{Float64,1}\n\n\nTotals of all registers of all meters\n\n\n\n\n\n"
},

{
    "location": "api/#Meters-1",
    "page": "Main API",
    "title": "Meters",
    "category": "section",
    "text": "Modules = [Meters]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Monitors.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\n(read-only) Array of all Monitor Names\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.ByteStream-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.ByteStream",
    "category": "method",
    "text": "ByteStream() -> Array{Int8,1}\n\n\n(read-only) Byte Array containing monitor stream values. Make sure a \"save\" is done first (standard solution modes do this automatically)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.Channel-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.Channel",
    "category": "method",
    "text": "Channel(Index::Int64)\n\n\n(read-only) Array of doubles for the specified channel  (usage: MyArray = DSSMonitor.Channel(i)) A Save or SaveAll  should be executed first. Done automatically by most standard solution modes.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\n(read-only) Number of Monitors\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.DblFreq-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.DblFreq",
    "category": "method",
    "text": "DblFreq() -> Array{Float64,1}\n\n\n(read-only) Array of doubles containing frequency values for harmonics mode solutions; Empty for time mode solutions (use dblHour)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.DblHour-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.DblHour",
    "category": "method",
    "text": "DblHour() -> Array{Float64,1}\n\n\n(read-only) Array of doubles containgin time value in hours for time-sampled monitor values; Empty if frequency-sampled values for harmonics solution  (see dblFreq)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.Element-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.Element",
    "category": "method",
    "text": "Element(Value::String)\n\n\nFull object name of element being monitored.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.Element-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.Element",
    "category": "method",
    "text": "Element() -> String\n\n\nFull object name of element being monitored.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.FileName-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.FileName",
    "category": "method",
    "text": "FileName() -> String\n\n\n(read-only) Name of CSV file associated with active Monitor.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.FileVersion-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.FileVersion",
    "category": "method",
    "text": "FileVersion() -> Int64\n\n\n(read-only) Monitor File Version (integer)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.First",
    "category": "method",
    "text": "First() -> Int64\n\n\n(read-only) Sets the first Monitor active.  Returns 0 if no monitors.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.Header-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.Header",
    "category": "method",
    "text": "Header() -> Array{String,1}\n\n\n(read-only) Header string;  Array of strings containing Channel names\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.Mode-Tuple{Union{Int64, MonitorModes}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.Mode",
    "category": "method",
    "text": "Mode(Value::Union{Int64, MonitorModes})\n\n\nSet Monitor mode (bitmask integer - see DSS Help)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.Mode-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.Mode",
    "category": "method",
    "text": "Mode() -> OpenDSSDirect.Lib.MonitorModes\n\n\nSet Monitor mode (bitmask integer - see DSS Help)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nSets the active Monitor object by name\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nSets the active Monitor object by name\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\n(read-only) Sets next monitor active.  Returns 0 if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.NumChannels-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.NumChannels",
    "category": "method",
    "text": "NumChannels() -> Int64\n\n\n(read-only) Number of Channels in the active Monitor\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.RecordSize-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.RecordSize",
    "category": "method",
    "text": "RecordSize() -> Int64\n\n\n(read-only) Size of each record in ByteStream (Integer). Same as NumChannels.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.SampleCount-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.SampleCount",
    "category": "method",
    "text": "SampleCount() -> Int64\n\n\n(read-only) Number of Samples in Monitor at Present\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.Terminal-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.Terminal",
    "category": "method",
    "text": "Terminal(Value::Int64)\n\n\nTerminal number of element being monitored.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Monitors.Terminal-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Monitors.Terminal",
    "category": "method",
    "text": "Terminal() -> Int64\n\n\nTerminal number of element being monitored.\n\n\n\n\n\n"
},

{
    "location": "api/#Monitors-1",
    "page": "Main API",
    "title": "Monitors",
    "category": "section",
    "text": "Modules = [Monitors]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Parser.AutoIncrement-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.AutoIncrement",
    "category": "method",
    "text": "AutoIncrement(Value::Bool)\n\n\nDefault is FALSE. If TRUE parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don\'t need to check for parameter names.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.AutoIncrement-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.AutoIncrement",
    "category": "method",
    "text": "AutoIncrement() -> Bool\n\n\nDefault is FALSE. If TRUE parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don\'t need to check for parameter names.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.BeginQuote-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.BeginQuote",
    "category": "method",
    "text": "BeginQuote(Value::String)\n\n\nString containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is \"\'([{.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.BeginQuote-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.BeginQuote",
    "category": "method",
    "text": "BeginQuote() -> String\n\n\nString containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is \"\'([{.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.CmdString-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.CmdString",
    "category": "method",
    "text": "CmdString(Value::String)\n\n\nString to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.CmdString-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.CmdString",
    "category": "method",
    "text": "CmdString() -> String\n\n\nString to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.DblValue-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.DblValue",
    "category": "method",
    "text": "DblValue() -> Float64\n\n\nReturn next parameter as a double.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.Delimiters-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.Delimiters",
    "category": "method",
    "text": "Delimiters(Value::String)\n\n\nString defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitesspace to separate tokens.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.Delimiters-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.Delimiters",
    "category": "method",
    "text": "Delimiters() -> String\n\n\nString defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitesspace to separate tokens.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.EndQuote-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.EndQuote",
    "category": "method",
    "text": "EndQuote(Value::String)\n\n\nString containing characters, in order, that match the beginning quote characters in BeginQuote. Default is \"\')]} (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.EndQuote-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.EndQuote",
    "category": "method",
    "text": "EndQuote() -> String\n\n\nString containing characters, in order, that match the beginning quote characters in BeginQuote. Default is \"\')]} (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.IntValue-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.IntValue",
    "category": "method",
    "text": "IntValue() -> Int64\n\n\nReturn next parameter as a long integer.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.Matrix-Tuple{Any}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.Matrix",
    "category": "method",
    "text": "Matrix(ExpectedOrder::Any)\n\n\nUse this property to parse a Matrix token in OpenDSS format.  Returns square matrix of order specified. Order same as default Fortran order: column by column.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.NextParam-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.NextParam",
    "category": "method",
    "text": "NextParam() -> String\n\n\nGet next token and return tag name (before = sign) if any. See AutoIncrement.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.StrValue-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.StrValue",
    "category": "method",
    "text": "StrValue() -> String\n\n\nReturn next parameter as a string\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.SymMatrix-Tuple{Any}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.SymMatrix",
    "category": "method",
    "text": "SymMatrix(ExpectedOrder::Any)\n\n\nUse this property to parse a matrix token specified in lower triangle form. Symmetry is forced.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.Vector-Tuple{Any}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.Vector",
    "category": "method",
    "text": "Vector(ExpectedSize::Any)\n\n\nReturns token as array of doubles. For parsing quoted array syntax.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.WhiteSpace-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.WhiteSpace",
    "category": "method",
    "text": "WhiteSpace(Value::String)\n\n\nCharacters used for White space in the command string.  Default is blank and Tab. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Parser.WhiteSpace-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Parser.WhiteSpace",
    "category": "method",
    "text": "WhiteSpace() -> String\n\n\nCharacters used for White space in the command string.  Default is blank and Tab. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#Parser-1",
    "page": "Main API",
    "title": "Parser",
    "category": "section",
    "text": "Modules = [Parser]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.PDElements.AccumulatedL-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.AccumulatedL",
    "category": "method",
    "text": "AccumulatedL() -> Float64\n\n\naccummulated failure rate for this branch on downline\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of PD elements (including disabled elements)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.FaultRate-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.FaultRate",
    "category": "method",
    "text": "FaultRate(Value::Float64)\n\n\nNumber of failures per year. For LINE elements: Number of failures per unit length per year. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.FaultRate-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.FaultRate",
    "category": "method",
    "text": "FaultRate() -> Float64\n\n\nNumber of failures per year. For LINE elements: Number of failures per unit length per year. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSet the first enabled PD element to be the active element.  Returns 0 if none found.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.FromTerminal-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.FromTerminal",
    "category": "method",
    "text": "FromTerminal() -> Int64\n\n\nNumber of the terminal of active PD element that is on the \"from\" side. This is set after the meter zone is determined.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.IsShunt-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.IsShunt",
    "category": "method",
    "text": "IsShunt() -> Bool\n\n\nVariant boolean indicating of PD element should be treated as a shunt element rather than a series element. Applies to Capacitor and Reactor elements in particular.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.Lambda-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.Lambda",
    "category": "method",
    "text": "Lambda() -> Float64\n\n\nFailure rate for this branch. Faults per year including length of line.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nName of active PD Element. Returns null string if active element is not PDElement type. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nName of active PD Element. Returns null string if active element is not PDElement type. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nAdvance to the next PD element in the circuit. Enabled elements only. Returns 0 when no more elements.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.NumCustomers-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.NumCustomers",
    "category": "method",
    "text": "NumCustomers() -> Int64\n\n\nNumber of customers, this branch\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.ParentPDElement-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.ParentPDElement",
    "category": "method",
    "text": "ParentPDElement() -> Int64\n\n\nSets the parent PD element to be the active circuit element.  Returns 0 if no more elements upline.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.PctPermanent-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.PctPermanent",
    "category": "method",
    "text": "PctPermanent(Value::Float64)\n\n\nGet/Set percent of faults that are permanent (require repair). Otherwise, fault is assumed to be transient/temporary. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.PctPermanent-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.PctPermanent",
    "category": "method",
    "text": "PctPermanent() -> Float64\n\n\nGet/Set percent of faults that are permanent (require repair). Otherwise, fault is assumed to be transient/temporary. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.RepairTime-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.RepairTime",
    "category": "method",
    "text": "RepairTime(Value::Float64)\n\n\nAverage repair time for this element in hours (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.RepairTime-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.RepairTime",
    "category": "method",
    "text": "RepairTime() -> Float64\n\n\nAverage repair time for this element in hours (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.SectionID-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.SectionID",
    "category": "method",
    "text": "SectionID() -> Int64\n\n\nInteger ID of the feeder section that this PDElement branch is part of\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.TotalCustomers-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.TotalCustomers",
    "category": "method",
    "text": "TotalCustomers() -> Int64\n\n\nTotal number of customers from this branch to the end of the zone\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PDElements.TotalMiles-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PDElements.TotalMiles",
    "category": "method",
    "text": "TotalMiles() -> Float64\n\n\nTotal miles of line from this element to the end of the zone. For recloser siting algorithm.\n\n\n\n\n\n"
},

{
    "location": "api/#PDElements-1",
    "page": "Main API",
    "title": "PDElements",
    "category": "section",
    "text": "Modules = [PDElements]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Progress.Caption-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Progress.Caption",
    "category": "method",
    "text": "Caption(Value::String)\n\n\nCaption to appear on the bottom of the DSS Progress form.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Progress.Close-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Progress.Close",
    "category": "method",
    "text": "Close()\n\n\nClose progress\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Progress.PctProgress-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Progress.PctProgress",
    "category": "method",
    "text": "PctProgress(Value::Int64)\n\n\nPercent progress to indicate [0..100]\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Progress.Show-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Progress.Show",
    "category": "method",
    "text": "Show()\n\n\nShow progress\n\n\n\n\n\n"
},

{
    "location": "api/#Progress-1",
    "page": "Main API",
    "title": "Progress",
    "category": "section",
    "text": "Modules = [Progress]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Properties.Description-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Properties.Description",
    "category": "method",
    "text": "Description() -> String\n\n\nDescription of the property.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Properties.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Properties.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nName of Property\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Properties.Value-Tuple{Union{Int64, String},String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Properties.Value",
    "category": "method",
    "text": "Value(argIndex_or_Name::Union{Int64, String}, Value::String)\n\n\nValue of Property of Index or Name (setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Properties.Value-Tuple{Union{Int64, String}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Properties.Value",
    "category": "method",
    "text": "Value(argIndex_or_Name::Union{Int64, String}) -> String\n\n\nValue of Property of Index or Name (getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Properties.Value-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Properties.Value",
    "category": "method",
    "text": "Value() -> String\n\n\nValue of Property (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Properties._setCurrentProperty-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Properties._setCurrentProperty",
    "category": "method",
    "text": "_setCurrentProperty(argIndex::Int64)\n\n\nSets the current DSS property based on a 1-based integer (or integer as a string) as an property index, or a string as a property name.\n\n\n\n\n\n"
},

{
    "location": "api/#Properties-1",
    "page": "Main API",
    "title": "Properties",
    "category": "section",
    "text": "Modules = [Properties]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nVariant array of strings with all PVSystem names\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of PVSystems\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSet first PVSystem active; returns 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.Idx-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.Idx",
    "category": "method",
    "text": "Idx(Value::Int64)\n\n\nActive PVSystem by index;  1..Count (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.Idx-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.Idx",
    "category": "method",
    "text": "Idx() -> Int64\n\n\nActive PVSystem by index;  1..Count (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.Irradiance-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.Irradiance",
    "category": "method",
    "text": "Irradiance(Value::Float64)\n\n\nPresent value of the Irradiance property in W/sq-m (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.Irradiance-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.Irradiance",
    "category": "method",
    "text": "Irradiance() -> Float64\n\n\nPresent value of the Irradiance property in W/sq-m (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nName of the active PVSystem (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nName of the active PVSystem (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nSets next PVSystem active; returns 0 if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.RegisterNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.RegisterNames",
    "category": "method",
    "text": "RegisterNames() -> Array{String,1}\n\n\nVariant Array of PVSYSTEM energy meter register names\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.RegisterValues-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.RegisterValues",
    "category": "method",
    "text": "RegisterValues() -> Array{Float64,1}\n\n\nArray of doubles containing values in PVSystem registers.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.kVARated-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.kVARated",
    "category": "method",
    "text": "kVARated(Value::Float64)\n\n\nRated kVA of the PVSystem (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.kVARated-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.kVARated",
    "category": "method",
    "text": "kVARated() -> Float64\n\n\nRated kVA of the PVSystem (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.kW-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.kW",
    "category": "method",
    "text": "kW() -> Float64\n\n\nget kW output\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.kvar-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.kvar",
    "category": "method",
    "text": "kvar(Value::Float64)\n\n\nkvar value (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.kvar-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.kvar",
    "category": "method",
    "text": "kvar() -> Float64\n\n\nkvar value (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.pf-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.pf",
    "category": "method",
    "text": "pf(Value::Float64)\n\n\nPower factor (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.PVsystems.pf-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.PVsystems.pf",
    "category": "method",
    "text": "pf() -> Float64\n\n\nPower factor (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#PVsystems-1",
    "page": "Main API",
    "title": "PVsystems",
    "category": "section",
    "text": "Modules = [PVsystems]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nArray of strings with names of all Reclosers in Active Circuit\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.Close-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.Close",
    "category": "method",
    "text": "Close()\n\n\nClose recloser\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of Reclosers in active circuit.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSet First Recloser to be Active Ckt Element. Returns 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.GroundInst-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.GroundInst",
    "category": "method",
    "text": "GroundInst(Value::Float64)\n\n\nGround (3I0) instantaneous trip setting - instantaneous curve multipler or actual amps. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.GroundInst-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.GroundInst",
    "category": "method",
    "text": "GroundInst() -> Float64\n\n\nGround (3I0) instantaneous trip setting - instantaneous curve multipler or actual amps. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.GroundTrip-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.GroundTrip",
    "category": "method",
    "text": "GroundTrip(Value::Float64)\n\n\nGround (3I0) trip multiplier or actual amps (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.GroundTrip-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.GroundTrip",
    "category": "method",
    "text": "GroundTrip() -> Float64\n\n\nGround (3I0) trip multiplier or actual amps (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.Idx-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.Idx",
    "category": "method",
    "text": "Idx(Value::Int64)\n\n\nGet/Set the active Recloser by index into the recloser list.  1..Count (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.Idx-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.Idx",
    "category": "method",
    "text": "Idx() -> Int64\n\n\nGet/Set the active Recloser by index into the recloser list.  1..Count (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.MonitoredObj-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.MonitoredObj",
    "category": "method",
    "text": "MonitoredObj(Value::String)\n\n\nFull name of object the Recloser is monitoring. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.MonitoredObj-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.MonitoredObj",
    "category": "method",
    "text": "MonitoredObj() -> String\n\n\nFull name of object the Recloser is monitoring. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.MonitoredTerm-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.MonitoredTerm",
    "category": "method",
    "text": "MonitoredTerm(Value::Int64)\n\n\nTerminal number of Monitored object for the Recloser (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.MonitoredTerm-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.MonitoredTerm",
    "category": "method",
    "text": "MonitoredTerm() -> Int64\n\n\nTerminal number of Monitored object for the Recloser (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nGet Name of active Recloser or set the active Recloser by name. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nGet Name of active Recloser or set the active Recloser by name. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nIterate to the next recloser in the circuit. Returns zero if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.NumFast-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.NumFast",
    "category": "method",
    "text": "NumFast(Value::Int64)\n\n\nNumber of fast shots (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.NumFast-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.NumFast",
    "category": "method",
    "text": "NumFast() -> Int64\n\n\nNumber of fast shots (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.Open-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.Open",
    "category": "method",
    "text": "Open()\n\n\nOpen recloser\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.PhaseInst-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.PhaseInst",
    "category": "method",
    "text": "PhaseInst(Value::Float64)\n\n\nPhase instantaneous curve multipler or actual amps (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.PhaseInst-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.PhaseInst",
    "category": "method",
    "text": "PhaseInst() -> Float64\n\n\nPhase instantaneous curve multipler or actual amps (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.PhaseTrip-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.PhaseTrip",
    "category": "method",
    "text": "PhaseTrip(Value::Float64)\n\n\nPhase trip curve multiplier or actual amps (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.PhaseTrip-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.PhaseTrip",
    "category": "method",
    "text": "PhaseTrip() -> Float64\n\n\nPhase trip curve multiplier or actual amps (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.RecloseIntervals-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.RecloseIntervals",
    "category": "method",
    "text": "RecloseIntervals() -> Array{Float64,1}\n\n\nVariant Array of Doubles: reclose intervals, s, between shots.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.Shots-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.Shots",
    "category": "method",
    "text": "Shots(Value::Int64)\n\n\nNumber of shots to lockout (fast + delayed) (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.Shots-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.Shots",
    "category": "method",
    "text": "Shots() -> Int64\n\n\nNumber of shots to lockout (fast + delayed) (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.SwitchedObj-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.SwitchedObj",
    "category": "method",
    "text": "SwitchedObj(Value::String)\n\n\nFull name of the circuit element that is being switched by the Recloser. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.SwitchedObj-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.SwitchedObj",
    "category": "method",
    "text": "SwitchedObj() -> String\n\n\nFull name of the circuit element that is being switched by the Recloser. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.SwitchedTerm-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.SwitchedTerm",
    "category": "method",
    "text": "SwitchedTerm(Value::Int64)\n\n\nTerminal number of the controlled device being switched by the Recloser (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Reclosers.SwitchedTerm-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Reclosers.SwitchedTerm",
    "category": "method",
    "text": "SwitchedTerm() -> Int64\n\n\nTerminal number of the controlled device being switched by the Recloser (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#Reclosers-1",
    "page": "Main API",
    "title": "Reclosers",
    "category": "section",
    "text": "Modules = [Reclosers]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.RegControls.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nArray of strings containing all RegControl names\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.CTPrimary-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.CTPrimary",
    "category": "method",
    "text": "CTPrimary(Value::Float64)\n\n\nCT primary ampere rating (secondary is 0.2 amperes) (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.CTPrimary-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.CTPrimary",
    "category": "method",
    "text": "CTPrimary() -> Float64\n\n\nCT primary ampere rating (secondary is 0.2 amperes) (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of RegControl objects in Active Circuit\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.Delay-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.Delay",
    "category": "method",
    "text": "Delay(Value::Float64)\n\n\nTime delay [s] after arming before the first tap change. Control may reset before actually changing taps. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.Delay-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.Delay",
    "category": "method",
    "text": "Delay() -> Float64\n\n\nTime delay [s] after arming before the first tap change. Control may reset before actually changing taps. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSets the first RegControl active. Returns 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.ForwardBand-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.ForwardBand",
    "category": "method",
    "text": "ForwardBand(Value::Float64)\n\n\nRegulation bandwidth in forward direciton, centered on Vreg (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.ForwardBand-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.ForwardBand",
    "category": "method",
    "text": "ForwardBand() -> Float64\n\n\nRegulation bandwidth in forward direciton, centered on Vreg (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.ForwardR-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.ForwardR",
    "category": "method",
    "text": "ForwardR(Value::Float64)\n\n\nLDC R setting in Volts (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.ForwardR-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.ForwardR",
    "category": "method",
    "text": "ForwardR() -> Float64\n\n\nLDC R setting in Volts (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.ForwardVreg-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.ForwardVreg",
    "category": "method",
    "text": "ForwardVreg(Value::Float64)\n\n\nTarget voltage in the forward direction, on PT secondary base. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.ForwardVreg-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.ForwardVreg",
    "category": "method",
    "text": "ForwardVreg() -> Float64\n\n\nTarget voltage in the forward direction, on PT secondary base. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.ForwardX-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.ForwardX",
    "category": "method",
    "text": "ForwardX(Value::Float64)\n\n\nLDC X setting in Volts (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.ForwardX-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.ForwardX",
    "category": "method",
    "text": "ForwardX() -> Float64\n\n\nLDC X setting in Volts (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.IsInverseTime-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.IsInverseTime",
    "category": "method",
    "text": "IsInverseTime(Value::Bool)\n\n\nTime delay is inversely adjsuted, proportinal to the amount of voltage outside the regulating band. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.IsInverseTime-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.IsInverseTime",
    "category": "method",
    "text": "IsInverseTime() -> Bool\n\n\nTime delay is inversely adjsuted, proportinal to the amount of voltage outside the regulating band. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.IsReversible-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.IsReversible",
    "category": "method",
    "text": "IsReversible(Value::Bool)\n\n\nRegulator can use different settings in the reverse direction.  Usually not applicable to substation transformers. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.IsReversible-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.IsReversible",
    "category": "method",
    "text": "IsReversible() -> Bool\n\n\nRegulator can use different settings in the reverse direction.  Usually not applicable to substation transformers. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.MaxTapChange-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.MaxTapChange",
    "category": "method",
    "text": "MaxTapChange(Value::Float64)\n\n\nMaximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for a faster solution. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.MaxTapChange-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.MaxTapChange",
    "category": "method",
    "text": "MaxTapChange() -> Float64\n\n\nMaximum tap change per iteration in STATIC solution mode. 1 is more realistic, 16 is the default for a faster solution. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.MonitoredBus-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.MonitoredBus",
    "category": "method",
    "text": "MonitoredBus(Value::String)\n\n\nName of a remote regulated bus, in lieu of LDC settings (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.MonitoredBus-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.MonitoredBus",
    "category": "method",
    "text": "MonitoredBus() -> String\n\n\nName of a remote regulated bus, in lieu of LDC settings (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nActive RegControl name (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nActive RegControl name (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nSets the next RegControl active. Returns 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.PTRatio-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.PTRatio",
    "category": "method",
    "text": "PTRatio(Value::Float64)\n\n\nPT ratio for voltage control settings (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.PTRatio-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.PTRatio",
    "category": "method",
    "text": "PTRatio() -> Float64\n\n\nPT ratio for voltage control settings (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.ReverseBand-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.ReverseBand",
    "category": "method",
    "text": "ReverseBand(Value::Float64)\n\n\nBandwidth in reverse direction, centered on reverse Vreg. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.ReverseBand-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.ReverseBand",
    "category": "method",
    "text": "ReverseBand() -> Float64\n\n\nBandwidth in reverse direction, centered on reverse Vreg. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.ReverseR-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.ReverseR",
    "category": "method",
    "text": "ReverseR(Value::Float64)\n\n\nReverse LDC R setting in Volts. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.ReverseR-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.ReverseR",
    "category": "method",
    "text": "ReverseR() -> Float64\n\n\nReverse LDC R setting in Volts. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.ReverseVreg-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.ReverseVreg",
    "category": "method",
    "text": "ReverseVreg(Value::Float64)\n\n\nTarget voltage in the revese direction, on PT secondary base. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.ReverseVreg-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.ReverseVreg",
    "category": "method",
    "text": "ReverseVreg() -> Float64\n\n\nTarget voltage in the revese direction, on PT secondary base. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.ReverseX-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.ReverseX",
    "category": "method",
    "text": "ReverseX(Value::Float64)\n\n\nReverse LDC X setting in volts. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.ReverseX-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.ReverseX",
    "category": "method",
    "text": "ReverseX() -> Float64\n\n\nReverse LDC X setting in volts. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.TapDelay-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.TapDelay",
    "category": "method",
    "text": "TapDelay(Value::Float64)\n\n\nTime delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.TapDelay-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.TapDelay",
    "category": "method",
    "text": "TapDelay() -> Float64\n\n\nTime delay [s] for subsequent tap changes in a set. Control may reset before actually changing taps. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.TapNumber-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.TapNumber",
    "category": "method",
    "text": "TapNumber(Value::Int64)\n\n\nInteger number of the tap that the controlled transformer winding is currentliy on. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.TapNumber-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.TapNumber",
    "category": "method",
    "text": "TapNumber() -> Int64\n\n\nInteger number of the tap that the controlled transformer winding is currentliy on. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.TapWinding-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.TapWinding",
    "category": "method",
    "text": "TapWinding(Value::Int64)\n\n\nTapped winding number (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.TapWinding-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.TapWinding",
    "category": "method",
    "text": "TapWinding() -> Int64\n\n\nTapped winding number (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.Transformer-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.Transformer",
    "category": "method",
    "text": "Transformer(Value::String)\n\n\nName of the transformer this regulator controls (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.Transformer-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.Transformer",
    "category": "method",
    "text": "Transformer() -> String\n\n\nName of the transformer this regulator controls (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.VoltageLimit-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.VoltageLimit",
    "category": "method",
    "text": "VoltageLimit(Value::Float64)\n\n\nFirst house voltage limit on PT secondary base.  Setting to 0 disables this function. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.VoltageLimit-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.VoltageLimit",
    "category": "method",
    "text": "VoltageLimit() -> Float64\n\n\nFirst house voltage limit on PT secondary base.  Setting to 0 disables this function. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.Winding-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.Winding",
    "category": "method",
    "text": "Winding(Value::Float64)\n\n\nWinding number for PT and CT connections (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.RegControls.Winding-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.RegControls.Winding",
    "category": "method",
    "text": "Winding() -> Float64\n\n\nWinding number for PT and CT connections (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#RegControls-1",
    "page": "Main API",
    "title": "RegControls",
    "category": "section",
    "text": "Modules = [RegControls]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Relays.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Relays.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nArray of strings containing names of all Relay elements\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Relays.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Relays.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of Relays in circuit\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Relays.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Relays.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSet First Relay active. If none, returns 0.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Relays.Idx-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Relays.Idx",
    "category": "method",
    "text": "Idx(Value::Int64)\n\n\nActive Relay by index into the Relay list. 1..Count (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Relays.Idx-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Relays.Idx",
    "category": "method",
    "text": "Idx() -> Int64\n\n\nActive Relay by index into the Relay list. 1..Count (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Relays.MonitoredObj-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Relays.MonitoredObj",
    "category": "method",
    "text": "MonitoredObj(Value::String)\n\n\nFull name of object this Relay is monitoring. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Relays.MonitoredObj-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Relays.MonitoredObj",
    "category": "method",
    "text": "MonitoredObj() -> String\n\n\nFull name of object this Relay is monitoring. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Relays.MonitoredTerm-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Relays.MonitoredTerm",
    "category": "method",
    "text": "MonitoredTerm(Value::Int64)\n\n\nNumber of terminal of monitored element that this Relay is monitoring. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Relays.MonitoredTerm-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Relays.MonitoredTerm",
    "category": "method",
    "text": "MonitoredTerm() -> Int64\n\n\nNumber of terminal of monitored element that this Relay is monitoring. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Relays.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Relays.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nName of active relay. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Relays.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Relays.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nName of active relay. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Relays.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Relays.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nAdvance to next Relay object. Returns 0 when no more relays.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Relays.SwitchedObj-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Relays.SwitchedObj",
    "category": "method",
    "text": "SwitchedObj(Value::String)\n\n\nFull name of element that will be switched when relay trips. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Relays.SwitchedObj-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Relays.SwitchedObj",
    "category": "method",
    "text": "SwitchedObj() -> String\n\n\nFull name of element that will be switched when relay trips. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Relays.SwitchedTerm-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Relays.SwitchedTerm",
    "category": "method",
    "text": "SwitchedTerm(Value::Int64)\n\n\nTerminal number of the switched object that will be opened when the relay trips. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Relays.SwitchedTerm-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Relays.SwitchedTerm",
    "category": "method",
    "text": "SwitchedTerm() -> Int64\n\n\nTerminal number of the switched object that will be opened when the relay trips. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#Relays-1",
    "page": "Main API",
    "title": "Relays",
    "category": "section",
    "text": "Modules = [Relays]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Sensors.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nArray of Sensor names.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of Sensors in Active Circuit.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.Currents-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.Currents",
    "category": "method",
    "text": "Currents(Value::Array{Float64,1})\n\n\nArray of doubles for the line current measurements; don\'t use with kW and kVAR. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.Currents-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.Currents",
    "category": "method",
    "text": "Currents() -> Array{Float64,1}\n\n\nArray of doubles for the line current measurements; don\'t use with kW and kVAR. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSets the first sensor active. Returns 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.IsDelta-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.IsDelta",
    "category": "method",
    "text": "IsDelta(Value::Bool)\n\n\nTrue if measured voltages are line-line. Currents are always line currents. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.IsDelta-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.IsDelta",
    "category": "method",
    "text": "IsDelta() -> Bool\n\n\nTrue if measured voltages are line-line. Currents are always line currents. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.MeteredElement-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.MeteredElement",
    "category": "method",
    "text": "MeteredElement(Value::String)\n\n\nFull Name of the measured element (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.MeteredElement-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.MeteredElement",
    "category": "method",
    "text": "MeteredElement() -> String\n\n\nFull Name of the measured element (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.MeteredTerminal-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.MeteredTerminal",
    "category": "method",
    "text": "MeteredTerminal(Value::Int64)\n\n\nNumber of the measured terminal in the measured element. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.MeteredTerminal-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.MeteredTerminal",
    "category": "method",
    "text": "MeteredTerminal() -> Int64\n\n\nNumber of the measured terminal in the measured element. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nName of the active sensor. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nName of the active sensor. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nSets the next Sensor active. Returns 0 if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.PctError-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.PctError",
    "category": "method",
    "text": "PctError(Value::Int64)\n\n\nAssumed percent error in the Sensor measurement. Default is 1. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.PctError-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.PctError",
    "category": "method",
    "text": "PctError() -> Int64\n\n\nAssumed percent error in the Sensor measurement. Default is 1. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.ReverseDelta-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.ReverseDelta",
    "category": "method",
    "text": "ReverseDelta(Value::Bool)\n\n\nTrue if voltage measurements are 1-3, 3-2, 2-1. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.ReverseDelta-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.ReverseDelta",
    "category": "method",
    "text": "ReverseDelta() -> Bool\n\n\nTrue if voltage measurements are 1-3, 3-2, 2-1. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.Weight-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.Weight",
    "category": "method",
    "text": "Weight(Value::Float64)\n\n\nWeighting factor for this Sensor measurement with respect to other Sensors. Default is 1. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.Weight-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.Weight",
    "category": "method",
    "text": "Weight() -> Float64\n\n\nWeighting factor for this Sensor measurement with respect to other Sensors. Default is 1. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.kVBase-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.kVBase",
    "category": "method",
    "text": "kVBase(Value::Float64)\n\n\nVoltage base for the sensor measurements. LL for 2 and 3-phase sensors, LN for 1-phase sensors. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.kVBase-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.kVBase",
    "category": "method",
    "text": "kVBase() -> Float64\n\n\nVoltage base for the sensor measurements. LL for 2 and 3-phase sensors, LN for 1-phase sensors. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.kVS-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.kVS",
    "category": "method",
    "text": "kVS(Value::Array{Float64,1})\n\n\nArray of doubles for the LL or LN (depending on Delta connection) voltage measurements. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.kVS-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.kVS",
    "category": "method",
    "text": "kVS() -> Array{Float64,1}\n\n\nArray of doubles for the LL or LN (depending on Delta connection) voltage measurements. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.kW-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.kW",
    "category": "method",
    "text": "kW(Value::Array{Float64,1})\n\n\nArray of doubles for P measurements. Overwrites Currents with a new estimate using kVAR. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.kW-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.kW",
    "category": "method",
    "text": "kW() -> Array{Float64,1}\n\n\nArray of doubles for P measurements. Overwrites Currents with a new estimate using kVAR. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.kvar-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.kvar",
    "category": "method",
    "text": "kvar(Value::Array{Float64,1})\n\n\nArray of doubles for Q measurements. Overwrites Currents with a new estimate using kW. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Sensors.kvar-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Sensors.kvar",
    "category": "method",
    "text": "kvar() -> Array{Float64,1}\n\n\nArray of doubles for Q measurements. Overwrites Currents with a new estimate using kW. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#Sensors-1",
    "page": "Main API",
    "title": "Sensors",
    "category": "section",
    "text": "Modules = [Sensors]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Settings.AllocationFactors-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.AllocationFactors",
    "category": "method",
    "text": "AllocationFactors(Value::Float64)\n\n\nSets all load allocation factors for all loads defined by XFKVA property to this value (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.AllowDuplicates-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.AllowDuplicates",
    "category": "method",
    "text": "AllowDuplicates(Value::Bool)\n\n\n{True | False*} Designates whether to allow duplicate names of objects (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.AllowDuplicates-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.AllowDuplicates",
    "category": "method",
    "text": "AllowDuplicates() -> Bool\n\n\n{True | False*} Designates whether to allow duplicate names of objects (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.AutoBusList-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.AutoBusList",
    "category": "method",
    "text": "AutoBusList(Value::String)\n\n\nList of Buses or (File=xxxx) syntax for the AutoAdd solution mode. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.AutoBusList-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.AutoBusList",
    "category": "method",
    "text": "AutoBusList() -> String\n\n\nList of Buses or (File=xxxx) syntax for the AutoAdd solution mode. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.CktModel-Tuple{Union{Int64, CktModels}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.CktModel",
    "category": "method",
    "text": "CktModel(Value::Union{Int64, CktModels})\n\n\n{dssMultiphase * | dssPositiveSeq} IIndicate if the circuit model is positive sequence. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.CktModel-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.CktModel",
    "category": "method",
    "text": "CktModel() -> OpenDSSDirect.Lib.CktModels\n\n\n{dssMultiphase * | dssPositiveSeq} IIndicate if the circuit model is positive sequence. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.ControlTrace-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.ControlTrace",
    "category": "method",
    "text": "ControlTrace(Value::Bool)\n\n\n{True | False*} Denotes whether to trace the control actions to a file. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.ControlTrace-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.ControlTrace",
    "category": "method",
    "text": "ControlTrace() -> Bool\n\n\n{True | False*} Denotes whether to trace the control actions to a file. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.EmergVmaxpu-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.EmergVmaxpu",
    "category": "method",
    "text": "EmergVmaxpu(Value::Float64)\n\n\nPer Unit maximum voltage for Emergency conditions. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.EmergVmaxpu-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.EmergVmaxpu",
    "category": "method",
    "text": "EmergVmaxpu() -> Float64\n\n\nPer Unit maximum voltage for Emergency conditions. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.EmergVminpu-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.EmergVminpu",
    "category": "method",
    "text": "EmergVminpu(Value::Float64)\n\n\nPer Unit minimum voltage for Emergency conditions. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.EmergVminpu-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.EmergVminpu",
    "category": "method",
    "text": "EmergVminpu() -> Float64\n\n\nPer Unit minimum voltage for Emergency conditions. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.LossRegs-Tuple{Array{Int64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.LossRegs",
    "category": "method",
    "text": "LossRegs(Value::Array{Int64,1})\n\n\nInteger array defining which energy meter registers to use for computing losses (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.LossRegs-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.LossRegs",
    "category": "method",
    "text": "LossRegs() -> Array{Int64,1}\n\n\nInteger array defining which energy meter registers to use for computing losses (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.LossWeight-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.LossWeight",
    "category": "method",
    "text": "LossWeight(Value::Float64)\n\n\nWeighting factor applied to Loss register values. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.LossWeight-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.LossWeight",
    "category": "method",
    "text": "LossWeight() -> Float64\n\n\nWeighting factor applied to Loss register values. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.NormVmaxpu-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.NormVmaxpu",
    "category": "method",
    "text": "NormVmaxpu(Value::Float64)\n\n\nPer Unit maximum voltage for Normal conditions. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.NormVmaxpu-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.NormVmaxpu",
    "category": "method",
    "text": "NormVmaxpu() -> Float64\n\n\nPer Unit maximum voltage for Normal conditions. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.NormVminpu-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.NormVminpu",
    "category": "method",
    "text": "NormVminpu(Value::Float64)\n\n\nPer Unit minimum voltage for Normal conditions. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.NormVminpu-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.NormVminpu",
    "category": "method",
    "text": "NormVminpu() -> Float64\n\n\nPer Unit minimum voltage for Normal conditions. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.PriceCurve-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.PriceCurve",
    "category": "method",
    "text": "PriceCurve(Value::String)\n\n\nName of LoadShape object that serves as the source of price signal data for yearly simulations, etc. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.PriceCurve-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.PriceCurve",
    "category": "method",
    "text": "PriceCurve() -> String\n\n\nName of LoadShape object that serves as the source of price signal data for yearly simulations, etc. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.PriceSignal-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.PriceSignal",
    "category": "method",
    "text": "PriceSignal(Value::Float64)\n\n\nPrice Signal for the Circuit (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.PriceSignal-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.PriceSignal",
    "category": "method",
    "text": "PriceSignal() -> Float64\n\n\nPrice Signal for the Circuit (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.Trapezoidal-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.Trapezoidal",
    "category": "method",
    "text": "Trapezoidal(Value::Bool)\n\n\n{True | False *} Gets value of trapezoidal integration flag in energy meters. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.Trapezoidal-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.Trapezoidal",
    "category": "method",
    "text": "Trapezoidal() -> Bool\n\n\n{True | False *} Gets value of trapezoidal integration flag in energy meters. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.UERegs-Tuple{Array{Int64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.UERegs",
    "category": "method",
    "text": "UERegs(Value::Array{Int64,1})\n\n\nArray of Integers defining energy meter registers to use for computing UE (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.UERegs-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.UERegs",
    "category": "method",
    "text": "UERegs() -> Array{Int64,1}\n\n\nArray of Integers defining energy meter registers to use for computing UE (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.UEWeight-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.UEWeight",
    "category": "method",
    "text": "UEWeight(Value::Float64)\n\n\nWeighting factor applied to UE register values. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.UEWeight-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.UEWeight",
    "category": "method",
    "text": "UEWeight() -> Float64\n\n\nWeighting factor applied to UE register values. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.VoltageBases-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.VoltageBases",
    "category": "method",
    "text": "VoltageBases(Value::Array{Float64,1})\n\n\nArray of doubles defining the legal voltage bases in kV L-L (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.VoltageBases-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.VoltageBases",
    "category": "method",
    "text": "VoltageBases() -> Array{Float64,1}\n\n\nArray of doubles defining the legal voltage bases in kV L-L (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.ZoneLock-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.ZoneLock",
    "category": "method",
    "text": "ZoneLock(Value::Bool)\n\n\n{True | False*}  Locks Zones on energy meters to prevent rebuilding if a circuit change occurs. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Settings.ZoneLock-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Settings.ZoneLock",
    "category": "method",
    "text": "ZoneLock() -> Bool\n\n\n{True | False*}  Locks Zones on energy meters to prevent rebuilding if a circuit change occurs. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#Settings-1",
    "page": "Main API",
    "title": "Settings",
    "category": "section",
    "text": "Modules = [Settings]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Solution.AddType-Tuple{Union{Int64, AutoAddTypes}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.AddType",
    "category": "method",
    "text": "AddType(Value::Union{Int64, AutoAddTypes})\n\n\nType of device to add in AutoAdd Mode: {dssGen (Default) | dssCap} (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.AddType-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.AddType",
    "category": "method",
    "text": "AddType() -> OpenDSSDirect.Lib.AutoAddTypes\n\n\nType of device to add in AutoAdd Mode: {dssGen (Default) | dssCap} (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Algorithm-Tuple{Union{Int64, SolutionAlgorithms}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Algorithm",
    "category": "method",
    "text": "Algorithm(Value::Union{Int64, SolutionAlgorithms})\n\n\nBase Solution algorithm: {dssNormalSolve | dssNewtonSolve} (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Algorithm-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Algorithm",
    "category": "method",
    "text": "Algorithm() -> OpenDSSDirect.Lib.SolutionAlgorithms\n\n\nBase Solution algorithm: {dssNormalSolve | dssNewtonSolve} (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.BuildYMatrix-Tuple{Int64,Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.BuildYMatrix",
    "category": "method",
    "text": "BuildYMatrix(BuildOption::Int64, AllocateVI::Int64)\n\n\nBuild Y Matrix\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Capkvar-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Capkvar",
    "category": "method",
    "text": "Capkvar(Value::Float64)\n\n\nCapacitor kvar for adding capacitors in AutoAdd mode (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Capkvar-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Capkvar",
    "category": "method",
    "text": "Capkvar() -> Float64\n\n\nCapacitor kvar for adding capacitors in AutoAdd mode (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.CheckControls-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.CheckControls",
    "category": "method",
    "text": "CheckControls()\n\n\nCheck Controls\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.CheckFaultStatus-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.CheckFaultStatus",
    "category": "method",
    "text": "CheckFaultStatus()\n\n\nCheck Fault Status\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Cleanup-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Cleanup",
    "category": "method",
    "text": "Cleanup()\n\n\nClean up Solution\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.ControlActionsDone-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.ControlActionsDone",
    "category": "method",
    "text": "ControlActionsDone(Value::Bool)\n\n\nFlag indicating the control actions are done. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.ControlActionsDone-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.ControlActionsDone",
    "category": "method",
    "text": "ControlActionsDone() -> Bool\n\n\nFlag indicating the control actions are done. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.ControlIterations-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.ControlIterations",
    "category": "method",
    "text": "ControlIterations(Value::Int64)\n\n\nValue of the control iteration counter (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.ControlIterations-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.ControlIterations",
    "category": "method",
    "text": "ControlIterations() -> Int64\n\n\nValue of the control iteration counter (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.ControlMode-Tuple{Union{Int64, ControlModes}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.ControlMode",
    "category": "method",
    "text": "ControlMode(Value::Union{Int64, ControlModes})\n\n\n{dssStatic* | dssEvent | dssTime}  Modes for control devices (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.ControlMode-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.ControlMode",
    "category": "method",
    "text": "ControlMode() -> OpenDSSDirect.Lib.ControlModes\n\n\n{dssStatic* | dssEvent | dssTime}  Modes for control devices (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Converged-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Converged",
    "category": "method",
    "text": "Converged(Value::Bool)\n\n\nFlag to indicate whether the circuit solution converged (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Converged-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Converged",
    "category": "method",
    "text": "Converged() -> Bool\n\n\nFlag to indicate whether the circuit solution converged (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Convergence-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Convergence",
    "category": "method",
    "text": "Convergence(Value::Float64)\n\n\nSolution convergence tolerance.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Convergence-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Convergence",
    "category": "method",
    "text": "Convergence() -> Float64\n\n\nSolution convergence tolerance.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.DblHour-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.DblHour",
    "category": "method",
    "text": "DblHour(Value::Float64)\n\n\nHour as a double, including fractional part (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.DblHour-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.DblHour",
    "category": "method",
    "text": "DblHour() -> Float64\n\n\nHour as a double, including fractional part (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.DefaultDaily-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.DefaultDaily",
    "category": "method",
    "text": "DefaultDaily(Value::String)\n\n\nDefault daily load shape (defaults to \"Default\") (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.DefaultDaily-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.DefaultDaily",
    "category": "method",
    "text": "DefaultDaily() -> String\n\n\nDefault daily load shape (defaults to \"Default\") (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.DefaultYearly-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.DefaultYearly",
    "category": "method",
    "text": "DefaultYearly(Value::String)\n\n\nDefault Yearly load shape (defaults to \"Default\") (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.DefaultYearly-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.DefaultYearly",
    "category": "method",
    "text": "DefaultYearly() -> String\n\n\nDefault Yearly load shape (defaults to \"Default\") (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.DoControlActions-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.DoControlActions",
    "category": "method",
    "text": "DoControlActions()\n\n\nDo Control Actions\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.EventLog-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.EventLog",
    "category": "method",
    "text": "EventLog() -> Array{String,1}\n\n\nArray of strings containing the Event Log\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.FinishTimeStep-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.FinishTimeStep",
    "category": "method",
    "text": "FinishTimeStep()\n\n\nFinish Time Step\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Frequency-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Frequency",
    "category": "method",
    "text": "Frequency(Value::Float64)\n\n\nSet the Frequency for next solution (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Frequency-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Frequency",
    "category": "method",
    "text": "Frequency() -> Float64\n\n\nSet the Frequency for next solution (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.GenMult-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.GenMult",
    "category": "method",
    "text": "GenMult(Value::Float64)\n\n\nDefault Multiplier applied to generators (like LoadMult) (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.GenMult-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.GenMult",
    "category": "method",
    "text": "GenMult() -> Float64\n\n\nDefault Multiplier applied to generators (like LoadMult) (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.GenPF-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.GenPF",
    "category": "method",
    "text": "GenPF(Value::Float64)\n\n\nPF for generators in AutoAdd mode (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.GenPF-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.GenPF",
    "category": "method",
    "text": "GenPF() -> Float64\n\n\nPF for generators in AutoAdd mode (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.GenkW-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.GenkW",
    "category": "method",
    "text": "GenkW(Value::Float64)\n\n\nGenerator kW for AutoAdd mode (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.GenkW-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.GenkW",
    "category": "method",
    "text": "GenkW() -> Float64\n\n\nGenerator kW for AutoAdd mode (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Hour-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Hour",
    "category": "method",
    "text": "Hour(Value::Float64)\n\n\nSet Hour for time series solutions. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Hour-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Hour",
    "category": "method",
    "text": "Hour() -> Float64\n\n\nSet Hour for time series solutions. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.InitSnap-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.InitSnap",
    "category": "method",
    "text": "InitSnap()\n\n\nInitialize Snapshot Solution\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.IntervalHrs-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.IntervalHrs",
    "category": "method",
    "text": "IntervalHrs(Value::Float64)\n\n\nSolution.IntervalHrs variable used for devices that integrate for custom solution algorithms (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.IntervalHrs-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.IntervalHrs",
    "category": "method",
    "text": "IntervalHrs() -> Float64\n\n\nSolution.IntervalHrs variable used for devices that integrate for custom solution algorithms (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Iterations-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Iterations",
    "category": "method",
    "text": "Iterations() -> Int64\n\n\nNumber of iterations taken for last solution. (Same as TotalIterations)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.LDCurve-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.LDCurve",
    "category": "method",
    "text": "LDCurve(Value::String)\n\n\nLoad-Duration Curve name for LD modes\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.LDCurve-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.LDCurve",
    "category": "method",
    "text": "LDCurve() -> String\n\n\nLoad-Duration Curve name for LD modes\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.LoadModel-Tuple{Union{Int64, SolutionLoadModels}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.LoadModel",
    "category": "method",
    "text": "LoadModel(Value::Union{Int64, SolutionLoadModels})\n\n\nLoad Model: {dssPowerFlow (default) | dssAdmittance}\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.LoadModel-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.LoadModel",
    "category": "method",
    "text": "LoadModel() -> OpenDSSDirect.Lib.SolutionLoadModels\n\n\nLoad Model: {dssPowerFlow (default) | dssAdmittance}\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.LoadMult-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.LoadMult",
    "category": "method",
    "text": "LoadMult(Value::Float64)\n\n\nDefault load multiplier applied to all non-fixed loads\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.LoadMult-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.LoadMult",
    "category": "method",
    "text": "LoadMult() -> Float64\n\n\nDefault load multiplier applied to all non-fixed loads\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.MaxControlIterations-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.MaxControlIterations",
    "category": "method",
    "text": "MaxControlIterations(Value::Int64)\n\n\nMaximum allowable control iterations\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.MaxControlIterations-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.MaxControlIterations",
    "category": "method",
    "text": "MaxControlIterations() -> Int64\n\n\nMaximum allowable control iterations\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.MaxIterations-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.MaxIterations",
    "category": "method",
    "text": "MaxIterations(Value::Int64)\n\n\nMax allowable iterations.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.MaxIterations-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.MaxIterations",
    "category": "method",
    "text": "MaxIterations() -> Int64\n\n\nMax allowable iterations.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.MinIterations-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.MinIterations",
    "category": "method",
    "text": "MinIterations(Value::Int64)\n\n\n(read) Minimum number of iterations required for a power flow solution. (write) Mininum number of iterations required for a power flow solution.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.MinIterations-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.MinIterations",
    "category": "method",
    "text": "MinIterations() -> Int64\n\n\n(read) Minimum number of iterations required for a power flow solution. (write) Mininum number of iterations required for a power flow solution.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Mode-Tuple{Union{Int64, SolveModes}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Mode",
    "category": "method",
    "text": "Mode(Value::Union{Int64, SolveModes})\n\n\nSet present solution mode (by a text code - see DSS Help)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Mode-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Mode",
    "category": "method",
    "text": "Mode() -> OpenDSSDirect.Lib.SolveModes\n\n\nGet present solution mode (by a text code - see DSS Help)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.ModeID-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.ModeID",
    "category": "method",
    "text": "ModeID() -> String\n\n\nID (text) of the present solution mode\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.MostIterationsDone-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.MostIterationsDone",
    "category": "method",
    "text": "MostIterationsDone() -> Int64\n\n\nMax number of iterations required to converge at any control iteration of the most recent solution.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Number-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Number",
    "category": "method",
    "text": "Number(Value::Int64)\n\n\nNumber of solutions to perform for Monte Carlo and time series simulations\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Number-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Number",
    "category": "method",
    "text": "Number() -> Int64\n\n\nNumber of solutions to perform for Monte Carlo and time series simulations\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.PctGrowth-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.PctGrowth",
    "category": "method",
    "text": "PctGrowth(Value::Float64)\n\n\nPercent default  annual load growth rate (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.PctGrowth-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.PctGrowth",
    "category": "method",
    "text": "PctGrowth() -> Float64\n\n\nPercent default  annual load growth rate (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.ProcessTime-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.ProcessTime",
    "category": "method",
    "text": "ProcessTime() -> Float64\n\n\nGets the time required to perform the latest solution (Read only)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Random-Tuple{Union{Int64, RandomModes}}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Random",
    "category": "method",
    "text": "Random(Value::Union{Int64, RandomModes})\n\n\nRandomization mode for random variables \"Gaussian\" or \"Uniform\" (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Random-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Random",
    "category": "method",
    "text": "Random() -> OpenDSSDirect.Lib.RandomModes\n\n\nRandomization mode for random variables \"Gaussian\" or \"Uniform\" (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.SampleControlDevices-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.SampleControlDevices",
    "category": "method",
    "text": "SampleControlDevices()\n\n\nSample Control Devices\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.SampleDoControlActions-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.SampleDoControlActions",
    "category": "method",
    "text": "SampleDoControlActions()\n\n\nSample Do Control Actions\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Seconds-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Seconds",
    "category": "method",
    "text": "Seconds(Value::Float64)\n\n\nSeconds from top of the hour.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Seconds-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Seconds",
    "category": "method",
    "text": "Seconds() -> Float64\n\n\nSeconds from top of the hour.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Solve-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Solve",
    "category": "method",
    "text": "Solve()\n\n\nSolve\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.SolveDirect-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.SolveDirect",
    "category": "method",
    "text": "SolveDirect()\n\n\nSolve direct\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.SolveNoControl-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.SolveNoControl",
    "category": "method",
    "text": "SolveNoControl()\n\n\nSolve no control\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.SolvePFlow-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.SolvePFlow",
    "category": "method",
    "text": "SolvePFlow()\n\n\nSolve Power Flow\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.SolvePlusControl-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.SolvePlusControl",
    "category": "method",
    "text": "SolvePlusControl()\n\n\nSolve Plus Control\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.SolveSnap-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.SolveSnap",
    "category": "method",
    "text": "SolveSnap()\n\n\nSolve Snap\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.StepSize-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.StepSize",
    "category": "method",
    "text": "StepSize(Value::Float64)\n\n\nTime step size in sec\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.StepSize-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.StepSize",
    "category": "method",
    "text": "StepSize() -> Float64\n\n\nTime step size in sec\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.StepSizeHr-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.StepSizeHr",
    "category": "method",
    "text": "StepSizeHr(Value::Float64)\n\n\nSet Stepsize in Hr (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.StepSizeMin-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.StepSizeMin",
    "category": "method",
    "text": "StepSizeMin(Value::Float64)\n\n\nSet Stepsize in minutes (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.SystemYChanged-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.SystemYChanged",
    "category": "method",
    "text": "SystemYChanged() -> Bool\n\n\nFlag that indicates if elements of the System Y have been changed by recent activity.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.TimeTimeStep-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.TimeTimeStep",
    "category": "method",
    "text": "TimeTimeStep() -> Float64\n\n\nGet the solution process time + sample time for time step\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.TotalIterations-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.TotalIterations",
    "category": "method",
    "text": "TotalIterations() -> Int64\n\n\nTotal iterations including control iterations for most recent solution.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.TotalTime-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.TotalTime",
    "category": "method",
    "text": "TotalTime(Value::Float64)\n\n\n(read) Gets the accumulated time of the simulation (write) Sets the Accumulated time of the simulation\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.TotalTime-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.TotalTime",
    "category": "method",
    "text": "TotalTime() -> Float64\n\n\n(read) Gets the accumulated time of the simulation (write) Sets the Accumulated time of the simulation\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Year-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Year",
    "category": "method",
    "text": "Year(Value::Int64)\n\n\nSet year for planning studies (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Solution.Year-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Solution.Year",
    "category": "method",
    "text": "Year() -> Int64\n\n\nSet year for planning studies (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#Solution-1",
    "page": "Main API",
    "title": "Solution",
    "category": "section",
    "text": "Modules = [Solution]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.Action-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.Action",
    "category": "method",
    "text": "Action(Value::Int64)\n\n\nOpen or Close the switch. No effect if switch is locked.  However, Reset removes any lock and then closes the switch (shelf state). (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.Action-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.Action",
    "category": "method",
    "text": "Action() -> Int64\n\n\nOpen or Close the switch. No effect if switch is locked.  However, Reset removes any lock and then closes the switch (shelf state). (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nArray of strings with all SwtControl names in the active circuit.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.Delay-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.Delay",
    "category": "method",
    "text": "Delay(Value::Float64)\n\n\nTime delay [s] betwen arming and opening or closing the switch.  Control may reset before actually operating the switch. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.Delay-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.Delay",
    "category": "method",
    "text": "Delay() -> Float64\n\n\nTime delay [s] betwen arming and opening or closing the switch.  Control may reset before actually operating the switch. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSets the first SwtControl active. Returns 0 if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.IsLocked-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.IsLocked",
    "category": "method",
    "text": "IsLocked(Value::Bool)\n\n\nThe lock prevents both manual and automatic switch operation. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.IsLocked-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.IsLocked",
    "category": "method",
    "text": "IsLocked() -> Bool\n\n\nThe lock prevents both manual and automatic switch operation. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nSets a SwtControl active by Name. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nSets a SwtControl active by Name. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nSets the next SwtControl active. Returns 0 if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.NormalState-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.NormalState",
    "category": "method",
    "text": "NormalState(Value::Int64)\n\n\nNormal state of switch (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.NormalState-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.NormalState",
    "category": "method",
    "text": "NormalState() -> Int64\n\n\nNormal state of switch (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.Reset-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.Reset",
    "category": "method",
    "text": "Reset()\n\n\nReset SWT controls\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.State-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.State",
    "category": "method",
    "text": "State(Value::Int64)\n\n\nState of switch (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.State-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.State",
    "category": "method",
    "text": "State() -> Int64\n\n\nState of switch (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.SwitchedObj-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.SwitchedObj",
    "category": "method",
    "text": "SwitchedObj(Value::String)\n\n\nFull name of the switched element. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.SwitchedObj-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.SwitchedObj",
    "category": "method",
    "text": "SwitchedObj() -> String\n\n\nFull name of the switched element. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.SwitchedTerm-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.SwitchedTerm",
    "category": "method",
    "text": "SwitchedTerm(Value::Int64)\n\n\nTerminal number where the switch is located on the SwitchedObj (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.SwtControls.SwitchedTerm-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.SwtControls.SwitchedTerm",
    "category": "method",
    "text": "SwitchedTerm() -> Int64\n\n\nTerminal number where the switch is located on the SwitchedObj (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#SwtControls-1",
    "page": "Main API",
    "title": "SwtControls",
    "category": "section",
    "text": "Modules = [SwtControls]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Text.Command-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Text.Command",
    "category": "method",
    "text": "Command(Value::String) -> String\n\n\nInput command string for the DSS. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Text.Command-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Text.Command",
    "category": "method",
    "text": "Command() -> String\n\n\nInput command string for the DSS. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Text.Result-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Text.Result",
    "category": "method",
    "text": "Result() -> String\n\n\nResult string for the last command.\n\n\n\n\n\n"
},

{
    "location": "api/#Text-1",
    "page": "Main API",
    "title": "Text",
    "category": "section",
    "text": "Modules = [Text]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Topology.ActiveBranch-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.ActiveBranch",
    "category": "method",
    "text": "ActiveBranch() -> Int64\n\n\nReturns index of the active branch\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.ActiveLevel-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.ActiveLevel",
    "category": "method",
    "text": "ActiveLevel() -> Int64\n\n\nTopological depth of the active branch\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.AllIsolatedBranches-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.AllIsolatedBranches",
    "category": "method",
    "text": "AllIsolatedBranches() -> Array{String,1}\n\n\nArray of all isolated branch names. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.AllIsolatedLoads-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.AllIsolatedLoads",
    "category": "method",
    "text": "AllIsolatedLoads() -> Array{String,1}\n\n\nArray of all isolated load names. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.AllLoopedPairs-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.AllLoopedPairs",
    "category": "method",
    "text": "AllLoopedPairs() -> Array{String,1}\n\n\nArray of all looped element names, by pairs.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.BackwardBranch-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.BackwardBranch",
    "category": "method",
    "text": "BackwardBranch() -> Int64\n\n\nMove back toward the source, return index of new active branch, or 0 if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.BranchName-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.BranchName",
    "category": "method",
    "text": "BranchName(Value::String)\n\n\nName of the active branch.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.BranchName-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.BranchName",
    "category": "method",
    "text": "BranchName() -> String\n\n\nName of the active branch.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.BusName-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.BusName",
    "category": "method",
    "text": "BusName(Value::String)\n\n\nSet the active branch to one containing this bus, return index or 0 if not found (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.BusName-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.BusName",
    "category": "method",
    "text": "BusName() -> String\n\n\nSet the active branch to one containing this bus, return index or 0 if not found (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSets the first branch active, returns 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.FirstLoad-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.FirstLoad",
    "category": "method",
    "text": "FirstLoad() -> Int64\n\n\nFirst load at the active branch, return index or 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.ForwardBranch-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.ForwardBranch",
    "category": "method",
    "text": "ForwardBranch() -> Int64\n\n\nMove forward in the tree, return index of new active branch or 0 if no more\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.LoopedBranch-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.LoopedBranch",
    "category": "method",
    "text": "LoopedBranch() -> Int64\n\n\nMove to looped branch, return index or 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nSets the next branch active, returns 0 if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.NextLoad-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.NextLoad",
    "category": "method",
    "text": "NextLoad() -> Int64\n\n\nNext load at the active branch, return index or 0 if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.NumIsolatedBranches-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.NumIsolatedBranches",
    "category": "method",
    "text": "NumIsolatedBranches() -> Int64\n\n\nNumber of isolated branches (PD elements and capacitors).\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.NumIsolatedLoads-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.NumIsolatedLoads",
    "category": "method",
    "text": "NumIsolatedLoads() -> Int64\n\n\nNumber of isolated loads\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.NumLoops-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.NumLoops",
    "category": "method",
    "text": "NumLoops() -> Int64\n\n\nNumber of loops\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Topology.ParallelBranch-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Topology.ParallelBranch",
    "category": "method",
    "text": "ParallelBranch() -> Int64\n\n\nMove to directly parallel branch, return index or 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#Topology-1",
    "page": "Main API",
    "title": "Topology",
    "category": "section",
    "text": "Modules = [Topology]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Transformers.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nArray of strings with all Transformer names in the active circuit.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSets the first Transformer active. Returns 0 if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.IsDelta-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.IsDelta",
    "category": "method",
    "text": "IsDelta(Value::Bool)\n\n\nActive Winding delta or wye connection? (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.IsDelta-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.IsDelta",
    "category": "method",
    "text": "IsDelta() -> Bool\n\n\nActive Winding delta or wye connection? (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.MaxTap-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.MaxTap",
    "category": "method",
    "text": "MaxTap(Value::Float64)\n\n\nActive Winding maximum tap in per-unit. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.MaxTap-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.MaxTap",
    "category": "method",
    "text": "MaxTap() -> Float64\n\n\nActive Winding maximum tap in per-unit. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.MinTap-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.MinTap",
    "category": "method",
    "text": "MinTap(Value::Float64)\n\n\nActive Winding minimum tap in per-unit. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.MinTap-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.MinTap",
    "category": "method",
    "text": "MinTap() -> Float64\n\n\nActive Winding minimum tap in per-unit. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nSets a Transformer active by Name. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nSets a Transformer active by Name. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nSets the next Transformer active. Returns 0 if no more.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.NumTaps-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.NumTaps",
    "category": "method",
    "text": "NumTaps(Value::Int64)\n\n\nActive Winding number of tap steps betwein MinTap and MaxTap. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.NumTaps-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.NumTaps",
    "category": "method",
    "text": "NumTaps() -> Int64\n\n\nActive Winding number of tap steps betwein MinTap and MaxTap. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.NumWindings-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.NumWindings",
    "category": "method",
    "text": "NumWindings(Value::Int64)\n\n\nNumber of windings on this transformer. Allocates memory; set or change this property first. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.NumWindings-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.NumWindings",
    "category": "method",
    "text": "NumWindings() -> Int64\n\n\nNumber of windings on this transformer. Allocates memory; set or change this property first. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.R-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.R",
    "category": "method",
    "text": "R(Value::Float64)\n\n\nActive Winding resistance in % (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.R-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.R",
    "category": "method",
    "text": "R() -> Float64\n\n\nActive Winding resistance in % (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Rneut-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Rneut",
    "category": "method",
    "text": "Rneut(Value::Float64)\n\n\nActive Winding neutral resistance [ohms] for wye connections. Set less than zero for ungrounded wye. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Rneut-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Rneut",
    "category": "method",
    "text": "Rneut() -> Float64\n\n\nActive Winding neutral resistance [ohms] for wye connections. Set less than zero for ungrounded wye. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Tap-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Tap",
    "category": "method",
    "text": "Tap(Value::Float64)\n\n\nActive Winding tap in per-unit. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Tap-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Tap",
    "category": "method",
    "text": "Tap() -> Float64\n\n\nActive Winding tap in per-unit. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Wdg-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Wdg",
    "category": "method",
    "text": "Wdg(Value::Float64)\n\n\nActive Winding Number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.) (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Wdg-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Wdg",
    "category": "method",
    "text": "Wdg() -> Float64\n\n\nActive Winding Number from 1..NumWindings. Update this before reading or setting a sequence of winding properties (R, Tap, kV, kVA, etc.) (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.XfmrCode-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.XfmrCode",
    "category": "method",
    "text": "XfmrCode(Value::String)\n\n\nName of an XfrmCode that supplies electircal parameters for this Transformer. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.XfmrCode-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.XfmrCode",
    "category": "method",
    "text": "XfmrCode() -> String\n\n\nName of an XfrmCode that supplies electircal parameters for this Transformer. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Xhl-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Xhl",
    "category": "method",
    "text": "Xhl(Value::Float64)\n\n\nPercent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2-winding or 3-winding transformers. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Xhl-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Xhl",
    "category": "method",
    "text": "Xhl() -> Float64\n\n\nPercent reactance between windings 1 and 2, on winding 1 kVA base. Use for 2-winding or 3-winding transformers. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Xht-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Xht",
    "category": "method",
    "text": "Xht(Value::Float64)\n\n\nPercent reactance between windigns 1 and 3, on winding 1 kVA base.  Use for 3-winding transformers only. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Xht-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Xht",
    "category": "method",
    "text": "Xht() -> Float64\n\n\nPercent reactance between windigns 1 and 3, on winding 1 kVA base.  Use for 3-winding transformers only. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Xlt-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Xlt",
    "category": "method",
    "text": "Xlt(Value::Float64)\n\n\nPercent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3-winding transformers only. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Xlt-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Xlt",
    "category": "method",
    "text": "Xlt() -> Float64\n\n\nPercent reactance between windings 2 and 3, on winding 1 kVA base. Use for 3-winding transformers only. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Xneut-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Xneut",
    "category": "method",
    "text": "Xneut(Value::Float64)\n\n\nActive Winding neutral reactance [ohms] for wye connections. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.Xneut-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.Xneut",
    "category": "method",
    "text": "Xneut() -> Float64\n\n\nActive Winding neutral reactance [ohms] for wye connections. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.kV-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.kV",
    "category": "method",
    "text": "kV(Value::Float64)\n\n\nActive Winding kV rating.  Phase-phase for 2 or 3 phases, actual winding kV for 1 phase transformer. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.kV-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.kV",
    "category": "method",
    "text": "kV() -> Float64\n\n\nActive Winding kV rating.  Phase-phase for 2 or 3 phases, actual winding kV for 1 phase transformer. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.kVA-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.kVA",
    "category": "method",
    "text": "kVA(Value::Float64)\n\n\nActive Winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Transformers.kVA-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Transformers.kVA",
    "category": "method",
    "text": "kVA() -> Float64\n\n\nActive Winding kVA rating. On winding 1, this also determines normal and emergency current ratings for all windings. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#Transformers-1",
    "page": "Main API",
    "title": "Transformers",
    "category": "section",
    "text": "Modules = [Transformers]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.Vsources.AllNames-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Vsources.AllNames",
    "category": "method",
    "text": "AllNames() -> Array{String,1}\n\n\nNames of all Vsource objects in the circuit\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Vsources.AngleDeg-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Vsources.AngleDeg",
    "category": "method",
    "text": "AngleDeg(Value::Float64)\n\n\nPhase angle of first phase in degrees (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Vsources.AngleDeg-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Vsources.AngleDeg",
    "category": "method",
    "text": "AngleDeg() -> Float64\n\n\nPhase angle of first phase in degrees (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Vsources.BasekV-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Vsources.BasekV",
    "category": "method",
    "text": "BasekV(Value::Float64)\n\n\nSource voltage in kV (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Vsources.BasekV-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Vsources.BasekV",
    "category": "method",
    "text": "BasekV() -> Float64\n\n\nSource voltage in kV (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Vsources.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Vsources.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of Vsource Object\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Vsources.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Vsources.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSets the first VSOURCE to be active; Returns 0 if none\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Vsources.Frequency-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Vsources.Frequency",
    "category": "method",
    "text": "Frequency(Value::Float64)\n\n\nSource frequency in Hz (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Vsources.Frequency-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Vsources.Frequency",
    "category": "method",
    "text": "Frequency() -> Float64\n\n\nSource frequency in Hz (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Vsources.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.Vsources.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nActive VSOURCE name (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Vsources.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Vsources.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nActive VSOURCE name (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Vsources.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Vsources.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nSets the next VSOURCE object to be active; returns zero if no more\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Vsources.PU-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Vsources.PU",
    "category": "method",
    "text": "PU(Value::Float64)\n\n\nSource pu voltage. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Vsources.PU-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Vsources.PU",
    "category": "method",
    "text": "PU() -> Float64\n\n\nSource pu voltage. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Vsources.Phases-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.Vsources.Phases",
    "category": "method",
    "text": "Phases(Value::Int64)\n\n\nNumber of phases (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.Vsources.Phases-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.Vsources.Phases",
    "category": "method",
    "text": "Phases() -> Int64\n\n\nNumber of phases (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#Vsources-1",
    "page": "Main API",
    "title": "Vsources",
    "category": "section",
    "text": "Modules = [Vsources]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.Count-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.Count",
    "category": "method",
    "text": "Count() -> Int64\n\n\nNumber of XYCurve Objects\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.First-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.First",
    "category": "method",
    "text": "First() -> Int64\n\n\nSets first XYcurve object active; returns 0 if none.\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.Name-Tuple{String}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.Name",
    "category": "method",
    "text": "Name(Value::String)\n\n\nName of active XYCurve Object (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.Name-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.Name",
    "category": "method",
    "text": "Name() -> String\n\n\nName of active XYCurve Object (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.Next-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.Next",
    "category": "method",
    "text": "Next() -> Int64\n\n\nAdvances to next XYCurve object; returns 0 if no more objects of this class\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.Npts-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.Npts",
    "category": "method",
    "text": "Npts(Value::Int64)\n\n\nNumber of points in X-Y curve (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.Npts-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.Npts",
    "category": "method",
    "text": "Npts() -> Int64\n\n\nNumber of points in X-Y curve (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.X-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.X",
    "category": "method",
    "text": "X(Value::Float64)\n\n\nX value for given Y. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.X-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.X",
    "category": "method",
    "text": "X() -> Float64\n\n\nX value for given Y. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.XArray-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.XArray",
    "category": "method",
    "text": "XArray(Value::Array{Float64,1})\n\n\nX values as a Array of doubles. Set Npts to max number expected if setting (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.XArray-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.XArray",
    "category": "method",
    "text": "XArray() -> Array{Float64,1}\n\n\nX values as a Array of doubles. Set Npts to max number expected if setting (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.XScale-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.XScale",
    "category": "method",
    "text": "XScale(Value::Float64)\n\n\nFactor to scale X values from original curve (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.XScale-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.XScale",
    "category": "method",
    "text": "XScale() -> Float64\n\n\nFactor to scale X values from original curve (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.XShift-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.XShift",
    "category": "method",
    "text": "XShift(Value::Float64)\n\n\nAmount to shift X value from original curve (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.XShift-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.XShift",
    "category": "method",
    "text": "XShift() -> Float64\n\n\nAmount to shift X value from original curve (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.Y-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.Y",
    "category": "method",
    "text": "Y(Value::Float64)\n\n\nY value for given X. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.Y-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.Y",
    "category": "method",
    "text": "Y() -> Float64\n\n\nY value for given X. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.YArray-Tuple{Array{Float64,1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.YArray",
    "category": "method",
    "text": "YArray(Value::Array{Float64,1})\n\n\nY values in curve; Set Npts to max number expected if setting (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.YArray-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.YArray",
    "category": "method",
    "text": "YArray() -> Array{Float64,1}\n\n\nY values in curve; Set Npts to max number expected if setting (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.YScale-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.YScale",
    "category": "method",
    "text": "YScale(Value::Float64)\n\n\nFactor to scale Y values from original curve. Represents a curve shift. (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.YScale-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.YScale",
    "category": "method",
    "text": "YScale() -> Float64\n\n\nFactor to scale Y values from original curve. Represents a curve shift. (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.YShift-Tuple{Float64}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.YShift",
    "category": "method",
    "text": "YShift(Value::Float64)\n\n\nAmount to shift Y value from original curve (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.XYCurves.YShift-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.XYCurves.YShift",
    "category": "method",
    "text": "YShift() -> Float64\n\n\nAmount to shift Y value from original curve (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#XYCurves-1",
    "page": "Main API",
    "title": "XYCurves",
    "category": "section",
    "text": "Modules = [XYCurves]\nOrder   = [:function, :type]"
},

{
    "location": "api/#OpenDSSDirect.YMatrix.AddInAuxCurrents-Tuple{Int64}",
    "page": "Main API",
    "title": "OpenDSSDirect.YMatrix.AddInAuxCurrents",
    "category": "method",
    "text": "AddInAuxCurrents(SType::Int64)\n\n\nAdd in auxiliary currents\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.YMatrix.BuildYMatrixD-Tuple{Int64,Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.YMatrix.BuildYMatrixD",
    "category": "method",
    "text": "BuildYMatrixD(BuildOps::Int64, AllocateVI::Bool)\n\n\nBuild Y MatrixD\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.YMatrix.GetPCInjCurr-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.YMatrix.GetPCInjCurr",
    "category": "method",
    "text": "GetPCInjCurr()\n\n\nGet PC Current Injections\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.YMatrix.GetSourceInjCurrents-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.YMatrix.GetSourceInjCurrents",
    "category": "method",
    "text": "GetSourceInjCurrents()\n\n\nGet Source Current Injections\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.YMatrix.IVector-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.YMatrix.IVector",
    "category": "method",
    "text": "IVector() -> Ptr{Complex{Float64}}\n\n\nGet access to the internal Current pointer\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.YMatrix.SolveSystem-Tuple{Array{Complex{Float64},1}}",
    "page": "Main API",
    "title": "OpenDSSDirect.YMatrix.SolveSystem",
    "category": "method",
    "text": "SolveSystem(NodeV::Array{Complex{Float64},1}) -> Int64\n\n\nSolve System for V\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.YMatrix.SystemYChanged-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.YMatrix.SystemYChanged",
    "category": "method",
    "text": "SystemYChanged(Value::Bool)\n\n\nSystemY has changed (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.YMatrix.SystemYChanged-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.YMatrix.SystemYChanged",
    "category": "method",
    "text": "SystemYChanged() -> Bool\n\n\nSystemY has changed (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.YMatrix.UseAuxCurrents-Tuple{Bool}",
    "page": "Main API",
    "title": "OpenDSSDirect.YMatrix.UseAuxCurrents",
    "category": "method",
    "text": "UseAuxCurrents(Value::Bool)\n\n\nUse auxiliary currents (Setter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.YMatrix.UseAuxCurrents-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.YMatrix.UseAuxCurrents",
    "category": "method",
    "text": "UseAuxCurrents() -> Bool\n\n\nUse auxiliary currents (Getter)\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.YMatrix.VVector-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.YMatrix.VVector",
    "category": "method",
    "text": "VVector() -> Ptr{Complex{Float64}}\n\n\nGet access to the internal Voltage pointer\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.YMatrix.ZeroInjCurr-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.YMatrix.ZeroInjCurr",
    "category": "method",
    "text": "ZeroInjCurr()\n\n\nZero Current Injections\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.YMatrix.getI-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.YMatrix.getI",
    "category": "method",
    "text": "getI() -> Array{Complex{Float64},1}\n\n\nGet the data from the internal Current pointer\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.YMatrix.getV-Tuple{}",
    "page": "Main API",
    "title": "OpenDSSDirect.YMatrix.getV",
    "category": "method",
    "text": "getV() -> Array{Complex{Float64},1}\n\n\nGet the data from the internal Voltage pointer\n\n\n\n\n\n"
},

{
    "location": "api/#OpenDSSDirect.YMatrix.getYsparse",
    "page": "Main API",
    "title": "OpenDSSDirect.YMatrix.getYsparse",
    "category": "function",
    "text": "getYsparse() -> SparseArrays.SparseMatrixCSC{Complex{Float64},Int64}\ngetYsparse(factor::Bool) -> SparseArrays.SparseMatrixCSC{Complex{Float64},Int64}\n\n\nReturn SparseMatrixCSC of ComplexF64\n\n\n\n\n\n"
},

{
    "location": "api/#YMatrix-1",
    "page": "Main API",
    "title": "YMatrix",
    "category": "section",
    "text": "Modules = [YMatrix]\nOrder   = [:function, :type]"
},

{
    "location": "flags/#",
    "page": "Flag objects",
    "title": "Flag objects",
    "category": "page",
    "text": "CurrentModule = OpenDSSDirect"
},

{
    "location": "flags/#Flag-objects-1",
    "page": "Flag objects",
    "title": "Flag objects",
    "category": "section",
    "text": "Several flag variables are also defined, each with multiple entries defined.Here is an example of use of CapControlModes_KVAR:CapControls.Mode(Lib.CapControlModes_KVAR)Pages = [\"flags.md\"]Lib.ActionCodes\nLib.CapControlModes\nLib.LineUnits\nLib.LoadModels\nLib.LoadStatus\nLib.Options\nLib.MonitorModes\nLib.SolveModes"
},

{
    "location": "dssmode/#",
    "page": "DSS REPL Mode",
    "title": "DSS REPL Mode",
    "category": "page",
    "text": ""
},

{
    "location": "dssmode/#DSS-REPL-Mode-1",
    "page": "DSS REPL Mode",
    "title": "DSS REPL Mode",
    "category": "section",
    "text": "OpenDSSDirect also includes a custom REPL mode for entering OpenDSS commands directly. This is similar to the Help (?) and Shell (;) modes. Use the right parenthesis ()) to enter DSS mode. Hit backspace on a blank line to exit. Here is an example:julia> using OpenDSSDirect\n\nDSS> compile C:\\\\portableapps\\\\home\\\\.julia\\\\v0.7\\\\OpenDSSDirect\\\\examples\\\\8500-Node\\\\Master.dss\n\nDSS> solve\n\nDSS> summary\nStatus = NOT Solved\nSolution Mode = Snap\nNumber = 100\nLoad Mult = 1.000\nDevices = 6103\nBuses = 4876\nNodes = 8541\nControl Mode =STATIC\nTotal Iterations = 23\nControl Iterations = 2\nMax Sol Iter = 15\n\n - Circuit Summary -\n\nYear = 0\nHour = 0\nMax pu. voltage = 1.0991\nMin pu. voltage = 0.91736\nTotal Active Power:   12.0047 MW\nTotal Reactive Power: 1.47117 Mvar\nTotal Active Losses:   1.21824 MW, (10.15 %)\nTotal Reactive Losses: 2.79839 Mvar\nFrequency = 60 Hz\nMode = Snap\nControl Mode = STATIC\nLoad Model = PowerFlowThe DSS mode also has help. Hit ? at the DSS> prompt, and enter options or commands you want help on.DSS> clear\n\nDSS help?> clear\nClear all circuits currently in memory.\n\nDSS help?> solve\nPerform the solution of the present solution mode. You can set any option that you can set with the Set command (see Set). The Solve command is virtually synonymous with the Set command except that a solution is performed after the options are processed."
},

{
    "location": "lowlevel/#OpenDSSDirect.YMatrix.getI",
    "page": "Low-level API",
    "title": "OpenDSSDirect.YMatrix.getI",
    "category": "function",
    "text": "getI() -> Array{Complex{Float64},1}\n\n\nGet the data from the internal Current pointer\n\n\n\n\n\n"
},

{
    "location": "lowlevel/#OpenDSSDirect.YMatrix.getV",
    "page": "Low-level API",
    "title": "OpenDSSDirect.YMatrix.getV",
    "category": "function",
    "text": "getV() -> Array{Complex{Float64},1}\n\n\nGet the data from the internal Voltage pointer\n\n\n\n\n\n"
},

{
    "location": "lowlevel/#OpenDSSDirect.YMatrix.getYsparse",
    "page": "Low-level API",
    "title": "OpenDSSDirect.YMatrix.getYsparse",
    "category": "function",
    "text": "getYsparse() -> SparseArrays.SparseMatrixCSC{Complex{Float64},Int64}\ngetYsparse(factor::Bool) -> SparseArrays.SparseMatrixCSC{Complex{Float64},Int64}\n\n\nReturn SparseMatrixCSC of ComplexF64\n\n\n\n\n\n"
},

{
    "location": "lowlevel/#OpenDSSDirect.YMatrix.ZeroInjCurr",
    "page": "Low-level API",
    "title": "OpenDSSDirect.YMatrix.ZeroInjCurr",
    "category": "function",
    "text": "ZeroInjCurr()\n\n\nZero Current Injections\n\n\n\n\n\n"
},

{
    "location": "lowlevel/#OpenDSSDirect.YMatrix.GetSourceInjCurrents",
    "page": "Low-level API",
    "title": "OpenDSSDirect.YMatrix.GetSourceInjCurrents",
    "category": "function",
    "text": "GetSourceInjCurrents()\n\n\nGet Source Current Injections\n\n\n\n\n\n"
},

{
    "location": "lowlevel/#OpenDSSDirect.YMatrix.GetPCInjCurr",
    "page": "Low-level API",
    "title": "OpenDSSDirect.YMatrix.GetPCInjCurr",
    "category": "function",
    "text": "GetPCInjCurr()\n\n\nGet PC Current Injections\n\n\n\n\n\n"
},

{
    "location": "lowlevel/#OpenDSSDirect.YMatrix.SystemYChanged",
    "page": "Low-level API",
    "title": "OpenDSSDirect.YMatrix.SystemYChanged",
    "category": "function",
    "text": "SystemYChanged() -> Bool\n\n\nSystemY has changed (Getter)\n\n\n\n\n\nSystemYChanged(Value::Bool)\n\n\nSystemY has changed (Setter)\n\n\n\n\n\n"
},

{
    "location": "lowlevel/#OpenDSSDirect.YMatrix.BuildYMatrixD",
    "page": "Low-level API",
    "title": "OpenDSSDirect.YMatrix.BuildYMatrixD",
    "category": "function",
    "text": "BuildYMatrixD(BuildOps::Int64, AllocateVI::Bool)\n\n\nBuild Y MatrixD\n\n\n\n\n\n"
},

{
    "location": "lowlevel/#OpenDSSDirect.YMatrix.UseAuxCurrents",
    "page": "Low-level API",
    "title": "OpenDSSDirect.YMatrix.UseAuxCurrents",
    "category": "function",
    "text": "UseAuxCurrents() -> Bool\n\n\nUse auxiliary currents (Getter)\n\n\n\n\n\nUseAuxCurrents(Value::Bool)\n\n\nUse auxiliary currents (Setter)\n\n\n\n\n\n"
},

{
    "location": "lowlevel/#OpenDSSDirect.YMatrix.AddInAuxCurrents",
    "page": "Low-level API",
    "title": "OpenDSSDirect.YMatrix.AddInAuxCurrents",
    "category": "function",
    "text": "AddInAuxCurrents(SType::Int64)\n\n\nAdd in auxiliary currents\n\n\n\n\n\n"
},

{
    "location": "lowlevel/#OpenDSSDirect.YMatrix.SolveSystem",
    "page": "Low-level API",
    "title": "OpenDSSDirect.YMatrix.SolveSystem",
    "category": "function",
    "text": "SolveSystem(NodeV::Array{Complex{Float64},1}) -> Int64\n\n\nSolve System for V\n\n\n\n\n\n"
},

{
    "location": "lowlevel/#",
    "page": "Low-level API",
    "title": "Low-level API",
    "category": "page",
    "text": "CurrentModule = OpenDSSDirect.YMatrixThis is some of the low level functions implemented in the OpenDSSDirect.YMatrix module.Pages = [\"lowlevel.md\"]getI\ngetV\ngetYsparse\nZeroInjCurr\nGetSourceInjCurrents\nGetPCInjCurr\nSystemYChanged\nBuildYMatrixD\nUseAuxCurrents\nAddInAuxCurrents\nSolveSystem"
},

{
    "location": "docindex/#",
    "page": "Index",
    "title": "Index",
    "category": "page",
    "text": ""
},

{
    "location": "docindex/#Index-1",
    "page": "Index",
    "title": "Index",
    "category": "section",
    "text": "Pages = [\"api.md\", \"flags.md\", \"lowlevel.md\"]"
},

{
    "location": "NEWS/#",
    "page": "Release notes",
    "title": "Release notes",
    "category": "page",
    "text": ""
},

{
    "location": "NEWS/#OpenDSSDirect-v0.5.1-Release-Notes-1",
    "page": "Release notes",
    "title": "OpenDSSDirect v0.5.1 Release Notes",
    "category": "section",
    "text": "Add Enum support for all functions\nMinor fixes in Error module\nAdd OPENDSSDIRECT_REPL environment variable to disable REPL mode\nAdd download examples function"
},

{
    "location": "NEWS/#OpenDSSDirect-v0.5.0-Release-Notes-1",
    "page": "Release notes",
    "title": "OpenDSSDirect v0.5.0 Release Notes",
    "category": "section",
    "text": "Rewrite using dss_capi\nFixes some issues and cleans up API (See https://github.com/dss-extensions/OpenDSSDirect.jl/pull/26 for more information)"
},

{
    "location": "NEWS/#OpenDSSDirect-v0.4.0-Release-Notes-1",
    "page": "Release notes",
    "title": "OpenDSSDirect v0.4.0 Release Notes",
    "category": "section",
    "text": "Support Mac that\'s compiled by Lazarus/FPC"
},

{
    "location": "NEWS/#OpenDSSDirect-v0.3.2-Release-Notes-1",
    "page": "Release notes",
    "title": "OpenDSSDirect v0.3.2 Release Notes",
    "category": "section",
    "text": "Support Linux that\'s compiled by Lazarus/FPC"
},

{
    "location": "NEWS/#OpenDSSDirect-v0.3.1-Release-Notes-1",
    "page": "Release notes",
    "title": "OpenDSSDirect v0.3.1 Release Notes",
    "category": "section",
    "text": "Update to OpenDSS version 7.6.5_18"
},

{
    "location": "NEWS/#OpenDSSDirect-v0.3.0-Release-Notes-1",
    "page": "Release notes",
    "title": "OpenDSSDirect v0.3.0 Release Notes",
    "category": "section",
    "text": "Update to Julia v0.5"
},

{
    "location": "NEWS/#OpenDSSDirect-v0.2.0-Release-Notes-1",
    "page": "Release notes",
    "title": "OpenDSSDirect v0.2.0 Release Notes",
    "category": "section",
    "text": "Add Documentation\nUpdate DLL\'s"
},

{
    "location": "NEWS/#OpenDSSDirect-v0.1.1-Release-Notes-1",
    "page": "Release notes",
    "title": "OpenDSSDirect v0.1.1 Release Notes",
    "category": "section",
    "text": "Initial release"
},

{
    "location": "LICENSE/#",
    "page": "License",
    "title": "License",
    "category": "page",
    "text": "The OpenDSSDirect.jl package is licensed under the MIT \"Expat\" License:Copyright (c) 2019: Alliance for Sustainable Energy, LLCPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS, THE COPYRIGHT HOLDERS, THE UNITED STATES, THE UNITED STATES DEPARTMENT OF ENERGY, OR ANY OF THEIR EMPLOYEES BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.Copyright (c) 2015-2017: Electric Power Research Institute.Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.This package also includes dynamic libraries for OpenDSS. OpenDSS is Copyright (c) 2008-2015, Electric Power Research Institute, Inc. It is published under a three-clause BSD license. See here:http://sourceforge.net/p/electricdss/code/HEAD/tree/trunk/License.txt\nhttp://sourceforge.net/p/electricdss/code/HEAD/tree/trunk/This package also includes dynamic libraries for KLUSolve. KLUSolve 1.0 is Copyright (c) 2008, EnerNex Corporation. It is published under the LGPL, version 2.1 or later. For code and license information, see the following:http://sourceforge.net/p/klusolve/code/HEAD/tree/\nhttp://sourceforge.net/p/klusolve/code/HEAD/tree/License.txtKLUSolve contains open-source copyrighted code as follows. These are also released under the LGPL, version 2.1 or later.KLU Version 1.0, May 31, 2007, by Timothy A. Davis and Ekanathan Palamadai. Copyright (C) 2004-2007, University of Florida.http://sourceforge.net/p/klusolve/code/HEAD/tree/KLU/CSparse: a Concise Sparse Matrix package. Version 2.2.0, Copyright (c) 2006-2007, Timothy A. Davis, Mar 31, 2007.http://sourceforge.net/p/klusolve/code/HEAD/tree/CSparse/\nhttp://sourceforge.net/p/klusolve/code/HEAD/tree/CSparse/Doc/License.txtAMD Version 2.2, Copyright (c) 2007 by Timothy A. Davis, Patrick R. Amestoy, and Iain S. Duff.http://sourceforge.net/p/klusolve/code/HEAD/tree/AMD/BTF Version 1.0, May 31, 2007, by Timothy A. Davis Copyright (C) 2004-2007, University of Floridahttp://sourceforge.net/p/klusolve/code/HEAD/tree/BTF/CZSparse, Copyright (c) 2008, EnerNex Corporation.http://sourceforge.net/p/klusolve/code/HEAD/tree/CZSparse/"
},

]}
