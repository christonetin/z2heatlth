<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
		<?php
		$row=mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM reg WHERE user_id='".$_GET['id']."'"));
		?>
        <section class="content-header">
            <h1>
               User ID: <?php echo $row['user_id']?> 
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="manage_user.php">User info</a></li>
                <li class="active">User info</li>
            </ol>
        </section>

      
        <script src="scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
        <script type="text/javascript" language="javascript">
        $("#success_msg").delay(4000).fadeOut(100);
        </script>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <!-- left column -->
                <div class="col-md-9" style="margin-left:10%;margin-right:10%;">
                    <!-- general form elements -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">User Details</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                       
                            <div class="box-body">

                                <div class="form-group">
                                    <label>Name</label>
                                   <input type="text" class="form-control" value="<?php echo $row['name']?> " required>
                                </div>
								 <div class="form-group">
                                    <label>Mobile Number</label>
                                   <input type="text" class="form-control" value="<?php echo $row['mobile']?> " required>
                                </div>
								 <div class="form-group">
                                    <label>Password</label>
                                   <input type="text" class="form-control" value="<?php echo $row['password']?> " required>
                                </div>
                                <?php
                                if($row['status']==0)
                                {
                                    ?>
                                    <div class="form-group">
                                        <form action="action.php" method="post">
                                   <button class="btn btn-info" value="<?php echo $row['user_id']?>" name="activate_user">Activate</button>
                                   </form>
                                </div>
                                    <?php
                                }
                                ?>
						
                       
                    </div>   

					<div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Wallet Update</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                       <form method="POST" action="action.php">
					   <input type="hidden" class="form-control" name="u_id" value="<?php echo $row['user_id']?> "  >
                            <div class="box-body">
                                <div class="form-group">
                                    <label>Wallet Amount</label>
                                   <input type="text" class="form-control" name="amount" value="<?php echo $row['purchase_wallet']?>"  requied>
                                </div>
							<div class="form-group">
                                   <button name="wallet_update" class="btn btn-info" >Update</button>
                                </div>
						
					
                             </div>
                       </form>
                    </div>
					<div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Send E-Pin</h3>
                        </div>
                        
                            <div class="box-body">
						<form method="POST" action="action.php">
						<input type="hidden" name="u_id" value="<?php echo $row['user_id']?> " required>
                                <div class="form-group">
                                    <label>E-Pin count</label>
                                   <input type="text" class="form-control"  name="count" required>
                                </div>
								 <div class="form-group">
                                    <label>Select Amount</label>
                                  <select name="amount" class="form-control" requied>
									<option value="">--SELECT--</option>
									<option value="1500">1500</option>
									<option value="4500">4500</option>
									<option value="9000">9000</option>
									
									
								  </select>
                                </div>
								 
								 <div class="form-group">
                                  <button name="send_e_pin" class="btn btn-success" onclick="return confirm('Are You Want Send E-Pin This ID?')" >Send Pin</button>
                                </div>
							
                              </form>
                                </div>
                       
                    </div>
					
				<div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Delete User</h3>
                        </div>
                        
                            <div class="box-body"> 
					<form action="action.php" method="post">
                        <button class="btn btn-lg btn-danger" name="delete_user" value="<?php echo $row['user_id']?>" onclick="return confirm('Are you want Delete This user')"><i class="fa fa-trash"></i> Delete</button>
                    </form>
                              
                                </div>
                       
                    </div>
			
                    <!-- /.box -->

                </div>

            </div>
		   
			
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <?php include "include/footer.php" ?>
