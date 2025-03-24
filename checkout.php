<?php
include('include/header.php');

session_start();

$UID = $_SESSION['id'];

if (!isset($UID)) {
    header("location: index.php");
    exit();
}

// Fetch user details
$sql_customer = "SELECT * FROM users WHERE user_id = '$UID'";
$result_customer = mysqli_query($connection, $sql_customer);
$row_customer = mysqli_fetch_array($result_customer);

// Fetch cart details
$sql_carts = "SELECT * FROM carts LEFT JOIN products ON carts.product_id = products.product_id WHERE carts.created_by = '$UID'";
$result_carts = mysqli_query($connection, $sql_carts);

// Calculate total amount
$sql_total_sum = "SELECT SUM(amount) as totalamount FROM carts WHERE carts.created_by = '$UID'";
$result_total_sum = mysqli_query($connection, $sql_total_sum);
$row_total_sum = mysqli_fetch_array($result_total_sum);
$totalamount = $row_total_sum["totalamount"];
?>

<!-- Checkout page section -->
<div class="Checkout_section mt-70">
    <div class="container">
        <form id="checkoutForm">
            <div class="checkout_form">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <h3>Billing Details</h3>
                        <div class="row">
                            <div class="col-lg-12 mb-20">
                                <label>Full Name <span>*</span></label>
                                <input type="text" id="fullname" value="<?php echo $row_customer['fullname']; ?>" required>
                            </div>
                            <div class="col-12 mb-20">
                                <label>Address <span>*</span></label>
                                <textarea id="address" rows="7" style="width:100%;" required><?php echo $row_customer['address']; ?></textarea>
                            </div>
                            <div class="col-lg-6 mb-20">
                                <label>Phone <span>*</span></label>
                                <input type="number" id="phone" required>
                            </div>
                            <div class="col-lg-6 mb-20">
                                <label>Email Address <span>*</span></label>
                                <input type="email" id="email" value="<?php echo $row_customer['email']; ?>" required readonly>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6">
                        <h3>Your order</h3>
                        <div class="order_table table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php while ($row_carts = mysqli_fetch_array($result_carts)) { ?>
                                        <tr>
                                            <td><?php echo $row_carts['product_name']; ?> × <?php echo $row_carts['quantity']; ?></td>
                                            <td>RM <?php echo $row_carts['amount']; ?></td>
                                        </tr>
                                    <?php } ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Order Total</th>
                                        <td><strong>RM <?php echo number_format($totalamount + 10.00, 2); ?></strong></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>

                        <div class="payment_method">
                            <input type="radio" name="payment_method" value="Cash On Delivery" required> Cash On Delivery <br>
                            <input type="radio" name="payment_method" value="Online Banking" required> Online Banking <br>
                            <button type="submit">Pay Now</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
document.getElementById("checkoutForm").addEventListener("submit", function (e) {
    e.preventDefault();

    let orderData = {
        fullname: document.getElementById("fullname").value,
        address: document.getElementById("address").value,
        phone: document.getElementById("phone").value,
        email: document.getElementById("email").value,
        payment_method: document.querySelector('input[name="payment_method"]:checked').value
    };

    fetch('api/checkout.php', {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(orderData)
    })
    .then(response => response.json())
    .then(data => {
        alert(data.message);
        window.location.href = "myorders.php";
    })
    .catch(error => console.error("Checkout failed:", error));
});
</script>

<?php include('include/footer.php'); ?>
