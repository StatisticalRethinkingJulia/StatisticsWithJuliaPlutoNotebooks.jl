### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Distributions, NLsolve
	Random.seed!(0)
end;

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing5.08"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	a, b, c = 3, 5, 4
	dist = TriangularDist(a,b,c)
	n = 2000
	samples = rand(dist,n)
end

# ╔═╡ d91f4766-3a9b-11eb-2892-7b7925b084b2
begin
	m_k(k,data) = 1/n*sum(data.^k)
	mHats = [m_k(i,samples) for i in 1:3]
end

# ╔═╡ d91f7dd0-3a9b-11eb-313d-81f3bcee7e68
function equations(F, x)
    F[1] = 1/3*( x[1] + x[2] + x[3] ) - mHats[1]
    F[2] = 1/6*( x[1]^2 + x[2]^2 + x[3]^2 + x[1]*x[2] + x[1]*x[3] +
		 x[2]*x[3] ) - mHats[2]
    F[3] = 1/10*( x[1]^3 + x[2]^3 + x[3]^3 + x[1]^2*x[2] + x[1]^2*x[3] +
		 x[2]^2*x[1] + x[2]^2*x[3] + x[3]^2*x[1] + x[3]^2*x[2] +
		 x[1]*x[2]*x[3] ) - mHats[3]
end

# ╔═╡ d9200de0-3a9b-11eb-2204-db202244e154
begin
	nlOutput = nlsolve(equations, [ 0.1; 0.1; 0.1])
	sol = sort(nlOutput.zero)
	aHat, bHat, cHat = sol[1], sol[3], sol[2]
	Text("Found estimates for (a,b,c) = $((aHat, bHat, cHat))")
	nlOutput
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.08"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═d91f4766-3a9b-11eb-2892-7b7925b084b2
# ╠═d91f7dd0-3a9b-11eb-313d-81f3bcee7e68
# ╠═d9200de0-3a9b-11eb-2204-db202244e154
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
