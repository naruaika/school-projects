<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= esc($title); ?></title>

    <!-- Icons -->
    <link rel="shortcut icon" type="image/png" href="<?= base_url('icons/site-icon.png'); ?>" />

    <!-- Bootstrap -->
    <link rel="stylesheet" href="<?= base_url('bootstrap/dist/css/bootstrap.min.css'); ?>">
    <script src="<?= base_url('bootstrap/dist/js/bootstrap.bundle.min.js'); ?>"></script>

    <!-- Custom Syling -->
    <link rel="stylesheet" href="<?= base_url('styles/main.css'); ?>">
    <?php if ($style) : ?>
        <link rel="stylesheet" href="<?= base_url('/styles/' . esc($style) . '.css') ?>">
    <?php endif; ?>
</head>

<body class="d-flex flex-column">
