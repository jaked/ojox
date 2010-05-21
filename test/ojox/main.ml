open OUnit

let tests = "Ojox" >::: [
  "link" >:: begin fun () -> let module M = DOMImpl in () end;
]

;;

OUnit.run_test_tt_main tests
