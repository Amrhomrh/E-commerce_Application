<?php

function FilterRequest($request){
    return htmlspecialchars(strip_tags($_POST[$request]));
}



// function sendGCM($title, $message, $topic, $pageid, $pagename)
// {
//     $Access_token = "ya29.c.c0ASRK0GY2gcHFwuQoXTjfvfRiIWVj6wZ2jMfhFwhY1375lrSLE7FzDHBcinZIJppBZ8Jvv0cQp5H818kA6bST865row9ahqiqxYX8G9GgE8dWMdnesocyIWM2jO-IpFumKnHMpAFzAqTzMZ0lySnjjyQUsa3RjZmgVdCrTXXBtTO_AtVF1Q2duwuSSW45FI0u_cYSjrPCq5i467mlQG9wUSzOftK9HAmKd1vzH-byok6BnnKg-Qd1UaTyRGPeACGpyZ9lMnfqAFo8k7AINjKbXgEl3YvAAarHzzLOFDCvIwTHZB85Rvfs6jIGEfimA0b-lB4uW_A0Ua_z98YfaqHND6BPru2oqL5JUSEgzSPXLdkVIG-R4km527MwIjNFN389CvQaynlI6M-_qs7htw1btMXxd46sUo27UmSn5Q1rjk2sf1bO64Bgynnjw6s0cl0764kWr5XdgRualzcWB1MexOdwUkvfkMhFsBnw-gMn-x2d3do9J1zyhgVdrjo3FnsaIQlBFVi-XXeuJZSOwIxOyeSbX4ZtxBVIs2saIj4YnfaeJez9Ql-YIsi-S1kv3MmbZ_iFJjB6ezO3hodnts9JoB66WBnWk7-ayx0yi4le6h0IM4Vguk54sQW87OXRQnUJ6Ufz4fmqVlxtnezRRMRm3y7Xh0pXZ1U49q3-fbv4vX3ZjrMiF2mVncR6zXiqOOwI64k9QVel5Xut-w0Unm_FZ8aFyI1_R9iOFqedo6RWmgblU_V_W_vwljvMoVaMabjYY2U9ecFWazl_kQki6MR06Xw64S3JigmalOiF6b_pwBRlZYJgI-p3hrU0u4rBQM268X6yjt5a3u6b726J65J2pm571WQld5Qob02U7y2Yns8bfsmodW1M2Yu179aqFym5d1_iOhIzr39lpQs1d_8Vxpypgq4wI3x97Q10nWBc8cMvS6u-cBfqSecrhWWJ_V3F8OlB-dl7chplI-aYVvc6OSlQqm-gry6yzOxQXbfo";

//     $url = 'https://fcm.googleapis.com/v1/projects/phonic-arcana-438515-d0/messages:send';

//     $fields = array(
//         'message' => array(
//             "topic" => "/topics/".$topic ,
//             'priority' => 'high',
//             'content_available' => true,
    
//             'notification' => array(
//                 "body" =>  $message,
//                 "title" =>  $title,
//                 "click_action" => "FLUTTER_NOTIFICATION_CLICK",
//                 "sound" => "default"
    
//             ),
//             'data' => array(
//                 "pageid" => $pageid,
//                 "pagename" => $pagename
//             )
//         )

//     );

//     $fields = json_encode($fields);
//     $headers = array(
//         'Authorization: Bearer' . $Access_token,
//         'Content-Type: application/json',
//         'access_token_auth: true'
//     );

//     $ch = curl_init();
//     curl_setopt($ch, CURLOPT_URL, $url);
//     curl_setopt($ch, CURLOPT_POST, true);
//     curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
//     curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
//     curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

//     $result = curl_exec($ch);
//     return $result;
//     curl_close($ch);
// }

function sendGCM($title, $message, $topic, $pagesid, $pagenames)
{
    // Access Token الخاص بـ Firebase
    $Access_token ="ya29.c.c0ASRK0Ga8pPR2oGCPdYxBphEmVU0m2ZR_80W2dIM9Zrw9gE4uJ7HUs75KaiLu7Sq9CPbAUad7FycXuNBWRzKxF0fMK0AevRQdNq7e7fxMt1A7ILyPzPOEDlgY4m9FIoS_UcXsGOivdY-ygUFygMFfhV0nSGLk_kKuJ6HCQAJQWq4RQxkzpGy04n3QzApZ8Y4_02QBHw4zy8ehGHDVgKMs5QZZERpUEXvL04bd5dks-no-e26-Yuz_OsKKFKGBPVI4hQ1oD56a5IUMSorCUWVg3VvnMs6Ers3TzjhHToT0v0piJuwPCaBcpdWL93EWI-lYuUkFIjV6VHtEs6OmftiPVu-Suh43KdPWno4aEVZwM2nPUpBuRtkFrGPMiLvTT389K39XihWXBhq9e3yk62YSvIWgOuXvw4J1kb9reefXhiukhY1rt3rWq8hakQM6qIkIpgWQrWk44Zxqv5JIahft--go8wfx-18Q9Wl6M8OQ2oc05a6tr381aUJnirSIjO0SkYtsnmmwpUbduZ4nFexRV2lt4yrQU08YsIWIRZInqhJv_ggbwh7sBgnzO8qlwWhzvwjs3xZYq6_bp9IsSS9fpM0t0zSx_wUrtdheZad89qu69v0RlY1kSuiXzXsqUX2qpBjj-FM7njqclVdR6vQJRWMxsz4uIgk1gqVlB_vFMgXbBck4bZOJj3ImgcuId47olluh_t6tZYUnnIVxkeIs-c69ey3ffd0__U4t75up2VaSIddr1RqY8ygb6ikz_o5IJdgh7dYi1nd9BkgkjJs7Q49URs_mgr6wZz2mRQ2ugYZpi9FpxBt_8RjowvIwQu90-J6gxV_vlSWOBsRBJxukqdJQsxc2MfkijiqI_xlc6JaFt05OpOfIzFgfv68ZW7muao-J2iaJWrYdJku4txYyjmQSOWXcRJWdhdQZpZBwgI-zjfox1i6ql2zmrSq5Bw1dS1xt4gg-WMJnYciuij6VJeveMX7fBhSmw7osmp0g";

    // رابط FCM API
    $url = 'https://fcm.googleapis.com/v1/projects/phonic-arcana-438515-d0/messages:send';

    // محتوى الطلب (JSON Payload)
    $fields = [
        'message' => [
            "topic" => $topic, // إرسال إلى topic
            'notification' => [
                "title" => $title,
                "body" => $message
            ],
            'data' => [
                "pageid" => $pagesid,
                "pagename" => $pagenames
            ]
        ]
    ];

    // تحويل الطلب إلى JSON
    $fields = json_encode($fields);

    // إعدادات الطلب (Headers)
    $headers = [
        'Authorization: Bearer ' . $Access_token,
        'Content-Type: application/json'
    ];

    // تنفيذ الطلب باستخدام cURL
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

    $result = curl_exec($ch);

    // تحقق من الأخطاء أثناء الاتصال
    if (curl_errno($ch)) {
        $error_msg = curl_error($ch);
        curl_close($ch);
        return "Curl Error: " . $error_msg;
    }

    curl_close($ch);

    // إعادة الرد
    return $result;
}

function insertNotifi($titles,$body , $topics, $pagesids , $pagenames , $userid){
    global $con;
    $stmt=$con->prepare("INSERT INTO `notification`(`notifi_title`, `notifi_body`, `notifi_userid`) VALUES ('$titles','$body','$userid')");
    $stmt->execute();
    sendGCM( $titles, $body  ,$topics , $pagesids , $pagenames);
    $count=$stmt->rowCount();
    return $count;
    // if($count > 0){
    //     echo json_encode(array("states" => "success"));
    // }
    // else{
    //     echo json_encode(array("states" => "feald"));
    
    // }
}

?>