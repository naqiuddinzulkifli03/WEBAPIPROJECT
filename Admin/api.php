<?php
header("Content-Type: application/json");
include '../connection.php'; 

$method = $_SERVER['REQUEST_METHOD'];

if ($method == 'GET') {
    // GET - Fetch Data
    $sql = "SELECT * FROM products";
    $result = mysqli_query($connection, $sql);
    $products = mysqli_fetch_all($result, MYSQLI_ASSOC);
    echo json_encode($products);
}

elseif ($method == 'POST') {
    // POST - Add Data
    $data = json_decode(file_get_contents("php://input"), true);
    if(isset($data["product_name"], $data["product_cat"], $data["product_desc"], $data["product_stock"], $data["product_img"], $data["product_price"])) {
        $name = $data["product_name"];
        $cat = $data["product_cat"];
        $desc = $data["product_desc"];
        $stock = $data["product_stock"];
        $img = $data["product_img"];
        $price = $data["product_price"];
        $sql = "INSERT INTO products (product_name, product_cat, product_desc, product_stock, product_img, product_price) 
                VALUES ('$name', '$cat', '$desc', '$stock', '$img', '$price')";
        echo json_encode(mysqli_query($connection, $sql) ? ["message" => "Product added successfully"] : ["error" => "Failed to add product"]);
    } else {
        echo json_encode(["error" => "Invalid input"]);
    }
}

elseif ($method == 'PUT') {
    // PUT - Update Data
    $data = json_decode(file_get_contents("php://input"), true);
    if(isset($data["product_id"], $data["product_name"], $data["product_cat"], $data["product_desc"], $data["product_stock"], $data["product_img"], $data["product_price"])) {
        $id = $data["product_id"];
        $name = $data["product_name"];
        $cat = $data["product_cat"];
        $desc = $data["product_desc"];
        $stock = $data["product_stock"];
        $img = $data["product_img"];
        $price = $data["product_price"];
        $sql = "UPDATE products SET 
                product_name='$name', product_cat='$cat', product_desc='$desc', 
                product_stock='$stock', product_img='$img', product_price='$price' 
                WHERE product_id='$id'";
        echo json_encode(mysqli_query($connection, $sql) ? ["message" => "Product updated successfully"] : ["error" => "Failed to update product"]);
    } else {
        echo json_encode(["error" => "Invalid input"]);
    }
}

elseif ($method == 'DELETE') {
    // DELETE - Delete Data
    $data = json_decode(file_get_contents("php://input"), true);
    if(isset($data["product_id"])) {
        $id = $data["product_id"];
        $sql = "DELETE FROM products WHERE product_id='$id'";
        echo json_encode(mysqli_query($connection, $sql) ? ["message" => "Product deleted successfully"] : ["error" => "Failed to delete product"]);
    } else {
        echo json_encode(["error" => "Invalid input"]);
    }
}

else {
    // ❌ Unknown Method
    echo json_encode(["error" => "Method Not Allowed"]);
}
?>
