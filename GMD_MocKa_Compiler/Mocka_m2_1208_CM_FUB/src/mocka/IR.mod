  (**************************************************************) 
  (*   This module was generated by BEG V1.84        *)
  (*        GMD Forschunsstelle an der Universitaet Karlsruhe   *)
  (*        Vincenz-Priessnitz-Str. 1 76131 Karlsruhe Germany   *)
  (**************************************************************)
 IMPLEMENTATION MODULE IR;

IMPORT InOut;
(*++++++ start insertion IpTestImport ++++++*)

FROM	Prints	IMPORT	PrintSHORTCARD, PrintLONGCARD, PrintSHORTINT,
			PrintLONGINT, PrintDataTempo, PrintAddressTempo,
			PrintSysProc, PrintLabelList, PrintLabel,
			PrintMode, PrintString, PrintStringIndex, PrintLONGREAL,
			PrintREAL, PrintBITSET, PrintProcIndex, PrintRelation,
			PrintModuleIndex, PrintCHAR, PrintADDRESS,
			PrintRelSymb, PrintMemAdr, PrintAdrMode;


(*------ end   insertion IpTestImport ------*)
(******* empty insertion IpInOut *******)
FROM    InOut IMPORT Write, WriteLn, WriteInt, WriteCard, WriteString;

(*++++++ start insertion IpIRConsStorage ++++++*)

FROM GcgStorage IMPORT ALLOCATE;


(*------ end   insertion IpIRConsStorage ------*)
FROM CgMobil IMPORT BegRegister;
IMPORT GcgTab;

 (*++++++ start insertion IpTypes ++++++*)

IMPORT CgBase;
FROM Strings	IMPORT	String;


(*------ end   insertion IpTypes ------*)
(******* empty insertion IpIR_i *******)

 
 PROCEDURE PrintAttributes  (VAR attr : AttributesRecord);
 BEGIN
    CASE attr.op OF 
    |  opShortCardConstant  :
       WriteString ('ShortCardConstant  ');
       Write(' '); PrintSHORTCARD(attr.ShortCardConstant.c);
    |  opLongCardConstant  :
       WriteString ('LongCardConstant  ');
       Write(' '); PrintLONGCARD(attr.LongCardConstant.c);
    |  opShortIntConstant  :
       WriteString ('ShortIntConstant  ');
       Write(' '); PrintSHORTINT(attr.ShortIntConstant.c);
    |  opLongIntConstant  :
       WriteString ('LongIntConstant  ');
       Write(' '); PrintLONGINT(attr.LongIntConstant.c);
    |  opRealConstant  :
       WriteString ('RealConstant  ');
       Write(' '); PrintREAL(attr.RealConstant.c);
    |  opLongRealConstant  :
       WriteString ('LongRealConstant  ');
       Write(' '); PrintLONGREAL(attr.LongRealConstant.c);
    |  opCharConstant  :
       WriteString ('CharConstant  ');
       Write(' '); PrintCHAR(attr.CharConstant.c);
    |  opBoolConstant  :
       WriteString ('BoolConstant  ');
       Write(' '); PrintBOOLEAN(attr.BoolConstant.val);
    |  opSetConstant  :
       WriteString ('SetConstant  ');
       Write(' '); PrintBITSET(attr.SetConstant.c);
    |  opNilConstant  :
       WriteString ('NilConstant  ');
    |  opProcedureConstant  :
       WriteString ('ProcedureConstant  ');
       Write(' '); PrintProcIndex(attr.ProcedureConstant.index);
    |  opStringAddr  :
       WriteString ('StringAddr  ');
       Write(' '); PrintStringIndex(attr.StringAddr.index);
    |  opLocalVariable  :
       WriteString ('LocalVariable  ');
       Write(' '); PrintLONGINT(attr.LocalVariable.offset);
    |  opStaticVariable  :
       WriteString ('StaticVariable  ');
       Write(' '); PrintModuleIndex(attr.StaticVariable.module);
       Write(' '); PrintLONGINT(attr.StaticVariable.offset);
    |  opFrameBase  :
       WriteString ('FrameBase  ');
       Write(' '); PrintProcIndex(attr.FrameBase.proc);
       Write(' '); PrintSHORTCARD(attr.FrameBase.level);
    |  opContent  :
       WriteString ('Content  ');
       Write(' '); PrintMode(attr.Content.mode);
    |  opAssign  :
       WriteString ('Assign  ');
       Write(' '); PrintMode(attr.Assign.mode);
    |  opAssignLong  :
       WriteString ('AssignLong  ');
       Write(' '); PrintLONGINT(attr.AssignLong.size);
    |  opInc1  :
       WriteString ('Inc1  ');
       Write(' '); PrintMode(attr.Inc1.mode);
    |  opInc2  :
       WriteString ('Inc2  ');
       Write(' '); PrintMode(attr.Inc2.mode);
    |  opDec1  :
       WriteString ('Dec1  ');
       Write(' '); PrintMode(attr.Dec1.mode);
    |  opDec2  :
       WriteString ('Dec2  ');
       Write(' '); PrintMode(attr.Dec2.mode);
    |  opInclL  :
       WriteString ('InclL  ');
    |  opExclL  :
       WriteString ('ExclL  ');
    |  opSkipAddress  :
       WriteString ('SkipAddress  ');
    |  opSkipData  :
       WriteString ('SkipData  ');
    |  opFixedNegate  :
       WriteString ('FixedNegate  ');
       Write(' '); PrintMode(attr.FixedNegate.mode);
    |  opFixedPlus  :
       WriteString ('FixedPlus  ');
       Write(' '); PrintMode(attr.FixedPlus.mode);
    |  opFixedMinus  :
       WriteString ('FixedMinus  ');
       Write(' '); PrintMode(attr.FixedMinus.mode);
    |  opFixedMult  :
       WriteString ('FixedMult  ');
       Write(' '); PrintMode(attr.FixedMult.mode);
    |  opFixedDiv  :
       WriteString ('FixedDiv  ');
       Write(' '); PrintMode(attr.FixedDiv.mode);
    |  opFixedMod  :
       WriteString ('FixedMod  ');
       Write(' '); PrintMode(attr.FixedMod.mode);
    |  opFixedAbs  :
       WriteString ('FixedAbs  ');
       Write(' '); PrintMode(attr.FixedAbs.mode);
    |  opFloatNegate  :
       WriteString ('FloatNegate  ');
       Write(' '); PrintMode(attr.FloatNegate.mode);
    |  opFloatPlus  :
       WriteString ('FloatPlus  ');
       Write(' '); PrintMode(attr.FloatPlus.mode);
    |  opFloatMinus  :
       WriteString ('FloatMinus  ');
       Write(' '); PrintMode(attr.FloatMinus.mode);
    |  opFloatMult  :
       WriteString ('FloatMult  ');
       Write(' '); PrintMode(attr.FloatMult.mode);
    |  opFloatDiv  :
       WriteString ('FloatDiv  ');
       Write(' '); PrintMode(attr.FloatDiv.mode);
    |  opFloatAbs  :
       WriteString ('FloatAbs  ');
       Write(' '); PrintMode(attr.FloatAbs.mode);
    |  opSetUnion  :
       WriteString ('SetUnion  ');
    |  opSetDifference  :
       WriteString ('SetDifference  ');
    |  opSetIntersection  :
       WriteString ('SetIntersection  ');
    |  opSetSymDifference  :
       WriteString ('SetSymDifference  ');
    |  opSetPlusSingleL  :
       WriteString ('SetPlusSingleL  ');
    |  opSetPlusRange  :
       WriteString ('SetPlusRange  ');
       Write(' '); PrintMode(attr.SetPlusRange.LwbMode);
       Write(' '); PrintMode(attr.SetPlusRange.UpbMode);
    |  opCap  :
       WriteString ('Cap  ');
    |  opFloat  :
       WriteString ('Float  ');
    |  opTrunc  :
       WriteString ('Trunc  ');
       Write(' '); PrintMode(attr.Trunc.opmode);
       Write(' '); PrintMode(attr.Trunc.resultmode);
    |  opCoerce  :
       WriteString ('Coerce  ');
       Write(' '); PrintMode(attr.Coerce.premode);
       Write(' '); PrintMode(attr.Coerce.postmode);
    |  opCheckL  :
       WriteString ('CheckL  ');
       Write(' '); PrintMode(attr.CheckL.IndexMode);
       Write(' '); PrintMode(attr.CheckL.LwbMode);
       Write(' '); PrintMode(attr.CheckL.UpbMode);
       Write(' '); PrintBOOLEAN(attr.CheckL.CheckLwb);
       Write(' '); PrintBOOLEAN(attr.CheckL.CheckUpb);
    |  opFixedCompare  :
       WriteString ('FixedCompare  ');
       Write(' '); PrintMode(attr.FixedCompare.mode);
       Write(' '); PrintRelation(attr.FixedCompare.rel);
    |  opFloatCompare  :
       WriteString ('FloatCompare  ');
       Write(' '); PrintMode(attr.FloatCompare.mode);
       Write(' '); PrintRelation(attr.FloatCompare.rel);
    |  opSetCompare  :
       WriteString ('SetCompare  ');
       Write(' '); PrintRelation(attr.SetCompare.rel);
    |  opTestMembershipL  :
       WriteString ('TestMembershipL  ');
       Write(' '); PrintMode(attr.TestMembershipL.ElemMode);
       Write(' '); PrintBOOLEAN(attr.TestMembershipL.cond);
    |  opTestOdd  :
       WriteString ('TestOdd  ');
       Write(' '); PrintMode(attr.TestOdd.mode);
       Write(' '); PrintBOOLEAN(attr.TestOdd.cond);
    |  opPlaceLabel  :
       WriteString ('PlaceLabel  ');
       Write(' '); PrintLabel(attr.PlaceLabel.lab);
    |  opGoto  :
       WriteString ('Goto  ');
       Write(' '); PrintLabel(attr.Goto.tar);
    |  opSwitchL  :
       WriteString ('SwitchL  ');
       Write(' '); PrintMode(attr.SwitchL.mode);
       Write(' '); PrintLONGINT(attr.SwitchL.lwb);
       Write(' '); PrintLONGINT(attr.SwitchL.upb);
       Write(' '); PrintLabelList(attr.SwitchL.CaseLabels);
       Write(' '); PrintLabel(attr.SwitchL.DefaultLabel);
    |  opTestAndBranch  :
       WriteString ('TestAndBranch  ');
       Write(' '); PrintBOOLEAN(attr.TestAndBranch.cond);
       Write(' '); PrintLabel(attr.TestAndBranch.tar);
    |  opFixedCompareAndBranch  :
       WriteString ('FixedCompareAndBranch  ');
       Write(' '); PrintMode(attr.FixedCompareAndBranch.mode);
       Write(' '); PrintRelation(attr.FixedCompareAndBranch.rel);
       Write(' '); PrintLabel(attr.FixedCompareAndBranch.tar);
    |  opFloatCompareAndBranch  :
       WriteString ('FloatCompareAndBranch  ');
       Write(' '); PrintMode(attr.FloatCompareAndBranch.mode);
       Write(' '); PrintRelation(attr.FloatCompareAndBranch.rel);
       Write(' '); PrintLabel(attr.FloatCompareAndBranch.tar);
    |  opSetCompareAndBranch  :
       WriteString ('SetCompareAndBranch  ');
       Write(' '); PrintRelation(attr.SetCompareAndBranch.rel);
       Write(' '); PrintLabel(attr.SetCompareAndBranch.tar);
    |  opTestMembershipAndBranchL  :
       WriteString ('TestMembershipAndBranchL  ');
       Write(' '); PrintMode(attr.TestMembershipAndBranchL.ElemMode);
       Write(' '); PrintBOOLEAN(attr.TestMembershipAndBranchL.cond);
       Write(' '); PrintLabel(attr.TestMembershipAndBranchL.tar);
    |  opTestOddAndBranch  :
       WriteString ('TestOddAndBranch  ');
       Write(' '); PrintMode(attr.TestOddAndBranch.mode);
       Write(' '); PrintBOOLEAN(attr.TestOddAndBranch.cond);
       Write(' '); PrintLabel(attr.TestOddAndBranch.tar);
    |  opNil  :
       WriteString ('Nil  ');
    |  opSkipArglist  :
       WriteString ('SkipArglist  ');
    |  opPass  :
       WriteString ('Pass  ');
       Write(' '); PrintMode(attr.Pass.mode);
       Write(' '); PrintLONGINT(attr.Pass.offset);
    |  opPassLong  :
       WriteString ('PassLong  ');
       Write(' '); PrintLONGINT(attr.PassLong.size);
       Write(' '); PrintLONGINT(attr.PassLong.offset);
       Write(' '); PrintLONGINT(attr.PassLong.space);
    |  opProcedureCall  :
       WriteString ('ProcedureCall  ');
       Write(' '); PrintLONGINT(attr.ProcedureCall.paramsize);
    |  opFunctionCall  :
       WriteString ('FunctionCall  ');
       Write(' '); PrintLONGINT(attr.FunctionCall.paramsize);
       Write(' '); PrintMode(attr.FunctionCall.mode);
    |  opRTSCall  :
       WriteString ('RTSCall  ');
       Write(' '); PrintLONGINT(attr.RTSCall.paramsize);
       Write(' '); PrintSysProc(attr.RTSCall.sysproc);
    |  opBeginProcedure  :
       WriteString ('BeginProcedure  ');
       Write(' '); PrintProcIndex(attr.BeginProcedure.index);
       Write(' '); PrintSHORTCARD(attr.BeginProcedure.level);
       Write(' '); PrintLONGINT(attr.BeginProcedure.FrameSize);
       Write(' '); PrintLONGINT(attr.BeginProcedure.ParamSize);
    |  opCopyOpenArray  :
       WriteString ('CopyOpenArray  ');
       Write(' '); PrintLONGINT(attr.CopyOpenArray.DataOffset);
       Write(' '); PrintLONGINT(attr.CopyOpenArray.HighOffset);
       Write(' '); PrintLONGINT(attr.CopyOpenArray.elemsize);
    |  opReturn  :
       WriteString ('Return  ');
       Write(' '); PrintLONGINT(attr.Return.ParamSize);
    |  opReturnValueL  :
       WriteString ('ReturnValueL  ');
       Write(' '); PrintMode(attr.ReturnValueL.mode);
    |  opEndProcedure  :
       WriteString ('EndProcedure  ');
    |  opEndModule  :
       WriteString ('EndModule  ');
    |  opMark  :
       WriteString ('Mark  ');
       Write(' '); PrintSHORTCARD(attr.Mark.line);
       Write(' '); PrintSHORTCARD(attr.Mark.col);
    END;
    WriteLn;
  END PrintAttributes;

 (*-------------------------------------------------------------------------*)
 PROCEDURE PrintExpressionR (expr: Expression; level: CARDINAL);
    VAR i: CARDINAL;
 BEGIN
    WriteCard (CARDINAL(expr),7); Write(' ');
    FOR i := 1 TO level DO WriteString('  '); END;
    PrintAttributes(expr^.attr^);
    FOR i := 1 TO expr^.arity DO
       PrintExpressionR(expr^.son[i], level+1)
    END;
 END PrintExpressionR;


 PROCEDURE PrintExpression  (e : Expression);
 BEGIN
    PrintExpressionR (e,0);
 END PrintExpression;
 (*-------------------------------------------------------------------------*)
 PROCEDURE PrintExprCostsR (expr: Expression; level: CARDINAL);
    VAR i: CARDINAL;
 BEGIN
    WriteCard (CARDINAL(expr),7); Write(' ');
    FOR i := 1 TO level DO WriteString('  '); END;
    PrintAttributes(expr^.attr^);
    PrintExprAttributes (expr^.gcg);
    FOR i := 1 TO expr^.arity DO
       PrintExprCostsR(expr^.son[i], level+1)
    END;
 END PrintExprCostsR;


 PROCEDURE PrintExprCosts  (e : Expression);
 BEGIN
    PrintExprCostsR (e,1);
 END PrintExprCosts;
 (*-------------------------------------------------------------------------*)
 PROCEDURE PrintInstrCosts  (e : Expression);
 VAR i : CARDINAL;
 BEGIN
    WriteCard (CARDINAL(e),7); Write(' ');
    PrintAttributes(e^.attr^);
    FOR i:=1 TO e^.arity DO 
       PrintExprCosts (e^.son[i]);
    END;
 END PrintInstrCosts;
 (*-------------------------------------------------------------------------*)
 PROCEDURE PrintINTEGER     (i : INTEGER);
 BEGIN
    WriteInt (i,1);
 END PrintINTEGER;

 PROCEDURE PrintCARDINAL    (i : CARDINAL);
 BEGIN
   WriteCard (i,1);
 END PrintCARDINAL;

 PROCEDURE PrintBOOLEAN     (b : BOOLEAN);
 BEGIN
    IF b THEN WriteString ('TRUE') ELSE WriteString ('FALSE'); END;
 END PrintBOOLEAN;

 (*-------------------------------------------------------------------------*)

 PROCEDURE  InitIR;
 VAR i : INTEGER;
 BEGIN
    NEW (emptyExpression);
    NEW (emptyAttributes);

    WITH emptyExprRec DO 
       gcg := NIL;
       hashchain := NIL;
       FOR i:=1 TO MaxArity DO son[i] := emptyExpression; END;
    END;
   
    emptyAttrRec.op  := NoOpCode;
    
    emptyAttributes^ := emptyAttrRec;
    emptyExpression^ := emptyExprRec;
    NEW (emptyExpression^.gcg);
    emptyExpression^.gcg^.cost := InfCosts;
 END InitIR;
 
(******* empty insertion IpError *******)
 PROCEDURE Error (errmesg: ARRAY OF CHAR);
 BEGIN
   InOut.WriteString (errmesg); InOut.WriteLn;
 END Error;


 PROCEDURE PrintNonTerminal (n : NonTerminal);
 BEGIN
    CASE n OF 
    |  ntreg : WriteString ('reg');
    |  ntfreg : WriteString ('freg');
    |  ntfstack : WriteString ('fstack');
    |  ntConstant : WriteString ('Constant');
    |  ntFloatConstant : WriteString ('FloatConstant');
    |  ntSimpleVariable : WriteString ('SimpleVariable');
    |  ntSymPlusOffset : WriteString ('SymPlusOffset');
    |  ntRegPlusSymPlusOffset : WriteString ('RegPlusSymPlusOffset');
    |  ntOffsetPlusIndexMultFaktor : WriteString ('OffsetPlusIndexMultFaktor');
    |  ntmem : WriteString ('mem');
    |  ntCMem : WriteString ('CMem');
    |  ntRegOrIm : WriteString ('RegOrIm');
    |  ntRegOrCMem : WriteString ('RegOrCMem');
    |  ntRegOrCMemOrIm : WriteString ('RegOrCMemOrIm');
    |  ntarglist : WriteString ('arglist');
    |  ntloadln2 : WriteString ('loadln2');
    END;
 END PrintNonTerminal;

 PROCEDURE PrintExprAttributes (ga : ExprAttributes);
 VAR  nt : NonTerminal;
 BEGIN
    FOR nt:= ntreg TO ntloadln2 DO 
       IF ga^.cost[nt]<infcost THEN 
          WriteString('                     ');
          PrintNonTerminal(nt);
          WriteString(' Cost=');
          WriteInt   (ga^.cost[nt],1);
          WriteString(' Rule=');
          WriteInt   (ga^.rule[nt],1);
          WriteLn;
       END;
    END;
 END PrintExprAttributes;

 PROCEDURE PrintRegisterSet    (rs : RegisterSet   );
 VAR r : Register;
 BEGIN
    WriteString ('{ ');
    FOR r:=MIN(Register) TO MAX(Register) DO 
       IF    (ORD(r) IN rs[0]) THEN
          PrintRegister (r); WriteString(' ');
       END;
    END;
    WriteString ('}');
 END PrintRegisterSet;

PROCEDURE PrintBegRegister       (r  : Register      );
BEGIN
    WriteString (RegNameTable[r]);
END PrintBegRegister;
 
PROCEDURE PrintRegister       (r  : Register      );
BEGIN
    WriteString (RegNameTable[r]);
END PrintRegister;
 



PROCEDURE RegUnion	(a, b: RegisterSet; VAR r: RegisterSet);
BEGIN
      r[0]:=a[0]+b[0];      
END RegUnion;

PROCEDURE RegInter	(a, b: RegisterSet; VAR r: RegisterSet);
BEGIN
      r[0]:=a[0]*b[0];      
END RegInter;

PROCEDURE RegMinus	(a, b: RegisterSet; VAR r: RegisterSet);
BEGIN
      r[0] :=a[0]-b[0];      
END RegMinus;

PROCEDURE RegNegate	(a: RegisterSet; VAR r: RegisterSet);
BEGIN
      r[0] := BITSET (-1)-a[0];      
END RegNegate;

PROCEDURE RegEmpty	(a: RegisterSet): BOOLEAN;
BEGIN
  RETURN ( (a[0]={}));
END RegEmpty;

PROCEDURE RegIsIn	(a: Register; b: RegisterSet): BOOLEAN;
BEGIN
  RETURN    (ORD(a) IN b[0]);
END RegIsIn;

PROCEDURE RegIncl	(VAR a: RegisterSet; b: Register);
BEGIN
   INCL (a[0], ORD(b));
END RegIncl;

PROCEDURE RegExcl	(VAR a: RegisterSet; b: Register);
BEGIN
   EXCL (a[0], ORD(b));
END RegExcl;

PROCEDURE RegClear	(VAR a: RegisterSet);
BEGIN
     a[0]:={};
END RegClear;

PROCEDURE RegDisjoint	(a, b: RegisterSet): BOOLEAN;
BEGIN
  RETURN ( (a[0]*b[0]={}));
END RegDisjoint;
 
PROCEDURE RegClosure (s : RegisterSet; VAR r : RegisterSet);
VAR reg : Register;
    c : CARDINAL;
BEGIN
      r[0]:={};
  IF s[0]<>{}  THEN
     FOR c:=0 TO 10 DO
        IF c IN s[0] THEN 
           reg:= VAL (Register, c+0);
                 r[0]:=r[0]+GcgTab.RegDestroy[reg][0];      
        END;
     END;
  END;
END RegClosure;


 VAR  nt : NonTerminal;
 BEGIN
    FOR nt:= ntreg TO ntloadln2 DO 
       InfCosts [nt] := infcost;
    END;
    OptEmitIR := FALSE;
    OptEmitMatch := FALSE;
    OptRegAlloc := FALSE;
     RegNameTable[RegNil] := 'Nil';
     RegNameTable[Regeax] := 'eax';
     RegNameTable[Regebx] := 'ebx';
     RegNameTable[Regecx] := 'ecx';
     RegNameTable[Regedx] := 'edx';
     RegNameTable[Regesi] := 'esi';
     RegNameTable[Regedi] := 'edi';
     RegNameTable[Regebp] := 'ebp';
     RegNameTable[Regesp] := 'esp';
     RegNameTable[Regst] := 'st';
     RegNameTable[Regst1] := 'st1';
 END IR.
 
