package body userinterface is

   procedure Console_UI is
      Win : WINDOW;
      Ch  : Character;
   begin
      -- Initialize ncurses.
      initscr;

      -- Create a new window.
      Win := newwin (10, 40, 5, 5);

      -- Set the background color of the window.
      wbkgdset (Win, COLOR_PAIR (1));

      -- Write text in the middle of the window.
      mvwaddstr (Win, 4, 10, "Some text in the middle");

      -- Add hotkeys to functionality on the bottom.
      mvwaddstr (Win, 9, 2, "Press 'q' to quit");
      mvwaddstr (Win, 9, 22, "Press 'h' for help");

      -- Refresh the window.
      wrefresh (Win);

      -- Wait for user input.
      loop
         Ch := Get_Key;
         case Ch is
            when 'q' =>
               exit;
            when 'h' =>
               Put_Line ("Help");
            when others =>
               null;
         end case;
      end loop;

      -- Clean up ncurses.
      endwin;
   end Console_UI;

end userinterface;
