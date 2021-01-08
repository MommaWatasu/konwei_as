i = 11
n = 11
ft = 1
fa = 1
for a = 1:n
    global fa
    fa = fa * a
end
ex_p = [1,2,3,4,5,6,7,8,9,10,11]
indices = [1,2,3,4,5,6,7,8,9,10,11]
cycles = [11,10,9,8,7,6,5,4,3,2,1]
bc_ex = []
function p()
    global i
    global n
    global indices
    global cycles
    global bc_ex
    i = n
    while true
        if i < 1
            i = n
        end
        cycles[i] = cycles[i] - 1
        if cycles[i] == 0 && i != n
            indices[i:n] = append!(indices[i+1:n], indices[i:i])
            cycles[i] = n - i + 1
            i = i - 1
        elseif cycles[i] == 0 && i == n
            cycles[i] = 1
            i = i - 1
        else
            j = cycles[i]
            indices[i], indices[n-j+1] = indices[n-j+1], indices[i]
            i = i - 1
            return indices
        end
    end
end
function main()
    global i
    global n
    global ft
    global fa
    global ex_p
    global bc_ex
    L::Int = 0
    i = n
    while ft < fa
        ex_p = copy(p())
        f::Int = 0
        while true
            a::Int = ex_p[1]
            if a == 1
                break
            end
            for j = 1:Int(div(a,2))
                ex_p[j], ex_p[a-j+1] = ex_p[a-j+1], ex_p[j]
            end
            f = f + 1
        end
        if f > L
            bc_ex = []
            L = f
        end
        if f >= L
            push!(bc_ex, copy(indices))
        end
        ft = ft + 1
    end
    print("f(",n,")=",L)
    println(bc_ex)
end
main()
