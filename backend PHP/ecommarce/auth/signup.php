<?php
include '../connect.php';

$username =FilterRequest('username');
$password=FilterRequest('password');
$email    = FilterRequest('email');
$phone    =FilterRequest('phone');
$verfiycode =77777;
// $verfiycode = rand(1000,9999);

$stmt=$con->prepare("SELECT * FROM `users` WHERE users_email=? OR users_phone=?");
$stmt->execute(array($email , $phone));
$count=$stmt->rowCount();
if($count>0){
    echo json_encode(array("stutes" => "feald "));
}

else{
    $stmt=$con->prepare("INSERT INTO `users`( `users_name`, `users_password`, `users_email`, `users_phone`, `users_verfiycode`) VALUES(?,?,?,?,?)");
    $stmt->execute(array($username,$password,$email ,$phone,$verfiycode));
    // mail($email,"Verfiy Code" , "This Verify Code about you dont share for ather $verfiycode" , "From:aaahhhhomrh@gmail.com" );

    $count=$stmt->rowCount();
    if($count>0){
        echo json_encode(array("stutes" => "success"));
    }
    

}


?>