
"""
    EachMember(m::Module)
    EachMember(m::Module, f::Function)

Call function `f` from module `m` for each member or each element in module in a iterator fashion.

```julia
julia> for n in OpenDSSDirect.EachMember(Lines, Lines.Name)
            @show n
       end
n = "hvmv_sub_connector"
n = "ln5502549-1"
n = "ln6259988-1"
n = "ln6077796-1"
n = "ln5835135-2"
...
```

This also works without a function. By default, it returns the index of the elment.

```julia
julia> for i in OpenDSSDirect.EachMember(Lines)
           @show i, Lines.Name()
       end
(i, Lines.Name()) = (1, "hvmv_sub_connector")
(i, Lines.Name()) = (2, "ln5502549-1")
(i, Lines.Name()) = (3, "ln6259988-1")
(i, Lines.Name()) = (4, "ln6077796-1")
(i, Lines.Name()) = (5, "ln5835135-2")
...
```

In each iteration of the body of the `for` loop a new element of the module can be accessed.
"""
struct EachMember
    m::Module
    f::Union{Nothing, Function}
end

EachMember(m) = EachMember(m, nothing)

function Base.iterate(iter::EachMember)
    check = iter.m.First()
    if check == 0
        return nothing
    else
        if iter.f isa Nothing
            next_element = check
        else
            next_element = iter.f()
        end
        return (next_element, 1)
    end
end

function Base.iterate(iter::EachMember, state::Int)
    check = iter.m.Next()
    if check == 0
        return nothing
    else
        if iter.f isa Nothing
            next_element = check
        else
            next_element = iter.f()
        end
        return (next_element, state + 1)
    end
end

function Base.length(iter::EachMember)
    return iter.m.Count()
end

function Base.eltype(iter::EachMember)
    return Any
end

