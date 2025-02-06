<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type");
    include "../db.php";
    include "../function.php";

    if (isset($_POST['getWishListStatus'])) {
        $user_id  = $_POST['user_id'];
        $pro_code = $_POST['pro_code'];
        $cnt      = mysqli_num_rows(mysqli_query($con, "SELECT * FROM `wishlist` WHERE `user_id`='$user_id' AND `pro_code`='$pro_code'"));
        if ($cnt == 0) {
            $arr['res'] = 'false';
        } else {
            $arr['res'] = 'true';
        }

        echo json_encode($arr);
    }

    if (isset($_POST['wishListSubmit'])) {
        $user_id  = $_POST['user_id'];
        $pro_code = $_POST['pro_code'];
        $cnt      = mysqli_num_rows(mysqli_query($con, "SELECT * FROM `wishlist` WHERE `user_id`='$user_id' AND `pro_code`='$pro_code'"));
        if ($cnt == 0) {
            mysqli_query($con, "INSERT INTO `wishlist`( `user_id`, `pro_code`) VALUES ('$user_id','$pro_code')") or die('error');
        } else {
            mysqli_query($con, "DELETE FROM `wishlist` WHERE  `user_id`='$user_id' AND `pro_code`='$pro_code'") or die('error');
        }
    }
    if (isset($_POST['levelTeam'])) {
        $sql = mysqli_query($con, "SELECT  * FROM down_line_insert INNER JOIN reg ON reg.user_id=down_line_insert.user_id where down_line_insert.down_s_id='" . $_POST['userId'] . "' ") or die('Error');
        $arr = [];
        while ($row = mysqli_fetch_array($sql)) {
            $arr[] = $row;

        }
        echo json_encode($arr);
    }

    if (isset($_POST['referralTeam'])) {
        $sql = mysqli_query($con, "SELECT * FROM  reg WHERE  sponsor_id='" . $_POST['userId'] . "' ") or die('Error');
        $arr = [];
        while ($row = mysqli_fetch_array($sql)) {
            $arr[] = $row;

        }
        echo json_encode($arr);
    }

    if (isset($_POST['levelIncome'])) {
        $sql = mysqli_query($con, "SELECT * FROM  transcation_history WHERE  user_id='" . $_POST['userId'] . "' AND type='level_income' ") or die('Error');
        $arr = [];
        while ($row = mysqli_fetch_array($sql)) {
            $arr[] = $row;

        }
        echo json_encode($arr);
    }

    if (isset($_POST['levelTable'])) {
        $user_id = $_POST['userId'];

        $sql = mysqli_query($con, "SELECT * FROM `level` WHERE `user_id`='$user_id' ");

        $row = mysqli_fetch_assoc($sql);

        echo json_encode($row);
    }

    if (isset($_POST['depositHistory'])) {
        $sql = mysqli_query($con, "SELECT * FROM  deposit WHERE  user_id='" . $_POST['userId'] . "' ") or die('Error');
        $arr = [];
        while ($row = mysqli_fetch_array($sql)) {
            $arr[] = $row;

        }
        echo json_encode($arr);
    }

    if (isset($_POST['withdrawHistory'])) {
        $sql = mysqli_query($con, "SELECT * FROM  withdraw_request WHERE  user_id='" . $_POST['userId'] . "' ") or die('Error');
        $arr = [];
        while ($row = mysqli_fetch_array($sql)) {
            $arr[] = $row;

        }

        echo json_encode($arr);
    }

    if (isset($_POST['applyBiz'])) {
        $sql = mysqli_query($con, "UPDATE reg SET is_business=1 WHERE user_id='" . $_POST['user_id'] . "'") or die('error');
        if ($sql) {
            $arr['res'] = 'true';
        } else {
            $arr['res'] = 'false';
        }

        echo json_encode($arr);
    }
    if (isset($_POST['orderIndex'])) {
        $user_id = $_POST['user_id'];

        $orders = mysqli_num_rows(mysqli_query($con, "SELECT * FROM cart WHERE user_id='$user_id' AND cart_status=1"));
        $cart   = mysqli_num_rows(mysqli_query($con, "SELECT * FROM cart WHERE user_id='$user_id' AND cart_status=0"));
        $wish   = mysqli_num_rows(mysqli_query($con, "SELECT * FROM wishlist WHERE user_id='$user_id' "));

        $return = ['orders' => $orders, 'cart' => $cart, 'wishList' => $wish];

        echo json_encode($return);
    }
    if (isset($_POST['myAllOrders'])) {

        $sql = mysqli_query($con, "SELECT * FROM `cart` INNER JOIN   `product` ON `cart`.`cart_pro_code`=`product`.`pro_code` WHERE `cart`.`user_id`='" . $_POST['user_id'] . "' AND `cart`.`cart_status`=1 ORDER BY `cart`.`cart_ai_id` DESC ") or die('Error');
        $arr = [];
        while ($row = mysqli_fetch_array($sql)) {
            $arr[] = $row;

        }
        echo json_encode($arr);
    }

    if (isset($_POST['placeOrder'])) {
        $user_id    = $_POST['user_id'];
        $inv_number = rand(1111, 9999) . mysqli_num_rows(mysqli_query($con, "SELECT * FROM invoice"));

        $row = mysqli_fetch_assoc(mysqli_query($con, "SELECT SUM(cart_mrp) AS inv_price,SUM(cart_gst) AS inv_tax , SUM(cart_discount) AS inv_discount, SUM(cart_pro_selling_price) AS inv_total FROM cart WHERE  user_id='$user_id' AND cart_status=0"));
        mysqli_query($con, "INSERT INTO `invoice`(`inv_jdate`, `inv_user`, `inv_number`, `inv_price`, `inv_tax`, `inv_discount`, `inv_total`) VALUES ('$dt','$user_id','$inv_number','" . $row['inv_price'] . "','" . $row['inv_tax'] . "','" . $row['inv_discount'] . "','" . $row['inv_total'] . "')") or die('invoice insert error');

        mysqli_query($con, "UPDATE reg SET total_purchase=total_purchase+" . $row['inv_total'] . " WHERE mobile='$user_id'") or die('purchase wallet update error');
        $sql = mysqli_query($con, "UPDATE cart SET cart_inv_no='$inv_number',cart_status=1 WHERE cart_status=0 AND user_id='$user_id' ") or die('cart update error');

        if ($sql) {
            echo json_encode('true');
        } else {
            echo json_encode('false');
        }

    }
    if (isset($_POST['deleteCart'])) {
        $cart_ai_id = $_POST['cart_ai_id'];
        mysqli_query($con, "DELETE FROM cart WHERE cart_ai_id='$cart_ai_id' ") or die('cart delete error');
        $return = ['res' => 'success'];
        echo json_encode($return);
    }
    if (isset($_POST['qtyDecrement'])) {
        $pro_code   = $_POST['pro_code'];
        $cart_ai_id = $_POST['cart_ai_id'];
        $sql        = mysqli_query($con, "UPDATE cart SET cart_qty=cart_qty-1 WHERE cart_ai_id='$cart_ai_id' AND cart_qty>1 ");

        $cnt = mysqli_num_rows(mysqli_query($con, "SELECT * FROM cart WHERE cart_ai_id='$cart_ai_id' AND cart_qty!=1"));

        if ($cnt > 0) {
            mysqli_query($con, "UPDATE product SET pro_qty=pro_qty+1 WHERE pro_code='$pro_code'") or die('product Decement error');
        }

        $return = ['res' => 'success'];

        echo json_encode($return);
    }

    if (isset($_POST['qtyIncrement'])) {
        $pro_code   = $_POST['pro_code'];
        $cart_ai_id = $_POST['cart_ai_id'];
        $sql        = mysqli_query($con, "UPDATE cart SET cart_qty=cart_qty+1 WHERE cart_ai_id='$cart_ai_id' ") or die('pro code error for cart');
        $sql        = mysqli_query($con, "UPDATE product SET pro_qty=pro_qty-1 WHERE pro_code='$pro_code'") or die('product Decement error');

        $return = ['res' => 'success'];

        echo json_encode($return);
    }

    if (isset($_POST['cartQtyPriceTotal'])) {
        $user_id = $_POST['user_id'];
        $row     = mysqli_fetch_assoc(mysqli_query($con, "SELECT SUM(cart_qty) as qty , SUM(cart_pro_selling_price) as price, SUM(cart_discount) as discount, SUM(cart_mrp) as cartmrp FROM cart  WHERE  user_id='$user_id' AND cart_status=0 "));

        $total_and_qty = 0;
        $discount      = 0;
        $mrp_and_qty   = 0;
        $total_and_qty = $row['price'] * $row['qty'];
        $discount      = $row['discount'] * $row['qty'];
        $mrp_and_qty   = $row['cartmrp'] * $row['qty'];
        $return        = ['total_price' => $total_and_qty, 'total_qty' => $row['qty'] > 0 ? $row['qty'] : 0, 'discount' => $discount, 'mrp_and_qty' => $mrp_and_qty];

        echo json_encode($return);
    }
    if (isset($_POST['currentCart'])) {

        $sql = mysqli_query($con, "SELECT * FROM `cart` INNER JOIN   `product` ON `cart`.`cart_pro_code`=`product`.`pro_code` WHERE `cart`.`user_id`='" . $_POST['user_id'] . "' AND `cart`.`cart_status`=0") or die('Error');
        $arr = [];
        while ($row = mysqli_fetch_array($sql)) {
            $arr[] = $row;

        }
        echo json_encode($arr);
    }
    if (isset($_POST['addToCart'])) {
        $user_id     = $_POST['user_id'];
        $cart_pro_id = $_POST['cart_pro_id'];
        $qty         = $_POST['qty'];
        $proimage    = $_POST['proimage'];
        $row         = mysqli_fetch_assoc(mysqli_query($con, "SELECT * FROM product WHERE pro_code='$cart_pro_id'"));

        if ($row['pro_qty'] > 0) {
            $cnt = mysqli_num_rows(mysqli_query($con, "SELECT * FROM cart WHERE cart_pro_code='$cart_pro_id' AND user_id='$user_id' AND cart_status=0"));
            if ($cnt >= 1) {
                $return = ['res' => 'exist'];
            } else {
                mysqli_query($con, "INSERT INTO `cart`(`cart_date`, `cart_pro_id`, `cart_pro_name`, `cart_mrp`, `cart_gst`, `cart_discount`, `cart_qty`, `cart_pro_selling_price`, `cart_img`, `cart_pro_code`,  `user_id`) VALUES ('$dt','" . $row['pro_ai'] . "','" . $row['pro_name'] . "','" . $row['mrp'] . "','" . $row['pro_gst'] . "','" . $row['discount'] . "','$qty','" . $row['price'] . "','$proimage','" . $row['pro_code'] . "','$user_id')") or die('error');
                mysqli_query($con, "UPDATE product SET pro_qty=pro_qty-$qty WHERE pro_code='$cart_pro_id'") or die('product Decement error');
                $return = ['res' => 'successfully'];
            }
        } else {
            $return = ['res' => 'low_qty'];
        }

        echo json_encode($return);
    }

    if (isset($_POST['getMainCategory'])) {

        $id = $_POST['id'];

        $sql = mysqli_query($con, "SELECT * FROM `category` WHERE `id`='$id' ");

        $row = mysqli_fetch_assoc($sql);

        echo json_encode($row);
    }

    if (isset($_POST['imagesBaedProuct'])) {
        $pro_code = $_POST['pro_code'];
        $sql      = mysqli_query($con, "SELECT * FROM `pro_images` WHERE `pro_code`='$pro_code'") or die('Error');
        $arr      = [];
        while ($row = mysqli_fetch_array($sql)) {
            $arr[] = $row;

        }
        echo json_encode($arr);
    }

    if (isset($_POST['getFirstImg'])) {
        $pro_code = $_POST['pro_code'];

        $sql = mysqli_query($con, "SELECT * FROM `pro_images` WHERE `pro_code`='$pro_code' ");

        $row = mysqli_fetch_assoc($sql);

        echo json_encode($row);
    }

    if (isset($_POST['getWishListProducts'])) {
        $sql = mysqli_query($con, "SELECT * FROM  product INNER JOIN wishlist ON wishlist.pro_code=product.pro_code ") or die('Error');
        $arr = [];
        while ($row = mysqli_fetch_array($sql)) {
            $arr[] = $row;

        }
        echo json_encode($arr);
    }

    if (isset($_POST['getProducts'])) {
        $type = $_POST['type'];

        switch ($type) {
            case 'is_new':
                $where = "AND is_new=1";
                break;
            case 'is_flash':
                $where = "AND is_flash=1";
                break;
            case 'is_today':
                $where = "AND is_today=1";
                break;

            case 'is_best':
                $where = "AND is_best=1";
                break;

            case 'is_offer':
                $where = "AND is_offer=1";
                break;
            default:
                $where = '';
                break;
        }

        $sql = mysqli_query($con, "SELECT * FROM  product WHERE pro_status=1 $where ") or die('Error');
        $arr = [];
        while ($row = mysqli_fetch_array($sql)) {
            $arr[] = $row;

        }
        echo json_encode($arr);
    }

    if (isset($_POST['registerFromPanel'])) {

        $s_id = $_POST['sponsor_id'];

        $cnt = mysqli_num_rows(mysqli_query($con, "SELECT * FROM reg WHERE user_id='$s_id'"));
        if ($cnt >= 1) {
            $user_id = user_name;

            mysqli_query($con, "INSERT INTO reg (`join_date`,`user_id`,`sponsor_id`,`name`,`mail`,`mobile`,`password`,`status`) VALUES ('$dt','$user_id','$s_id','" . $_POST['name'] . "','" . $_POST['mail'] . "','" . $_POST['mobile'] . "','" . $_POST['password'] . "',1)") or die('insert error');

            mysqli_query($con, "UPDATE reg SET ref_count=ref_count+1 WHERE user_id='$s_id'") or die('Query error ref');
            level_team($user_id);
            $return = ['res' => 'true', 'user_id' => $user_id, 'password' => $_POST['password'], 'name' => $_POST['name'], 'sponsor_id' => $_POST['sponsor_id'], 'join_date' => $dt];
        } else {
            $return = ['res' => 'wrong_sponsor'];
        }

        echo json_encode($return);
    }

    if (isset($_POST['changePassword'])) {

        $sql = mysqli_query($con, 'UPDATE reg SET `password`="' . $_POST['new_pass'] . '" WHERE mobile="' . $_POST['mobile'] . '"');
        if ($sql) {
            echo json_encode('true');
        } else {
            echo json_encode('false');
        }

    }

    if (isset($_POST['checkOldPassword'])) {
        $cnt = mysqli_num_rows(mysqli_query($con, 'SELECT * FROM reg WHERE  mobile="' . $_POST['mobile'] . '" AND password="' . $_POST['old_pass'] . '"'));

        if ($cnt >= 1) {
            echo json_encode('true');
        } else {
            echo json_encode('false');
        }

    }

    if (isset($_POST['uploadProfileImage'])) {

        $return["error"] = false;
        $return["msg"]   = "";
        if (isset($_POST["image"])) {
            $base64_string = $_POST["image"];

            $image_data      = base64_decode($base64_string);
            $targetDirectory = "../profile_photo/";
            $filename        = time() . rand(11, 99) . '.jpg';
            $targetFile      = $targetDirectory . $filename;
            if (! file_exists($targetDirectory)) {
                mkdir($targetDirectory, 0777, true); // Creates the directory recursively
            }
            file_put_contents($targetFile, $image_data);
            $sql           = mysqli_query($con, "UPDATE `reg` SET `profile_pic`='$filename' WHERE  `user_id`='" . $_POST['user_id'] . "' ");
            $return["msg"] = $filename;
        } else {
            $return["error"] = true;
            $return["msg"]   = "No image is submited.";
        }

        echo json_encode($return);
    }

    if (isset($_POST['bankUpdate'])) {
        $sql = mysqli_query($con, "UPDATE `reg` SET `acc_num`='" . $_POST['acc_num'] . "',`acc_name`='" . $_POST['acc_name'] . "',`ifsc`='" . $_POST['ifsc'] . "',`bank`='" . $_POST['bank'] . "',`branch`='" . $_POST['branch'] . "',`google_pay`='" . $_POST['google_pay'] . "',`phone_pe`='" . $_POST['phone_pe'] . "',`upi`='" . $_POST['upi'] . "' WHERE `user_id`='" . $_POST['user_id'] . "' ") or die('error');

        if ($sql) {
            $return = ['res' => 'true'];
        } else {
            $return = ['res' => 'false'];
        }

        echo json_encode($return);
    }
    if (isset($_POST['updateProfile'])) {
        $sql = mysqli_query($con, "UPDATE `reg` SET `name`='" . $_POST['name'] . "',`mail`='" . $_POST['mail'] . "',`mobile`='" . $_POST['mobile'] . "' WHERE `user_id`='" . $_POST['user_id'] . "' ") or die('error');

        if ($sql) {
            $return = ['res' => 'true'];
        } else {
            $return = ['res' => 'false'];
        }

        echo json_encode($return);
    }

    if (isset($_POST['getUserData'])) {
        $user_id = $_POST['user_id'];

        $sql = mysqli_query($con, "SELECT * FROM `reg` WHERE `user_id`='$user_id' ");

        $row = mysqli_fetch_assoc($sql);

        echo json_encode($row);
    }

    if (isset($_POST['registerUser'])) {

        $cnt = mysqli_num_rows(mysqli_query($con, "SELECT * FROM reg WHERE user_id='" . $_POST['sponsor_id'] . "'"));
        if ($cnt >= 1) {
            $user_id = user_name;
            mysqli_query($con, "INSERT INTO reg (`join_date`,`user_id`,`sponsor_id`,`name`,`mail`,`mobile`,`password`) VALUES ('$dt','$user_id','" . $_POST['sponsor_id'] . "','" . $_POST['name'] . "','" . $_POST['mail'] . "','" . $_POST['mobile'] . "','" . $_POST['password'] . "')") or die('insert error');

            $return = ['res' => 'true', 'user_id' => $user_id, 'password' => $_POST['password'], 'name' => $_POST['name'], 'sponsor_id' => $_POST['sponsor_id'], 'join_date' => $dt];
        } else {
            $return = ['res' => 'wrong_sponsor'];
        }

        echo json_encode($return);
    }

    if (isset($_POST['userIdToName'])) {
        $sql = mysqli_query($con, "SELECT * FROM reg WHERE user_id='" . $_POST['user_id'] . "'") or die('error');
        $cnt = mysqli_num_rows($sql);
        if ($cnt >= 1) {
            $row = mysqli_fetch_assoc($sql);
            echo json_encode($row['name']);
        } else {
            echo json_encode('not_exit');
        }
    }
    if (isset($_POST['checkSponsorId'])) {
        $sql = mysqli_query($con, "SELECT * FROM reg WHERE user_id='" . $_POST['user_id'] . "'") or die('error');
        $cnt = mysqli_num_rows($sql);
        if ($cnt >= 1) {
            $row = mysqli_fetch_assoc($sql);
            echo json_encode($row['name']);
        } else {
            echo json_encode('not_exit');
        }

    }
    if (isset($_POST['loginUser'])) {
        $sql = mysqli_query($con, "SELECT * FROM reg WHERE mobile='" . $_POST['mobile'] . "' AND password='" . $_POST['password'] . "'");
        if ($sql) {
            $cnt = mysqli_num_rows($sql);
            if ($cnt >= 1) {
                $row = mysqli_fetch_assoc($sql);
                echo json_encode($row['user_id']);
            } else {
                echo json_encode('false');
            }

        } else {
            echo json_encode('false');
        }

    }

    if (isset($_POST['getBanners'])) {

        $sql = mysqli_query($con, "SELECT * FROM `banner` ") or die('Error');

        $arr = [];
        while ($row = mysqli_fetch_assoc($sql)) {
            $arr[] = $row;
        }
        echo json_encode($arr);
    }

    /*
DELETE FROM reg WHERE id!=1;
ALTER TABLE reg AUTO_INCREMENT=1;

TRUNCATE TABLE transcation_history;
UPDATE reg set total_income=0,wallet=0,ref_count=0,level_income=0;


DELETE FROM level where level_id!=1;
ALTER TABLE level AUTO_INCREMENT=1;
UPDATE level set level_1=0,level_2=0,level_3=0,level_4=0,level_5=0,level_6=0,level_7=0,level_8=0,level_9=0,level_10=0,level_1_income=0,level_2_income=0,level_3_income=0;

TRUNCATE TABLE down_line_insert;
*/
