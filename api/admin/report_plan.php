
<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <!-- Content Header (Page header) -->
       <section class="content-header"><h1> Plan Report<small>advanced tables</small></h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#"> Total users</a></li>
                <li class="active"> Total users</li>
            </ol></section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title" style="color:#FF0000;"><b>Report</b></h3>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                             <table id="data_table" class="table table-bordered table-striped">  
                          <thead>  
                               <tr>  
                                   <th style="text-align:center;">S.No.</th>
                                        <th style="text-align:center;">User Id</th>
									  <th style="text-align:center;">Join Date</th>
                                        <th style="text-align:center;">Name</th>
                                        <th style="text-align:center;">Mobile</th>
                                        <th style="text-align:center;">Sponser ID</th>
                                        <th style="text-align:center;">Referrals</th>
                                        <th style="text-align:center;">Plan Amount</th>
                                        <th style="text-align:center;">Upgrade Date</th>
                                        <th style="text-align:center;">Total Deposit</th>
                                     
                                        <th style="text-align:center;">Total Income</th>
                                        <th style="text-align:center;">Wallet</th>
                                        <th style="text-align:center;">Left Business</th>
                                        <th style="text-align:center;">Right Business</th>
                                        <th style="text-align:center;">Total PV</th>
                                        <th style="text-align:center;">Today PV</th>
                                        
                                        
                                        <th style="text-align:center;">User Panel</th>
                                        <th style="text-align:center;">View</th>
                               </tr>  
                          </thead>  
                             <tbody>
									<?php 
							$res_pin=mysqli_query($con,"SELECT reg.user_id,reg.join_date,reg.name,reg.mobile,reg.sponsor_id,reg.ref_count,reg.plan_amount,reg.total_income,reg.wallet,tree.1_biz,tree.2_biz,reg.total_pv,reg.today_pv,reg.user_id,reg.password,reg.upgrade_date,reg.total_investment FROM reg INNER JOIN tree ON reg.user_id=tree.user_id")or die("Query error");
							$i=1;
							while($row_pin=mysqli_fetch_array($res_pin))
							{
					
					?>
						<tr>
							<td><?php echo $i++; ;?></td>
							<td><?php echo$row_pin['user_id'];?></td>
							<td><?php echo$row_pin['join_date'];?></td>
							<td><?php echo$row_pin['name'];?></td>
							<td><?php echo$row_pin['mobile'];?></td>
							<td><?php echo$row_pin['sponsor_id'];?></td>
							<td><?php echo$row_pin['ref_count'];?></td>
						
							<td><?php echo$row_pin['plan_amount'];?></td>
							<td><?php echo$row_pin['upgrade_date'];?></td>
							<td><?php echo$row_pin['total_investment'];?></td>
							<td><?php echo$row_pin['total_income'];?></td>
							<td><?php echo$row_pin['wallet'];?></td>
							<td><?php echo$row_pin['1_biz'];?></td>
							<td><?php echo$row_pin['2_biz'];?></td>
							<td><?php echo$row_pin['total_pv'];?></td>
							<td><?php echo$row_pin['today_pv'];?></td>
						
							
							
							
							
							<td><form method="POST" action="../action.php" target="_blank">
								<input type="hidden" name="u_id" value="<?php echo $row_pin['user_id']?>">
								<input type="hidden" name="pass" value="<?php echo $row_pin['password']?>">
                                    <button name="login" class="btn btn-danger">Goto Panel</button>
									</form></td>
							
							<td><a href="view.php?id=<?php echo$row_pin['user_id'];?>" class="btn btn-primary">View</a></td>
						</tr>
						<?php
					}
							
						?>
                                </tbody>
                     </table> 
                        </div>
                        <!-- /.box-body -->
                    </div>
					 
		    <script>  
			 $(document).ready(function(){  
				  $('#employee_data').DataTable();  
			 });  
			 </script>  
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

