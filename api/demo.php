<?php 

include "db.php";
include "function.php";
$d=$today->format('d');



    $sql=mysqli_query($con,"SELECT * FROM plan INNER JOIN reg ON plan.user_id=reg.user_id WHERE plan.roi_status=1 AND plan.roi_decrement>0 ")or die('error 2');

    while($row=mysqli_fetch_array($sql))
    {
       
        $total_income=$row['daily_increment_amount'];
        mysqli_query($con,"UPDATE plan SET total_income=total_income+'$total_income',wallet=wallet+'$total_income',roi_increment=roi_increment+1,roi_decrement=roi_decrement-1 WHERE  user_id='".$row['user_id']."' ")or die('error 1');

        mysqli_query($con,"UPDATE reg SET total_income=total_income+'$total_income',wallet=wallet+'$total_income',roi_income=roi_income+'$total_income'WHERE user_id='".$row['user_id']."'")or die('reg update error');

        $comment='Daily Plan Income Added';
        transcation_history($row['user_id'],'roi_income',$comment,$total_income,0);
       
       

    }


    
?>

