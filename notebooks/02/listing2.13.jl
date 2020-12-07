### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ de7a5e8a-1ee4-11eb-2bbf-0f0eb3e489ec
using Pkg, DrWatson

# ╔═╡ e4eeb13a-1ee4-11eb-0113-91f9a9c3b659
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random
	Random.seed!(1)
end

# ╔═╡ ac3ceabe-1ee4-11eb-3935-313e96aafd62
md"## Listing 2.13"

# ╔═╡ e9fa266e-1eeb-11eb-2630-59930c474ed3
function montyHall(switchPolicy)
    prize, choice = rand(1:3), rand(1:3)
    if prize == choice
        revealed = rand(setdiff(1:3,choice))
    else
        revealed = rand(setdiff(1:3,[prize,choice]))
    end

    if switchPolicy
        choice = setdiff(1:3,[revealed,choice])[1]
    end
    return choice == prize
end

# ╔═╡ 9046a9c8-1f64-11eb-067f-6552cbd8919e
N = 10^6

# ╔═╡ 9046fdce-1f64-11eb-3888-651b7d2d17ac
Text("Success probability with policy I (stay): $(sum([montyHall(false) for _ in 1:N])/N)")

# ╔═╡ 90479df6-1f64-11eb-3e06-af4adc28a9d5
Text("Success probability with policy II (switch): $(sum([montyHall(true) for _ in 1:N])/N)")

# ╔═╡ ea086874-1eeb-11eb-2cb0-4186697d4294
md"## End of listing 2.13"

# ╔═╡ Cell order:
# ╟─ac3ceabe-1ee4-11eb-3935-313e96aafd62
# ╠═de7a5e8a-1ee4-11eb-2bbf-0f0eb3e489ec
# ╠═e4eeb13a-1ee4-11eb-0113-91f9a9c3b659
# ╠═e9fa266e-1eeb-11eb-2630-59930c474ed3
# ╠═9046a9c8-1f64-11eb-067f-6552cbd8919e
# ╠═9046fdce-1f64-11eb-3888-651b7d2d17ac
# ╠═90479df6-1f64-11eb-3e06-af4adc28a9d5
# ╟─ea086874-1eeb-11eb-2cb0-4186697d4294
