module TypedDocStringExtensions

using DocStringExtensions
const DSE = DocStringExtensions

struct FullMethodSignatures <: DSE.Abbreviation end

const FULLSIGNATURES = FullMethodSignatures()

function DSE.format(::FullMethodSignatures, buf, doc)
    local binding = doc.data[:binding]
    local typesig = doc.data[:typesig]
    local modname = doc.data[:module]
    local func = Docs.resolve(binding)
    local groups = DSE.methodgroups(func, typesig, modname)
    if !isempty(groups)
        println(buf)
        println(buf, "```julia")
        for group in groups
            for method in group
                printmethod(buf, binding, func, method, typesig)
                println(buf)
            end
        end
        println(buf, "\n```\n")
    end
end

function printmethod(buffer::IOBuffer, binding::Docs.Binding, func, method::Method, typesig)
    # TODO: print qualified?
    print(buffer, binding.var)
    print(buffer, "(")
    local args = DSE.arguments(method)
    for (i, sym) in enumerate(args)
        print(buffer, "$sym::$(typesig.types[i])")
        if i != length(args)
            print(buffer, ", ")
        end
    end
    local kws = DSE.keywords(func, method)
    if !isempty(kws)
        print(buffer, "; ")
        join(buffer, kws, ", ")
    end
    print(buffer, ")")
    return buffer
end

printmethod(b, f, m, t) = String(take!(printmethod(IOBuffer(), b, f, m, t)))

end

