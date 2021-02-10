<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{ title | title }</title>

    <!-- Icons -->
    <link rel="shortcut icon" type="image/png" href="{ icon }" />

    <!-- Bootstrap -->
    <link rel="stylesheet" href="{ bootstrapCss }">
    <script src="{ bootstrapJs }"></script>

    <!-- Custom Syling -->
    <link rel="stylesheet" href="{ mainCss }">
    { if $customCss }
        <link rel="stylesheet" href="{ customCss }">
    { endif }
</head>

<body class="d-flex flex-column">
