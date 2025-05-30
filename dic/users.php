<?php

return new Service\UsersService(
    // require "config/db-connection.php"
    require_once __DIR__ . '/../config-dev/db-connection.php'

);
