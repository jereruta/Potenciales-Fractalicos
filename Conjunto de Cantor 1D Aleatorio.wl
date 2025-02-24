(* ::Package:: *)

(* ::Input:: *)
(*(*Funci\[OAcute]n que genera una iteraci\[OAcute]n del conjunto de Cantor Aleatorio*)*)
(*CantorIterate[segments_]:=Flatten[Table[Module[{L=segment[[2]]-segment[[1]],deltaL1,deltaL2},  *)
(*deltaL1=RandomReal[] L /2;*)
(*deltaL2 = RandomReal[] L /2;*)
(**)
(*{{segment[[1]],segment[[1]]+(L-deltaL1)/2},{segment[[2]]-(L-deltaL2)/2,segment[[2]]}}],*)
(**)
(*{segment,segments}],1]*)


(* ::Input:: *)
(*(*Funci\[OAcute]n para aplicar n iteraciones al conjunto de Cantor*)*)
(*CantorSet[L_,n_]:=Nest[CantorIterate[#]&,{{0,L}},n]*)


(* ::Input:: *)
(*(* Par\[AAcute]metros *)*)
(*L = 1; (* Longitud inicial del segmento *)*)
(*n = 5; (* N\[UAcute]mero de iteraciones *)*)


(* ::Input:: *)
(*(* Generar el conjunto de Cantor Aleatorio *)*)
(*cantorSet = CantorSet[L,n];*)


(* ::Input:: *)
(*(* Visualizaci\[OAcute]n del conjunto de Cantor Aleatorio *)*)
(*Graphics[Line[{{#, 0}, {#, 1}} & @@@ cantorSet],\[NonBreakingSpace]Axes\[NonBreakingSpace]->\[NonBreakingSpace]True]*)


(* ::Input:: *)
(*(*Definison del potencial por segmentos*)*)
(*\[Phi][r_,z_,seg_] :=Log[(Sqrt[1+((seg[[2]]-z)^2)/r^2]+(seg[[2]]-z)/r)/(Sqrt[1+((seg[[1]]-z)^2)/r^2]+(seg[[1]]-z)/r)]*)
(*\[CapitalPhi][r_,z_]:= Sum[\[Phi][r,z,seg],{seg,cantorSet}]*)


(* ::Input:: *)
(*(*Visualizaci\[OAcute]n del potencial*)*)
(*ContourPlot[\[CapitalPhi][r,z],{r,0,0.1},{z,-0.1,1.1}]*)


(* ::Input:: *)
(*(*Transformada de Fourier analitica*)*)
(*(*Transformada de Fourier de un segmento con longitud (1/3)^n*)*)
(*Fn\[Phi][kr_,kz_,n_] :=(I /(2Pi)^3 )*(1/(kz^2+kr^2))*((1-Exp[I kz (1/3)^n])/kz)*)
(*(*Transformada de Fourier del conjunto de cantor, a partir de suma de frecuencias*)*)
(*Fn\[CapitalPhi][kr_,kz_] := Fn\[Phi][kr,kz,n]*Sum[Exp[I kz seg[[1]]],{seg,cantorSet}]*)


(* ::Input:: *)
(*(*Grafico de la TF del conjunto de cantor para un valor de kr y un rango de 0 < kz < kzmax*)*)
(*kr=50000; (*longitud de onda en r*)*)
(*kzmax =50000; (*longitud de onda en z*)*)
(*Plot[Re[Fcantor\[CapitalPhi][kr,kz]],{kz,0,kzmax},PlotRange->All,ImageSize->Large,ColorFunction->Black,PlotLabel->"n="<>ToString[n]<>" kr="<>ToString[kr] <>" kzmax="<>ToString[kzmax]]*)
