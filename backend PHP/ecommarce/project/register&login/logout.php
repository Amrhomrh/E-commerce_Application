<?php

require_once 'connectdb.php';
session_start();
session_unset();
session_destroy();

header('location:view_produ.php');

?>