<?php session_start();

include "../db.php";
include "../function.php";

if(isset($_POST['getProImageByCode'])){
	$sql=mysqli_query($con,"SELECT * FROM `pro_images` WHERE `pro_code`='".$_POST['getProImageByCode']."'")or die('error');
	while($row=mysqli_fetch_array($sql)){
		echo '<tr>
		<td> <img src="../product_image/'.$row['pi_pic'].'" style="width:70px;height:70px"></td>
		<td><span style="display: inline-block; background-color: '.$row['pro_color'].'; height: 15px; width: 50px;"></span></td>
		<td>'.$row['pro_qty'].'</td>
		<td> <a href="#" class="btn btn-danger delete_pro_image"  data-id="'.$row['pi_ai'].'">Delete</a></td>
		</tr>
		';
	}
}

if(isset($_POST['delete_pro_image'])){
	$pi_ai=$_POST['delete_pro_image'];
	$row=mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM `pro_images` WHERE `pi_ai`='$pi_ai'"));
	unlink('../product_image/'.$row['pi_pic']);
	mysqli_query($con,"DELETE FROM `pro_images` WHERE `pi_ai`='$pi_ai'")or die('delete error');
}
if(isset($_POST['getProImage'])){
	$sql=mysqli_query($con,"SELECT * FROM `pro_images` WHERE `pro_code`='' ")or die('error');
	while($row=mysqli_fetch_array($sql)){
		echo '<tr>
		<td> <img src="../product_image/'.$row['pi_pic'].'" style="width:70px;height:70px"></td>
		<td><span style="display: inline-block; background-color: '.$row['pro_color'].'; height: 15px; width: 50px;"></span></td>
		<td>'.$row['pro_qty'].'</td>
		<td> <a href="#" class="btn btn-danger delete_pro_image"  data-id="'.$row['pi_ai'].'">Delete</a></td>
		</tr>
		';
	}
}
if(isset($_POST['cut_off'])){
	$sql=mysqli_query($con,"SELECT * FROM withdraw_request WHERE wr_status=1")or die('error 1 cuttoff');
	while($row=mysqli_fetch_array($sql)){
		$sql2=mysqli_query($con,"SELECT * FROM cutt_off WHERE user_id='".$row['user_id']."' AND cutt_status=1")or die('error 2');
		$cnt=mysqli_num_rows($sql2);
		if($cnt>=1){
			mysqli_query($con,"UPDATE cutt_off SET wr_date='$dt',amount=amount+".$row['amount'].",tds=tds+".$row['tds'].",service=service+".$row['service'].",repurchase=repurchase+".$row['repurchase'].",net_deduction=net_deduction+".$row['net_deduction'].",eligible_withdraw=eligible_withdraw+".$row['eligible_withdraw']." WHERE user_id='".$row['user_id']."' ")or die('error 3');
		}
		else{
			mysqli_query($con,"INSERT INTO `cutt_off`(`user_id`, `wr_date`, `amount`, `tds`, `service`, `repurchase`, `net_deduction`, `eligible_withdraw`) VALUES ('".$row['user_id']."','$dt','".$row['amount']."','".$row['tds']."','".$row['service']."','".$row['repurchase']."','".$row['net_deduction']."','".$row['eligible_withdraw']."' )")or die('error 4');
		}
		mysqli_query($con,"UPDATE withdraw_request SET wr_status=2 WHERE user_id='".$row['user_id']."'") or die('error 5');
	}
	echo "<script>alert('Cutt-Off Successfully')</script>";
	echo "<script>location.href='cutt_off.php'</script>";
}
if(isset($_POST['wallet_remove'])){
	mysqli_query($con,"UPDATE pin_req SET pin_req_status=2 WHERE pin_req_id='".$_POST['pin_req_id']."'")or die('eror 2');
	echo "<script>alert('Removed Successfully')</script>";
	echo "<script>location.href='payment_request.php'</script>";
}
if(isset($_POST['order_status_change'])){
	mysqli_query($con,"UPDATE cart SET order_status='".$_POST['status']."' WHERE cart_ai_id='".$_POST['cart_ai_id']."'")or die('change status error');
	echo "<script>location.href='".$_POST['currunt_url']."'</script>";
}
if(isset($_POST['upate_vid_url']))
{
	
	$video=getYoutubeEmbedUrl($_POST['video']);
	mysqli_query($con,"UPDATE admin SET youtube_url='$video'")or die('error');
	echo "<script>alert('Video Added')</script>";
	echo "<script>location.href='vid_add.php'</script>";
}
if(isset($_POST['send_e_pin']))
{
	$send_e_pin=$_POST['send_e_pin'];
	$u_id=$_POST['u_id'];
	$count=$_POST['count'];
	
	for($i=0;$i<$count;$i++)
	{
	$length = 10;
				$getNumber = substr(str_shuffle("abcdefghijklmnopqrstuvwxyz"), 0, $length).$_POST['amount'];
				mysqli_query($con,"INSERT INTO `pin`(`pin`, `amount`, `u_id`, `pin_date`, `status`) VALUES ('$getNumber','".$_POST['amount']."','$u_id','$dt',0)")or die("Query Error Pin");
	}
	
	echo "<script>alert('E-pin send Successfully')</script>";
	echo "<script>location.href='view.php?id=$u_id'</script>";
}
if(isset($_POST['accept_withdraw_request']))
{
	$user_id=$_POST['u_id']; 
	$cuttoff_id =$_POST['cuttoff_id'];
	$amount=$_POST['amount'];
	mysqli_query($con,"UPDATE cutt_off SET cutt_status=2 where 	cuttoff_id ='$cuttoff_id'" )or die("withdraw_request update query error");
	
		$type='wallet';
		$creadit=0;
		$debit=$amount;
		$comment='Amount of '.$amount.' Credit Your local Account';
		transcation_history($user_id,$type,$comment,$creadit,$debit);
		
		echo "<script>alert('Accetpt Withdraw Request')</script>";
	echo "<script>location.href='cutt_off.php'</script>";
}
if(isset($_POST['delete_user']))
{
	mysqli_query($con,"DELETE FROM `cart` WHERE user_id='".$_POST['delete_user']."'")or die('error 1 cart delete');
	mysqli_query($con,"DELETE FROM `invoice` WHERE inv_user='".$_POST['delete_user']."'")or die('error 2');
	mysqli_query($con,"DELETE FROM `level` WHERE user_id='".$_POST['delete_user']."'")or die('error 3');
	mysqli_query($con,"DELETE FROM `reg` WHERE user_id='".$_POST['delete_user']."'")or die('error 4');
	mysqli_query($con,"DELETE FROM `transcation_history` WHERE u_id='".$_POST['delete_user']."'")or die('error 5');
	mysqli_query($con,"DELETE FROM `withdraw_request` WHERE u_id='".$_POST['delete_user']."'")or die('error 6');
	echo "<script>alert('Delete ID Successfully')</script>";
	echo "<script>location.href='index.php'</script>";
}
if(isset($_POST['update_img_whatsapp']))
{
	unlink($_POST['unlink']);
	
	$destination='../banners_admin/';
	$pic_name=img_validate($_FILES['pic']['type'],$_FILES['pic']['size'],$_FILES['pic']['tmp_name'],$destination);

	mysqli_query($con,"UPDATE admin SET whatsapp_pic='$pic_name'")or die('error');

	echo "<script>alert('Image Updated')</script>";
	echo "<script>location.href='whatsapp_image_update.php'</script>";
}

if(isset($_POST['franchisee_update']))
{
	mysqli_query($con,"UPDATE `master_franchisee` SET `mas_franch_name`='".$_POST['mas_franch_name']."',`mas_franch_mobile`='".$_POST['mas_franch_mobile']."',`mas_franch_mail`='".$_POST['mas_franch_mail']."',`mas_franch_password`='".$_POST['mas_franch_password']."',`mas_franch_address`='".$_POST['mas_franch_address']."',`mas_franch_city`='".$_POST['mas_franch_city']."',`mas_franch_state`='".$_POST['mas_franch_state']."',`mas_franch_pincode`='".$_POST['mas_franch_pincode']."' WHERE `mas_franch_id`='".$_POST['mas_franch_id']."'")or  die ('error');
	success('Updated');
}
if(isset($_POST['franchisee_add']))
{
	$mas_franch_id="MF".rand(111,999).mysqli_num_rows(mysqli_query($con,"SELECT * FROM master_franchisee"));
	mysqli_query($con,"INSERT INTO `master_franchisee`(`mas_franch_jdate`, `mas_franch_id`, `mas_franch_name`, `mas_franch_mobile`, `mas_franch_mail`, `mas_franch_password`, `mas_franch_address`, `mas_franch_city`, `mas_franch_state`, `mas_franch_pincode`,`is_mater_franches`) VALUES ('$dt','$mas_franch_id','".$_POST['mas_franch_name']."','".$_POST['mas_franch_mobile']."','".$_POST['mas_franch_mail']."','".$_POST['mas_franch_password']."','".$_POST['mas_franch_address']."','".$_POST['mas_franch_city']."','".$_POST['mas_franch_state']."','".$_POST['mas_franch_pincode']."',1)")or die('query error');
	echo "<script>alert('Franchisee Added')</script>";
	echo "<script>location.href='franchisee_add.php'</script>";

	
                                
}
if(isset($_POST['banner_add']))
{
	$url=$_POST['url'];
	

	$destination='../banners_admin/';
	$pic_name=img_validate($_FILES['pic']['type'],$_FILES['pic']['size'],$_FILES['pic']['tmp_name'],$destination);
				mysqli_query($con,"INSERT INTO `banner_admin`(`url`, `pic`) VALUES ('$url','$pic_name')");
				
		
			echo "<script>alert('Banner Added')</script>";
	echo "<script>location.href='banner.php'</script>";
}


if(isset($_POST['banner_delete']))
{
	unlink($_POST['unlink']);
	mysqli_query($con,"DELETE FROM `banner_admin` WHERE ban_ai='".$_POST['ban_ai']."'")or die("Query error");
	
echo "<script>alert('Banner Deleted')</script>";
	echo "<script>location.href='banner.php'</script>";
	
	
}

if(isset($_POST['banner_edit']))
{
	mysqli_query($con,"UPDATE banner_admin SET url='".$_POST['url']."' WHERE ban_ai='".$_POST['ban_ai']."'");
	
	if(!empty($_FILES['pic']['name']))
	{
		unlink($_POST['unlink']);
		$destination='../banners_admin/';
	$pic_name=img_validate($_FILES['pic']['type'],$_FILES['pic']['size'],$_FILES['pic']['tmp_name'],$destination);
	mysqli_query($con,"UPDATE banner_admin SET pic='$pic_name' WHERE ban_ai='".$_POST['ban_ai']."'");
	}
		
	echo "<script>alert('Banner Updated')</script>";
	echo "<script>location.href='banner.php'</script>";
}

if(isset($_POST['proMultipleImg_delete'])){
	unlink($_POST['unlink']);
	mysqli_query($con,"DELETE FROM `pro_images` WHERE `pi_ai`='".$_POST['proMultipleImg_delete']."'")or die('error 2');
	
	echo "<script>alert('Product Image Deleted Successfully')</script>";
	echo "<script>location.href='product_view.php?id=".$_POST['pro_id']."'</script>";
}


if(isset($_POST['product_update']))
{
	$row=mysqli_fetch_assoc(mysqli_query($con,"SELECT SUM(pro_qty) as qty FROM `pro_images` WHERE `pro_code`='".$_POST['pro_code']."'"));
	$youtube_link=!empty($_POST['youtube_link'])?getYoutubeEmbedUrl($_POST['youtube_link']):'';
	mysqli_query($con,"UPDATE `product` SET `pro_code`='".$_POST['pro_code']."',`pro_name`='".$_POST['pro_name']."',`pro_desc`='".$_POST['pro_desc']."',`mrp`='".$_POST['mrp']."',`discount`='".$_POST['discount']."',`price`='".$_POST['price']."',`pro_qty`='".$row['qty']."',`maincat`='".$_POST['maincat']."',`subcat`='".$_POST['subcat']."',`youtube_link`='$youtube_link' WHERE `pro_ai`='".$_POST['pro_ai']."'")or die('update error');

$pro_ai=$_POST['pro_ai'];
	echo "<script>alert('Product Updated')</script>";
		echo "<script>location.href='product_all.php'</script>";
}

if(isset($_POST['add_image'])){

	$pro_code=!empty($_POST['pro_code'])?$_POST['pro_code']:'';
	$destination='../product_image/';
	$pic_name=img_validate($_FILES['pic']['type'],$_FILES['pic']['size'],$_FILES['pic']['tmp_name'],$destination);
	mysqli_query($con,"INSERT INTO `pro_images`( `pi_pic`, `pro_color`,`pro_qty`,`pro_code`) VALUES ('$pic_name','".$_POST['color']."','".$_POST['qty']."','$pro_code')")or die('error');


}
if(isset($_POST['product_add']))
{

	$cnt=mysqli_num_rows(mysqli_query($con,"SELECT * FROM `product` WHERE `pro_code`='".$_POST['pro_code']."'"));

	if($cnt>=1){
		fail('This Code Already exist');
		return;
	}
	else{
		if(!empty($_POST['youtube_link']))
		$youtube_link=!empty($_POST['youtube_link'])?getYoutubeEmbedUrl($_POST['youtube_link']):'';
		else
		$youtube_link='';
		
		$row=mysqli_fetch_assoc(mysqli_query($con,"SELECT SUM(pro_qty) as qty FROM `pro_images` WHERE `pro_code`=''"));
		
		mysqli_query($con,"INSERT INTO `product`(`pro_date`,`pro_code`, `pro_name`, `pro_desc`, `mrp`, `discount`, `price`,`pro_qty`, `maincat`, `subcat`,`youtube_link`) VALUES ('$dt','".$_POST['pro_code']."','".$_POST['pro_name']."','".$_POST['pro_desc']."','".$_POST['mrp']."','".$_POST['discount']."','".$_POST['price']."','".$row['qty']."','".$_POST['maincat']."','".$_POST['subcat']."','$youtube_link')")or die('error 1');
	
		mysqli_query($con,"UPDATE `pro_images` SET `pro_code`='".$_POST['pro_code']."'  WHERE `pro_code`='' ")or die('pro code update error');
		
		success('Product Added');
	}

			
}



if(isset($_POST['product_delete']))
{
	$sql=mysqli_query($con,"SELECT  * FROM pro_images WHERE pro_code='".$_POST['pro_code']."'") or die('error');
	while($row=mysqli_fetch_array($sql)){
		unlink('../product_image/'.$row['pi_pic']);
	}
	mysqli_query($con,"DELETE FROM `pro_images` WHERE  pro_code='".$_POST['pro_code']."'") or die('update_product error');
	mysqli_query($con,"DELETE FROM `product` WHERE  pro_ai='".$_POST['pro_ai']."'") or die('update_product error');
	echo "<script>alert('Delete sucessfully')</script>";
		echo "<script>location.href='product_all.php'</script>";
}


if(isset($_POST['check_category']))
{
	$res_cat=mysqli_query($con,"SELECT * FROM category_sub WHERE maincat='".$_POST['maincat']."'")or die("Query error");
	$i=1;
	while($row_cat=mysqli_fetch_array($res_cat))
	{
		echo '<option value='.$row_cat['subcat_ai'].'>'.$row_cat['subcat'].'</option>';
	}
}
if(isset($_POST['sub_cat_delete']))
{
	mysqli_query($con,"DELETE FROM `category_sub` WHERE  subcat_ai='".$_POST['subcat_ai']."'")or die('error');
	echo "<script>alert('Category Deleted')</script>";
	echo "<script>location.href='category_sub.php'</script>";
}

if(isset($_POST['sub_cat_edit']))
{
	mysqli_query($con,"UPDATE category_sub SET subcat='".$_POST['subcat']."' WHERE subcat_ai='".$_POST['subcat_ai']."'")or die('error');
	echo "<script>alert('Category Updated')</script>";
	echo "<script>location.href='category_sub.php'</script>";
}
if(isset($_POST['category_sub_add']))
{
	

	mysqli_query($con,"INSERT INTO `category_sub`(`maincat`, `subcat`) VALUES ('".$_POST['maincat']."','".$_POST['subcat']."')");

	echo "<script>alert('category_added')</script>";
	echo "<script>location.href='category_sub.php'</script>";
}

if(isset($_POST['category_delete']))
{
	mysqli_query($con,"DELETE FROM category WHERE id='".$_POST['id']."'");

	
		unlink($_POST['unlink']);

		echo "<script>alert('Category Deleted')</script>";
	echo "<script>location.href='category_main.php'</script>";
}

if(isset($_POST['category_edit']))
{
	mysqli_query($con,"UPDATE category SET category_name='".$_POST['category_name']."' WHERE id='".$_POST['id']."'");
	
	if(!empty($_FILES['pic']['name']))
	{
		unlink($_POST['unlink']);

		$destination='../category_icon/';
	$pic_name=img_validate($_FILES['pic']['type'],$_FILES['pic']['size'],$_FILES['pic']['tmp_name'],$destination);
	mysqli_query($con,"UPDATE category SET icon='$pic_name' WHERE id='".$_POST['id']."'")or die('IMg update query error');
	}
		
		echo "<script>alert('Category Updated')</script>";
	echo "<script>location.href='category_main.php'</script>";
}

if(isset($_POST['category_add']))
{
	$category_name=$_POST['category_name'];
	
	$destination='../category_icon/';
	$pic_name=img_validate($_FILES['pic']['type'],$_FILES['pic']['size'],$_FILES['pic']['tmp_name'],$destination);

	mysqli_query($con,"INSERT INTO `category`(`category_name`, `icon`) VALUES ('$category_name','$pic_name')");

	echo "<script>alert('Category Added')</script>";
	echo "<script>location.href='category_main.php'</script>";
}







if(isset($_POST['delete_category']))
{
	mysqli_query($con,"DELETE FROM `category` WHERE id='".$_POST['id']."'")or die("Query error");
	
	echo "<script>alert('Delete Category Successfully')</script>";
	echo "<script>location.href='category_management.php'</script>";
	
	
}



if(isset($_POST["login"]))
{
	$u_id=$_POST["u_id"];
	$pass=$_POST["pass"];
	if($u_id!=""&&$pass!="")
	{
		
		$sql=mysqli_query($con,"SELECT * FROM `admin` WHERE `name`='$u_id' AND `pass`='$pass'")or die('error1');
		$cnt=mysqli_num_rows($sql);
		if($cnt>=1)
		{
			
			$_SESSION["admin_ssj"]=$u_id;
			
			echo "<script>location.href='index.php'</script>";
			//header("Location:loginindex.php");
		}
		else
		{
			echo "<p>Please enter Correct Details1</p>";
		}
	}
	else
	{
		echo "<p>Please enter all the details2</p>";
	}
}





if(isset($_POST['change_pass']))
{
	$id=$_POST['id'];
	$old_pass=$_POST['old_pass'];
	$cpwd=$_POST['cpwd'];
	$user_name=$_POST['user_name'];
	
	 $pass_count=mysqli_num_rows(mysqli_query($con,"select * from admin where id=2 AND pass='$old_pass'"));
	 
	 if($pass_count>=1)
	 {
		 mysqli_query($con,"UPDATE `admin` SET `pass`='$cpwd',`name`='$user_name' where id=2")or die("Query error");
		 $msg="Password Update";
		success($msg);
	 }
	 else{
		 $msg="Wrong Old Password";
		fail($msg);
	 }
	
	
}
function getYoutubeEmbedUrl($url)
	{
		 $shortUrlRegex = '/youtu.be\/([a-zA-Z0-9_-]+)\??/i';
		 $longUrlRegex = '/youtube.com\/((?:embed)|(?:watch))((?:\?v\=)|(?:\/))([a-zA-Z0-9_-]+)/i';

		if (preg_match($longUrlRegex, $url, $matches)) {
			$youtube_id = $matches[count($matches) - 1];
		}

		if (preg_match($shortUrlRegex, $url, $matches)) {
			$youtube_id = $matches[count($matches) - 1];
		}
		return $youtube_id ;
	}


 ?>
