(* ::Package:: *)

(* ::Input:: *)
(*(*Funci\[OAcute]n que genera una iteraci\[OAcute]n del conjunto de Cantor Aleatorio en 2D*)CantorIterate2Dran[squares_]:=Flatten[Table[Module[{Lx=square[[2,1]]-square[[1,1]],Ly=square[[2,2]]-square[[1,2]], deltaLx1, deltaLx2,deltaLy1,deltaLy2},*)
(*deltaLx1=RandomReal[] Lx /2;*)
(*deltaLx2=RandomReal[] Lx /2;*)
(*deltaLy1=RandomReal[] Ly /2;*)
(*deltaLy2=RandomReal[] Ly /2;*)
(*{*)
(*{{square[[1,1]],square[[1,2]]},{square[[1,1]]+(Lx-deltaLx1)/2,square[[1,2]]+(Ly-deltaLy1)/2}},*)
(*{{square[[2,1]]-(Lx-deltaLx2)/2,square[[1,2]]},{square[[2,1]],square[[1,2]]+(Ly-deltaLy1)/2}},*)
(*{{square[[1,1]],square[[2,2]]-(Ly-deltaLy2)/2},{square[[1,1]]+(Lx-deltaLx1)/2,square[[2,2]]}},*)
(*{{square[[2,1]]-(Lx-deltaLx2)/2,square[[2,2]]-(Ly-deltaLy2)/2},{square[[2,1]],square[[2,2]]}}*)
(*}],*)
(**)
(*{square,squares}],1]*)


(* ::Input:: *)
(*(*Funci\[OAcute]n para aplicar n iteraciones al conjunto de Cantor 2D Aleatorio*)*)
(*CantorSet2Dran[L_,n_]:=Nest[CantorIterate2Dran[#]&,{{{0,0},{L,L}}},n]*)


(* ::Input:: *)
(*(*Par\[AAcute]metros*)*)
(*L=1; (*Longitud inicial del lado del cuadrado*)*)
(*n=4; (*N\[UAcute]mero de iteraciones*)*)


(* ::Input:: *)
(*(*Generar el conjunto de Cantor Aleatorio en 2D*)*)
(*cantorSet2Dran=CantorSet2Dran[L,n];*)


(* ::Input:: *)
(*(*Visualizaci\[OAcute]n del conjunto de Cantor Aleatorio en 2D*)*)
(*Graphics[Rectangle@@@cantorSet2Dran,Axes->True]*)
