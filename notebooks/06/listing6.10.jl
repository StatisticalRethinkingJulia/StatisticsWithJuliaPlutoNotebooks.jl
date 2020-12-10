### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Statistics, Distributions, DataFrames, CSV
	using HypothesisTests
end;

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing6.10"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	data = CSV.read(datadir("machine1.csv"), DataFrame; delim=",")[:, 1]
end;

# ╔═╡ 1aa41898-3afa-11eb-2f49-570853ce6435
begin
	n, s, alpha = length(data), std(data), 0.1
	ci = (  (n-1)*s^2/quantile(Chisq(n-1),1-alpha/2),
			(n-1)*s^2/quantile(Chisq(n-1),alpha/2)  )

	Text("Point estimate for the variance: $(s^2)")
end

# ╔═╡ d0a56572-3b2a-11eb-383a-f94fe2f45a5b
Text("Confidence interval for the variance: $ci")

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing6.10"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═1aa41898-3afa-11eb-2f49-570853ce6435
# ╠═d0a56572-3b2a-11eb-383a-f94fe2f45a5b
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
