<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
               Withdraw Eligible
			  <!-- <form action="action.php" method="POST">
			  <button name="cut_off" class="btn btn-info">Cut Off</button>
			  </form>--->
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="manage_user.php">E-Pin</a></li>
                <li class="active">E-pin Details</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <!-- left column -->
                <div class="col-md-12" style="margin-left:0%;margin-right:10%;">
                    <!-- general form elements -->
                    <div class="box box-primary" >
                      <div style=" overflow-x: scroll;">
                    <table id="data_table" class="table table-bordered table-striped"> 
					 <thead class="table__head">
						<tr>
						<th>Sl.No</th>
							<th>User Id</th>
							<th>Name</th>
							<th>Mobile</th>
							<th>Acc number</th>
							<th>Acc Name</th>
							<th>IFSC</th>
							<th>Branch</th>
							<th>Bank</th>
                            <th>withdraw request Date</th>
							<th>Withdraw amount</th>
							<th>Deduction</th>
							<th>Net Amount</th>
							
							
							<th>View User</th>
						</tr>
					</thead>
					<tbody>
					<?php 
					$res_wallet_his=mysqli_query($con,"SELECT * FROM withdraw_request INNER JOIN reg  ON reg.user_id=withdraw_request.user_id ")or die("Query Error"); 
					$i=0;
					while($row_wallet_his=mysqli_fetch_array($res_wallet_his))
					{
					?>
						<tr>
							<td><?php $i++; echo $i;?></td>
							<td><?php echo$row_wallet_his['user_id'];?></td>
							<td><?php echo$row_wallet_his['name'];?></td>
							<td><?php echo$row_wallet_his['mobile'];?></td>
							<td><?php echo$row_wallet_his['acc_num'];?></td>
							<td><?php echo$row_wallet_his['acc_name'];?></td>
							<td><?php echo$row_wallet_his['ifsc'];?></td>
							<td><?php echo$row_wallet_his['branch'];?></td>
							<td><?php echo$row_wallet_his['bank'];?></td>
							<td><?php echo$row_wallet_his['wr_date'];?></td>
							<td><?php echo$row_wallet_his['amount'];?></td>
							<td><?php echo$row_wallet_his['net_deduction'];?></td>
							<td><?php echo$row_wallet_his['eligible_withdraw'];?></td>
							
				
						
							<td> <a href="view.php?id=<?php echo$row_wallet_his['user_id'];?>" class="btn btn-primary">View</a></td>
							
						</tr>
						<?php
					}
						?>
					</tbody>
				</table>
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
