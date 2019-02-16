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
            if length(group) == 1
                for method in group
                    printmethod(buf, binding, func, method, typesig)
                    println(buf)
                end
            else
                # If function has default arguments, revert to default printmethod
                for (i, method) in enumerate(group)
                    if i == length(group)
                        t = typesig
                    else
                        t = typesig.a
                        typesig = typesig.b
                    end
                    printmethod(buf, binding, func, method, t)
                    println(buf)
                end
            end
        end
        println(buf, "\n```")
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
    rt = Base.return_types(func, typesig)[1]
    if rt !== Nothing && rt !== Union{}
        print(buffer, " -> $rt")
    end
    return buffer
end

end

