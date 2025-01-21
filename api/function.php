<?php 

function level_team($user_id)
{
	global $con;
 
	mysqli_query($con,"INSERT INTO level(`user_id`) VALUES ('$user_id')")or die('insert error');
	
  $ref_id=find_sponsor_id($user_id);
  $s_id=find_sponsor_id($user_id);
  

  $a=0;
  $level=['level_1','level_2','level_3','level_4','level_5','level_6','level_7','level_8','level_9','level_10','level_11','level_12'];


    while ($a < 10 AND !empty($s_id)) {
    mysqli_query($con,"UPDATE level SET $level[$a]=$level[$a]+1 WHERE user_id='$s_id'")or die("level_distribution Query error");

	mysqli_query($con,"UPDATE reg SET  level_count=level_count+1 WHERE user_id='$s_id' ")or die("reg level  Query error1");

	down_insert($s_id,$user_id,0,$level[$a],$ref_id);

    $next_id=find_sponsor_id($s_id);
    $s_id=$next_id;
    $a++;
  }
	
}

function down_insert($s_id,$user_id,$plan_amount,$level,$ref_id)
{
	global $con;
	global $dt;

	
	mysqli_query($con,"INSERT INTO `down_line_insert`( `user_id`, `plan_amount`, `down_s_id`, `down_ref_id`, `down_level`) VALUES ('$user_id','$plan_amount','$s_id','$ref_id','$level')")or die("down_line_insert query error");
}

function level_income_onetime($user_id,$plan_amount)
{
	global $con;
	
  $s_id=find_sponsor_id($user_id);

  $amount1=$plan_amount*0.05;
  $amount2=$plan_amount*0.03;
  $amount3=$plan_amount*0.01;
  $amount4=$plan_amount*0.01;
  $amount5=$plan_amount*0.01;
  $amount6=$plan_amount*0.005;
  $amount7=$plan_amount*0.005;
  $amount8=$plan_amount*0.005;
  $amount9=$plan_amount*0.005;
  $amount10=$plan_amount*0.005;
  
  $a=0;

  $level_income=['level_1_income','level_2_income','level_3_income','level_4_income','level_5_income','level_6_income','level_7_income','level_8_income','level_9_income','level_10_income','level_11_income','level_12_income'];

$amount=[$amount1,$amount2,$amount3,$amount4,$amount5,$amount6,$amount7,$amount8,$amount9,$amount10];
    while ($a < 10 AND !empty($s_id)) {
	
		mysqli_query($con,"UPDATE reg SET  ref_income=ref_income+$amount[$a] , total_income=total_income+$amount[$a], wallet=wallet+$amount[$a] WHERE user_id='$s_id' ")or die("reg level  Query error1");

		mysqli_query($con,"UPDATE level SET $level_income[$a]=$level_income[$a]+$amount[$a] WHERE user_id='$s_id'")or die("level_distribution Query error");

		$comment=' Referral income '.($a+1).'  Added id of : '.$user_id;
			$type='ref_income';
				transcation_history($s_id,$type,$comment,$amount[$a],0);
	
				$next_id=find_sponsor_id($s_id);
				$s_id=$next_id;
				$a++;
		}

	
        }

function find_sponsor_id($user_id)
{
  global $con;
  $data1=mysqli_query($con,"SELECT * FROM `reg` WHERE `user_id`='$user_id'")or die("find_placement_idQuyre error");
  $data=mysqli_fetch_assoc($data1);
  if(!empty($data['sponsor_id']))
  return $data['sponsor_id'];
}

function ref_income($user_id,$amount){
	global $con;
	$s_id=find_sponsor_id($user_id);
	mysqli_query($con,"UPDATE reg SET  ref_income=ref_income+$amount , total_income=total_income+$amount , wallet=wallet+$amount WHERE user_id='$s_id' AND status=1")or die("ref Query error1");
		$type='referral_income';
	   $comment='Referrel income added ID OF : '.$user_id.' Amount OF '.$amount;
	   $debit=0;
	   transcation_history($s_id,$type,$comment,$amount,$debit);
		
}

function transcation_history($user_id,$type,$comment,$credit,$debit)
{
	global $con ,$dt;
	
	mysqli_query($con,"INSERT INTO `transcation_history`(`user_id`, `type`, `comment`, `credit`, `debit`,`trans_date`) VALUES ('$user_id','$type','$comment','$credit','$debit','$dt')")or die("transcation_history Query erro");
}

?>