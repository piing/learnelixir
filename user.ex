defmodule User do
    
    @derive Blank
    @derive [Size]
    defstruct name: "john", age: 27
    
    #@enforce_keys [:name]
    #defstruct [:name,:age]
end