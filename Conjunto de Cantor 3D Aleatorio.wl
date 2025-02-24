(* ::Package:: *)

(* ::Input:: *)
(*(*Funci\[OAcute]n que genera una iteraci\[OAcute]n del conjunto de Cantor Aleatorio en 3D*)CantorIterate3Dran[cubes_]:=Flatten[Table[Module[{Lx=cube[[2,1]]-cube[[1,1]],Ly=cube[[2,2]]-cube[[1,2]],Lz=cube[[2,3]]-cube[[1,3]],*)
(*deltaLx1,deltaLx2,deltaLy1,deltaLy2,deltaLz1,deltaLz2},*)
(**)
(*deltaLx1=RandomReal[] Lx/2;*)
(*deltaLx2=RandomReal[] Lx/2;*)
(*deltaLy1=RandomReal[] Ly/2;*)
(*deltaLy2=RandomReal[] Ly/2;*)
(*deltaLz1=RandomReal[] Lz/2;*)
(*deltaLz2=RandomReal[] Lz/2;*)
(*{*)
(*{{cube[[1,1]],cube[[1,2]],cube[[1,3]]},{cube[[1,1]]+(Lx-deltaLx1)/2,cube[[1,2]]+(Ly-deltaLy1)/2,cube[[1,3]]+(Lz-deltaLz1)/2}},{{cube[[2,1]]-(Lx-deltaLx2)/2,cube[[1,2]],cube[[1,3]]},{cube[[2,1]],cube[[1,2]]+(Ly-deltaLy1)/2,cube[[1,3]]+(Lz-deltaLz1)/2}},{{cube[[1,1]],cube[[2,2]]-(Ly-deltaLy2)/2,cube[[1,3]]},{cube[[1,1]]+(Lx-deltaLx1)/2,cube[[2,2]],cube[[1,3]]+(Lz-deltaLz1)/2}},{{cube[[1,1]],cube[[1,2]],cube[[2,3]]-(Lz-deltaLz2)/2},{cube[[1,1]]+(Lx-deltaLx1)/2,cube[[1,2]]+(Ly-deltaLy1)/2,cube[[2,3]]}},{{cube[[2,1]]-(Lx-deltaLx2)/2,cube[[2,2]]-(Ly-deltaLy2)/2,cube[[1,3]]},{cube[[2,1]],cube[[2,2]],cube[[1,3]]+(Lz-deltaLz1)/2}},{{cube[[2,1]]-(Lx-deltaLx2)/2,cube[[1,2]],cube[[2,3]]-(Lz-deltaLz2)/2},{cube[[2,1]],cube[[1,2]]+(Ly-deltaLy1)/2,cube[[2,3]]}},{{cube[[1,1]],cube[[2,2]]-(Ly-deltaLy2)/2,cube[[2,3]]-(Lz-deltaLz2)/2},{cube[[1,1]]+(Lx-deltaLx1)/2,cube[[2,2]],cube[[2,3]]}},{{cube[[2,1]]-(Lx-deltaLx2)/2,cube[[2,2]]-(Ly-deltaLy2)/2,cube[[2,3]]-(Lz-deltaLz2)/2},{cube[[2,1]],cube[[2,2]],cube[[2,3]]}}*)
(*}],*)
(**)
(*{cube,cubes}],1]*)


(* ::Input:: *)
(*(*Funci\[OAcute]n para aplicar n iteraciones al conjunto de Cantor 3D Aeatorio*)*)
(*CantorSet3Dran[L_,n_]:=Nest[CantorIterate3Dran[#]&,{{{0,0,0},{L,L,L}}},n]*)


(* ::Input:: *)
(*(*Par\[AAcute]metros*)*)
(*L=1; (*Longitud inicial del lado del cuadrado*)*)
(*n=4; (*N\[UAcute]mero de iteraciones*)*)


(* ::Input:: *)
(*(*Generar el conjunto de Cantor Aleatorio en 3D*)*)
(*cantorSet3Dran=CantorSet3Dran[L,n];*)


(* ::Input:: *)
(*(*Visualizaci\[OAcute]n del conjunto de Cantor Aleatorio en 3D*)*)
(*Graphics3D[Cuboid@@@cantorSet3Dran,Axes->True]*)


(* ::Input:: *)
(*(*Potencial de un cubo de lados (seg[[1,1]]-seg[[2,1]]),(seg[[1,2]]-seg[[2,2]]),(seg[[1,3]]-seg[[2,3]])*)*)
(*\[Phi]3D[X_,Y_,Z_,seg_]:=(1/2) (ArcTan[((-Y+seg[[1,2]]) (-Z+seg[[1,3]]))/((-X+seg[[1,1]]) \[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2))] (X-seg[[1,1]])^2-ArcTan[((-Z+seg[[1,3]]) (-Y+seg[[2,2]]))/((-X+seg[[1,1]]) \[Sqrt]((X-seg[[1,1]])^2+(Z-seg[[1,3]])^2+(Y-seg[[2,2]])^2))] (X-seg[[1,1]])^2-ArcTan[((-Y+seg[[1,2]]) (-Z+seg[[2,3]]))/((-X+seg[[1,1]]) \[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[2,3]])^2))] (X-seg[[1,1]])^2+ArcTan[((-Y+seg[[2,2]]) (-Z+seg[[2,3]]))/((-X+seg[[1,1]]) \[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2))] (X-seg[[1,1]])^2-2 Log[-Z+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2)+seg[[1,3]]] (X-seg[[1,1]]) (Y-seg[[1,2]])+2 Log[-Z+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[2,3]])^2)+seg[[2,3]]] (X-seg[[1,1]]) (Y-seg[[1,2]])+ArcTan[((-X+seg[[1,1]]) (-Z+seg[[1,3]]))/((-Y+seg[[1,2]]) \[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2))] (Y-seg[[1,2]])^2-ArcTan[((-Z+seg[[1,3]]) (-X+seg[[2,1]]))/((-Y+seg[[1,2]]) \[Sqrt]((Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2+(X-seg[[2,1]])^2))] (Y-seg[[1,2]])^2-ArcTan[((-X+seg[[1,1]]) (-Z+seg[[2,3]]))/((-Y+seg[[1,2]]) \[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[2,3]])^2))] (Y-seg[[1,2]])^2+ArcTan[((-X+seg[[2,1]]) (-Z+seg[[2,3]]))/((-Y+seg[[1,2]]) \[Sqrt]((Y-seg[[1,2]])^2+(X-seg[[2,1]])^2+(Z-seg[[2,3]])^2))] (Y-seg[[1,2]])^2-2 Log[-Y+seg[[1,2]]+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2)] (X-seg[[1,1]]) (Z-seg[[1,3]])+2 Log[-Y+\[Sqrt]((X-seg[[1,1]])^2+(Z-seg[[1,3]])^2+(Y-seg[[2,2]])^2)+seg[[2,2]]] (X-seg[[1,1]]) (Z-seg[[1,3]])-2 Log[-X+seg[[1,1]]+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2)] (Y-seg[[1,2]]) (Z-seg[[1,3]])+2 Log[-X+\[Sqrt]((Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2+(X-seg[[2,1]])^2)+seg[[2,1]]] (Y-seg[[1,2]]) (Z-seg[[1,3]])+ArcTan[((-X+seg[[1,1]]) (-Y+seg[[1,2]]))/(\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2) (-Z+seg[[1,3]]))] (Z-seg[[1,3]])^2-ArcTan[((-Y+seg[[1,2]]) (-X+seg[[2,1]]))/((-Z+seg[[1,3]]) \[Sqrt]((Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2+(X-seg[[2,1]])^2))] (Z-seg[[1,3]])^2-ArcTan[((-X+seg[[1,1]]) (-Y+seg[[2,2]]))/((-Z+seg[[1,3]]) \[Sqrt]((X-seg[[1,1]])^2+(Z-seg[[1,3]])^2+(Y-seg[[2,2]])^2))] (Z-seg[[1,3]])^2+ArcTan[((-X+seg[[2,1]]) (-Y+seg[[2,2]]))/((-Z+seg[[1,3]]) \[Sqrt]((Z-seg[[1,3]])^2+(X-seg[[2,1]])^2+(Y-seg[[2,2]])^2))] (Z-seg[[1,3]])^2+2 Log[-Z+seg[[1,3]]+\[Sqrt]((Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2+(X-seg[[2,1]])^2)] (Y-seg[[1,2]]) (X-seg[[2,1]])-2 Log[-Z+\[Sqrt]((Y-seg[[1,2]])^2+(X-seg[[2,1]])^2+(Z-seg[[2,3]])^2)+seg[[2,3]]] (Y-seg[[1,2]]) (X-seg[[2,1]])+2 Log[-Y+seg[[1,2]]+\[Sqrt]((Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2+(X-seg[[2,1]])^2)] (Z-seg[[1,3]]) (X-seg[[2,1]])-2 Log[-Y+\[Sqrt]((Z-seg[[1,3]])^2+(X-seg[[2,1]])^2+(Y-seg[[2,2]])^2)+seg[[2,2]]] (Z-seg[[1,3]]) (X-seg[[2,1]])-ArcTan[((-Y+seg[[1,2]]) (-Z+seg[[1,3]]))/(\[Sqrt]((Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2+(X-seg[[2,1]])^2) (-X+seg[[2,1]]))] (X-seg[[2,1]])^2+ArcTan[((-Z+seg[[1,3]]) (-Y+seg[[2,2]]))/((-X+seg[[2,1]]) \[Sqrt]((Z-seg[[1,3]])^2+(X-seg[[2,1]])^2+(Y-seg[[2,2]])^2))] (X-seg[[2,1]])^2+ArcTan[((-Y+seg[[1,2]]) (-Z+seg[[2,3]]))/((-X+seg[[2,1]]) \[Sqrt]((Y-seg[[1,2]])^2+(X-seg[[2,1]])^2+(Z-seg[[2,3]])^2))] (X-seg[[2,1]])^2-ArcTan[((-Y+seg[[2,2]]) (-Z+seg[[2,3]]))/((-X+seg[[2,1]]) \[Sqrt]((X-seg[[2,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2))] (X-seg[[2,1]])^2+2 Log[-Z+seg[[1,3]]+\[Sqrt]((X-seg[[1,1]])^2+(Z-seg[[1,3]])^2+(Y-seg[[2,2]])^2)] (X-seg[[1,1]]) (Y-seg[[2,2]])-2 Log[-Z+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2)+seg[[2,3]]] (X-seg[[1,1]]) (Y-seg[[2,2]])+2 Log[-X+seg[[1,1]]+\[Sqrt]((X-seg[[1,1]])^2+(Z-seg[[1,3]])^2+(Y-seg[[2,2]])^2)] (Z-seg[[1,3]]) (Y-seg[[2,2]])-2 Log[-X+seg[[2,1]]+\[Sqrt]((Z-seg[[1,3]])^2+(X-seg[[2,1]])^2+(Y-seg[[2,2]])^2)] (Z-seg[[1,3]]) (Y-seg[[2,2]])-2 Log[-Z+seg[[1,3]]+\[Sqrt]((Z-seg[[1,3]])^2+(X-seg[[2,1]])^2+(Y-seg[[2,2]])^2)] (X-seg[[2,1]]) (Y-seg[[2,2]])+2 Log[-Z+\[Sqrt]((X-seg[[2,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2)+seg[[2,3]]] (X-seg[[2,1]]) (Y-seg[[2,2]])-ArcTan[((-X+seg[[1,1]]) (-Z+seg[[1,3]]))/(\[Sqrt]((X-seg[[1,1]])^2+(Z-seg[[1,3]])^2+(Y-seg[[2,2]])^2) (-Y+seg[[2,2]]))] (Y-seg[[2,2]])^2+ArcTan[((-Z+seg[[1,3]]) (-X+seg[[2,1]]))/(\[Sqrt]((Z-seg[[1,3]])^2+(X-seg[[2,1]])^2+(Y-seg[[2,2]])^2) (-Y+seg[[2,2]]))] (Y-seg[[2,2]])^2+ArcTan[((-X+seg[[1,1]]) (-Z+seg[[2,3]]))/((-Y+seg[[2,2]]) \[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2))] (Y-seg[[2,2]])^2-ArcTan[((-X+seg[[2,1]]) (-Z+seg[[2,3]]))/((-Y+seg[[2,2]]) \[Sqrt]((X-seg[[2,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2))] (Y-seg[[2,2]])^2+2 Log[-Y+seg[[1,2]]+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[2,3]])^2)] (X-seg[[1,1]]) (Z-seg[[2,3]])-2 Log[-Y+seg[[2,2]]+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2)] (X-seg[[1,1]]) (Z-seg[[2,3]])+2 Log[-X+seg[[1,1]]+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[2,3]])^2)] (Y-seg[[1,2]]) (Z-seg[[2,3]])-2 Log[-X+seg[[2,1]]+\[Sqrt]((Y-seg[[1,2]])^2+(X-seg[[2,1]])^2+(Z-seg[[2,3]])^2)] (Y-seg[[1,2]]) (Z-seg[[2,3]])-2 Log[-Y+seg[[1,2]]+\[Sqrt]((Y-seg[[1,2]])^2+(X-seg[[2,1]])^2+(Z-seg[[2,3]])^2)] (X-seg[[2,1]]) (Z-seg[[2,3]])+2 Log[-Y+seg[[2,2]]+\[Sqrt]((X-seg[[2,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2)] (X-seg[[2,1]]) (Z-seg[[2,3]])-2 Log[-X+seg[[1,1]]+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2)] (Y-seg[[2,2]]) (Z-seg[[2,3]])+2 Log[-X+seg[[2,1]]+\[Sqrt]((X-seg[[2,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2)] (Y-seg[[2,2]]) (Z-seg[[2,3]])-ArcTan[((-X+seg[[1,1]]) (-Y+seg[[1,2]]))/(\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[2,3]])^2) (-Z+seg[[2,3]]))] (Z-seg[[2,3]])^2+ArcTan[((-Y+seg[[1,2]]) (-X+seg[[2,1]]))/(\[Sqrt]((Y-seg[[1,2]])^2+(X-seg[[2,1]])^2+(Z-seg[[2,3]])^2) (-Z+seg[[2,3]]))] (Z-seg[[2,3]])^2+ArcTan[((-X+seg[[1,1]]) (-Y+seg[[2,2]]))/(\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2) (-Z+seg[[2,3]]))] (Z-seg[[2,3]])^2-ArcTan[((-X+seg[[2,1]]) (-Y+seg[[2,2]]))/(\[Sqrt]((X-seg[[2,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2) (-Z+seg[[2,3]]))] (Z-seg[[2,3]])^2)*)


(* ::Input:: *)
(*(*Potencial del Cantor Aleatorio en 3D*)*)
(*\[CapitalPhi]3Dran[x_,y_,z_]:=Sum[\[Phi]3D[x,y,z,cantorSet3Dran[[seg]]],{seg,1,Length[cantorSet3Dran]}]*)


(* ::Input:: *)
(*(*Grafico del potencial por contornos*)*)
(*ContourPlot[\[CapitalPhi]3Dran[x,y,0.75],{x,0.542,0.547},{y,0.441,0.446},ImageSize->Large] *)
