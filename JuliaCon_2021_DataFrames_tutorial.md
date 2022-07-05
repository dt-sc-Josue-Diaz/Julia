# JuliaCon 2021: DataFrames.jl 1.3 tutorial for Julia 1.7

Este es el material que se dio en el grupo de trabajo sobre  `DataFrames.jl` en 2021. En julia 1.6 la función `dowload` es obsoleta, por eso requerimos como módulo  a `Downloads` para estar estables en las notas a futuro. 

```julia
using Bootstrap, CSV, CategoricalArrays, Chain, DataFrames, Downloads,
GLM, Plots, Random, StatsPlots, Statistics
```

El data set  son observaciones de la fuerza laboral en Suiza de 1996. 

la nomemclatura de Downloads es 

```julia
Downloads.dowload("url---.csv", "nombre.cvs")
```

```julia
readlines("archivo.csv")
```

Lo anterior nos permite leer de manera primitiva las el contenido del archivo. Para poder trabajar el archivo como data frame es necesrio usar a `DataFrames.lj` y a `CSV`. 

```julia
data_frame = CSV.read("archivo.csv", DataFrame)
```

Esto nos convierte a `data_frame`en un tipo de data tabular con la información del archivo csv. Podemos obtener las estádisticas básicas del data frame mediante

```julia
describe(data_frame)
```

## Transformación de datos.

La nomclatura que usa `select`es de la siguiente manera

```julia
columna => transformación => columna final
```

Columna nos referimos a una variable del data frame, la trasformación va a depender del tipo de dato guardado en la columna. Columna final nos  referimos a como vamos a guardar los datos obtenidos en el data frame. El ejemplo de las notas es 

```julia
df = select(df_raw,
            :lfp => (x -> recode(x, "yes" => 1, "no" => 0)) => :lfp,
            :lnnlinc,
            :age,
            :age => ByRow(x -> x^2) => :age²,
            Between(:educ, :noc),
            :foreign => categorical => :foreign)
```

En este caso a `:lfp` es de texto a binario, notemos las transformaciones importantes. `ByRow` indica a la función `select` que haga la transformación fila por fila. Pues por defecto las operaciones se hacen en toda la columna.  

Para dejas las columnas sin cambios podemos usar `renamecols=false`

## Análisis explotario de datos.
