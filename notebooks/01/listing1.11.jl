### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ 61a5b548-1ddc-11eb-2f7a-0d1b24e3cf48
using Pkg, DrWatson

# ╔═╡ 61d2b2c8-1ddc-11eb-3ae7-a3c92d8a64b3
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Plots
end

# ╔═╡ 0fdee93c-1ddc-11eb-2bde-712854f4263e
md"## Listing 1.11"

# ╔═╡ 61d33860-1ddc-11eb-1c60-eda2aa584f64
function hailLength(x::Int)
    n = 0
    while x != 1
        if x % 2 == 0
            x = Int(x/2)
        else
            x = 3x +1
        end
        n += 1
    end
    return n
end

# ╔═╡ 61dc8cb4-1ddc-11eb-065a-fdfe7782833d
lengths = [hailLength(x0) for x0 in 2:10^7];

# ╔═╡ 61dda098-1ddc-11eb-19ba-c3b600208626
histogram(lengths, bins=1000, normed=:true, 
    fill=(:blue, true), la=0, legend=:none,
    xlims=(0, 500), ylims=(0, 0.012),
    xlabel="Length", ylabel="Frequency")

# ╔═╡ 61e6709c-1ddc-11eb-392c-97a365b3a46d
md"## End of listing 1.11"

# ╔═╡ Cell order:
# ╟─0fdee93c-1ddc-11eb-2bde-712854f4263e
# ╠═61a5b548-1ddc-11eb-2f7a-0d1b24e3cf48
# ╠═61d2b2c8-1ddc-11eb-3ae7-a3c92d8a64b3
# ╠═61d33860-1ddc-11eb-1c60-eda2aa584f64
# ╠═61dc8cb4-1ddc-11eb-065a-fdfe7782833d
# ╠═61dda098-1ddc-11eb-19ba-c3b600208626
# ╟─61e6709c-1ddc-11eb-392c-97a365b3a46d
