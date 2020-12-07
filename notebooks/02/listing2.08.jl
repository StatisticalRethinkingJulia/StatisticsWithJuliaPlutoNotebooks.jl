### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ de7a5e8a-1ee4-11eb-2bbf-0f0eb3e489ec
using Pkg, DrWatson

# ╔═╡ e4eeb13a-1ee4-11eb-0113-91f9a9c3b659
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, StatsBase, Combinatorics, DataFrames
	Random.seed!(1)
end

# ╔═╡ ac3ceabe-1ee4-11eb-3935-313e96aafd62
md"## Listing 2.8"

# ╔═╡ c4bef1a4-1ee9-11eb-0b58-8be033f6fbad
function bruteSetsProbabilityAllMiss(n)
    omega = collect(permutations(1:n))
    matchEvents = []
    for i in 1:n
        event = []
        for p in omega
            if p[i] == i
                push!(event,p)
            end
        end
        push!(matchEvents,event)
    end
    noMatch = setdiff(omega,union(matchEvents...))
    return length(noMatch)/length(omega)
end

# ╔═╡ e9f9616e-1eeb-11eb-177d-2fa9d0c18b13
formulaCalcAllMiss(n) = sum([(-1)^k/factorial(k) for k in 0:n])

# ╔═╡ e9f99800-1eeb-11eb-3333-59c96cd555d4
function mcAllMiss(n,N)
    function envelopeStuffer()
        envelopes = Random.shuffle!(collect(1:n))
        return sum([envelopes[i] == i for i in 1:n]) == 0
    end
    data = [envelopeStuffer() for _ in 1:N]
    return sum(data)/N
end

# ╔═╡ e9fa266e-1eeb-11eb-2630-59930c474ed3
begin
	N = 10^6
	df = DataFrame()

	for n in 1:6
		bruteForce = bruteSetsProbabilityAllMiss(n)
		fromFormula = formulaCalcAllMiss(n)
		fromMC = mcAllMiss(n,N)
		append!(df, DataFrame(
			:bruteForce => round(bruteForce,digits=4),
			:fromFormula => round(fromFormula,digits=4),
			:fromMC => round(fromMC,digits=4),
			:asymptotic => round(1/MathConstants.e,digits=4))
		)
	end
	df
end

# ╔═╡ ea086874-1eeb-11eb-2cb0-4186697d4294
md"## End of listing 2.8"

# ╔═╡ Cell order:
# ╟─ac3ceabe-1ee4-11eb-3935-313e96aafd62
# ╠═de7a5e8a-1ee4-11eb-2bbf-0f0eb3e489ec
# ╠═e4eeb13a-1ee4-11eb-0113-91f9a9c3b659
# ╠═c4bef1a4-1ee9-11eb-0b58-8be033f6fbad
# ╠═e9f9616e-1eeb-11eb-177d-2fa9d0c18b13
# ╠═e9f99800-1eeb-11eb-3333-59c96cd555d4
# ╠═e9fa266e-1eeb-11eb-2630-59930c474ed3
# ╟─ea086874-1eeb-11eb-2cb0-4186697d4294
