### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Distributions, Plots
	Random.seed!(0)
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing5.11"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	N = 10^5
	nMin, nStep, nMax = 10, 10, 200
	nn = Int(nMax/nStep)
	sampleSizes = nMin:nStep:nMax
	trueB = 5
	trueDist = Uniform(-2, trueB)

	MLEest(data) = maximum(data)
	MMest(data)  = mean(data) + sqrt(3)*std(data)
end

# ╔═╡ 5790308c-3af7-11eb-1ebf-b57c8c5e4061
res = Dict{Symbol,Array{Float64}}(
    ((sym) -> sym => Array{Float64}(undef,nn)).(
        [:MSeMLE,:MSeMM, :VarMLE,:VarMM,:BiasMLE,:BiasMM]))

# ╔═╡ 57b8a47c-3af7-11eb-3da1-aba055f63a52
for (i, n) in enumerate(sampleSizes)
    mleEst, mmEst = Array{Float64}(undef, N), Array{Float64}(undef, N) 
    for j in 1:N
        sample    = rand(trueDist,n)
        mleEst[j] = MLEest(sample)
        mmEst[j]  = MMest(sample)
    end
    meanMLE, meanMM = mean(mleEst), mean(mmEst)
    varMLE, varMM = var(mleEst), var(mmEst)

    res[:MSeMLE][i] = varMLE + (meanMLE - trueB)^2
    res[:MSeMM][i] = varMM + (meanMM - trueB)^2
    res[:VarMLE][i] = varMLE
    res[:VarMM][i] = varMM
    res[:BiasMLE][i] = meanMLE - trueB
    res[:BiasMM][i] = meanMM - trueB
end

# ╔═╡ 57b9288e-3af7-11eb-2faf-3949ce5d7593
begin
	p1 = scatter(sampleSizes, [res[:MSeMLE] res[:MSeMM]], c=[:blue :red],
		label=["Mean sq.err (MLE)" "Mean sq.err (MM)"])
	p2 = scatter(sampleSizes, [res[:VarMLE] res[:VarMM]], c=[:blue :red],
		label=["Variance (MLE)" "Variance (MM)"])
	p3 = scatter(sampleSizes, [res[:BiasMLE] res[:BiasMM]], c=[:blue :red],
		label=["Bias (MLE)" "Bias (MM)"])

	plot(p1, p2, p3, ms=10, shape=:xcross, xlabel="n", 
		layout=(1,3), size=(1200, 400))
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.11"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═5790308c-3af7-11eb-1ebf-b57c8c5e4061
# ╠═57b8a47c-3af7-11eb-3da1-aba055f63a52
# ╠═57b9288e-3af7-11eb-2faf-3949ce5d7593
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
