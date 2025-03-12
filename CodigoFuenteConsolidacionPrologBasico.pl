% Hechos de genero
hombre( jose ).
hombre( tomas ).
hombre( jaime ).

mujer( clara ).
mujer( isabel ).
mujer( ana ).
mujer( patricia ).


% Hechos de progenitores
progenitor( clara, jose ).
progenitor( tomas, jose).
progenitor( tomas, isabel ).
progenitor( jose, ana ).
progenitor( jose, patricia ).
progenitor( patricia, jaime ).

%Regla de diferente
dif( X, Y ) :- X \= Y.

%Reglas solicitadas en el ejercicio 1.3
es_madre( X ) :- mujer( X ), progenitor( X, _ ), !.

es_padre( X ) :- hombre( X ), progenitor( X, _ ), !.

es_hijo( X ) :- hombre( X ), progenitor( _, X ), !.

hermana_de( X, Y ) :- 
    mujer( X ), 
    progenitor( Progenitor, X ), 
    progenitor( Progenitor, Y ), 
    dif( X, Y ).

abuelo_de( X, Y ) :- 
    hombre( X ),
    progenitor( X, Hijo ),
    progenitor( Hijo, Y ).

abuela_de( X, Y ) :- 
    mujer( X ),
    progenitor( X, Hijo ),
    progenitor( Hijo, Y ).

hermanos( X, Y ) :- 
    progenitor( Progenitor1, X ),
    progenitor( Progenitor2, Y ),
    Progenitor1 = Progenitor2,
    dif( X, Y ).

tia_de( X, Y ) :-
    mujer( X ),
    hermana_de( X, Progenitor ),
    progenitor( Progenitor, Y ).
    
