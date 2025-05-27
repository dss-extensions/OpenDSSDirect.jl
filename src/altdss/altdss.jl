"""
The AltDSS module exposes the Alternative API from the AltDSS engine in OpenDSSDirect.jl.

While most classes, properties and functions work as expected, consider this still **experimental**. Compared to the C++ and Python equivalents,
this is still incomplete in some aspects. Notably, support for engine-side batches of elements is still missing. More features and adjustments are expected.

We need user feedback, please see <https://github.com/dss-extensions/OpenDSSDirect.jl/issues/82>.

This module is compatible with the AltDSS engine. Since 2019, AltDSS has been used exclusively in OpenDSSDirect.jl, so most references and publications
that mention OpenDSSDirect.jl are works developed using the AltDSS engine, even if it was not called "AltDSS" yet (the same goes for other popular projects
like OpenDSSDirect.py and DSS-Python from DSS-Extensions). As a reminder, users can typically load multiple engine implementations in the same process 
when using OpenDSSDirect.jl.

For some general context outside OpenDSSDirect.jl, please read https://dss-extensions.org/classic_api (especially the "Alternative API" section).

**(API Extension)**
"""
module AltDSS

include("enums.jl")
include("common.jl")
include("linecode.jl")
include("loadshape.jl")
include("tshape.jl")
include("priceshape.jl")
include("xycurve.jl")
include("growthshape.jl")
include("tcc_curve.jl")
include("spectrum.jl")
include("wiredata.jl")
include("cndata.jl")
include("tsdata.jl")
include("linespacing.jl")
include("linegeometry.jl")
include("xfmrcode.jl")
include("circuit_element.jl")
include("pd_element.jl")
include("pc_element.jl")
include("line.jl")
include("vsource.jl")
include("isource.jl")
include("vccs.jl")
include("load.jl")
include("transformer.jl")
include("capacitor.jl")
include("reactor.jl")
include("capcontrol.jl")
include("fault.jl")
include("dynamicexp.jl")
include("generator.jl")
include("windgen.jl")
include("gendispatcher.jl")
include("storage.jl")
include("storagecontroller.jl")
include("relay.jl")
include("recloser.jl")
include("fuse.jl")
include("swtcontrol.jl")
include("pvsystem.jl")
include("upfc.jl")
include("upfccontrol.jl")
include("espvlcontrol.jl")
include("indmach012.jl")
include("gicsource.jl")
include("autotrans.jl")
include("regcontrol.jl")
include("invcontrol.jl")
include("expcontrol.jl")
include("gicline.jl")
include("gictransformer.jl")
include("vsconverter.jl")
include("monitor.jl")
include("energymeter.jl")
include("sensor.jl")
include("fmonitor.jl")
include("generic5.jl")
include("bus.jl")

"""
Convenience function: apply a function to all elements in the input vector, collecting the results in a vector
"""
function All(objs::Vector, func, args...)::Vector
    [obj !== nothing ? func(obj, args...) : nothing for obj in objs]
end
export All

end # module AltDSS
