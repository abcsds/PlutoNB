### A Pluto.jl notebook ###
# v0.12.4

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

# ╔═╡ b3033ef8-1240-11eb-3f91-a7c190a759a1
using Plots

# ╔═╡ b8cb85ce-123f-11eb-1d78-91f1fd228904
function square(x)
    if (0 <= x) && (x <= π)
        sqr = 1;
    elseif (π < x) && (x < 2*π)
        sqr = -1;
    end
	return sqr
end

# ╔═╡ fad396e2-1240-11eb-26ae-4d418ce7aba6
@bind n html"<input type=range min=1 max=100 value=1>"

# ╔═╡ dfdb106c-123f-11eb-072b-7781289bb2d6
begin
	x=0:0.001:2*π;
	y = sum((4/(π*((2*k)-1))).*(sin.((2*k-1).*x)) for k in 1:n)
	n
end

# ╔═╡ 19d7cac8-1240-11eb-2987-899917472aea
plot(x,y)

# ╔═╡ bbd52780-1240-11eb-31e2-b77a7e5bfe12
begin
	y1 = square.(x);
	plot(x,y1)
end

# ╔═╡ 0406dc78-1242-11eb-06d2-05bba0ae3b4b
e = 100;

# ╔═╡ f7ad1c92-1241-11eb-12cb-cf568871ed40
begin
	local w = nothing;
	for m in 1:1000
		y = sum((4/(π*((2*k)-1))).*(sin.((2*k-1).*x)) for k in 1:m);
		y1 = square.(x);
		e = sqrt(sum(abs.(y - y1).^2) / sum(abs.(y).^2));
		w = m
		e < 0.02 ? break : continue
	end
	w
end

# ╔═╡ Cell order:
# ╠═b3033ef8-1240-11eb-3f91-a7c190a759a1
# ╠═b8cb85ce-123f-11eb-1d78-91f1fd228904
# ╠═fad396e2-1240-11eb-26ae-4d418ce7aba6
# ╠═dfdb106c-123f-11eb-072b-7781289bb2d6
# ╠═19d7cac8-1240-11eb-2987-899917472aea
# ╠═bbd52780-1240-11eb-31e2-b77a7e5bfe12
# ╠═0406dc78-1242-11eb-06d2-05bba0ae3b4b
# ╠═f7ad1c92-1241-11eb-12cb-cf568871ed40
