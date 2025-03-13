% Hechos de genero
hombre( [ jose, tomas, jaime ] ).

mujer( [ clara, isabel, ana, patricia ] ).

% Hechos de progenitores
progenitor( clara, jose ).
progenitor( tomas, jose).
progenitor( tomas, isabel ).
progenitor( jose, ana ).
progenitor( jose, patricia ).
progenitor( patricia, jaime ).

%Regla de diferente(regla dada)
dif( X, Y ) :- X \= Y.

%Regla de diferente para crear el arbol SLD
myDif( X, Y, Result ) :- X = Y, Result is 0, !.

myDif( _, _, Result ) :- Result is 1.

%Reglas solicitadas en el ejercicio 1.3
es_madre( X ) :- mujer( Mujeres ), member( X , Mujeres ), progenitor( X, _ ).

es_padre( X ) :- hombre( Hombres ), member( X, Hombres ), progenitor( X, _ ).

es_hijo( X ) :- hombre( Hombres ), member( X, Hombres ), progenitor( _, X ).

hermana_de( X, Y ) :- 
    mujer( Mujeres ), member( X , Mujeres ),  
    progenitor( Progenitor, X ), 
    progenitor( Progenitor, Y ), 
    myDif( X, Y, Result ), Result = 1.

abuelo_de( X, Y ) :- 
    hombre( Hombres ), member( X, Hombres ),
    progenitor( X, Hijo ),
    progenitor( Hijo, Y ).

abuela_de( X, Y ) :- 
    mujer( Mujeres ), member( X , Mujeres ), 
    progenitor( X, Hijo ),
    progenitor( Hijo, Y ).

hermanos( X, Y ) :- 
    progenitor( Progenitor1, X ),
    progenitor( Progenitor2, Y ),
    Progenitor1 = Progenitor2,
    myDif( X, Y, Result ), Result = 1.

tia_de( X, Y ) :-
    mujer( Mujeres ), member( X , Mujeres ), 
    hermana_de( X, Progenitor ),
    progenitor( Progenitor, Y ).
    
