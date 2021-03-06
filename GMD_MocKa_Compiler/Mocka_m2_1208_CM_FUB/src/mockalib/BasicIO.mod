(******************************************************************************)
(* Copyright (c) 1988 by GMD Karlruhe, Germany				      *)
(* Gesellschaft fuer Mathematik und Datenverarbeitung			      *)
(* (German National Research Center for Computer Science)		      *)
(* Forschungsstelle fuer Programmstrukturen an Universitaet Karlsruhe	      *)
(* All rights reserved.							      *)
(******************************************************************************)

IMPLEMENTATION MODULE BasicIO;

  FROM SYSTEM IMPORT
    ADDRESS, ADR;

  FROM SysLib IMPORT
    pROWNER, pWOWNER, pRGROUP, pWGROUP, pROTHERS, pWOTHERS, pEMPTY,
    oRDONLY, cREAD, cWRITE,
    unlink, creat, open, close, read, write, access;

  IMPORT Strings1; (* ms 11/90 *)

  TYPE tFileName = ARRAY [0..1023] OF CHAR;


  PROCEDURE OpenInput (VAR file : File; VAR name : ARRAY OF CHAR);
    VAR s: tFileName;
  BEGIN
    IF (name[0] = '-') AND ((HIGH (name) = 0) OR (name[1] = CHR(0))) THEN
       file := 0;
    ELSE
       Strings1.Assign(s,name); (* ms 11/90 *)
       file := open (ADR (s), oRDONLY); (* ms 11/90 *)
    END;
  END OpenInput;


  PROCEDURE OpenOutput (VAR file : File; VAR name : ARRAY OF CHAR);
    VAR s: tFileName;
  BEGIN
    IF (name[0] = '-') AND ((HIGH (name) = 0) OR (name[1] = CHR(0))) THEN
	file := 1;
     ELSE
        Strings1.Assign(s,name); (* ms 11/90 *)
        file := creat (ADR (s), pROWNER + pWOWNER + pRGROUP + pWGROUP + pROTHERS + pWOTHERS);
        (* access mode is rw-rw-rw- & ~umask *)
     END;
  END OpenOutput;

  PROCEDURE Close (file : File);
     VAR result : INTEGER;
  BEGIN
     IF (file <> 0) AND (file <> 1) THEN
        result := close (file);
     END;
  END Close;

  PROCEDURE Read (file: File; x: ADDRESS; n: INTEGER; VAR bytesread: INTEGER);
  BEGIN
    bytesread := read (file, x, n);
  END Read;

  PROCEDURE Write (file : File; x : ADDRESS; n : INTEGER);
     VAR result : INTEGER;
  BEGIN
    result := write (file, x, n);
  END Write;

  PROCEDURE Accessible (VAR name : ARRAY OF CHAR; ForWriting : BOOLEAN)
		       : BOOLEAN;
    VAR
      s: tFileName;
      amode : SHORTINT;
  BEGIN
    Strings1.Assign(s,name); (* ms 11/90 *)
    IF ForWriting THEN
      amode := cWRITE
    ELSE (* for reading *)
      amode := cREAD
    END;
    RETURN access (ADR(s), amode) = 0  (* ms 11/90 *)
  END Accessible;

  PROCEDURE Erase (VAR name : ARRAY OF CHAR; VAR ok : BOOLEAN);
    VAR s: tFileName;
  BEGIN
     Strings1.Assign(s,name); (* ms 11/90 *)
     ok := unlink (ADR(s)) = 0  (* ms 11/90 *)
  END Erase;

END BasicIO.
