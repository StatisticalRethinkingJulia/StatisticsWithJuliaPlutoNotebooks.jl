### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ c83a4764-1d65-11eb-0211-3f30ca230c32
using Pkg, DrWatson

# ╔═╡ cf3e1fd6-1d65-11eb-043f-b1e0c0d3620e
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Roots
end

# ╔═╡ 8be3ec46-1d49-11eb-0cb0-bb04f5925358
md"## Listing 1.6"

# ╔═╡ 837f96be-1d3e-11eb-1df7-878544276c0a
function bubbleSort!(a)
    n = length(a)
    for i in 1:n-1
        for j in 1:n-i
            if a[j] > a[j+1]
                a[j], a[j+1] = a[j+1], a[j]
            end
        end
    end
    return a
end

# ╔═╡ b14809a4-1d3f-11eb-1567-0364629fc97d
data = [65, 51, 32, 12, 23, 84, 68, 1]

# ╔═╡ b1485852-1d3f-11eb-1ebe-09648d32a6f8
bubbleSort!(data)

# ╔═╡ 3e65dfd4-1d66-11eb-275a-8747968227c7
md"## Listing 1.7"

# ╔═╡ 13f2150a-1d4e-11eb-30bc-c1bf235f675b
function polynomialGenerator(a...)
    n = length(a)-1
    poly =  function(x)
                return sum([a[i+1]*x^i for i in 0:n])
            end
    return poly
end

# ╔═╡ 2a3e53a6-1d66-11eb-0b8f-03b03d500b4f
polynomial = polynomialGenerator(1, 3, -10)

# ╔═╡ 2a3ea644-1d66-11eb-22d0-254c46fbb49d
zeroVals = find_zeros(polynomial, -10 ,10)

# ╔═╡ 2a3f3f3c-1d66-11eb-0ee9-ff23b3c7804f
"Zeros of the function f(x): ", zeroVals

# ╔═╡ Cell order:
# ╟─8be3ec46-1d49-11eb-0cb0-bb04f5925358
# ╠═c83a4764-1d65-11eb-0211-3f30ca230c32
# ╠═cf3e1fd6-1d65-11eb-043f-b1e0c0d3620e
# ╠═837f96be-1d3e-11eb-1df7-878544276c0a
# ╠═b14809a4-1d3f-11eb-1567-0364629fc97d
# ╠═b1485852-1d3f-11eb-1ebe-09648d32a6f8
# ╟─3e65dfd4-1d66-11eb-275a-8747968227c7
# ╠═13f2150a-1d4e-11eb-30bc-c1bf235f675b
# ╠═2a3e53a6-1d66-11eb-0b8f-03b03d500b4f
# ╠═2a3ea644-1d66-11eb-22d0-254c46fbb49d
# ╠═2a3f3f3c-1d66-11eb-0ee9-ff23b3c7804f
