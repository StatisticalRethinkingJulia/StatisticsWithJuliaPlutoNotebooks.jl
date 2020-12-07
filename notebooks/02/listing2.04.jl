### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ 7ccb2b9c-1ecd-11eb-205e-11296dd5bb76
using Pkg, DrWatson

# ╔═╡ 855951b0-1ecd-11eb-0108-71f29ba2082f
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using StatsBase, Plots
end

# ╔═╡ 54e90298-1ecd-11eb-01d6-714cdcc0e877
md"## Listing 2.4"

# ╔═╡ 97360536-1ecd-11eb-36d6-038ba8a75dc5
function proportionFished(gF, sF, n, N, withReplacement = false)
	
    function fishing()
        fishInPond = [ones(Int64,gF); zeros(Int64,sF)]
        fishCaught = Int64[]

        for fish in 1:n
            fished = rand(fishInPond)
            push!(fishCaught,fished)
            if withReplacement == false
                deleteat!(fishInPond, findfirst(x->x==fished, fishInPond))
            end
        end
        sum(fishCaught)
    end

    simulations = [fishing() for _ in 1:N]
    proportions = counts(simulations, 0:n)/N

    if withReplacement
        plot!(0:n, proportions, 
             line=:stem, marker=:circle, c=:blue, ms=6, msw=0,
             label="With replacement",
             xlabel="n",
             ylims=(0, 0.6), ylabel="Probability")
    else
        plot!(0:n, proportions, 
            line=:stem, marker=:xcross, c=:red, ms=6, msw=0,
            label="Without replacement")
    end
end

# ╔═╡ f505b35c-1ecd-11eb-1eef-6fe09900d4be
begin
	N = 10^6
	goldFish, silverFish, n = 3, 4, 3
	
	p = plot()
	proportionFished(goldFish, silverFish, n, N)
	proportionFished(goldFish, silverFish, n, N, true)
	p
end

# ╔═╡ f506085a-1ecd-11eb-1e55-db1a82f7bf85
md"## End of listing 2.4"

# ╔═╡ Cell order:
# ╟─54e90298-1ecd-11eb-01d6-714cdcc0e877
# ╠═7ccb2b9c-1ecd-11eb-205e-11296dd5bb76
# ╠═855951b0-1ecd-11eb-0108-71f29ba2082f
# ╠═97360536-1ecd-11eb-36d6-038ba8a75dc5
# ╠═f505b35c-1ecd-11eb-1eef-6fe09900d4be
# ╟─f506085a-1ecd-11eb-1e55-db1a82f7bf85
