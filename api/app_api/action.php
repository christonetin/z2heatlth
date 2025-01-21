<?php 
include "../db.php";
include "../function.php";

if(isset($_POST['imagesBaedProuct'])){
    $pro_code=$_POST['pro_code'];
    $sql=mysqli_query($con,"SELECT * FROM `pro_images` WHERE `pro_code`='$pro_code'")or die('Error');
    $arr= array();
    while($row=mysqli_fetch_array($sql))
    {
        $arr[]=$row;
    
    }
     echo json_encode($arr);
}

if(isset($_POST['getFirstImg'])){
    $pro_code=$_POST['pro_code'];
    
    $sql=mysqli_query($con,"SELECT * FROM `pro_images` WHERE `pro_code`='$pro_code' ");
     
      $row=mysqli_fetch_assoc($sql);

          echo json_encode($row);
}

if(isset($_POST['getProducts'])){
    $sql=mysqli_query($con,"SELECT * FROM  product  ")or die('Error');
    $arr= array();
    while($row=mysqli_fetch_array($sql))
    {
        $arr[]=$row;
    
    }
     echo json_encode($arr);
}

if(isset($_POST['registerByUser'])){
    
    $s_id=$_POST['sponsor_id'];
    $activator_id=$_POST['activator_id'];
    $plan_amount=$_POST['plan_amount'];
    $daily_increment_amount=$plan_amount*0.02;
	$roi_days=365;
	$roi_end_date=date('Y-m-d H:i:s', strtotime('+'.$roi_days.' days'));

    $cnt=mysqli_num_rows(mysqli_query($con,"SELECT * FROM reg WHERE user_id='$s_id'"));
    if($cnt>=1){
        $user_id=user_name;
        mysqli_query($con,"UPDATE reg SET `global_count`=`global_count`+1")or die('Query error ref');
			
        mysqli_query($con,"INSERT INTO reg (`join_date`,`user_id`,`sponsor_id`,`name`,`mail`,`mobile`,`password`,`plan_amount`,`status`) VALUES ('$dt','$user_id','$s_id','".$_POST['name']."','".$_POST['mail']."','".$_POST['mobile']."','".$_POST['password']."','$plan_amount',1)")or die('insert error');

        $plan_id=rand(1111,9999).mysqli_num_rows(mysqli_query($con,"SELECT * FROM plan"));
	mysqli_query($con,"INSERT INTO `plan`(`plan_create_date`,`plan_id`,`user_id`, `sponsor_id`, `plan_amount`, `roi_start_date`, `roi_end_date`, `daily_increment_amount`, `roi_days`, `roi_decrement`) VALUES ('$dt','$plan_id','$user_id','$s_id','$plan_amount','$dt','$roi_end_date','$daily_increment_amount',$roi_days,$roi_days)")or die('Plan insert query error');
    mysqli_query($con,"UPDATE reg SET ref_count=ref_count+1 WHERE user_id='$s_id'")or die('Query error ref');
    mysqli_query($con,"UPDATE reg SET purchase_wallet=purchase_wallet-$plan_amount WHERE user_id='$activator_id'");

        $return = array('res' =>'true','user_id'=>$user_id,'password'=>$_POST['password'],'name'=>$_POST['name'],'sponsor_id'=> $_POST['sponsor_id'],'join_date'=>$dt);
    }
    else
    $return = array('res' =>'wrong_sponsor' );

    echo json_encode($return);
}



if(isset($_POST['changePassword'])){
   
    $sql=mysqli_query($con,'UPDATE reg SET `password`="'.$_POST['new_pass'].'" WHERE mobile="'.$_POST['mobile'].'"');
    if($sql)
    echo json_encode('true');
    else
    echo json_encode('false');
}

if(isset($_POST['checkOldPassword'])){
    $cnt=mysqli_num_rows(mysqli_query($con,'SELECT * FROM reg WHERE  mobile="'.$_POST['mobile'].'" AND password="'.$_POST['old_pass'].'"'));

    if($cnt>=1)
    echo json_encode('true');
    else
    echo json_encode('false');
}


if(isset($_POST['uploadProfileImage'])){

    $return["error"] = false;
$return["msg"] = "";
if(isset($_POST["image"])){
    $base64_string = $_POST["image"];

    $image_data = base64_decode($base64_string);
    $targetDirectory = "../profile_photo/";
    $filename = time().rand(11,99) . '.jpg';
    $targetFile = $targetDirectory . $filename;
    if (!file_exists($targetDirectory)) {
        mkdir($targetDirectory, 0777, true); // Creates the directory recursively
    }
    file_put_contents($targetFile, $image_data);
    $sql=mysqli_query($con,"UPDATE `reg` SET `profile_pic`='$filename' WHERE  `mobile`='".$_POST['mobile']."' ");
    $return["msg"] = $filename;
}else{
    $return["error"] = true;
    $return["msg"] =  "No image is submited.";
}


echo json_encode($return);
}


if(isset($_POST['updateProfile'])){
    $sql=mysqli_query($con,"UPDATE `reg` SET `name`='".$_POST['name']."',`mail`='".$_POST['mail']."' WHERE `mobile`='".$_POST['mobile']."' ")or die('error');

    if($sql)
    $return = array('res' =>'true' );
    else
    $return = array('res' =>'false' );

    echo json_encode($return);
}

if(isset($_POST['getUserData'])){
    $mobile=$_POST['mobile'];
    
    $sql=mysqli_query($con,"SELECT * FROM `reg` WHERE `mobile`='$mobile' ");
     
      $row=mysqli_fetch_assoc($sql);

          echo json_encode($row);
}

if(isset($_POST['registerUser'])){

    $cnt=mysqli_num_rows(mysqli_query($con,"SELECT * FROM reg WHERE user_id='".$_POST['sponsor_id']."'"));
    if($cnt>=1){
        $user_id=user_name;
        mysqli_query($con,"INSERT INTO reg (`join_date`,`user_id`,`sponsor_id`,`name`,`mail`,`mobile`,`password`) VALUES ('$dt','$user_id','".$_POST['sponsor_id']."','".$_POST['name']."','".$_POST['mail']."','".$_POST['mobile']."','".$_POST['password']."')")or die('insert error');

        $return = array('res' =>'true','user_id'=>$user_id,'password'=>$_POST['password'],'name'=>$_POST['name'],'sponsor_id'=> $_POST['sponsor_id'],'join_date'=>$dt);
    }
    else
    $return = array('res' =>'wrong_sponsor' );

    echo json_encode($return);
}

if(isset($_POST['userIdToName'])){
    $sql=mysqli_query($con,"SELECT * FROM reg WHERE user_id='".$_POST['user_id']."'")or die('error');
    $cnt=mysqli_num_rows($sql);
    if($cnt>=1)
    {
        $row=mysqli_fetch_assoc($sql);
        echo json_encode($row['name']);
    }
    else{
        echo json_encode('not_exit');
    }
}
if(isset($_POST['checkSponsorId'])){
    $sql=mysqli_query($con,"SELECT * FROM reg WHERE user_id='".$_POST['user_id']."'")or die('error');
    $cnt=mysqli_num_rows($sql);
    if($cnt>=1)
    {
        $row=mysqli_fetch_assoc($sql);
        echo json_encode($row['name']);
    }
    else{
        echo json_encode('not_exit');
    }
   

}
if(isset($_POST['loginUser']))
{
    $sql=mysqli_query($con,"SELECT * FROM reg WHERE mobile='".$_POST['mobile']."' AND password='".$_POST['password']."'");
    if($sql){
        $cnt=mysqli_num_rows($sql);
        if($cnt>=1){
            $row=mysqli_fetch_assoc($sql);
            echo json_encode($row['mobile']);
        }
        else
        echo json_encode('false');
    }
    else
    echo json_encode('false');
}




/*
DELETE from reg where id!=1;
ALTER table reg AUTO_INCREMENT=1;

TRUNCATE TABLE transcation_history;
TRUNCATE TABLE withdraw_request;
UPDATE reg set ref_income=0,total_income=0,wallet=0,ref_count=0,global_count=0,level_income=0;
TRUNCATE TABLE pin; 

DELETE FROM plan WHERE id!=1;
UPDATE plan SET total_income=0,wallet=0,roi_decrement=0,roi_increment=0;
ALTER TABLE plan AUTO_INCREMENT=1;

DELETE FROM level where level_id!=1;
ALTER TABLE level AUTO_INCREMENT=1;
UPDATE level set level_1=0,level_2=0,level_3=0,level_4=0,level_5=0,level_6=0,level_7=0,level_8=0,level_9=0,level_10=0,level_1_income=0,level_2_income=0,level_3_income=0;
*/
?>

