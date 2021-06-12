<?php 
    require 'db_conn.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="script.js" defer></script>
    <title>IBRAT INNOVATIONS - PHP Assignment</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<div class="header">

    <a href="#"><img src="img/expand-arrows-alt-solid.svg" alt="Expand-Arrows"></a>
    <a href="#"><img src="img/power-off-solid.svg" alt="Power-Off"></a>

</div>

    <h1 class="heading-hi">Hi, Welcomeback!</h1>
    
<div class="box-white">

    <h1 class="basic">BASIC</h1>

    <ul class="tabs">
        <li data-tab-target="#details" class="active tab">Details</li>
        <li data-tab-target="#plans" class="tab">Plans</li>
        <li data-tab-target="#classes" class="tab">Classes</li>

    </ul>

    <div class="sub-content">

        <div id="details" data-tab-content class="active">

            <?php
                if(isset($_GET['memid']))
                {   
                    $memid = $_GET['memid'];

                    $sql = "SELECT * FROM membership where id='$memid'"; //details of membership through membership_id
                    $result = mysqli_query($conn, $sql);
                    $row = mysqli_fetch_assoc($result);
                    
                    $sql2 = "SELECT COUNT(*) AS 'var' FROM master where type='class' and membership_id='$memid'"; //for no of classes
                    $result2 = mysqli_query($conn, $sql2);
                    $row2 = mysqli_fetch_assoc($result2);

                    echo '<p><b>Duration:</b>&nbsp; '.$row['membership_duration'].'</p>
                    <p><b>Price:</b> &nbsp;₹&nbsp;'.number_format($row['membership_price'],2).'</p>
                    <p><b>Classes:</b> &nbsp; '.$row2['var'].'</p>
                    <p><b>Discount Percentage:</b> &nbsp; '.number_format($row['membership_discount_percentage'],1).' %</p>
                    <p><b>Offername:</b> &nbsp; '.$row['membership_offer_name'].'</p>
                    <p><b>Status:</b>&nbsp; '.$row['membership_status'].'</p>';
                }else{
                    echo '<br><br><h1>!!! Select Membership Plan <br>from EDIT !!!</h1><br><br>';
                }        
            ?>
    
        </div>

        <div id="plans" data-tab-content>
            <h1>Plans Overview</h1>    
            <?php 

            if(isset($_GET['memid']))
            {   
                $memid = $_GET['memid'];

                //Get Plans intially from master
                $sql1 = "SELECT key_id FROM master where type='plan' and membership_id='$memid'"; //for retriving the plan key_ids using membership_id
                $result1 = mysqli_query($conn, $sql1);
                $count = 0;

                while($row1 = mysqli_fetch_assoc($result1))
                {
                $count++;
                $key_id = $row1['key_id'];
                $sql2 = "SELECT * FROM plans where id='$key_id' "; //details of the plan using key_id
                $result2 = mysqli_query($conn, $sql2);
                $row2 = mysqli_fetch_assoc($result2);
                echo '
                    <h2>Plan No: '.$count.'</h2>
                    <p><b>Plan Name:</b>&nbsp; '.$row2["plan_name"].'</p>
                    <p><b>Description:</b> &nbsp;'.$row2["plan_description"].'</p>
                    <p><b>Total Workouts:</b>&nbsp; '.$row2["plan_total_workouts"].'</p>
                    <p><b>No. of Weeks:</b> &nbsp; '.$row2["plan_total_weeks"].'</p>
                    <p><b>Average Duration:</b> &nbsp; '.$row2["plan_avg_duration"].' '.$row2["duration_unit"].'</p>
                    <p><b>Plan Level:</b> &nbsp; '.$row2["plan_level"].'</p><br><br>';
                }            
            }
            ?>
            
        </div>

        <div id="classes" data-tab-content>
            <h1>Classes Overview</h1>
            <?php 
            //Get Classses intially from master
                $sql1 = "SELECT key_id FROM master where type='class' and membership_id='$memid'"; //for retriving the class key_ids using membership_id
                $result1 = mysqli_query($conn, $sql1);
                $count = 0;

                while($row1 = mysqli_fetch_assoc($result1)){
                    $count++;
                    $key_id = $row1['key_id'];
                    $sql2 = "SELECT * FROM classes where id='$key_id' "; //details of the class using key_id
                    $result2 = mysqli_query($conn, $sql2);
                    $row2 = mysqli_fetch_assoc($result2);
                    echo '
                    <h2>Class No: '.$count.'</h2>
                    <p><b>Class Name:</b>&nbsp; '.$row2['class_name'].'</p>
                    <p><b>Class Date:</b>&nbsp; '.$row2['class_date'].'</p>
                    <p><b>Instructor:</b>&nbsp; '.$row2['class_trainer'].'</p>
                    <p><b>Description:</b> &nbsp; '.$row2['class_short_description'].' </p>
                    <p><b>Duration:</b> &nbsp; '.$row2['class_duration'].'</p>
                    <p><b>Class Member limit:</b> &nbsp; '.$row2['class_member_limit'].'</p>
                    <p><b>Class Level:</b> &nbsp; '.$row2['class_level'].'</p>
                    <br><br>';    
                
                }
            ?>
        </div>

       
        <button id="open-popup-btn"> &#9432; Edit</button>
        <button class="delete"><i class='fa fa-trash-o'></i> Delete</button>
         

    </div>

</div>
 

</body>
<!--Modal Content-->
<div class="bg-modal">
    <div class="modal-content">
        <a href=""><div class="cross">&#10060;</div></a>
        <div class="membership-head">
            <h1>Membership Type</h1>
        </div>
        <div class="mem-opt">
        <select id="mem-opt-dropdown" class="dropdown">
            <option value="1">BEGINNER</option>
        </select>
        </div>
            <div class="submit-sec">
                <a href="index.php?memid=1"><button class="submit-mem"> Get Results </button></a>
            </div>    
    </div>
</div>
</html>
