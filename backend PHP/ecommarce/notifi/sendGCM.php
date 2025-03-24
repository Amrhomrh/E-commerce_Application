<?php

include '../connect.php';

$response = sendGCM("Hi", "How are you", "amr21", "", "");

echo $response;



?>