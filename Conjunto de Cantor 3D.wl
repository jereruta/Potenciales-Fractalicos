(* ::Package:: *)

(* ::Input:: *)
(*(*Funci\[OAcute]n que genera una iteraci\[OAcute]n del conjunto de Cantor 3D*)CantorIterate3D[cubes_,gamma_]:=Flatten[Table[Module[{Lx=cube[[2,1]]-cube[[1,1]],Ly=cube[[2,2]]-cube[[1,2]],Lz=cube[[2,3]]-cube[[1,3]],deltaLx,deltaLy,deltaLz},*)
(*deltaLx=gamma Lx;*)
(*deltaLy=gamma Ly;*)
(*deltaLz=gamma Lz;*)
(**)
(*{*)
(*{{cube[[1,1]],cube[[1,2]],cube[[1,3]]},{cube[[1,1]]+(Lx-deltaLx)/2,cube[[1,2]]+(Ly-deltaLy)/2,cube[[1,3]]+(Lz-deltaLz)/2}},{{cube[[2,1]]-(Lx-deltaLx)/2,cube[[1,2]],cube[[1,3]]},{cube[[2,1]],cube[[1,2]]+(Ly-deltaLy)/2,cube[[1,3]]+(Lz-deltaLz)/2}},{{cube[[1,1]],cube[[2,2]]-(Ly-deltaLy)/2,cube[[1,3]]},{cube[[1,1]]+(Lx-deltaLx)/2,cube[[2,2]],cube[[1,3]]+(Lz-deltaLz)/2}},{{cube[[1,1]],cube[[1,2]],cube[[2,3]]-(Lz-deltaLz)/2},{cube[[1,1]]+(Lx-deltaLx)/2,cube[[1,2]]+(Ly-deltaLy)/2,cube[[2,3]]}},{{cube[[2,1]]-(Lx-deltaLx)/2,cube[[2,2]]-(Ly-deltaLy)/2,cube[[1,3]]},{cube[[2,1]],cube[[2,2]],cube[[1,3]]+(Lz-deltaLz)/2}},{{cube[[2,1]]-(Lx-deltaLx)/2,cube[[1,2]],cube[[2,3]]-(Lz-deltaLz)/2},{cube[[2,1]],cube[[1,2]]+(Ly-deltaLy)/2,cube[[2,3]]}},{{cube[[1,1]],cube[[2,2]]-(Ly-deltaLy)/2,cube[[2,3]]-(Lz-deltaLz)/2},{cube[[1,1]]+(Lx-deltaLx)/2,cube[[2,2]],cube[[2,3]]}},{{cube[[2,1]]-(Lx-deltaLx)/2,cube[[2,2]]-(Ly-deltaLy)/2,cube[[2,3]]-(Lz-deltaLz)/2},{cube[[2,1]],cube[[2,2]],cube[[2,3]]}}*)
(*}],*)
(**)
(*{cube,cubes}],1]*)


(* ::Input:: *)
(*(*Funci\[OAcute]n para aplicar n iteraciones al conjunto de Cantor 3D*)*)
(*CantorSet3D[L_,gamma_,n_]:=Nest[CantorIterate3D[#,gamma]&,{{{0,0,0},{L,L,L}}},n]*)


(* ::Input:: *)
(*(*Par\[AAcute]metros*)*)
(*L=1; (*Longitud inicial del lado del cuadrado*)*)
(*gamma=1/3; (*Fracci\[OAcute]n a retirar del centro*)*)
(*n=4; (*N\[UAcute]mero de iteraciones*)*)


(* ::Input:: *)
(*(*Generar el conjunto de Cantor modificado en 3D*)*)
(*cantorSet3D=CantorSet3D[L,gamma,n];*)


(* ::Input:: *)
(*(*Visualizaci\[OAcute]n del conjunto de Cantor modificado en 3D*)*)
(*Graphics3D[Cuboid@@@cantorSet3D,Axes->True]*)


(* ::Input:: *)
(*(*Potencial de un cubo de lados (seg[[1,1]]-seg[[2,1]]),(seg[[1,2]]-seg[[2,2]]),(seg[[1,3]]-seg[[2,3]])*)*)
(*\[Phi]3D[X_,Y_,Z_,seg_]:=(1/2) (ArcTan[((-Y+seg[[1,2]]) (-Z+seg[[1,3]]))/((-X+seg[[1,1]]) \[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2))] (X-seg[[1,1]])^2-ArcTan[((-Z+seg[[1,3]]) (-Y+seg[[2,2]]))/((-X+seg[[1,1]]) \[Sqrt]((X-seg[[1,1]])^2+(Z-seg[[1,3]])^2+(Y-seg[[2,2]])^2))] (X-seg[[1,1]])^2-ArcTan[((-Y+seg[[1,2]]) (-Z+seg[[2,3]]))/((-X+seg[[1,1]]) \[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[2,3]])^2))] (X-seg[[1,1]])^2+ArcTan[((-Y+seg[[2,2]]) (-Z+seg[[2,3]]))/((-X+seg[[1,1]]) \[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2))] (X-seg[[1,1]])^2-2 Log[-Z+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2)+seg[[1,3]]] (X-seg[[1,1]]) (Y-seg[[1,2]])+2 Log[-Z+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[2,3]])^2)+seg[[2,3]]] (X-seg[[1,1]]) (Y-seg[[1,2]])+ArcTan[((-X+seg[[1,1]]) (-Z+seg[[1,3]]))/((-Y+seg[[1,2]]) \[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2))] (Y-seg[[1,2]])^2-ArcTan[((-Z+seg[[1,3]]) (-X+seg[[2,1]]))/((-Y+seg[[1,2]]) \[Sqrt]((Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2+(X-seg[[2,1]])^2))] (Y-seg[[1,2]])^2-ArcTan[((-X+seg[[1,1]]) (-Z+seg[[2,3]]))/((-Y+seg[[1,2]]) \[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[2,3]])^2))] (Y-seg[[1,2]])^2+ArcTan[((-X+seg[[2,1]]) (-Z+seg[[2,3]]))/((-Y+seg[[1,2]]) \[Sqrt]((Y-seg[[1,2]])^2+(X-seg[[2,1]])^2+(Z-seg[[2,3]])^2))] (Y-seg[[1,2]])^2-2 Log[-Y+seg[[1,2]]+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2)] (X-seg[[1,1]]) (Z-seg[[1,3]])+2 Log[-Y+\[Sqrt]((X-seg[[1,1]])^2+(Z-seg[[1,3]])^2+(Y-seg[[2,2]])^2)+seg[[2,2]]] (X-seg[[1,1]]) (Z-seg[[1,3]])-2 Log[-X+seg[[1,1]]+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2)] (Y-seg[[1,2]]) (Z-seg[[1,3]])+2 Log[-X+\[Sqrt]((Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2+(X-seg[[2,1]])^2)+seg[[2,1]]] (Y-seg[[1,2]]) (Z-seg[[1,3]])+ArcTan[((-X+seg[[1,1]]) (-Y+seg[[1,2]]))/(\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2) (-Z+seg[[1,3]]))] (Z-seg[[1,3]])^2-ArcTan[((-Y+seg[[1,2]]) (-X+seg[[2,1]]))/((-Z+seg[[1,3]]) \[Sqrt]((Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2+(X-seg[[2,1]])^2))] (Z-seg[[1,3]])^2-ArcTan[((-X+seg[[1,1]]) (-Y+seg[[2,2]]))/((-Z+seg[[1,3]]) \[Sqrt]((X-seg[[1,1]])^2+(Z-seg[[1,3]])^2+(Y-seg[[2,2]])^2))] (Z-seg[[1,3]])^2+ArcTan[((-X+seg[[2,1]]) (-Y+seg[[2,2]]))/((-Z+seg[[1,3]]) \[Sqrt]((Z-seg[[1,3]])^2+(X-seg[[2,1]])^2+(Y-seg[[2,2]])^2))] (Z-seg[[1,3]])^2+2 Log[-Z+seg[[1,3]]+\[Sqrt]((Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2+(X-seg[[2,1]])^2)] (Y-seg[[1,2]]) (X-seg[[2,1]])-2 Log[-Z+\[Sqrt]((Y-seg[[1,2]])^2+(X-seg[[2,1]])^2+(Z-seg[[2,3]])^2)+seg[[2,3]]] (Y-seg[[1,2]]) (X-seg[[2,1]])+2 Log[-Y+seg[[1,2]]+\[Sqrt]((Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2+(X-seg[[2,1]])^2)] (Z-seg[[1,3]]) (X-seg[[2,1]])-2 Log[-Y+\[Sqrt]((Z-seg[[1,3]])^2+(X-seg[[2,1]])^2+(Y-seg[[2,2]])^2)+seg[[2,2]]] (Z-seg[[1,3]]) (X-seg[[2,1]])-ArcTan[((-Y+seg[[1,2]]) (-Z+seg[[1,3]]))/(\[Sqrt]((Y-seg[[1,2]])^2+(Z-seg[[1,3]])^2+(X-seg[[2,1]])^2) (-X+seg[[2,1]]))] (X-seg[[2,1]])^2+ArcTan[((-Z+seg[[1,3]]) (-Y+seg[[2,2]]))/((-X+seg[[2,1]]) \[Sqrt]((Z-seg[[1,3]])^2+(X-seg[[2,1]])^2+(Y-seg[[2,2]])^2))] (X-seg[[2,1]])^2+ArcTan[((-Y+seg[[1,2]]) (-Z+seg[[2,3]]))/((-X+seg[[2,1]]) \[Sqrt]((Y-seg[[1,2]])^2+(X-seg[[2,1]])^2+(Z-seg[[2,3]])^2))] (X-seg[[2,1]])^2-ArcTan[((-Y+seg[[2,2]]) (-Z+seg[[2,3]]))/((-X+seg[[2,1]]) \[Sqrt]((X-seg[[2,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2))] (X-seg[[2,1]])^2+2 Log[-Z+seg[[1,3]]+\[Sqrt]((X-seg[[1,1]])^2+(Z-seg[[1,3]])^2+(Y-seg[[2,2]])^2)] (X-seg[[1,1]]) (Y-seg[[2,2]])-2 Log[-Z+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2)+seg[[2,3]]] (X-seg[[1,1]]) (Y-seg[[2,2]])+2 Log[-X+seg[[1,1]]+\[Sqrt]((X-seg[[1,1]])^2+(Z-seg[[1,3]])^2+(Y-seg[[2,2]])^2)] (Z-seg[[1,3]]) (Y-seg[[2,2]])-2 Log[-X+seg[[2,1]]+\[Sqrt]((Z-seg[[1,3]])^2+(X-seg[[2,1]])^2+(Y-seg[[2,2]])^2)] (Z-seg[[1,3]]) (Y-seg[[2,2]])-2 Log[-Z+seg[[1,3]]+\[Sqrt]((Z-seg[[1,3]])^2+(X-seg[[2,1]])^2+(Y-seg[[2,2]])^2)] (X-seg[[2,1]]) (Y-seg[[2,2]])+2 Log[-Z+\[Sqrt]((X-seg[[2,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2)+seg[[2,3]]] (X-seg[[2,1]]) (Y-seg[[2,2]])-ArcTan[((-X+seg[[1,1]]) (-Z+seg[[1,3]]))/(\[Sqrt]((X-seg[[1,1]])^2+(Z-seg[[1,3]])^2+(Y-seg[[2,2]])^2) (-Y+seg[[2,2]]))] (Y-seg[[2,2]])^2+ArcTan[((-Z+seg[[1,3]]) (-X+seg[[2,1]]))/(\[Sqrt]((Z-seg[[1,3]])^2+(X-seg[[2,1]])^2+(Y-seg[[2,2]])^2) (-Y+seg[[2,2]]))] (Y-seg[[2,2]])^2+ArcTan[((-X+seg[[1,1]]) (-Z+seg[[2,3]]))/((-Y+seg[[2,2]]) \[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2))] (Y-seg[[2,2]])^2-ArcTan[((-X+seg[[2,1]]) (-Z+seg[[2,3]]))/((-Y+seg[[2,2]]) \[Sqrt]((X-seg[[2,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2))] (Y-seg[[2,2]])^2+2 Log[-Y+seg[[1,2]]+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[2,3]])^2)] (X-seg[[1,1]]) (Z-seg[[2,3]])-2 Log[-Y+seg[[2,2]]+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2)] (X-seg[[1,1]]) (Z-seg[[2,3]])+2 Log[-X+seg[[1,1]]+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[2,3]])^2)] (Y-seg[[1,2]]) (Z-seg[[2,3]])-2 Log[-X+seg[[2,1]]+\[Sqrt]((Y-seg[[1,2]])^2+(X-seg[[2,1]])^2+(Z-seg[[2,3]])^2)] (Y-seg[[1,2]]) (Z-seg[[2,3]])-2 Log[-Y+seg[[1,2]]+\[Sqrt]((Y-seg[[1,2]])^2+(X-seg[[2,1]])^2+(Z-seg[[2,3]])^2)] (X-seg[[2,1]]) (Z-seg[[2,3]])+2 Log[-Y+seg[[2,2]]+\[Sqrt]((X-seg[[2,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2)] (X-seg[[2,1]]) (Z-seg[[2,3]])-2 Log[-X+seg[[1,1]]+\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2)] (Y-seg[[2,2]]) (Z-seg[[2,3]])+2 Log[-X+seg[[2,1]]+\[Sqrt]((X-seg[[2,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2)] (Y-seg[[2,2]]) (Z-seg[[2,3]])-ArcTan[((-X+seg[[1,1]]) (-Y+seg[[1,2]]))/(\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[1,2]])^2+(Z-seg[[2,3]])^2) (-Z+seg[[2,3]]))] (Z-seg[[2,3]])^2+ArcTan[((-Y+seg[[1,2]]) (-X+seg[[2,1]]))/(\[Sqrt]((Y-seg[[1,2]])^2+(X-seg[[2,1]])^2+(Z-seg[[2,3]])^2) (-Z+seg[[2,3]]))] (Z-seg[[2,3]])^2+ArcTan[((-X+seg[[1,1]]) (-Y+seg[[2,2]]))/(\[Sqrt]((X-seg[[1,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2) (-Z+seg[[2,3]]))] (Z-seg[[2,3]])^2-ArcTan[((-X+seg[[2,1]]) (-Y+seg[[2,2]]))/(\[Sqrt]((X-seg[[2,1]])^2+(Y-seg[[2,2]])^2+(Z-seg[[2,3]])^2) (-Z+seg[[2,3]]))] (Z-seg[[2,3]])^2)*)


(* ::Input:: *)
(*(*Potencial del Cantor en 3D*)*)
(*\[CapitalPhi]3D[x_,y_,z_]:=Sum[\[Phi]3D[x,y,z,seg],{seg,cantorSet3D}]*)


(* ::Input:: *)
(*(*Visualizaci\[OAcute]n del potencial por grafico de contornos*) *)
(*ContourPlot[\[CapitalPhi]3D[0.1,y,z],{y,-1,2},{z,-1,2}]*)


(* ::Input:: *)
(*(*Visualizaci\[OAcute]n del potencial por densidad de puntos*)*)
(*data = Table[{x,y,z,\[CapitalPhi]3D[x,y,z]},{x,-1.01,2.01,0.05},{y,-1.01,2.01,0.05},{z,-1.01,2.01,0.05}];*)
(*data2 =Partition[Flatten[data],4];*)
(*ListDensityPlot3D[data2,PlotRange->{{-0.4,1.4},{-0.4,1.4},{-0.4,1.4}}, ImageSize->Large]*)
