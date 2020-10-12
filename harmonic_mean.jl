### A Pluto.jl notebook ###
# v0.12.3

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 63ef8948-0c91-11eb-3649-b11c7bdf9542
using Plots

# ╔═╡ 102508a6-0c91-11eb-1474-e7ae0f584d07
@bind x1 html"<input type=range>"

# ╔═╡ 2251cf12-0c91-11eb-0063-2f5145be4497
@bind x2 html"<input type=range>"

# ╔═╡ 2a6c8b12-0c91-11eb-34df-11c3d65142d9
2 * (x1 * x2)/(x1 + x2)

# ╔═╡ a203481e-0c91-11eb-1e82-cb02ab6c9f3d
function harmonic_mean(x1, x2)
	2 * (x1 * x2)/(x1 + x2)
end

# ╔═╡ 695ec0d8-0c91-11eb-2f95-63d2939dc785
begin 
	x = -1:0.01:1
	y = -1:0.01:1

	X = repeat(reshape(x, 1, :), length(y), 1)
	Y = repeat(y, 1, length(x))
	Z = map(harmonic_mean, X, Y)
	p1 = contour(x, y, harmonic_mean, fill = true)
	p2 = contour(x, y, Z)
	plot(p1, p2)
end

# ╔═╡ Cell order:
# ╠═102508a6-0c91-11eb-1474-e7ae0f584d07
# ╠═2251cf12-0c91-11eb-0063-2f5145be4497
# ╠═2a6c8b12-0c91-11eb-34df-11c3d65142d9
# ╠═63ef8948-0c91-11eb-3649-b11c7bdf9542
# ╠═a203481e-0c91-11eb-1e82-cb02ab6c9f3d
# ╠═695ec0d8-0c91-11eb-2f95-63d2939dc785
