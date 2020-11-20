### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using StatisticalRethinking
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.13"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	df = CSV.read(datadir("3featureData.csv"), DataFrame; header=false)
	n, p = size(df)
	Text("Number of features: $p")
end

# ╔═╡ 136d33e4-24f6-11eb-317e-179b37d8a908
Text("Number of observations: $n")

# ╔═╡ 136d76a6-24f6-11eb-0733-27f739580d0a
begin
	X = convert(Array{Float64,2}, df)
	Text("Dimensions of data matrix: $(size(X))")
end

# ╔═╡ ae9f09ba-24f5-11eb-0b03-09474b72a910
md"##### Alternative calculations of (sample) mean vector: "

# ╔═╡ aecb29dc-24f5-11eb-3556-8bb00e726c80
begin
	xbarA = (1/n)*X'*ones(n)
	xbarB = [mean(X[:,i]) for i in 1:p]
	xbarC = reshape(sum(X,dims=1)/n, 3)
end

# ╔═╡ 1d4f3718-24f6-11eb-1795-55a9df2ffae8
xbarA

# ╔═╡ 293c3666-24f6-11eb-1bc8-532831874790
xbarB

# ╔═╡ 293c6654-24f6-11eb-0427-6b6b5fcb5f21
xbarC

# ╔═╡ 57f48b98-24f6-11eb-1921-ad00e4113d88
md"##### Y is the de-meaned (centered) data: "

# ╔═╡ aecba394-24f5-11eb-12ab-7b59ea17225a
begin
	Y = (I-ones(n,n)/n)*X
	mean(Y,dims=1)
end

# ╔═╡ 931e32be-2681-11eb-131c-690af2ec449d
std(Y, dims=1)

# ╔═╡ aedb2ff8-24f5-11eb-043b-3fb4f93ab76a
md"##### Alternative calculations of (sample) covariance matrix: "

# ╔═╡ aedbd20c-24f5-11eb-0ef7-2de4a0bdca69
begin
	covA = (X .- xbarA')'*(X .- xbarA')/(n-1)
	covB = Y'*Y/(n-1)
	covC = [cov(X[:,i], X[:,j]) for i in 1:p, j in 1:p]
	covD = [cor(X[:,i], X[:,j])*std(X[:,i])*std(X[:,j]) for i in 1:p, j in 1:p]
	covE = cov(X)
	(covA, covB, covC, covD, covE)
end

# ╔═╡ aee78048-24f5-11eb-0307-cd8e720569c3
md"##### Alternate computation of Z-scores yields same matrix: "

# ╔═╡ aee820f0-24f5-11eb-3daf-5db07473c697
begin
	ZmatA = [(X[i,j] - mean(X[:,j]))/std(X[:,j]) for i in 1:n, j in 1:p ]
	ZmatB = hcat([zscore(X[:,j]) for j in 1:p]...)
	maximum(norm(ZmatA-ZmatB))
end

# ╔═╡ aef6225e-24f5-11eb-2230-dfcd9c39a209
Z = ZmatA

# ╔═╡ aef6ded8-24f5-11eb-17d0-af7a139241f9
md"##### Alternative calculations of (sample) correlation matrix: "

# ╔═╡ af06b704-24f5-11eb-03dc-d71cc3c48b7c
begin
	corA = covA ./ [std(X[:,i])*std(X[:,j]) for i in 1:p, j in 1:p]
	corB = covA ./ (std(X,dims = 1)'*std(X,dims = 1))
	corC = [cor(X[:,i],X[:,j]) for i in 1:p, j in 1:p]
	corD = Z'*Z/(n-1)
	corE = cov(Z)
	corF = cor(X)
	(corA, corB, corC, corD, corE, corF)
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.13"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═136d33e4-24f6-11eb-317e-179b37d8a908
# ╠═136d76a6-24f6-11eb-0733-27f739580d0a
# ╟─ae9f09ba-24f5-11eb-0b03-09474b72a910
# ╠═aecb29dc-24f5-11eb-3556-8bb00e726c80
# ╠═1d4f3718-24f6-11eb-1795-55a9df2ffae8
# ╠═293c3666-24f6-11eb-1bc8-532831874790
# ╠═293c6654-24f6-11eb-0427-6b6b5fcb5f21
# ╟─57f48b98-24f6-11eb-1921-ad00e4113d88
# ╠═aecba394-24f5-11eb-12ab-7b59ea17225a
# ╠═931e32be-2681-11eb-131c-690af2ec449d
# ╟─aedb2ff8-24f5-11eb-043b-3fb4f93ab76a
# ╠═aedbd20c-24f5-11eb-0ef7-2de4a0bdca69
# ╟─aee78048-24f5-11eb-0307-cd8e720569c3
# ╠═aee820f0-24f5-11eb-3daf-5db07473c697
# ╠═aef6225e-24f5-11eb-2230-dfcd9c39a209
# ╟─aef6ded8-24f5-11eb-17d0-af7a139241f9
# ╠═af06b704-24f5-11eb-03dc-d71cc3c48b7c
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
