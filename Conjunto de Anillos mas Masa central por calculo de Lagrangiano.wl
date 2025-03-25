(* ::Package:: *)

(* ::Input:: *)
(*(*Definir listas de posiciones y momentos angulares*)*)
(*n=150(*numero de particulas*);*)
(*r=Table[Symbol["r"<>ToString[i]],{i,1,n}](*Tabla con las variables de los radios*);*)
(*l=Table[RandomReal[{10,100}],{i,1,n}](*Distribucion aleatoria de Momentos angulares*);*)


(* ::Input:: *)
(*(*Potencial de cada part\[IAcute]cula con la masa central*)*)
(*Vindividual=Sum[(l[[i]]^2/(4 m ^2r[[i]]^2)-(m M)/r[[i]]),{i,1,n}];*)
(*(*Interacci\[OAcute]n entre pares de part\[IAcute]culas*)*)
(*Vinteraccion=Sum[(-4 m^2 EllipticK[(4 r[[i]] r[[j]])/(r[[i]]+r[[j]]+\[Epsilon])^2])/(r[[i]]+r[[j]]),{i,1,n},{j,i+1,n}];*)
(*(*Potencial total*)*)
(*Vtotal=Vindividual+Vinteraccion;*)


(* ::Input:: *)
(*(*Encontrar el m\[IAcute]nimo del potencial*)*)
(*(*Aqui m reprecenta la masa de cada anillo y M la masa del objeto central*)*)
(*sol=FindMinimum[{Vtotal/.{m->10,M->1000,\[Epsilon]->1/10000000},And@@Table[r[[i]]>0,{i,1,n}]},Evaluate[Sequence@@Table[{r[[i]],RandomReal[{0.1,100}]},{i,1,n}]]];*)


(* ::Input:: *)
(*(*Extraer los radios \[OAcute]ptimos de la soluci\[OAcute]n*)*)
(*radiosOptimizados=r/. sol[[2]];*)


(* ::Input:: *)
(*(*Dibujar los anillos*)*)
(*graf = Graphics[{Table[Circle[{0,0},radiosOptimizados[[i]]],{i,1,Length[radiosOptimizados]}]},Axes->True]*)
