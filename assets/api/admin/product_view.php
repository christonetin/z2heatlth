<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>View product </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#"> Edit product</a></li>
                <li class="active"> Edit product</li>
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
                <div class="col-md-12" style="margin:10px">
                    <!-- general form elements -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Add New Product</h3>
                        </div>
                        <?php  $row_pro=mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM product WHERE pro_ai='".$_GET['id']."'"))?>
                        <!-- /.box-header -->
                        <form style="margin:10px" action="action.php" method="POST" enctype="multipart/form-data">
                     <input type="hidden" name="pro_ai" value="<?php echo $row_pro['pro_ai']?>">
                     <input type="hidden" name="pro_code" value="<?php echo $row_pro['pro_code']?>">
                <div class=" row ">
                    <div class="form-group col-md-2">
                    <label for="inputEmail4">Product Code</label>
                    <input type="text" class="form-control"  name="pro_code" value="<?php echo $row_pro['pro_code']?>" required readonly>
                    </div>
                 
               
                    <div class="form-group col-md-3">
                    <label for="inputEmail4">Product Name</label>
                    <input type="text" class="form-control"name="pro_name" value="<?php echo $row_pro['pro_name']?>"  required>
                    </div>
                    
                    <div class="form-group col-md-2">
                    <label for="inputPassword4">Qty</label>
                    <input type="number" class="form-control"name="pro_qty" value="<?php echo $row_pro['pro_qty']?>"  readonly>
                    </div>
                    <div class="form-group col-md-2">
                    <label>Main Category <a href="category_main.php" target="_blank"><i class="fa fa-plus-circle"></i></a></label>
                         <select name="maincat" class="form-control" id="maincat" required>
                           <option value="<?php echo $row_pro['maincat']?>"><?php echo select_query('category','id',$row_pro['maincat'],'category_name')?></option>
                           <?php
                           $res_cat=mysqli_query($con,"SELECT * FROM category")or die("Query error");
                           $i=1;
                           while($row_cat=mysqli_fetch_array($res_cat))
                           {
                               echo '<option value='.$row_cat['id'].'>'.$row_cat['category_name'].'</option>';
                           }
                           
                                     ?>
                            </select>
                                
                    </div>
                    <div class="form-group col-md-2">
                    <label>Sub Category <a href="category_sub.php" target="_blank"><i class="fa fa-plus-circle"></i></a></label>
                         <select name="subcat" class="form-control" id="subcat" required>
                         <option value=" ">--SELECT--</option>
                            </select>
                                <script>
                                    $(document).ready(function(){
                                        get_sub_cat(1);
                                    });
                                    $("#maincat").change(function(){
                                     
                                        get_sub_cat(1);
                                    });

                                    function get_sub_cat(e)
                                    {
                                        var  maincat=$("#maincat").val();
                                      var check_category='';
                                      $.post('action.php',{check_category:check_category,maincat:maincat}).done(function(data){
                                        $("#subcat").html(data);
                                      })
                                    }
                                  
                                </script>
                    </div>
                </div>
                <div class="row">
                   
                    <div class="form-group col-md-3">
                    <label for="inputPassword4"> MRP</label>
                    <input type="number" class="form-control" id="mrp" name="mrp" value="<?php echo $row_pro['mrp']?>"  required>
                    </div>
                    <div class="form-group col-md-3">
                    <label for="inputPassword4">Discount</label>
                    <input type="number" class="form-control" name="discount" value="<?php echo $row_pro['discount']?>" id="discount" required value="0">
                    </div>
                    <div class="form-group col-md-3">
                    <label for="inputPassword4">Selling Price</label>
                    <input type="number" class="form-control" name="price" value="<?php echo $row_pro['price']?>" id="price" readonly>
                    </div>
                    <div class="form-group col-md-3">
                    <label for="inputPassword4">Flat Level Distribution (in Amount)</label>
                    <input type="number" class="form-control" name="margin"  value="<?php echo $row_pro['margin'] ?>" required >
                    </div>
                </div>
           
                <div class="row"> 
               
                    <div class="form-group col-md-4">
                    <label for="inputEmail4">YouTube Link</label>
                    <input type="text" class="form-control"name="youtube_link" value="https://www.youtube.com/watch?v=<?php echo $row_pro['youtube_link']?>" required>
                    </div>
                    <div class="form-group col-md-4">
                    <label for="inputPassword4">Description</label>
                    <textarea class="form-control" name="pro_desc" id="editor"><?php echo $row_pro['pro_desc']?></textarea>
                    </div>
                </div>

                <div class="row">
                    <h3>Product Image Section</h3>
                    <div class="col-xs-12 col-md-6 ">
                        <div class="row">
                        <div class="form-group col-xs-6  col-md-4">
                    <label> (Width :300px * Height :300px) </label>
                                   <input type="file" class="form-control" id="pic" accept="image/*" onchange="loadFile(event)" >
								   <img id="output" style="width:100px; height:100px" />
										<script>
										  var loadFile = function(event) {
											var output = document.getElementById('output');
											output.src = URL.createObjectURL(event.target.files[0]);
											output.onload = function() {
											  URL.revokeObjectURL(output.src) // free memory
											}
										  };
										</script>
                    </div>
                   
                    <div class="form-group col-xs-6  col-md-4 ">
                        <label for="">Qty</label>
                       
                        <br>
                        <a href="#" id="add_image" class="btn btn-info"><i class="fa fa-image"></i> Add Image</a>
                    </div>
                  
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-6 ">

                    <table class="table">
                        <thead>
                            <tr>
                                <th>Image</th>
                              
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody id="product_imge_tbody">

                        </tbody>
                    </table>
                    </div>

                    
                </div>
<div class="box-footer text-center">
<button name="product_update" class="btn btn-primary"><i class="fa fa-upload"></i> Update Product</button>
  <button name="product_delete" class="btn btn-danger"  onclick="return confirm('Are You Want Delete This product?')"><i class="fa fa-close"></i> Delete Product</button>
</div>
 
</form>
            <script>
 $('#add_image').on('click', function(event){
                        event.preventDefault();
                        var isValid = true;
                    
                        var pic=$("#pic")[0].files[0];
                        var color=$('#color').val();
                        var qty=$('#qty').val();
                        var pro_code='<?php echo $row_pro['pro_code']?>';
                      
                    
                    
                    
                        if($("#pic").val()===''){
                        $('#pic').focus();
                        isValid = false;
                        return false;
                        }
                   
                   
                        if(isValid){
                          
                           
                        const formData = new FormData();
                    
                        formData.append('pic',  pic);
                        formData.append('color', color);
                        formData.append('qty', qty);
                        formData.append('pro_code', pro_code);
                  
                        formData.append('add_image', '');
                       
                       
                        $.ajax({
                                            type: 'POST',
                                            url: 'action.php',
                                            data: formData,
                                            contentType: false,
                                            processData: false,
                                            success: function(response) {
                                                getProImageByCode(1);
                                            },
                                            error: function(xhr, status, error) {
                                                console.log('fail '+response);
                                            }
                                            
                                        }); 
                                      
                                        
                                  
                                        
                                        
                        }
                        
                    
                    });

$(document).on('click', '.delete_pro_image', function(e){
        e.preventDefault();
        var delete_pro_image= $(this).data('id');

        $.post('action.php',{delete_pro_image:delete_pro_image}).done(function(data){
            getProImageByCode(1);
        });
    });

$( document ).ready(function() {

    getProImageByCode(1);
});

function getProImageByCode(e){
                    var getProImageByCode='<?php echo $row_pro['pro_code']?>';
                    $.post('action.php',{getProImageByCode:getProImageByCode}).done(function(datas){
                      console.log(datas);
                            $("#product_imge_tbody").html(datas)
                    });
                }
                  ClassicEditor
                                .create( document.querySelector( '#editor' ) )
                                .then( editor => {
                                        console.log( editor );
                                } )
                                .catch( error => {
                                        console.error( error );
                                } );
                 $('#mrp').keyup(function(){
                                  
                                  var mrp=$('#mrp').val();
                                  var discount=$('#discount').val();
                                  find_price(mrp,discount);
                                 
                          });
                          $('#discount').keyup(function(){
                                  var mrp=$('#mrp').val();
                                  var discount=$('#discount').val();
                                  find_price(mrp,discount);
                                 
                          });

                          function find_price(mrp,discount)
                          {
                              var price=mrp-discount;
                                  $('#price').val(price);
                          }

                        $("#pro_gst").keyup(function(){
                        var pro_gst=$('#pro_gst').val();
                        find_gst(pro_gst)
                        
                        });

                    

                        function find_gst(pro_gst)
                        {
                            var pro_selling_price=$('#price').val();
                        var gst=pro_selling_price*(pro_gst/100);
                        var split_gst=gst/2;

                        $("#pro_sgst").val(split_gst);
                        $("#pro_cgst").val(split_gst);
                        
                        }
                    </script>

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
