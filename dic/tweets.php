<?php

return new Service\TweetsService(
    // require "config/db-connection.php"
    require __DIR__ . '/../config-dev/db-connection.php'
);
