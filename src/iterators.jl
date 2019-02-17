
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

