### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Distributions, Plots, LaTeXStrings
	Random.seed!(0)
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing5.20"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	alpha, beta = 8, 2
	prior(lam) = pdf(Gamma(alpha, 1/beta), lam)
	data = [2,1,0,0,1,0,2,2,5,2,4,0,3,2,5,0]

	like(lam) = *([pdf(Poisson(lam),x) for x in data]...)
	posteriorUpToK(lam) = like(lam)*prior(lam)

	sig = 0.5
	foldedNormalPDF(x,mu) = (1/sqrt(2*pi*sig^2))*(exp(-(x-mu)^2/2sig^2)
													+ exp(-(x+mu)^2/2sig^2))
	foldedNormalRV(mu) = abs(rand(Normal(mu,sig)))
end

# ╔═╡ f9da18ea-3afb-11eb-1c03-eb97ca5c6918
function sampler(piProb,qProp,rvProp)
    lam = 1
    warmN, N = 10^5, 10^6
    samples = zeros(N-warmN)

    for t in 1:N
        while true
            lamTry = rvProp(lam)
            L = piProb(lamTry)/piProb(lam)
            H = min(1,L*qProp(lam,lamTry)/qProp(lamTry,lam))
            if rand() < H
                lam = lamTry
                if t > warmN
                    samples[t-warmN] = lam
                end
                break
            end
        end
    end
    return samples
end

# ╔═╡ f9da4af4-3afb-11eb-3be6-c136b5d61c81
begin
	mcmcSamples = sampler(posteriorUpToK,foldedNormalPDF,foldedNormalRV)
	Text("MCMC Bayes Estimate: $(mean(mcmcSamples))")
end

# ╔═╡ f9dae8a6-3afb-11eb-3b01-15befda98071
begin
	stephist(mcmcSamples, bins=100, 
		c=:black, normed=true, label="Histogram of MCMC samples")

	lamRange = 0:0.01:10
	plot!(lamRange, prior.(lamRange), 
		c=:blue, label="Prior distribution")

	closedFormPosterior(lam)=pdf(Gamma(alpha + sum(data),1/(beta+length(data))),lam)
	plot!(lamRange, closedFormPosterior.(lamRange), 
		c=:red, label="Posterior distribution", 
		xlims=(0, 10), ylims=(0, 1.2),
		xlabel=L"\lambda",ylabel="Density")
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.20"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═f9da18ea-3afb-11eb-1c03-eb97ca5c6918
# ╠═f9da4af4-3afb-11eb-3be6-c136b5d61c81
# ╠═f9dae8a6-3afb-11eb-3b01-15befda98071
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
