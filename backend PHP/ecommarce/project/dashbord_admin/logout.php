<?php

require_once 'connectdb.php';
session_start();
session_unset();
session_destroy();

echo '<a href="../register&login/login.php"></a>';

?>

