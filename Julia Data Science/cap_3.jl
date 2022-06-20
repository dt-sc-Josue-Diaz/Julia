### A Pluto.jl notebook ###
# v0.19.8

using Markdown
using InteractiveUtils

# ╔═╡ d1ae5a50-ed94-11ec-11e8-89c23c3f8381
# Básicos de Julia

# ╔═╡ 0e4c39d0-09ef-49ed-8c7f-f1d94a3b4d23
## Sintáxis del lenguaje.

# ╔═╡ b001592e-2fb2-4af9-89ec-a97437ddc416
# Las asignaciones para las varibles usan el operador `=`.
name = "Julia"

# ╔═╡ f09f225d-eee1-4eb5-8001-689554fc76cb
age = 9

# ╔═╡ 3fdaeb8a-bab5-4204-b0b7-d410f8a3a23f
name

# ╔═╡ 45ee5185-c60d-4e3e-a85c-8b1526f426cc
# Tipo de una variable:
typeof(age)

# ╔═╡ 1480060b-250a-4395-8bbf-a2e370edfde4
# Que podemos hacer con numeros enteros
first(methodswith(Int64), 5)

# ╔═╡ 4c0a80fa-dd96-4435-a464-48ec7ea8822a
# Definiendo el tipo de las variables. Es como poo pero no se le dice así.

# ╔═╡ afda377e-81f5-4e5f-bb51-0353ddb4355d
struct Language 
	name::String
	title::String 
	year_of_birth::Int64 
	fast::Bool 
end

# ╔═╡ 493ae7ee-693b-4b7f-823a-4a0e9813c4b6
fieldnames(Language)

# ╔═╡ a4d3ea83-88fa-447d-a7e4-9c8906f9d65e
Python = Language("Python", "Letargicus", 1991, false)

# ╔═╡ 6204d217-e44d-45d8-9648-7c8e1abec107
Julia = Language("Julia", "Fast", 2012, true)

# ╔═╡ f686d6a2-42db-4f38-bf05-253d1402ebad
mutable struct MutableLanguage
	name::String
	title::String
	year_of_birth::Int64
	fast::Bool
end

# ╔═╡ 69b6b9f7-9680-46f4-84fa-350cdd175e3b
MutableLanguage("Julia", "Fast", 2012, true)

# ╔═╡ 7db62256-36e6-4bc4-ae72-f83573d3d846
# Vamos a cambiar el titulo. 
julia_mutable = MutableLanguage("Julia", "Rapidus", 2012, true)

# ╔═╡ d05af266-147f-4e21-9173-02ab59a11e3d
julia_mutable.title = "Python Obliteratus"

# ╔═╡ 654cbdf0-7e3a-4b08-810e-cdc73391b393
julia_mutable

# ╔═╡ 46ad5391-afd7-407b-8c60-d3a001558d5c
## Operadores booleanos y comparaciones numéricas.
# Tenemos 3 tipos de operadores:
# - !
# - %%
# - || 

# ╔═╡ a3881cab-6de4-48b1-8d41-ad71d199526e
!true

# ╔═╡ ceb930ee-02f7-4391-b160-5a5e5090e887
# Julia tiene tres tiposde comparación. 
# Igualdad, Menor que, Mayor que,


# ╔═╡ 46535ac1-92c6-40b6-bd9f-2a23a59ba752
## Funciones, una función toma arguemtnos y los transforma para devolver los resultados. 

# ╔═╡ a3789c6e-bad9-44c7-9556-dc34450705dd
# ╠═╡ disabled = true
#=╠═╡
function function_name(arg1, arg2)
	result = stuff with the arg1 and arg2 
	return result 
end

de manera mas resumida


f_name(arg1, arg2) = stuff with the arg1 and arg2

Que describe el mismo funcionamiento de la función anterior. 
# Crear funciones nuevas 

  ╠═╡ =#

# ╔═╡ e7c8dcca-e7de-4d2b-b01e-2d2a07a749d7
function add(x,y)
	return x+y
end

# ╔═╡ 7a01fcab-3f4e-4369-8d41-905db38fa9fe
add(90901234567789098976543211122,9919283745574838765432100)

# ╔═╡ 33960539-dc42-49ce-91d1-1b31d260225c
add(90901234567789098.976543211122,9919283745574.838765432100)

# ╔═╡ a06b16ec-4801-48e5-b59d-d5a3afcf83ea
# Podemos especificar el comportamiento de las declaraciones que se pueden hacer. 

# ╔═╡ f88b38d8-be92-4322-a65f-25e47c4f701f
function round_number(x::Float64)
	return round(x)
end

# ╔═╡ 94b6f021-603d-42e5-9ddc-9ba2d373049b
function round_number(x::Int64)
	return x
end

# ╔═╡ 71c6fe3f-405c-40c7-af41-f785b9ab85a6
function round_number(x::AbstractFloat)
	return round(x)
end

# ╔═╡ eebaf8e7-b2ed-4483-99db-015ebb7434c5
methods(round_number)

# ╔═╡ 3a27cb31-68d4-4b7b-b37b-c07428beb412
round_number(Float32(1.1))

# ╔═╡ 9a0486ac-f8b6-483c-b078-f1ddefa10fa2
Base.show(io::IO, l::Language) = print(
	io, l.name, ", ",
	2022-l.year_of_birth, " years old, ", 
	" has the following titles: ", l.title
)

# ╔═╡ 88e6def8-5169-488e-a5ad-493f886c5a47
Python

# ╔═╡ 88b89125-e039-477c-a7bb-f2f9c854180e
## Multiples valores. 

# ╔═╡ 1bf54a08-cdf0-4af9-b78c-39d08079865f
#Esta fucnión hace la suma y la multiplicación de dos numeros
function add_mult(x,y)
	add = x+y
	mult = x * y
	return add, mult
end	

# ╔═╡ c41bae16-9250-4d29-942b-e35da3f849ef


# ╔═╡ 63b8adff-d0ed-4449-8729-3144ed975c9d
add_mult(1234345,543127654)

# ╔═╡ 476f7e12-3d84-4858-b6af-e7513e5cf62b
## Keywords

# ╔═╡ 6158fb84-81ec-4148-9283-eddb3c997765
function logarit(x::Real; base::Real=2.7182818284590)
	return log(base, x)
end

# ╔═╡ d2977a03-bdb2-459c-8eed-a4c9405a8613
logarit(10)

# ╔═╡ f0cee8ae-e008-4c53-a56e-17d10400b7d8
logarit(10, base = 2)

# ╔═╡ 68c8d5e2-6701-4d5a-8708-bd1d2f8d997c
## Funciones anónimas. 

# ╔═╡ 657840f9-d887-4819-924a-da4814975412
map(x -> 2.7182818284590^x, logarit(2))

# ╔═╡ 2bf4e6b8-43a9-456b-a5bd-1b8684ef4b68
## Funciones de control

# ╔═╡ 3049caf2-730d-431e-9a5c-14766b1ef127
a = 1

# ╔═╡ fbc4cb74-ce5d-44e0-8557-8d1a81d612ad
b = 2

# ╔═╡ 50bc17f7-87c7-4252-8878-e5989b198343
function compare(x,y)
	a = float(x)
	b = float(y)
	if a < b
		"a is less than b"
	elseif a > b
		"a is greater than b"
	else
		"a is equal to b"
	end
end

# ╔═╡ 7b4babd4-9eba-46f7-9d7f-846ce6f01e13
compare(45,45.0)

# ╔═╡ c0bbf6de-7913-4231-87ea-4fa36fb0134e
# For 

# ╔═╡ 7fec7788-5d6d-4e81-850f-47bae656af4f
for pal_bra in 1:100
	println(pal_bra)
end

# ╔═╡ e538ff65-3dac-4645-bb06-d9ab78d4520d
# Ciclo While

# ╔═╡ 52fa48c3-19dc-4fa4-8fe3-bcc4e8df9fa4


# ╔═╡ 7c187d2c-aa85-4c5d-b349-1db429dba3f0


# ╔═╡ 7a423ac6-4d9b-4bb3-beb3-71a285bbc417
#=╠═╡
contador
  ╠═╡ =#

# ╔═╡ 112f3028-d21b-43cc-aba3-748a44384eae
# We will cover String, Tuple, NamedTuple, UnitRange, Arrays, Pair, Dict, Symbol.

# ╔═╡ e7894339-3055-4a46-88e7-4855cc7d4c00
#  Broadcasting Operators and Functions,
# las operaciones entrada a entrada en tipos de datos. Operador `.`

# ╔═╡ f5100959-8580-4262-bce9-2f795ecdf8a7


# ╔═╡ 46f47527-f2a5-440f-8245-bab142b726e8


# ╔═╡ 0f8cee44-7683-474d-9c7b-e53cc9cc9792


# ╔═╡ 266f3e90-1b32-49d9-b1f6-31421709ccde


# ╔═╡ 0a946c3d-c123-4046-a689-32845bf9bf6f
# ╠═╡ disabled = true
#=╠═╡
contador = 0
  ╠═╡ =#

# ╔═╡ f1ad7afc-6cbe-4437-ac6f-49e67ee0995c
#=╠═╡
while contador < 3
	global contador += 1
end
  ╠═╡ =#

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.3"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╠═d1ae5a50-ed94-11ec-11e8-89c23c3f8381
# ╠═0e4c39d0-09ef-49ed-8c7f-f1d94a3b4d23
# ╠═b001592e-2fb2-4af9-89ec-a97437ddc416
# ╠═f09f225d-eee1-4eb5-8001-689554fc76cb
# ╠═3fdaeb8a-bab5-4204-b0b7-d410f8a3a23f
# ╠═45ee5185-c60d-4e3e-a85c-8b1526f426cc
# ╠═1480060b-250a-4395-8bbf-a2e370edfde4
# ╠═4c0a80fa-dd96-4435-a464-48ec7ea8822a
# ╠═afda377e-81f5-4e5f-bb51-0353ddb4355d
# ╠═493ae7ee-693b-4b7f-823a-4a0e9813c4b6
# ╠═a4d3ea83-88fa-447d-a7e4-9c8906f9d65e
# ╠═6204d217-e44d-45d8-9648-7c8e1abec107
# ╠═f686d6a2-42db-4f38-bf05-253d1402ebad
# ╠═69b6b9f7-9680-46f4-84fa-350cdd175e3b
# ╠═7db62256-36e6-4bc4-ae72-f83573d3d846
# ╠═d05af266-147f-4e21-9173-02ab59a11e3d
# ╠═654cbdf0-7e3a-4b08-810e-cdc73391b393
# ╠═46ad5391-afd7-407b-8c60-d3a001558d5c
# ╠═a3881cab-6de4-48b1-8d41-ad71d199526e
# ╠═ceb930ee-02f7-4391-b160-5a5e5090e887
# ╠═46535ac1-92c6-40b6-bd9f-2a23a59ba752
# ╠═a3789c6e-bad9-44c7-9556-dc34450705dd
# ╠═e7c8dcca-e7de-4d2b-b01e-2d2a07a749d7
# ╠═7a01fcab-3f4e-4369-8d41-905db38fa9fe
# ╠═33960539-dc42-49ce-91d1-1b31d260225c
# ╠═a06b16ec-4801-48e5-b59d-d5a3afcf83ea
# ╠═f88b38d8-be92-4322-a65f-25e47c4f701f
# ╠═94b6f021-603d-42e5-9ddc-9ba2d373049b
# ╠═eebaf8e7-b2ed-4483-99db-015ebb7434c5
# ╠═71c6fe3f-405c-40c7-af41-f785b9ab85a6
# ╠═3a27cb31-68d4-4b7b-b37b-c07428beb412
# ╠═9a0486ac-f8b6-483c-b078-f1ddefa10fa2
# ╠═88e6def8-5169-488e-a5ad-493f886c5a47
# ╠═88b89125-e039-477c-a7bb-f2f9c854180e
# ╠═1bf54a08-cdf0-4af9-b78c-39d08079865f
# ╠═c41bae16-9250-4d29-942b-e35da3f849ef
# ╠═63b8adff-d0ed-4449-8729-3144ed975c9d
# ╠═476f7e12-3d84-4858-b6af-e7513e5cf62b
# ╠═6158fb84-81ec-4148-9283-eddb3c997765
# ╠═d2977a03-bdb2-459c-8eed-a4c9405a8613
# ╠═f0cee8ae-e008-4c53-a56e-17d10400b7d8
# ╠═68c8d5e2-6701-4d5a-8708-bd1d2f8d997c
# ╠═657840f9-d887-4819-924a-da4814975412
# ╠═2bf4e6b8-43a9-456b-a5bd-1b8684ef4b68
# ╠═3049caf2-730d-431e-9a5c-14766b1ef127
# ╠═fbc4cb74-ce5d-44e0-8557-8d1a81d612ad
# ╠═50bc17f7-87c7-4252-8878-e5989b198343
# ╠═7b4babd4-9eba-46f7-9d7f-846ce6f01e13
# ╠═c0bbf6de-7913-4231-87ea-4fa36fb0134e
# ╠═7fec7788-5d6d-4e81-850f-47bae656af4f
# ╠═e538ff65-3dac-4645-bb06-d9ab78d4520d
# ╠═0a946c3d-c123-4046-a689-32845bf9bf6f
# ╠═52fa48c3-19dc-4fa4-8fe3-bcc4e8df9fa4
# ╠═f1ad7afc-6cbe-4437-ac6f-49e67ee0995c
# ╠═7c187d2c-aa85-4c5d-b349-1db429dba3f0
# ╠═7a423ac6-4d9b-4bb3-beb3-71a285bbc417
# ╠═112f3028-d21b-43cc-aba3-748a44384eae
# ╠═e7894339-3055-4a46-88e7-4855cc7d4c00
# ╠═f5100959-8580-4262-bce9-2f795ecdf8a7
# ╠═46f47527-f2a5-440f-8245-bab142b726e8
# ╠═0f8cee44-7683-474d-9c7b-e53cc9cc9792
# ╠═266f3e90-1b32-49d9-b1f6-31421709ccde
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
