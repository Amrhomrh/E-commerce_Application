


<!-- esmaail almawri -->
<!-- ============================================================================================== -->
<!-- chese_set -->
<?php

$size = 8;


$lightColor = "#aaaa";
$darkColor = "#ffff";


echo "<table cellpadding='5' cellspacing='0' style='border: 1px solid black;'>";


for ($row = 1; $row <= $size; $row++) {
    echo "<tr>";

    
    for ($col = 1; $col <= $size; $col++) {
        
        $color = ($row + $col) % 2 == 0 ? $lightColor : $darkColor;

        
        echo "<td style='background-color: $color;'></td>";
    }

    echo "</tr>";
}

echo "</table>";
?>


<!-- ============================================================================================== -->

<!-- array_key_exists() function in PHP: -->

<?php
// Define an associative array
$fruits = array(
    "apple" => "red",
    "banana" => "yellow",
    "orange" => "orange"
);

// Check if a key exists in the array
if (array_key_exists("banana", $fruits)) {
    echo "The key 'banana' exists in the array.";
} else {
    echo "The key 'banana' does not exist in the array.";
}

echo "<br>";

// Check if a key exists in the array
if (array_key_exists("grape", $fruits)) {
    echo "The key 'grape' exists in the array.";
} else {
    echo "The key 'grape' does not exist in the array.";
}
?>


<!-- ============================================================================================== -->

<!-- ------------------------- -->

<!-- in_array() : -->

<?php
// Define an array of colors
$colors = array("red", "green", "blue", "yellow");

// Check if a value exists in the array
if (in_array("blue", $colors)) {
    echo "The value 'blue' exists in the array.";
} else {
    echo "The value 'blue' does not exist in the array.";
}

echo "<br>";

// Check if a value exists in the array
if (in_array("orange", $colors)) {
    echo "The value 'orange' exists in the array.";
} else {
    echo "The value 'orange' does not exist in the array.";
}
?>


<!-- ============================================================================================== -->


<!-- array_search() : -->

<?php
// Define an associative array
$fruits = array(
    "apple" => "red",
    "banana" => "yellow",
    "orange" => "orange"
);

// Search for a value in the array
$key = array_search("yellow", $fruits);
if ($key !== false) {
    echo "The key for the value 'yellow' is: " . $key;
} else {
    echo "The value 'yellow' does not exist in the array.";
}

echo "<br>";

// Search for a value in the array
$key = array_search("green", $fruits);
if ($key !== false) {
    echo "The key for the value 'green' is: " . $key;
} else {
    echo "The value 'green' does not exist in the array.";
}
?>


<!-- ============================================================================================== -->

<!-- is_array() : -->

<?php
// Define an array
$fruits = array("apple", "banana", "orange");

// Check if a variable is an array
if (is_array($fruits)) {
    echo "The variable is an array.";
} else {
    echo "The variable is not an array.";
}

echo "<br>";

// Define a string variable
$name = "John";

// Check if a variable is an array
if (is_array($name)) {
    echo "The variable is an array.";
} else {
    echo "The variable is not an array.";
}
?>


<!-- ============================================================================================== -->

<!-- sizeof() : -->

<?php
// Define an array
$fruits = array("apple", "banana", "orange");

// Get the size of the array
$size = sizeof($fruits);

// Print the size of the array
echo "The size of the array is: " . $size;
?>

<!-- ============================================================================================== -->


<!-- asort() : -->

<?php
// Define an associative array
$fruits = array(
    "apple" => 5,
    "banana" => 2,
    "orange" => 3,
    "kiwi" => 4
);

// Sort the array in ascending order by value
asort($fruits);

// Print the sorted array
foreach ($fruits as $fruit => $quantity) {
    echo $fruit . ": " . $quantity . "<br>";
}
?>

<!-- ============================================================================================== -->

<!-- sort(): -->

<?php
// Define an indexed array
$fruits = array("apple", "banana", "orange", "kiwi");

// Sort the array in ascending order
sort($fruits);

// Print the sorted array
foreach ($fruits as $fruit) {
    echo $fruit . "<br>";
}
?>


<!-- ============================================================================================== -->

<!-- array_shift() : -->

<?php
// Define an indexed array
$fruits = array("apple", "banana", "orange", "kiwi");

// Remove and return the first element of the array
$firstFruit = array_shift($fruits);

// Print the updated array and the removed element
echo "Updated Array: ";
print_r($fruits);

echo "Removed Element: " . $firstFruit;
?>
<!-- ============================================================================================== -->
<!-- kasort() : error in syntix of funaction -->
<!-- ============================================== -->
<?php
// Define an associative array
$fruits = array(
    "apple" => 5,
    "banana" => 2,
    "orange" => 8,
    "kiwi" => 3
);

// Sort the array by key in ascending order
ksort($fruits); 
// kasort($fruits); 
// --------here-----------
// ------
// ----------------------------------------------------------
// Print the sorted array
foreach ($fruits as $fruit => $quantity) {
    echo $fruit . ": " . $quantity . "<br>";
}
?>

<!-- ksort() : this right syntix of funaction -->

<?php
// Define an associative array
$fruits = array(
    "banana" => 3,
    "orange" => 2,
    "kiwi" => 5,
    "apple" => 1
);

// Sort the array by keys in ascending order
ksort($fruits);

// Print the sorted array
echo "Sorted Array: ";
print_r($fruits);
?>
<!-- ============================================================================================== -->
<!-- array_unshift()\: -->

<?php
// Define an indexed array
$fruits = array("banana", "orange", "kiwi");

// Add elements to the beginning of the array
array_unshift($fruits, "apple", "grape");

// Print the updated array
echo "Updated Array: ";
print_r($fruits);
?>

<!-- ============================================================================================== -->

<!-- array_unique() : -->

<?php
// Define an array with duplicate values
$numbers = array(1, 2, 3, 4, 2, 3, 5, 6, 1);

// Remove duplicate values from the array
$uniqueNumbers = array_unique($numbers);

// Print the unique values
echo "Unique Numbers: ";
print_r($uniqueNumbers);
?>

<!-- ============================================================================================== -->

<!-- array_pop() : -->

<?php
// Define an array
$fruits = array("apple", "banana", "orange", "kiwi");

// Remove and return the last element of the array
$lastFruit = array_pop($fruits);

// Print the updated array and the removed element
echo "Updated Array: ";
print_r($fruits);

echo "Removed Element: " . $lastFruit;
?>

<!-- ============================================================================================== -->

<!-- array_push() : -->

<?php
// Define an array
$fruits = array("apple", "banana", "orange");

// Add elements to the end of the array
array_push($fruits, "kiwi", "mango");

// Print the updated array
echo "Updated Array: ";
print_r($fruits);
?>