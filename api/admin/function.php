<?php 
/*
DELETE FROM reg WHERE id!=1;
ALTER TABLE reg AUTO_INCREMENT=1;
UPDATE reg SET pacakge=0,board=1,wallet=0,total_income=0,plan_income=0,rewards=0,ref_count=0,global_count=0;
DELETE FROM transcation_history ;
ALTER TABLE transcation_history AUTO_INCREMENT=1;

*/

function upgrade($user_id)
{
	
	global $con;
	global $date;
	$type='board_income';
	$this_id=this_ai_id($user_id);
	
	  $sql=mysqli_query($con,"SELECT * FROM reg   ");
	   while($row_cnt=mysqli_fetch_array($sql))
	   {
		
		$next_id=$row_cnt['auto_inc']*4;
		$cnt1=mysqli_num_rows(mysqli_query($con,"select * from reg  "));
		if($next_id==$cnt1)  
		{
			
			$income=300;
			  $board=1;
			 $query_check1=mysqli_query($con,"UPDATE reg SET pacakge=$income ,total_income=total_income+$income , wallet=wallet+$income, plan_income=plan_income+$income, board=$board WHERE id='".$row_cnt['id']."' AND pacakge!=$income ")or die("query error");
			 
			
			 
			 parant_income_add($user_id,$income,$board);
			  
			 $comment='Board '.$board.' Income';
			 if($query_check1)
					transcation_history($user_id,$type,$comment,$income,0);
		}

	   } 
	   
	   
	   
	   
	   $sql2=mysqli_query($con,"SELECT * FROM reg WHERE pacakge=300 AND board=1");
	   while($row_cnt2=mysqli_fetch_array($sql2))
	   {
	
		$next_id2=$row_cnt2['auto_inc']*3;
		$cnt2=mysqli_num_rows(mysqli_query($con,"select * from reg  WHERE pacakge=300 AND board=1"));
		if($next_id2==$cnt2)  
		{
			
			$income=400;
			  $board=2;
			 $query_check1=mysqli_query($con,"UPDATE reg SET pacakge=$income ,total_income=total_income+$income , wallet=wallet+$income, plan_income=plan_income+$income, board=$board WHERE id='".$row_cnt2['id']."' AND pacakge!=$income ")or die("query error");
			 
			 $user_id=find_user_id($row_cnt2['id']);
			
			 parant_income_add($user_id,$income,$board);
			  
			 $comment='Board '.$board.' Income';
			 if($query_check1)
					transcation_history($row_cnt2['user_id'],$type,$comment,$income,0);
		}

	   } 
	   
	   
	  $sql3=mysqli_query($con,"SELECT * FROM reg WHERE pacakge=400 AND board=2");
	   while($row_cnt3=mysqli_fetch_array($sql3))
	   {
	
		$next_id3=$row_cnt3['auto_inc']*2;
		$cnt3=mysqli_num_rows(mysqli_query($con,"select * from reg  WHERE pacakge=400 AND board=2"));
		if($next_id3==$cnt3)  
		{
			
			$income=500;
			  $board=3;
			 $query_check1=mysqli_query($con,"UPDATE reg SET pacakge=$income ,total_income=total_income+$income , wallet=wallet+$income, plan_income=plan_income+$income, board=$board WHERE id='".$row_cnt3['id']."' AND pacakge!=$income ")or die("query error");
			 
			  $user_id=find_user_id($row_cnt3['id']);
			 
			 
			  parant_income_add($row_cnt3['user_id'],$income,$board);
			  
			 $comment='Board '.$board.' Income';
			 if($query_check1)
					transcation_history($row_cnt3['user_id'],$type,$comment,$income,0);
		}

	   } 
	   
	   
	   
	   $sql4=mysqli_query($con,"SELECT * FROM reg WHERE pacakge=500 AND board=3");
	   while($row_cnt4=mysqli_fetch_array($sql4))
	   {
	
		$next_id4=$row_cnt4['auto_inc']*3;
		$cnt4=mysqli_num_rows(mysqli_query($con,"select * from reg  WHERE pacakge=500 AND board=3"));
		if($next_id4==$cnt4)  
		{
			
			$income=600;
			  $board=4;
			 $query_check4=mysqli_query($con,"UPDATE reg SET pacakge=$income ,total_income=total_income+$income , wallet=wallet+$income, plan_income=plan_income+$income, board=$board WHERE id='".$row_cnt4['id']."' AND pacakge!=$income ")or die("query error");
			 
			 $user_id=find_user_id($row_cnt4['id']);
			 
			 
			 
			  parant_income_add($row_cnt4['user_id'],$income,$board);
			  
			 $comment='Board '.$board.' Income';
			 if($query_check4)
					transcation_history($row_cnt4['user_id'],$type,$comment,$income,0);
		}

	   }   
	   
	   $sql5=mysqli_query($con,"SELECT * FROM reg WHERE pacakge=600 AND board=4");
	   while($row_cnt5=mysqli_fetch_array($sql5))
	   {
	
		$next_id5=$row_cnt5['auto_inc']*2;
		$cnt5=mysqli_num_rows(mysqli_query($con,"select * from reg  WHERE pacakge=600 AND board=4"));
		if($next_id5==$cnt5)  
		{
			
			$income=1000;
			  $board=5;
			 $query_check5=mysqli_query($con,"UPDATE reg SET pacakge=$income ,total_income=total_income+$income , wallet=wallet+$income, plan_income=plan_income+$income, board=$board WHERE id='".$row_cnt5['id']."' AND pacakge!=$income ")or die("query error");
			 
			 $user_id=find_user_id($row_cnt5['id']);
			
			  parant_income_add($row_cnt5['user_id'],$income,$board);
			  
			 $comment='Board '.$board.' Income';
			 if($query_check5)
					transcation_history($row_cnt5['user_id'],$type,$comment,$income,0);
		}

	   } 
	   
	   
	   $sql6=mysqli_query($con,"SELECT * FROM reg WHERE pacakge=1000 AND board=5");
	   while($row_cnt6=mysqli_fetch_array($sql6))
	   {
	
		$next_id6=$row_cnt6['auto_inc']*2;
		$cnt6=mysqli_num_rows(mysqli_query($con,"select * from reg  WHERE pacakge=1000 AND board=5"));
		if($next_id6==$cnt6)  
		{
			
			$income=1500;
			  $board=6;
			 $query_check6=mysqli_query($con,"UPDATE reg SET pacakge=$income ,total_income=total_income+$income , wallet=wallet+$income, plan_income=plan_income+$income, board=$board WHERE id='".$row_cnt6['id']."' AND pacakge!=$income ")or die("query error");
			 
			 $user_id=find_user_id($row_cnt6['id']);
			
			 
			  parant_income_add($row_cnt6['user_id'],$income,$board);
			  
			 $comment='Board '.$board.' Income';
			 if($query_check5)
					transcation_history($row_cnt6['user_id'],$type,$comment,$income,0);
		}

	   }
		
		$sql7=mysqli_query($con,"SELECT * FROM reg WHERE pacakge=1500 AND board=6");
	   while($row_cnt6=mysqli_fetch_array($sql7))
	   {
	
		$next_id7=$row_cnt7['auto_inc']*2;
		$cnt7=mysqli_num_rows(mysqli_query($con,"select * from reg  WHERE pacakge=1500 AND board=6"));
		if($next_id7==$cnt7)  
		{
			
			$income=2000;
			  $board=7;
			 $query_check7=mysqli_query($con,"UPDATE reg SET pacakge=$income ,total_income=total_income+$income , wallet=wallet+$income, plan_income=plan_income+$income, board=$board WHERE id='".$row_cnt7['id']."' AND pacakge!=$income ")or die("query error");
			 
			 $user_id=find_user_id($row_cnt7['id']);
			 
			  parant_income_add($row_cnt7['user_id'],$income,$board);
			  
			 $comment='Board '.$board.' Income';
			 if($query_check7)
					transcation_history($row_cnt7['user_id'],$type,$comment,$income,0);
		}

	   }
	   
	$sql8=mysqli_query($con,"SELECT * FROM reg WHERE pacakge=2000 AND board=7");
	   while($row_cnt8=mysqli_fetch_array($sql8))
	   {
	
		$next_id8=$row_cnt8['auto_inc']*2;
		$cnt8=mysqli_num_rows(mysqli_query($con,"select * from reg  WHERE pacakge=2000 AND board=7"));
		if($next_id8==$cnt8)  
		{
			
			$income=2000;
			  $board=8;
			 $query_check8=mysqli_query($con,"UPDATE reg SET pacakge=$income ,total_income=total_income+$income , wallet=wallet+$income, plan_income=plan_income+$income, board=$board WHERE id='".$row_cnt8['id']."' AND pacakge!=$income ")or die("query error");
			 
			 $user_id=find_user_id($row_cnt8['id']);
			 
			  parant_income_add($row_cnt8['user_id'],$income,$board);
			  
			 $comment='Board '.$board.' Income';
			 if($query_check8)
					transcation_history($row_cnt8['user_id'],$type,$comment,$income,0);
		}

	   }
	   
	   
	   
	   $sql9=mysqli_query($con,"SELECT * FROM reg WHERE pacakge=2000 AND board=8");
	   while($row_cnt9=mysqli_fetch_array($sql9))
	   {
	
		$next_id9=$row_cnt9['auto_inc']*2;
		$cnt9=mysqli_num_rows(mysqli_query($con,"select * from reg  WHERE pacakge=2000 AND board=8"));
		if($next_id9==$cnt9)  
		{
			
			$income=2000;
			  $board=9;
			 $query_check9=mysqli_query($con,"UPDATE reg SET pacakge=$income ,total_income=total_income+$income , wallet=wallet+$income, plan_income=plan_income+$income, board=$board WHERE id='".$row_cnt9['id']."' AND pacakge!=$income ")or die("query error");
			 
			 $user_id=find_user_id($row_cnt9['id']);
			 
			 
			  parant_income_add($row_cnt9['user_id'],$income,$board);
			  
			 $comment='Board '.$board.' Income';
			 if($query_check9)
					transcation_history($row_cnt9['user_id'],$type,$comment,$income,0);
		}

	   } 
	   
	   
	   $sql10=mysqli_query($con,"SELECT * FROM reg WHERE pacakge=2000 AND board=9");
	   while($row_cnt10=mysqli_fetch_array($sql10))
	   {
	
		$next_id10=$row_cnt10['auto_inc']*2;
		$cnt10=mysqli_num_rows(mysqli_query($con,"select * from reg  WHERE pacakge=2000 AND board=9"));
		if($next_id10==$cnt10)  
		{
			
			$income=2500;
			  $board=10;
			 $query_check10=mysqli_query($con,"UPDATE reg SET pacakge=$income ,total_income=total_income+$income , wallet=wallet+$income, plan_income=plan_income+$income, board=$board WHERE id='".$row_cnt10['id']."' AND pacakge!=$income ")or die("query error");
			 
			$user_id=find_user_id($row_cnt9['id']);
			 
			  parant_income_add($row_cnt10['user_id'],$income,$board);
			  
			 $comment='Board '.$board.' Income';
			 if($query_check10)
					transcation_history($row_cnt10['user_id'],$type,$comment,$income,0);
		}

	   }
	
		
		
}

function this_ai_id($user_id)
{
	global $con;
	$row_this=mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM reg WHERE user_id='$user_id'"));
	if(!empty($row_this['id']))
	return $row_this['id'];
}

function find_user_id($id)
{
	global $con;
	$row_this=mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM reg WHERE id='$id'"));
	return $row_this['user_id'];
}

function parant_income_add($user_id,$income,$board)
{
	global $con;
	 $row=mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM reg WHERE user_id='$user_id'"));
		  
		  if(!empty($row['re_birth_parent']))
		  {
			  mysqli_query($con,"UPDATE reg SET total_income=total_income+$income , wallet=wallet+$income, plan_income=plan_income+$income WHERE user_id='".$row['re_birth_parent']."'")or die("query error");
			  $type='child_board_income';
			  $comment='Child board income id of :'.$user_id.' Board : '.$board;
			  
			  transcation_history($row['re_birth_parent'],$type,$comment,$income,0);
		  }
		  
}
function create_rebirth($u_id){
	global $con;
	global $date;
	global $time;
	
	$row=mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM reg WHERE user_id='$u_id'"));
	 $user_id="WM".rand(1111,9999).mysqli_num_rows(mysqli_query($con,"select* from reg"));
	 upgrade($row['parant_id'],$user_id);
	 
	mysqli_query($con,"UPDATE reg SET global_count=global_count+1 ")or die("create_rebirth global Query error");
	 mysqli_query($con,"INSERT INTO `reg`(`user_id`,`join_date`,`join_time`,`parant_id`,`re_birth_parent`,`pacakge`, `name`, `mail`, `mobile`, `password`, `sponsor_id`, `board`,`status`) VALUES ('$user_id','$date','$time','".$row['parant_id']."','$u_id',0,'".$row['name']."','".$row['mail']."','".$row['mobile']."','".$row['password']."','".$row['sponsor_id']."',0,1)")or die("create_rebirth Query error");

			  
}


?>