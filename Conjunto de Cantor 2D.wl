(* ::Package:: *)

(* ::Input:: *)
(*(*Funci\[OAcute]n que genera una iteraci\[OAcute]n del conjunto de Cantor en 2D*)CantorIterate2D[squares_,gamma_]:=Flatten[Table[Module[{Lx=square[[2,1]]-square[[1,1]],Ly=square[[2,2]]-square[[1,2]], deltaLx, deltaLy},*)
(*deltaLx=gamma Lx;*)
(*deltaLy = gamma Ly;*)
(**)
(*{*)
(*{{square[[1,1]],square[[1,2]]},{square[[1,1]]+(Lx-deltaLx)/2,square[[1,2]]+(Ly-deltaLy)/2}},*)
(*{{square[[2,1]]-(Lx-deltaLx)/2,square[[1,2]]},{square[[2,1]],square[[1,2]]+(Ly-deltaLy)/2}},*)
(*{{square[[1,1]],square[[2,2]]-(Ly-deltaLy)/2},{square[[1,1]]+(Lx-deltaLx)/2,square[[2,2]]}},*)
(*{{square[[2,1]]-(Lx-deltaLx)/2,square[[2,2]]-(Ly-deltaLy)/2},{square[[2,1]],square[[2,2]]}}*)
(*}],*)
(**)
(*{square,squares}],1]*)


(* ::Input:: *)
(*(*Funci\[OAcute]n para aplicar n iteraciones al conjunto de Cantor 2D*)*)
(*CantorSet2D[L_,gamma_,n_]:=Nest[CantorIterate2D[#,gamma]&,{{{0,0},{L,L}}},n]*)


(* ::Input:: *)
(*(*Par\[AAcute]metros*)*)
(*L=1; (*Longitud inicial del lado del cuadrado*)*)
(*gamma=1/3; (*Fracci\[OAcute]n a retirar del centro*)*)
(*n=4; (*N\[UAcute]mero de iteraciones*)*)


(* ::Input:: *)
(*(*Generar el conjunto de Cantor modificado en 2D*)*)
(*cantorSet2D=CantorSet2D[L,gamma,n];*)


(* ::Input:: *)
(*(*Visualizaci\[OAcute]n del conjunto de Cantor modificado en 2D*)*)
(*Graphics[Rectangle@@@cantorSet2D,Axes->True,ImageSize->Small]*)
