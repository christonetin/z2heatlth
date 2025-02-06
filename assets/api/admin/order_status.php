
<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ;
    if($_GET['id']==0){
        $head='New Orders';
        $cart_order_status=0;
    }
    elseif($_GET['id']==1){
        $head='Packed Orders';
        $cart_order_status=1;
    }
    elseif($_GET['id']==2){
        $head='Couriered Orders';
        $cart_order_status=2;
    }
    elseif($_GET['id']==3){
        $head='Completed Orders';
        $cart_order_status=3;
    }
    elseif($_GET['id']==4){
        $head='Failed Orders';
        $cart_order_status=4;
    }
    ?>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <!-- Content Header (Page header) -->
       <section class="content-header">
            <h1>
               <?php echo $head?>
                <small>advanced tables</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">  <?php echo $head?></a></li>
                <li class="active"> <?php echo $head?></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title" style="color:#FF0000;"><b>  <?php echo $head?></b></h3>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                             <table id="data_table" class="table table-bordered table-striped">  
                          <thead>  
                               <tr>  
                               <th>Sl.No</th>
				<th>Date</th>
				<th>User Details</th>
				<th>Product Details</th>
				<th>Product </th>
				<th>Price</th>
				<th>Qty</th>
				<th>Total</th>
				<th>Status</th>
                               </tr>  
                          </thead>  
                             <tbody>
									<?php 
					
				
							$res_pin=mysqli_query($con,"SELECT * FROM cart WHERE   cart_status=1 AND order_status='$cart_order_status' ORDER BY cart_ai_id  DESC  ")or die("Query error");
							$i=1;
                            $stot=0;
							while($row1=mysqli_fetch_array($res_pin))
							{
                                $row_user=mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM reg WHERE user_id='".$row1['user_id']."'"));
                                $price_only=$row1['cart_pro_selling_price']+$row1['cart_gst'];
                                $tot=$price_only*$row1['cart_qty'];
                                $stot+=$tot;
                                if($row1['order_status']==0)
                                $st='New Order';
                                elseif($row1['order_status']==1)
                                $st='Packed';
                                elseif($row1['order_status']==2)
                                $st='Couriered';
                                elseif($row1['order_status']==3)
                                $st='Completed';
                                elseif($row1['order_status']==4)
                                $st='Failed';
                
                                $order_date='';
                                echo '<tr>';
                                echo '<td>'.$i++.'</td>';
                                echo '<td>'.date('d-m-Y',strtotime($row1['cart_date'])).'</td>';
                                echo '<td>'.$row_user['user_id'].' - '.$row_user['name'].',<br>'.$row_user['address'].',<br>'.$row_user['city'].','.$row_user['pin_code'].',<br>'.$row_user['mobile'].'<br><a href="view.php?id='.$row_user['user_id'].'" target="_blank" class="btn btn-primary btn-sm">View user</a></td>';
                                echo '<td>'.$row1['cart_pro_name'].'</td>';
                                echo '<td><img src="../product_image/'.$row1['cart_img'].'" class="img-thumbnail" style="width:100px"></td>';
                                echo '<td>'.$row1['cart_status'].'</td>';
                                echo '<td>'.$row1['cart_qty'].'</td>';
                                echo '<td>'.$tot.'</td>';
                                echo '<td>'.$st.'<br><form method="POST" action="action.php">
                                <input type="hidden" value="'.(empty($_SERVER['HTTPS']) ? 'http' : 'https') . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]".'" name="currunt_url">
                                <input type="hidden" value="'.$row1['cart_ai_id'].'" name="cart_ai_id">
                                <select name="status" required>
                                <option value=" ">--SELECT--</option>
                                <option value="1">Packed</option>
                                <option value="2">Couriered</option>
                                <option value="3">Completed</option>
                                <option value="4">Failed</option>
                                </select>
                                <button name="order_status_change" class="btn btn-info btn-sm">Change</button>
                                </form></td>';
                                echo '</tr>';
					
					?>
						
						<?php
					}
							
						?>
                                </tbody>
                     </table> 
                        </div>
                        <!-- /.box-body -->
                    </div>
					 
		  
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <?php include "include/footer.php" ?>

