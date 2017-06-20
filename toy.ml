open Printf


let fname = "blot.txt"
let msg = "Duh!\n"


(* w_blot() - function to write out a one line file *)
 let w_blot =  
   let outc = open_out fname in
   fprintf outc "%s\n" msg;
   close_out outc;;

(* r_blot() - function to read in a one line file *)
 let r_blot = 
   let inc = open_in fname in
   try 
     let line = input_line inc in 
       print_endline line;
       flush stdout;
       close_in inc;

   with e->
       close_in_noerr inc;
       raise e;;

(* under_travis() - function to determine whether we're running in the travis CI environment *)

let under_travis = try ( Sys.getenv ( "MERLIN_TRAVIS" ) != "" ) with Not_found -> false ;;
(*
      flag_set = true;
      printf "MERLIN_TRAVIS = %s \n" env_val;
      return ( flag_set) ;

   with Not_found ->
      printf "MERLIN_TRAVIS not found.\n";
      return ( flag_set );;
*)

 let () = 
   w_blot;  
   r_blot;  
   
   if ( under_travis ) 
      then printf "Under Travis\n"
      else printf "Native\n"

