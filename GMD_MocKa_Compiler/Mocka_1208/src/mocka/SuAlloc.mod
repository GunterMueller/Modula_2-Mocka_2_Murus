(******************************************************************************)
(* Copyright (c) 1988 by GMD Karlruhe, Germany				      *)
(* Gesellschaft fuer Mathematik und Datenverarbeitung			      *)
(* (German National Research Center for Computer Science)		      *)
(* Forschungsstelle fuer Programmstrukturen an Universitaet Karlsruhe	      *)
(* All rights reserved.							      *)
(******************************************************************************)

IMPLEMENTATION MODULE SuAlloc;
                       
  FROM SYSTEM IMPORT ADDRESS;                    
  FROM MemPools IMPORT MemPool, NewPool, PoolAllocate, KillPool;

  VAR
    pool: MemPool;

  PROCEDURE ALLOCATE (VAR ptr : ADDRESS; size : LONGCARD);
  BEGIN
    PoolAllocate(pool, ptr, size);
  END ALLOCATE;

  PROCEDURE InitAlloc;
  BEGIN
    KillPool(pool);
    NewPool(pool);
  END InitAlloc;

BEGIN
  NewPool(pool);
END SuAlloc.
