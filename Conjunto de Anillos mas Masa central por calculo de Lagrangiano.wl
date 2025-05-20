(* ::Package:: *)

(* ::Input:: *)
(*Quit*)


(* ::Section:: *)
(*C\[AAcute]lculo de los anillos, caso simple*)


(* ::Subsection:: *)
(*Input*)


(* ::Input:: *)
(*(*Par\[AAcute]metros y configuraci\[OAcute]n*)*)
(*n=150; (*numero de particulas*)*)
(*\[Sigma]=10; (*densidad angular de masa*)*)
(*k=1; (*cte. de gravitacion*)*)
(*M=1500000; (*Masa central*)*)
(*\[CurlyEpsilon]=1/10000000 //N;*)
(*rmax=10000;*)


(* ::Input:: *)
(*(*Variables simb\[OAcute]licas*)*)
(*r=Table[Symbol["r"<>ToString[i]],{i,1,n}];*)
(*q=\[Sigma] r;*)


(* ::Input:: *)
(*(*Potencial de cada part\[IAcute]cula con la masa central*)*)
(*Vindividual=Sum[(l[[i]]^2)/(2 q[[i]]^2)-(k \[Sigma]^3 M)/q[[i]],{i,1,n}];*)
(*(*Interacci\[OAcute]n entre pares de part\[IAcute]culas*)*)
(*Vinteraccion=Sum[(-4 k \[Sigma]^5 EllipticK[(-4 q[[i]] q[[j]])/(q[[i]]-q[[j]]+\[CurlyEpsilon])^2])/Abs[q[[i]]-q[[j]]+\[CurlyEpsilon]],{i,1,n},{j,i+1,n}];*)
(*(*Potencial total*)*)
(*Vtotal=Vindividual+Vinteraccion;*)


(* ::Input:: *)
(*(*Restricciones:todos los q_i (\[Proportional]r_i) positivos*)*)
(*restricciones=And@@Table[r[[i]]>\[CurlyEpsilon],{i,1,n}];*)


(* ::Subsection:: *)
(*Inicializaci\[OAcute]n al azar*)


(* ::Input:: *)
(*(*Momento angular aleatorio*)*)
(*l=RandomReal[{100,500},n];*)


(* ::Input:: *)
(*(*Inicializaci\[OAcute]n aleatoria*)*)
(*inicial=Table[{r[[i]],RandomReal[{0.1,100}],\[CurlyEpsilon],rmax},{i,1,n}];*)


(* ::Subsection:: *)
(*C\[AAcute]lculo*)


(* ::Input:: *)
(*(*Minimizaci\[OAcute]n*)*)
(*Dynamic[ temp]*)
(*sol= FindMinimum[{Re[Vtotal],restricciones},inicial, AccuracyGoal->2,MaxIterations->1000,StepMonitor:>(temp=r)] *)


(* ::Input:: *)
(*(*Extraer los radios \[OAcute]ptimos de la soluci\[OAcute]n*)*)
(*radiosOptimizados=r/. sol[[2]]*)
(**)
(*(*Dibujar los anillos*)*)
(*graf = Graphics[{Table[{Orange,Thick,Circle[{0,0},radiosOptimizados[[i]]]},{i,1,Length[radiosOptimizados]}]},Axes->True]*)


(* ::Input:: *)
(*Min[Table[Vtotal/.Table[r[[i]]-> (r[[i]]/. sol[[2]])(1+RandomReal[{0,0.15}]),{i,1,n}],{j,1,1000}]]>Vtotal/. sol[[2]]*)
