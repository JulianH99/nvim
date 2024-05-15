return {
  -- php initialization boilerplate
  s({
    trig = "phpinit",
    dscr = "Inserts the usual boilerplate for a php file",
  }, {
    t({ "<?php", "declare(strict_types=1);" }),
  }),
}
