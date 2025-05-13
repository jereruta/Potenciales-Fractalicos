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
(*n = 8; (* N\[UAcute]mero de iteraciones *)*)


(* ::Input:: *)
(*(* Generar el conjunto de Cantor Aleatorio *)*)
(*cantorSet = CantorSet[L,n];*)


(* ::Input:: *)
(*(*Dibujar los anillos*)*)
(*Graphics[Table[Module[{rIn,rOut},{rIn,rOut}=par;{Black,Disk[{0,0},rOut],White,Disk[{0,0},rIn]}],{par,Reverse[cantorSet]}],Axes->True]*)


(* ::Input:: *)
(*(*Pot. de un disco seg[1]<r<seg[2]*)*)
(*\[Phi]ring[r_,z_,seg_]:=-(-Sqrt[z^2+(seg[[2]]+r)^2]EllipticE[Sqrt[4seg[[2]] r / (z^2 + (seg[[2]]+r)^2)]]-(seg[[2]]^2-r^2)/Sqrt[z^2 + (seg[[2]]+r)^2] EllipticK[Sqrt[4seg[[2]] r / (z^2 + (seg[[2]]+r)^2)]]- (seg[[2]]-r)/(seg[[2]]+r)z^2/Sqrt[z^2 + (seg[[2]]+r)^2] EllipticPi[4seg[[2]] r / (seg[[2]]+r)^2,Sqrt[4seg[[2]] r / (z^2 + (seg[[2]]+r)^2)]])+(-Sqrt[z^2+(seg[[1]]+r)^2]EllipticE[Sqrt[4seg[[1]] r / (z^2 + (seg[[1]]+r)^2)]]-(seg[[1]]^2-r^2)/Sqrt[z^2 + (seg[[1]]+r)^2] EllipticK[Sqrt[4seg[[1]] r / (z^2 + (seg[[1]]+r)^2)]]- (seg[[1]]-r)/(seg[[1]]+r)z^2/Sqrt[z^2 + (seg[[1]]+r)^2] EllipticPi[4seg[[1]] r / (seg[[1]]+r)^2,Sqrt[4seg[[1]] r / (z^2 + (seg[[1]]+r)^2)]])*)
(*(*Pot. de un disco seg[1]<r<seg[2] en z=0*)*)
(*\[Phi]0ring[r_,seg_]:= 2((seg[[2]]+r)EllipticE[Sqrt[4seg[[2]] r / (seg[[2]]+r)^2]]+(seg[[2]]-r) EllipticK[Sqrt[4seg[[2]] r /(seg[[2]]+r)^2]]-(seg[[1]]+r)EllipticE[Sqrt[4seg[[1]] r / (seg[[1]]+r)^2]]-(seg[[1]]-r) EllipticK[Sqrt[4seg[[1]] r /(seg[[1]]+r)^2]])*)


(* ::Input:: *)
(*(*Pot. anillos de Cantor aleatorio*)*)
(*\[CapitalPhi]ring[r_,z_]:= -Sum[\[Phi]ring[r,z,seg],{seg,cantorSet}]-1/r*)
(*(*Pot. anillos de Cantor aleatorio con z=0*)*)
(*\[CapitalPhi]0ring[r_]:= -Sum[\[Phi]0ring[r,seg],{seg,cantorSet}];*)


(* ::Input:: *)
(*(*visualizacion del Pot.*)*)
(*Plot[\[CapitalPhi]0ring[r],{r,0,2},ImageSize->Large]*)


(* ::Input:: *)
(*(*Velocidad de rotacion de una particula de prueba sobre el plano z=0*)*)
(*v2[r_]=r D[\[CapitalPhi]0ring[r],r];*)


(* ::Input:: *)
(*(*Visualizacion de la curva de rotacion*)*)
(*Plot[v2[r],{r,0,2},ImageSize->Large,PlotRange->All,AxesLabel->{r,"v^2(r)"}]*)
