<!-- ==================        empty or not     ========================================= -->
<!DOCTYPE html>
<html>
<head>
    <title>Input Form</title>
</head>
<body>
    <form method="POST" action="process.php">
        <input type="text" name="input_field" placeholder="Enter your input">
        <button type="submit">Submit</button>
    </form>
</body>
</html>
<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = $_POST['input_field'];

    // Validate if the input is empty
    if (empty($input)) {
        echo "Input is empty.";
    } else {
        // Database connection using PDO
        $host = 'localhost';
        $dbname = 'project';
        $username = 'root';
        $password = '';

        try {
            $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Insert the input into the database
            $stmt = $conn->prepare("INSERT INTO your_table_name (input_field) VALUES (?)");
            $stmt->execute([$input]);

            echo "Input saved in the database.";
        } catch (PDOException $e) {
            echo "Database Error: " . $e->getMessage();
        }
    }
}
?>
<!-- ==================         java script      ========================================= -->

onAbort:
JavaScript:
function handleAbort() {
  alert("The loading of the resource was aborted.");
}

<img src="example.jpg" onabort="handleAbort()" alt="Example image">


onBlur:
JavaScript:
function handleBlur() {
  console.log("An input field lost focus.");
}

<input type="text" onblur="handleBlur()" placeholder="Type something">


onChange:
JavaScript:
function handleChange() {
  console.log("The value of the input field was changed.");
}

<input type="text" onchange="handleChange()" placeholder="Type something">


onClick:
JavaScript:
function handleClick() {
  alert("The button was clicked!");
}

<button onclick="handleClick()">Click me</button>


onError:
JavaScript:
function handleError() {
  console.log("An error occurred while loading a resource.");
}

<img src="example.jpg" onerror="handleError()" alt="Example image">


onFocus:
JavaScript:
function handleFocus() {
  console.log("An input field gained focus.");
}

<input type="text" onfocus="handleFocus()" placeholder="Type something">


onLoad:
JavaScript:
function handleLoad() {
  alert("The page finished loading.");
}

<body onload="handleLoad()">
  <!-- Page content -->
</body>


onMouseOver:
JavaScript:
function handleMouseOver() {
  console.log("Mouse pointer is over the element.");
}

<div onmouseover="handleMouseOver()">Hover over me</div>


onMouseOut:
JavaScript:
function handleMouseOut() {
  console.log("Mouse pointer moved out of the element.");
}

<div onmouseout="handleMouseOut()">Move your mouse out of me</div>


onSelect:
JavaScript:
function handleSelect() {
  console.log("Text was selected in an input field.");
}

<input type="text" onselect="handleSelect()" value="Select me">


onSubmit:
JavaScript:
function handleSubmit() {
  console.log("Form was submitted.");
}

<form onsubmit="handleSubmit()">
  <input type="text" placeholder="Type something">
  <button type="submit">Submit</button>
</form>


onUnload:
JavaScript:
function handleUnload() {
  alert("The page is about to be unloaded.");
}

<body onunload="handleUnload()">
  <!-- Page content -->
</body>
