let b =
  new Button.c
    ~html:"Click me"
    ~handler:(fun _ -> Window.alert "Hello, OJOX")
    () in
(RootPanel.get ())#add b
